/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author RG
 */
@RequestMapping("/keeper")
@Controller
public class KeeperController {
    
    @RequestMapping(method=RequestMethod.POST)
    public String showKeeperHome(){
    
    return "keeper-home";
    }
    
    @GetMapping("schedule")
    public String createUser(){
    
    return "schedule";
    }
}
