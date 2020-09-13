/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.model.KeepersAvailability;
import com.example.PetKeeper.model.MyUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.PetKeeper.repository.KeepersAvailabilityRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
            //if not exists, save it
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

    @Override
    public List<KeepersAvailability> getAllUnavailableDatesByMyUser(MyUser myUser) {

        List<KeepersAvailability> dates = new ArrayList<>();

        dates = keepersAvailabilityRepo.findByKeeperId(myUser);

        System.out.println(dates);
        return dates;
    }

    @Override
    public List<Address> filterAddressListBasedOnAvailability(List<Address> addresses, Date fromDate, Date toDate) {

        List<Address> result = new ArrayList<>();

        for (Address address : addresses) {
            // --- Alternative way --- does not work correctly. Takes the same time to execute so it's pointless to change it
//            List<KeepersAvailability> unavailableDates = address.getMyUserId().getKeepersAvailabilityCollection()
//                    .stream()
//                    .filter(kprsAvlb -> (kprsAvlb.getUnavailableDate().compareTo(fromDate) >= 0 && kprsAvlb.getUnavailableDate().compareTo(toDate) < 0))
//                    .collect(Collectors.toList());

            List<KeepersAvailability> unavailableDates = keepersAvailabilityRepo.findByBetweenDates(fromDate, toDate, address.getMyUserId());
            if (unavailableDates.isEmpty()) {
                result.add(address);
            }
        }
        return result;
    }

}
