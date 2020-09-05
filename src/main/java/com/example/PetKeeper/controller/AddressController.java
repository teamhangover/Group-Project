/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.service.AddressService;
import com.example.PetKeeper.service.MyUserService;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author RG
 */
@RestController
public class AddressController {

    @Autowired
    MyUserService myUserService;
    @Autowired
    AddressService addressService;

    @PostMapping("/keeper/registerMyAddress")
    public Address registerAddress(
            @RequestParam("latitude") String latitude,
            @RequestParam("longitude") String longitude,
            @RequestParam("country") String country,
            @RequestParam("city") String city,
            @RequestParam("streetName") String streetName,
            @RequestParam("streetNumber") String streetNumber,
            @RequestParam("postalCode") String postalCode,
            @RequestParam("price") String price,
            Principal principal) {

        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        Address myAddress = new Address();

        myAddress.setMyUserId(loggedInMyUser);
        myAddress.setCountry(country);
        myAddress.setCity(city);
        myAddress.setStreetName(streetName);
        myAddress.setStreetNumber(streetNumber);
        myAddress.setPostalCode(postalCode);
        myAddress.setPrice(new BigDecimal(price));
        myAddress.setLatitude(new BigDecimal(latitude));
        myAddress.setLongitude(new BigDecimal(longitude));

        if (loggedInMyUser.getAddress() != null) {
            myAddress.setAddressId(loggedInMyUser.getAddress().getAddressId());
            //update address info
            addressService.saveAddress(myAddress);
        } else {
            //register new address
            addressService.saveAddress(myAddress);
        }

        myAddress.setMyUserId(null);
        return myAddress;
    }

    @GetMapping("/keeper/myAddress")
    public Address getMyAddress(Principal principal) {

        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        Address myAddress = new Address();

        if (loggedInMyUser.getAddress() != null) {
            myAddress = loggedInMyUser.getAddress();
            myAddress.setMyUserId(null);
            return myAddress;
        } else {
            return null;
        }

    }

    @GetMapping("/findKeepers")
    public List<Address> findKeepers() {

        return null;
    }
}
