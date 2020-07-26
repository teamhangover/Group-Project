/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.service;

import com.example.DoggyWalker.model.MyUser;
import com.example.DoggyWalker.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.DoggyWalker.repository.MyUserRepository;
import com.example.DoggyWalker.repository.RoleRepository;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;

/**
 *
 * @author glamb
 */
@Service
public class MyUserServiceImpl implements MyUserServiceInterface {

    @Autowired
    MyUserRepository myUserRepository;
    @Autowired
    RoleRepository roleRepository;

    @Override
    @Transactional
    public MyUser saveNewMyUser(MyUser myUser, boolean isKeeper) {

        Role role;
        System.out.println(myUser);
        List<Role> userRoles = new ArrayList<>();

        if (isKeeper) {
            //RoleID= 2 keeper 
            role = roleRepository.getOne(2);
        } else {
            //RoleID=1 owner
            role = roleRepository.getOne(1);
        }
        userRoles.add(role);
        myUser.setRolesCollection(userRoles);
        MyUser savedUser = myUserRepository.save(myUser);

        return savedUser;
    }

    @Override
    public MyUser getMyUserById(int id) {
        return myUserRepository.getOne(id);
    }
}
