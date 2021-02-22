package com.example.PetKeeper.dto;

/**
 *
 * @author RG
 */
public class PetDto {

    private String petName;
    private String petType;
    private String petDescription;

    public PetDto() {
    }

    public PetDto(String petName, String petType, String petDescription) {
        this.petName = petName;
        this.petType = petType;
        this.petDescription = petDescription;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public String getPetDescription() {
        return petDescription;
    }

    public void setPetDescription(String petDescription) {
        this.petDescription = petDescription;
    }

}
