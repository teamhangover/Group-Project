/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.controller;

import com.example.DoggyWalker.model.Role;
import com.example.DoggyWalker.service.RoleServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author RG
 */
@Controller
public class RoleController {
//this class is only for debugging and will be deleteed later
    @Autowired
    RoleServiceInterface roleServiceInterface;

    @GetMapping("/getRoles")
    public String getRoles() {

        List<Role> roles = roleServiceInterface.getAllRoles();
        System.out.println(roles);
        return "index";
    }
}
