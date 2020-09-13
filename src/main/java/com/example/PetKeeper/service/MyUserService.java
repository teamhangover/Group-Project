/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.MyUser;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author glamb
 */
public interface MyUserService extends UserDetailsService{

    MyUser saveNewMyUser(MyUser myUser, boolean keeper);

    MyUser getMyUserById(int id);

    MyUser getMyUserByUsername(String username);
}
