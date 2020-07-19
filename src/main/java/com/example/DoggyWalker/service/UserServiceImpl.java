/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.service;

import com.example.DoggyWalker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author glamb
 */
@Service
public class UserServiceImpl implements UserServiceInterface{
    
    @Autowired
    UserRepository userRepository;
}
