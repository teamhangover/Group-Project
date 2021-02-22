/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.repository;


import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Pet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author glamb
 */
@Repository
public interface PetRepository extends JpaRepository<Pet, Integer>{
    
     public Pet findByMyUserId(MyUser myUser);
}
