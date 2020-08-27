/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Pet;
import com.example.PetKeeper.service.MyUserService;
import com.example.PetKeeper.service.PetService;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author RG
 */
@Controller
public class PetController {

    @Autowired
    MyUserService myUserService;
    @Autowired
    PetService petService;

    @ResponseBody
    @GetMapping("/owner/myPet")
    public Pet getMyPet(Principal principal) {
        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        Pet myPet = new Pet();

        if (loggedInMyUser.getPetsCollection().size() > 0) {
            List<Pet> petList = (List<Pet>) loggedInMyUser.getPetsCollection();
            //we let users to have only 1 pet for now
            myPet = petList.get(0);
            myPet.setMyUserId(null);
            return myPet;
        } else {
            return myPet;
        }
    }

    @RequestMapping(value = "/owner/registerPet", method = RequestMethod.POST)
    @ResponseBody
    public Pet registerPet(
            @RequestParam("petName") String petName,
            @RequestParam("petType") String petType,
            @RequestParam("petDescription") String petDescription,
            Principal principal) {

        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        Pet myPet = new Pet();
        if (loggedInMyUser.getPetsCollection().size() > 0) {
            //we only let 1 pet per user for now - if we have the time we'll adjust this later
            List<Pet> petList = (List<Pet>) loggedInMyUser.getPetsCollection();
            Pet pet = petList.get(0);
            pet.setMyUserId(loggedInMyUser);
            pet.setPetName(petName);
            pet.setPetType(petType);
            pet.setPetDescription(petDescription);
            myPet = petService.savePet(pet);
        } else {
            myPet.setMyUserId(loggedInMyUser);
            myPet.setPetName(petName);
            myPet.setPetType(petType);
            myPet.setPetDescription(petDescription);
            myPet = petService.savePet(myPet);
        }
        myPet.setMyUserId(null);
        return myPet;
    }
}
