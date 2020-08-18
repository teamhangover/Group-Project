/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.PetKeeper.repository.MyUserRepository;
import com.example.PetKeeper.repository.RoleRepository;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 *
 * @author glamb
 */
@Transactional
@Service
public class MyUserServiceImpl implements MyUserService {

    @Autowired
    MyUserRepository myUserRepository;
    @Autowired
    RoleRepository roleRepository;

    @Override
    public MyUser saveNewMyUser(MyUser myUser, boolean isKeeper) {

        Role role;
        System.out.println(myUser);
        List<Role> userRoles = new ArrayList<>();

        if (isKeeper == true) {
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

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MyUser myuser = myUserRepository.findByUsername(username);
        if (myuser == null) {
            throw new UsernameNotFoundException("Invalid username");
        } else {
            User springSecurityUser
                    = new User(myuser.getUsername(),
                            myuser.getMyPassword(),
                            mapRolesToAuthorities((List<Role>) myuser.getRolesCollection()));

            return springSecurityUser;

        }

    }

    private List<? extends GrantedAuthority> mapRolesToAuthorities(List<Role> roles) {
        List<GrantedAuthority> authorities = new ArrayList();

        for (Role role : roles) {
            SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleName());
            authorities.add(authority);
        }

        return authorities;
    }

    @Override
    public MyUser getMyUserByUsername(String username) {
      return myUserRepository.findByUsername(username);
    }
}
