/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.model.KeepersAvailability;
import com.example.PetKeeper.model.MyUser;
import java.util.Date;
import java.util.List;

/**
 *
 * @author RG
 */
public interface KeepersAvailabilityService {
    
    public KeepersAvailability saveOrDeleteUnavailableDate(KeepersAvailability keeperAvailability);
    
    public List<KeepersAvailability> getAllUnavailableDatesByMyUser(MyUser myUser);
    
    public List<Address> filterAddressListBasedOnAvailability(List<Address> addresses, Date fromDate, Date toDate);
}
