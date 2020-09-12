/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.dto.AddressDto;
import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.service.AddressService;
import com.example.PetKeeper.service.MyUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author glamb
 */
@RestController
public class ReservationController {
    
    @Autowired
    MyUserService myUserService;
    
    @GetMapping("/owner/getReservationDetails/{username}")
    public AddressDto preReservation(@PathVariable("username") String username) {
        AddressDto addressDto = new AddressDto();
        Address myAddress = myUserService.getMyUserByUsername(username).getAddress();
        addressDto.fillDtoFromAddress(myAddress);
        return addressDto;
    }
    
}
