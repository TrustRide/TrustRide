package com.fastcampus.gearshift.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
@PropertySource("classpath:mail.properties")
public class SEmailAuthService {

    @Value("${mail.username}")
    private String fromEmail;

    private final JavaMailSender mailSender;
    private final Map<String, String> codeStorage = new HashMap<>();

    @Autowired
    public SEmailAuthService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public boolean sendCode(String toEmail) {
        String code = createCode();
        codeStorage.put(toEmail, code);

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");

            helper.setTo(toEmail);
            helper.setFrom(fromEmail);
            helper.setSubject("[Trust Ride] 이메일 인증번호입니다.");
            helper.setText("인증번호는 " + code + " 입니다.\n3분 안에 입력해주세요.");

            mailSender.send(message);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean verifyCode(String email, String inputCode) {
        String savedCode = codeStorage.get(email);
        return savedCode != null && savedCode.equals(inputCode);
    }

    private String createCode() {
        int code = new Random().nextInt(900000) + 100000;
        return String.valueOf(code);
    }
}