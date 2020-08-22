/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.MyUserDetails;
import com.example.PetKeeper.service.FileHandlingService;
import com.example.PetKeeper.service.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.PetKeeper.service.MyUserService;
import java.security.Principal;
import java.util.Random;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author RG
 */
@Controller
public class MyUserDetailsController {

    @Autowired
    MyUserService myUserService;
    @Autowired
    MyUserDetailsService myUserDetailsService;
    @Autowired
    FileHandlingService fileHandlingService;

    @GetMapping("/preInsertMyUserDetails")
    public String showMyUserDetailsForm(ModelMap mm, Principal principal) {

        MyUserDetails newMyUserDetails = new MyUserDetails();

        if (principal.getName() != null) {
            //getting logged in user's
            MyUser loggedInMyUser = myUserService
                    .getMyUserByUsername(principal.getName());

            if (loggedInMyUser.getMyUserDetails() != null) {
                newMyUserDetails = loggedInMyUser.getMyUserDetails();
            } else {
                newMyUserDetails.setMyUserId(loggedInMyUser);
            }

        }
        mm.addAttribute("myUserDetails", newMyUserDetails);
        return "fillMyUserDetails";
    }

    @PostMapping("/doInsertMyUserDetails")
    public String insertMyUserDetails(@ModelAttribute("myUserDetails") MyUserDetails newMyUserDetails,
            @RequestParam("profilePic") MultipartFile profilePic,
            Principal principal) {
//        getting the logged user
        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());
        newMyUserDetails.setMyUserId(loggedInMyUser);
        //giving a unique name to the file 
        Random rand = new Random();
        String profilePicName = newMyUserDetails.getMyUserId().getUsername() + rand.nextInt();
        //save file to disk and get the filename back
        newMyUserDetails.setUPhotoName(fileHandlingService.storeFileToDisk(profilePic, profilePicName));

        //save details 
        myUserDetailsService.saveMyUserDetails(newMyUserDetails);

        return "redirect:/preInsertMyUserDetails";

    }
}
