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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
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
            @RequestParam("photo") MultipartFile profilePic,
            Principal principal) {
//        getting the logged user
        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());
        newMyUserDetails.setMyUserId(loggedInMyUser);

        //if Multipart is not empty
        if (!profilePic.getOriginalFilename().equals("")) {
            //giving a name to the file 
            String profilePicName = newMyUserDetails.getMyUserId().getUsername() + "-Photo";
            //save file to disk and get the filename.extension back
            newMyUserDetails.setUPhotoName(fileHandlingService.storeFileToDisk(profilePic, profilePicName));

        } else if (null != loggedInMyUser.getMyUserDetails() && null != loggedInMyUser.getMyUserDetails().getUPhotoName()) {
            //set previous photo profile if none given this time
            newMyUserDetails.setUPhotoName(loggedInMyUser.getMyUserDetails().getUPhotoName());
        } else {
            newMyUserDetails.setUPhotoName("no-profile-pic-icon-12.png");
        }

        //save details 
        myUserDetailsService.saveMyUserDetails(newMyUserDetails);

        return "redirect:/preInsertMyUserDetails";
    }

    @GetMapping("/getProfilePhoto/{username}")
    @ResponseBody
    public String getProfilePhotoName(@PathVariable("username") String username) {

        MyUser myUser = myUserService.getMyUserByUsername(username);
        if (null != myUser.getMyUserDetails() && !myUser.getMyUserDetails().getUPhotoName().isEmpty()) {
            return myUser.getMyUserDetails().getUPhotoName();
        } else {
            return null;
        }
    }
}
