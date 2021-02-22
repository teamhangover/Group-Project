/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.dto;

import java.util.Date;

/**
 *
 * @author RG
 */
public class KeepersAvailabilityDto {

    private Date unavailableDate;

    public KeepersAvailabilityDto(Date unavailableDate) {
        this.unavailableDate = unavailableDate;
    }

    public Date getUnavailableDate() {
        return unavailableDate;
    }

    public void setUnavailableDate(Date unavailableDate) {
        this.unavailableDate = unavailableDate;
    }

}
