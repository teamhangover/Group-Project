/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.KeepersAvailability;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Reservation;
import com.example.PetKeeper.repository.KeepersAvailabilityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.PetKeeper.repository.ReservationRepository;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang3.time.DateUtils;

/**
 *
 * @author RG
 */
@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    ReservationRepository reservationRepo;

    @Autowired
    KeepersAvailabilityRepository keepersAvailabilityRepo;

    @Override
    public Reservation saveReservation(Reservation reservation) {
        Reservation rsvn = reservationRepo.save(reservation);
        Date from = rsvn.getDateFrom();

        Date end = rsvn.getDateTo();

        for (Date start = from; !start.equals(end); start = DateUtils.addDays(start, 1)) {
            KeepersAvailability kprAvl = new KeepersAvailability();
            kprAvl.setKeeperId(rsvn.getKeeperId());
            kprAvl.setUnavailableDate(start);
            keepersAvailabilityRepo.save(kprAvl);
        }

        return rsvn;
    }

    @Override
    public List<Reservation> getReservationsByOwnerId(MyUser myUser) {
        return reservationRepo.findByOwnerId(myUser);
    }
}
