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
        return myUserDetailsRepository.save(myUserDetails);
    }

    @Override
    public MyUserDetails getMyUserDetailsByMyUser(MyUser myUser) {
        return myUserDetailsRepository.findMyUserDetailsByMyUserId(myUser);
    }
}