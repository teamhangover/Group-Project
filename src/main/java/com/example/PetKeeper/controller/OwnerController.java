/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author glamb
 */
@RequestMapping("/owner")
@Controller
public class OwnerController {
    
    @RequestMapping
    public String showOwnerHome(){
    
    return "owner-home";
    }
    
    @GetMapping("/profile")
    public String showMyUserDetails(){
    
    return "fillMyUserDetails";
    }
}
