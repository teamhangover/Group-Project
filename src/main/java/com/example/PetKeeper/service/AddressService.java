/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.model.MyUser;

/**
 *
 * @author ths13
 */
public interface AddressService {
    
    public Address saveAddress(Address address);
    
    public Address getAddressByMyUserId(MyUser myUser);
}
