/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.dto;

/**
 *
 * @author RG
 */
public class KeeperDto {

    private MyUserDetailsDto myUserDetailsDto;
    private AddressDto addressDto;

    public KeeperDto(MyUserDetailsDto myUserDetailsDto, AddressDto addressDto) {
        this.myUserDetailsDto = myUserDetailsDto;
        this.addressDto = addressDto;
    }

    public MyUserDetailsDto getMyUserDetailsDto() {
        return myUserDetailsDto;
    }

    public void setMyUserDetailsDto(MyUserDetailsDto myUserDetailsDto) {
        this.myUserDetailsDto = myUserDetailsDto;
    }

    public AddressDto getAddressDto() {
        return addressDto;
    }

    public void setAddressDto(AddressDto addressDto) {
        this.addressDto = addressDto;
    }

}
