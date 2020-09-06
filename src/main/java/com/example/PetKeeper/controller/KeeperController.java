/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.model.KeepersAvailability;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.service.MyUserDetailsService;
import com.example.PetKeeper.service.MyUserService;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.PetKeeper.service.KeepersAvailabilityService;
import java.security.Principal;

/**
 *
 * @author RG
 */
@RequestMapping("/keeper")
@Controller
public class KeeperController {

    @Autowired
    MyUserDetailsService myUserDetailsService;
    @Autowired
    MyUserService myUserService;
    @Autowired
    KeepersAvailabilityService keeperAvailabilityService;

    @GetMapping("dashboard")
    public String showKeeperHome() {

        return "keeper-home";
    }

    @ResponseBody
    @PostMapping("/unavailableDate")
    public String registerUnavailableDate(@RequestParam("date") String date, Principal principal) {

        long dateMilli = Long.parseLong(date);
        Date newDate = new Date(dateMilli);

        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        KeepersAvailability keepersAvailability = new KeepersAvailability();
        keepersAvailability.setUnavailableDate(newDate);
        keepersAvailability.setKeeperId(loggedInMyUser);

        keeperAvailabilityService.saveOrDeleteUnavailableDate(keepersAvailability);
        return "Mresu";
    }

    @ResponseBody
    @PostMapping("/deleteUnavailableDate")
    public String deleteUnavailableDate(@RequestParam("date") String date, Principal principal) {
        long dateMilli = Long.parseLong(date);
        Date newDate = new Date(dateMilli);

        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        KeepersAvailability keepersAvailability = new KeepersAvailability();
        keepersAvailability.setUnavailableDate(newDate);
        keepersAvailability.setKeeperId(loggedInMyUser);
        keeperAvailabilityService.saveOrDeleteUnavailableDate(keepersAvailability);
        return "Ela bro";
    }
}
