/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.MyUserDetails;
import com.example.PetKeeper.service.MyUserDetailsService;
import com.example.PetKeeper.service.MyUserService;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author RG
 */
@RequestMapping("/keeper")
@Controller
public class KeeperController {

    @Autowired
    MyUserDetailsService myUserDetailsService;
    @Autowired
    MyUserService myUserService;

    @GetMapping("dashboard")
    public String showKeeperHome() {

        return "keeper-home";
    }

    @GetMapping("profile")
    public String showMyUserDetails(HttpSession session, ModelMap mm) {

        MyUser myUser = (MyUser) session.getAttribute("loggedUser");
        MyUserDetails myUserDetails = myUserDetailsService.getMyUserDetailsByMyUser(myUser);
        mm.addAttribute("myUserDetails", myUserDetails);
        return "fillMyUserDetails";
    }

    @PostMapping("/registerMyAddress")
    @ResponseBody
    public Address registerAddress(@RequestParam("petName") String petName,
            @RequestParam("petType") String petType,
            @RequestParam("petDescription") String petDescription,
            Principal principal) {

        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        return null;
    }

    @PostMapping("/myAddress")
    @ResponseBody
    public Address getMyAddress(Principal principal) {

        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        Address myAddress = new Address();

        if (loggedInMyUser.getAddressesCollection().size() > 0) {
            List<Address> addressList = (List<Address>) loggedInMyUser.getAddressesCollection();
            //we let users to have only 1 pet for now
            myAddress = addressList.get(0);
            myAddress.setMyUserId(null);
            return myAddress;
        } else {
            return myAddress;
        }
    }
}
