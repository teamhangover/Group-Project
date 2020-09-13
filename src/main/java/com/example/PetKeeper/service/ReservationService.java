/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.Reservation;

/**
 *
 * @author RG
 */
public interface ReservationService {
    
    public Reservation saveReservation(Reservation reservation);
}
