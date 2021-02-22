/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.repository;


import com.example.PetKeeper.model.MyUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author glamb
 */
@Repository
public interface MyUserRepository extends JpaRepository<MyUser, Integer>{
    
    public MyUser findByUsername(String username);
}
