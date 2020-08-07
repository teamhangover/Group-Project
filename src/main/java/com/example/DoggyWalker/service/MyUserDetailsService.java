/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.service;

import com.example.DoggyWalker.model.MyUserDetails;

/**
 *
 * @author RG
 */
public interface MyUserDetailsService {
    
    public MyUserDetails saveMyUserDetails(int MyUserId);
}
