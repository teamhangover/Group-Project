/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.controller;

import com.example.DoggyWalker.model.MyUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.DoggyWalker.service.MyUserServiceInterface;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author glamb
 */
@Controller
public class MyUserController {

    @Autowired
    MyUserServiceInterface myUserServiceInterface;

    @GetMapping("/preInsertMyUser")
    public String showUserRegisterForm(ModelMap mm) {
        MyUser newMyUser = new MyUser();
        mm.addAttribute("newMyUser", newMyUser);
        return "register";
    }

   
    @PostMapping("/doInsertMyUser")
    public String insertUser(@ModelAttribute("newMyUser") MyUser myUser,
            @RequestParam(value = "keeper", defaultValue = "false") String keeper) {

        boolean isKeeper = Boolean.parseBoolean(keeper);

       myUserServiceInterface.saveNewMyUser(myUser, isKeeper);

        return "index";

    }

}
