package com.example.PetKeeper.dto;

import java.math.BigDecimal;

/**
 *
 * @author RG
 */
public class AddressDto {

    private BigDecimal longitude;
    private BigDecimal latitude;
    private String country;
    private String city;
    private String streetName;
    private String streetNumber;
    private String postalCode;
    private BigDecimal price;

    public AddressDto() {
    }

    public AddressDto(
            BigDecimal longitude, 
            BigDecimal latitude, 
            String country, 
            String city, 
            String streetName, 
            String streetNumber, 
            String postalCode, 
            BigDecimal price) {
        this.longitude = longitude;
        this.latitude = latitude;
        this.country = country;
        this.city = city;
        this.streetName = streetName;
        this.streetNumber = streetNumber;
        this.postalCode = postalCode;
        this.price = price;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public String getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(String streetNumber) {
        this.streetNumber = streetNumber;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    
}
