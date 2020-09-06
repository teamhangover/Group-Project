/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.KeepersAvailability;

/**
 *
 * @author RG
 */
public interface KeepersAvailabilityService {
    
    public KeepersAvailability saveOrDeleteUnavailableDate(KeepersAvailability keeperAvailability);
}
