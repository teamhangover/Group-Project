package com.example.PetKeeper.controller;

import com.example.PetKeeper.dto.PetDto;
import com.example.PetKeeper.mapper.PetDtoMapper;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Pet;
import com.example.PetKeeper.service.MyUserService;
import com.example.PetKeeper.service.PetService;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

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
    public ResponseEntity getMyPet(Principal principal) {
        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        if (loggedInMyUser.getPetsCollection().size() > 0) {
            List<Pet> petList = (List<Pet>) loggedInMyUser.getPetsCollection();
            //we let users to have only 1 pet for now
            return ResponseEntity.ok(
                    PetDtoMapper.mapToPetDto(petList.get(0)));
        } else {
            return ResponseEntity.ok(new PetDto());
        }
    }

    @RequestMapping(value = "/owner/registerPet", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public void registerPet(
            @RequestBody PetDto petDto,
            Principal principal) {

        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        petService.savePet(PetDtoMapper.mapToPet(petDto, loggedInMyUser));
    }
}
