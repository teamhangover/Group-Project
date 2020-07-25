/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.DoggyWalker.repository.MyUserRepository;

/**
 *
 * @author glamb
 */
@Service
public class MyUserServiceImpl implements MyUserServiceInterface{
    
    @Autowired
    MyUserRepository myUserRepository;
}
