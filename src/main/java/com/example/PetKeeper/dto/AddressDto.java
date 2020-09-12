/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.dto;

import com.example.PetKeeper.model.Address;
import java.math.BigDecimal;

/**
 *
 * @author RG
 */
public class AddressDto {

    //address related
    private BigDecimal longitude;
    private BigDecimal latitude;
    private String country;
    private String city;
    private String streetName;
    private String streetNumber;
    private String postalCode;
    private BigDecimal price;
    //user related
    private String username;
    private String firstName;
    private String lastName;
    private int age;
    private String tel;
    private String uPhotoName;
    private String uDescription;

    public AddressDto() {
    }

    public AddressDto(BigDecimal longitude, BigDecimal latitude, String country, String city, String streetName, String streetNumber, String postalCode, BigDecimal price, String username, String firstName, String lastName, int age, String tel, String uPhotoName, String uDescription) {
        this.longitude = longitude;
        this.latitude = latitude;
        this.country = country;
        this.city = city;
        this.streetName = streetName;
        this.streetNumber = streetNumber;
        this.postalCode = postalCode;
        this.price = price;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.tel = tel;
        this.uPhotoName = uPhotoName;
        this.uDescription = uDescription;
    }

    public void fillDtoFromAddress(Address address) {

        this.longitude = address.getLongitude();
        this.latitude = address.getLatitude();
        this.country = address.getCountry();
        this.city = address.getCity();
        this.streetName = address.getStreetName();
        this.streetNumber = address.getStreetNumber();
        this.postalCode = address.getPostalCode();
        this.price = address.getPrice();
        this.username = address.getMyUserId().getUsername();
        this.firstName = address.getMyUserId().getMyUserDetails().getFirstName();
        this.lastName = address.getMyUserId().getMyUserDetails().getLastName();
        this.age = address.getMyUserId().getMyUserDetails().getAge();
        this.tel = address.getMyUserId().getMyUserDetails().getTel();
        this.uPhotoName = address.getMyUserId().getMyUserDetails().getUPhotoName();
        this.uDescription = address.getMyUserId().getMyUserDetails().getUDescription();
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getuPhotoName() {
        return uPhotoName;
    }

    public void setuPhotoName(String uPhotoName) {
        this.uPhotoName = uPhotoName;
    }

    public String getuDescription() {
        return uDescription;
    }

    public void setuDescription(String uDescription) {
        this.uDescription = uDescription;
    }

}
