package com.fastcampus.gearshift.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDto {
    private Integer userId;
    private String userEmail;
    private String userPassword;
    private String userPhoneNumber;
    private String userName;
    private String userGender;
    private String userAccount;
}