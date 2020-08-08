/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.service;

import com.example.DoggyWalker.model.MyUserDetails;
import com.example.DoggyWalker.repository.MyUserDetailsRepository;
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
}
