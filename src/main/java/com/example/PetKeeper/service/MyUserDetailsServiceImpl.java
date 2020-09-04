/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.MyUserDetails;
import com.example.PetKeeper.repository.MyUserDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

/**
 *
 * @author RG
 */
@Service
public class MyUserDetailsServiceImpl implements MyUserDetailsService {

    @Autowired
    MyUserDetailsRepository myUserDetailsRepository;

    @Override
    public MyUserDetails saveMyUserDetails(MyUserDetails myUserDetails) {
        MyUserDetails newMyUserDetails = new MyUserDetails();
        try {
            newMyUserDetails = myUserDetailsRepository.save(myUserDetails);
        } catch (DataIntegrityViolationException e) {
            e.printStackTrace();
            System.out.println("Duplicate entry! One or more info already exists");
        }
        return newMyUserDetails;
    }

    @Override
    public MyUserDetails getMyUserDetailsByMyUser(MyUser myUser) {
        return myUserDetailsRepository.findMyUserDetailsByMyUserId(myUser);
    }
}
