package com.example.PetKeeper.dto;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author RG
 */
public class ReservationDto {

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

    public ReservationDto() {
    }

    public ReservationDto(String ownerPetType, String addressStr, String firstName, String lastName, String profPhoto, BigDecimal totalPrice, Date dateFrom, Date dateTo) {
        this.ownerPetType = ownerPetType;
        this.addressStr = addressStr;
        this.firstName = firstName;
        this.lastName = lastName;
        this.profPhoto = profPhoto;
        this.totalPrice = totalPrice;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
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
