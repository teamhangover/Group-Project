/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.model.Address;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author RG
 */
@RestController
public class AddressController {
    
    @PostMapping("/registerAddress")
    public Address registerAddress(){
    
        return null;
    }
    
    @GetMapping("/getAddress/{username}")
    public Address getAddress(){
    
        return null;
    }
    
    @GetMapping("/findKeepers")
    public List<Address> findKeepers(){
    
    
        
        return null;
    }
}
