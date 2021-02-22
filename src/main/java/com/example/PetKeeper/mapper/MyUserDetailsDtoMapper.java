/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.mapper;

import com.example.PetKeeper.dto.MyUserDetailsDto;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.MyUserDetails;

/**
 *
 * @author RG
 */
public class MyUserDetailsDtoMapper {

    public static MyUserDetailsDto mapToMyUserDetailsDto(MyUserDetails myUserDetails) {
        return new MyUserDetailsDto(
                myUserDetails.getMyUserId().getUsername(),
                myUserDetails.getFirstName(),
                myUserDetails.getLastName(),
                myUserDetails.getAge(),
                myUserDetails.getTel(),
                myUserDetails.getUPhotoName(),
                myUserDetails.getUDescription());
    }

    public static MyUserDetails mapToMyUserDetails(MyUserDetailsDto myUserDetailsDto, MyUser myUser) {
        MyUserDetails temp = new MyUserDetails();

        temp.setAge(myUserDetailsDto.getAge());
        temp.setFirstName(myUserDetailsDto.getFirstName());
        temp.setLastName(myUserDetailsDto.getLastName());
        temp.setTel(myUserDetailsDto.getTel());
        temp.setUDescription(myUserDetailsDto.getuDescription());
        temp.setUPhotoName(myUserDetailsDto.getuPhotoName());
        temp.setDetailsId(myUser.getMyUserDetails().getDetailsId());
        temp.setMyUserId(myUser);

        return temp;
    }
}
