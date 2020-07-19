/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.controller;

import com.example.DoggyWalker.service.UserServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 *
 * @author glamb
 */
@Controller
public class UserController {
    
    @Autowired
    UserServiceInterface userServiceInterface;
}
