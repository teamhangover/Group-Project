/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ths13
 */

@Service
public class AddressServiceImpl implements AddressService {
    
    @Autowired
    AddressRepository addressRepository;

    @Override
    public Address getAddressByMyUserId(MyUser myUser) {
        return addressRepository.findByMyUserId(myUser);
    }

    @Override
    public Address saveAddress(Address address) {
        return addressRepository.save(address);
    }

  
    
}
