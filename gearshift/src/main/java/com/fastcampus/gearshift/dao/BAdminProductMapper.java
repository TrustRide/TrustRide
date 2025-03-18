package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.AdminProductDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface BAdminProductMapper {

    @Select("SELECT * FROM CAR_INFORMATION ci JOIN INFORMATION i ON ci.car_info_id = i.car_info_id")
    List<AdminProductDTO> selectAllProducts();

    @Select("SELECT * FROM CAR_INFORMATION ci JOIN INFORMATION i ON ci.car_info_id = i.car_info_id WHERE ci.car_info_id = #{id}")
    AdminProductDTO selectProductById(int id);

    @Update("UPDATE INFORMATION SET model_name=#{modelName}, mileage=#{mileage}, engine_capacity=#{engineCapacity}, fuel_type=#{fuelType}, color=#{color}, car_price=#{carPrice} WHERE car_info_id=#{carInfoId}")
    void updateProduct(AdminProductDTO product);

    @Delete("DELETE FROM CAR_INFORMATION WHERE car_info_id=#{id}")
    void deleteProduct(int id);
}
