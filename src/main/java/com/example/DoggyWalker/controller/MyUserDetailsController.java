/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.controller;

import com.example.DoggyWalker.model.MyUser;
import com.example.DoggyWalker.model.MyUserDetails;
import com.example.DoggyWalker.service.MyUserDetailsService;
import com.example.DoggyWalker.service.MyUserServiceInterface;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author RG
 */
@Controller
public class MyUserDetailsController {

    @Autowired
    MyUserServiceInterface myUserServiceInterface;
    @Autowired
    MyUserDetailsService myUserDetailsService;

    @GetMapping("/preInsertMyUserDetails")
    public String showMyUserDetailsForm(ModelMap mm, HttpSession session) {
        MyUser myUser = (MyUser) session.getAttribute("loggedUser");
        MyUserDetails newMyUserDetails = new MyUserDetails();
        newMyUserDetails.setMyUserId(myUser);
        mm.addAttribute("myUserDetails", newMyUserDetails);

        return "fillMyUserDetails";
    }

    @PostMapping("/doInsertMyUserDetails")
    public String insertMyUserDetails(@ModelAttribute("myUserDetails") MyUserDetails newMyUserDetails) {
        
        return "success";

    }
}
