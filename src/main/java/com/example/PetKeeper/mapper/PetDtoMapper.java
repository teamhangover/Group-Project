/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.mapper;

import com.example.PetKeeper.dto.PetDto;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Pet;
import java.util.List;

/**
 *
 * @author RG
 */
public class PetDtoMapper {

    public static PetDto mapToPetDto(Pet pet) {
        return new PetDto(
                pet.getPetName(),
                pet.getPetType(),
                pet.getPetDescription()
        );
    }

    public static Pet mapToPet(PetDto petDto, MyUser myUser) {
        Pet pet = new Pet();

        if (myUser.getPetsCollection().size() > 0) {
//            List<Pet> petList = (List<Pet>) myUser.getPetsCollection();
            pet = ((List<Pet>) myUser.getPetsCollection()).get(0);
        } else {
            pet.setMyUserId(myUser);
        }
        pet.setPetName(petDto.getPetName());
        pet.setPetType(petDto.getPetType());
        pet.setPetDescription(petDto.getPetDescription());

        return pet;
    }

}
