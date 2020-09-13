/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.dto;

import com.example.PetKeeper.model.Pet;
import com.example.PetKeeper.model.Reservation;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author RG
 */
public class ReservastionDto {

    //when used by keeper
    private String ownerPetType;
    //when used by owner
    private String addressStr;
    //common
    private String firstName;
    private String lastName;
    private String profPhoto;
    private BigDecimal totalPrice;
    private Date dateFrom;
    private Date dateTo;

    public ReservastionDto() {
    }

    public void fillByReservationForKeeper(Reservation reservation) {
        List<Pet> pets = (List<Pet>) reservation.getOwnerId().getPetsCollection();
        this.ownerPetType = pets.get(0).getPetType();
        this.firstName = reservation.getOwnerId().getMyUserDetails().getFirstName();
        this.lastName = reservation.getOwnerId().getMyUserDetails().getLastName();
        this.profPhoto = reservation.getOwnerId().getMyUserDetails().getUPhotoName();
        this.totalPrice = reservation.getTotalPrice();
        this.dateFrom = reservation.getDateFrom();
        this.dateTo = reservation.getDateTo();
    }

    public void fillByReservationForOwner(Reservation reservation) {
        this.addressStr = reservation.getKeeperId().getAddress().toString();
        this.firstName = reservation.getKeeperId().getMyUserDetails().getFirstName();
        this.lastName = reservation.getKeeperId().getMyUserDetails().getLastName();
        this.profPhoto = reservation.getKeeperId().getMyUserDetails().getUPhotoName();
        this.totalPrice = reservation.getTotalPrice();
        this.dateFrom = reservation.getDateFrom();
        this.dateTo = reservation.getDateTo();
    }

    public String getOwnerPetType() {
        return ownerPetType;
    }

    public void setOwnerPetType(String ownerPetType) {
        this.ownerPetType = ownerPetType;
    }

    public String getAddressStr() {
        return addressStr;
    }

    public void setAddressStr(String addressStr) {
        this.addressStr = addressStr;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getProfPhoto() {
        return profPhoto;
    }

    public void setProfPhoto(String profPhoto) {
        this.profPhoto = profPhoto;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

}
