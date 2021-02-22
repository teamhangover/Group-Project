package com.example.PetKeeper.dto;

/**
 *
 * @author RG
 */
public class OwnerDto {

    private PetDto petDto;
    private MyUserDetailsDto myUserDetailsDto;

    public OwnerDto(PetDto petDto, MyUserDetailsDto myUsserDetailsDto) {
        this.petDto = petDto;
        this.myUserDetailsDto = myUsserDetailsDto;
    }

    public PetDto getPetDto() {
        return petDto;
    }

    public void setPetDto(PetDto petDto) {
        this.petDto = petDto;
    }

    public MyUserDetailsDto getMyUsserDetailsDto() {
        return myUserDetailsDto;
    }

    public void setMyUsserDetailsDto(MyUserDetailsDto myUsserDetailsDto) {
        this.myUserDetailsDto = myUsserDetailsDto;
    }

}
