package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.JAdminCarDao;
import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.ImageDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class JAdminCarServiceImpl implements JAdminCarService {

    private final JAdminCarDao carDao; // MyBatis DAO

    // 차량 목록 조회
    @Override
    public List<CarDto> getCarList() {
        List<CarDto> carList = carDao.getCarList(); // images 포함된 전체 리스트 조회

        for (CarDto car : carList) {
            if (car.getImages() != null) {
                car.getImages().stream()
                        .filter(ImageDto::getIsThumbnail)
                        .findFirst()
                        .ifPresent(thumbnail -> {
                            car.setThumbnailUrl(thumbnail.getImageUrl());
                            car.setThumbnailImageId(thumbnail.getImageId());
                        });
            }
        }

        return carList;
    }

    // 썸네일 조회
    public ImageDto getThumbnailByCarId(int carInfoId) {
        return carDao.getThumbnailByCarId(carInfoId);
    }

    /**
     * 차량 등록 + 이미지 파일 처리
     */
    @Transactional
    @Override
    public void registerCarWithFiles(CarDto carDto, List<MultipartFile> imageFiles, Integer thumbnailIndex) {
        // 1) 차량 정보 등록
        carDao.insertCarInformation(carDto); // PK 생성
        carDao.insertCarBasicInfo(carDto);

        // 2) 이미지 처리
        if (imageFiles != null && !imageFiles.isEmpty()) {
            for (int i = 0; i < imageFiles.size(); i++) {
                MultipartFile file = imageFiles.get(i);
                if (!file.isEmpty()) {
                    try {
                        String originalName = file.getOriginalFilename();
                        if (originalName == null) continue;

                        String uuid = UUID.randomUUID().toString();
                        String savedName = uuid + "_" + originalName;

                        // 저장 경로
                        File dest = new File("C:/upload/" + savedName);
                        file.transferTo(dest);

                        // DTO 생성
                        ImageDto imageDto = new ImageDto();
                        imageDto.setCarInfoId(carDto.getCarInfoId());
                        imageDto.setImageUuid(uuid);
                        imageDto.setImageUrl("/uploads/" + savedName);
                        imageDto.setImageType(file.getContentType());
                        imageDto.setIsThumbnail(i == thumbnailIndex); // 썸네일 지정

                        carDao.insertCarImage(imageDto); // DB 저장
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        System.out.println("carDto 서비스 = " + carDto);
    }
    // ============추가된 부분============

    // 차량 상세 조회
    @Override
    public CarDto getCarById(Integer carInfoId) {
        return carDao.getCarById(carInfoId);
    }

    // 차량 수정
    @Transactional
    @Override
    public void updateCar(CarDto carDto) {
        carDao.updateCarInformation(carDto);
        carDao.updateCarBasicInfo(carDto);
    }

    // 차량 삭제
    @Transactional
    @Override
    public void deleteCar(Integer carInfoId) {
        carDao.deleteCar(carInfoId);
    }
}
