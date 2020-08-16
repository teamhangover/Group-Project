/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Reservation;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author glamb
 */
@RequestMapping("/reservation")
@Controller
public class ReservationController {

    @RequestMapping
    public String showSearchForKeepers(ModelMap mm) {
        //TODO get the logged in user
        //TODO check if owner (if keeper - deny - add this to MyWebSecurityConfigurer)
        return "searchForKeepersForm";
    }

    @GetMapping("search")
    @ResponseBody
    public List<MyUser> searchResults(/*@ModelAttribute("") DaoSearchCriteria daoSearchCriteria*/) {
        List<MyUser> keepers = new ArrayList<>();
        //TODO get date_from and date_to
        //TODO get address and calculate radius
        //TODO select all available keepers that match the criteria from db and add them to the list (make sure to get only the necessary info (not pass etc.))
        return keepers;
    }

    @GetMapping("preReservation")
    public String showReservationForm(ModelMap mm) {
        Reservation newReservation = new Reservation();
        mm.addAttribute("newReservation", newReservation);
        return "reservationForm";
    }
    
    @PostMapping("reserved")
    public String showReservationComplete(@ModelAttribute("newReservation") Reservation newReservation) {
        //TODO Check if paid ? do we have prices somewhere? lol 
        //TODO add the reservation to db
        //TODO add to keepers_availability the reserved dates
        //TODO send message to keeper? who knows? 
        return "ReservationComplete";
    }
}
