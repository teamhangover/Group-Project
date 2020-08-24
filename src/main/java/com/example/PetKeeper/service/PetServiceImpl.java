/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.Pet;
import com.example.PetKeeper.repository.PetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ths13
 */

@Service
public class PetServiceImpl implements PetService{
    
    @Autowired
    PetRepository petRepository;

    @Override
    public Pet savePet(Pet pet) {
       return petRepository.save(pet);
    }
    
    
}
