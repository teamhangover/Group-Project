/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.model.Role;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.PetKeeper.service.RoleService;

/**
 *
 * @author RG
 */
@Controller
public class RoleController {
//this class is only for debugging and will be deleteed later
    @Autowired
    RoleService roleServiceInterface;

    @GetMapping("/getRoles")
    public String getRoles() {

        List<Role> roles = roleServiceInterface.getAllRoles();
        System.out.println(roles);
        return "index";
    }
}
