/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.KeepersAvailability;
import com.example.PetKeeper.model.MyUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.PetKeeper.repository.KeepersAvailabilityRepository;
import java.util.Date;

/**
 *
 * @author RG
 */
@Service
public class KeepersAvailabilityServiceImpl implements KeepersAvailabilityService {

    @Autowired
    KeepersAvailabilityRepository keepersAvailabilityRepo;

    @Override
    public KeepersAvailability saveOrDeleteUnavailableDate(KeepersAvailability keeperAvailability) {
        boolean doesDateExist = checkIfDateExists(keeperAvailability.getUnavailableDate(),
                keeperAvailability.getKeeperId());
        //if exists
        if (doesDateExist) {
            //find it
            KeepersAvailability dateToBeDeleted
                    = keepersAvailabilityRepo.findByUnavailableDateAndKeeperId(keeperAvailability.getUnavailableDate(),
                            keeperAvailability.getKeeperId());
            //and delete it
            keepersAvailabilityRepo.delete(dateToBeDeleted);
            return null;
        } else {
            //if not, save it
            return keepersAvailabilityRepo.save(keeperAvailability);
        }
    }

    private boolean checkIfDateExists(Date date, MyUser myUser) {
        KeepersAvailability keepersAvl = new KeepersAvailability();
        keepersAvl = keepersAvailabilityRepo.findByUnavailableDateAndKeeperId(date, myUser);
        if (keepersAvl != null) {
            return true;
        } else {
            return false;
        }
    }

}
