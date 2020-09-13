/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.dto.AddressDto;
import com.example.PetKeeper.dto.ReservastionDto;
import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Reservation;
import com.example.PetKeeper.service.MyUserService;
import com.example.PetKeeper.service.ReservationService;
import com.example.PetKeeper.service.RoleService;
import java.math.BigDecimal;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author glamb
 */
@RestController
public class ReservationController {

    @Autowired
    MyUserService myUserService;

    @Autowired
    ReservationService reservationService;

    @Autowired
    RoleService roleService;

    @GetMapping("/owner/getReservationDetails/{username}")
    public AddressDto preReservation(@PathVariable("username") String username) {
        AddressDto addressDto = new AddressDto();
        Address myAddress = myUserService.getMyUserByUsername(username).getAddress();
        addressDto.fillDtoFromAddress(myAddress);
        return addressDto;
    }

    @PostMapping("/owner/makeReservation")
    public String makeReservation(@RequestParam("keeperUsername") String keeperUsername,
            @RequestParam("fromDate") Date fromDate,
            @RequestParam("toDate") Date toDate,
            @RequestParam("totalPrice") BigDecimal totalPrice,
            Principal principal) {

        MyUser keeper = myUserService.getMyUserByUsername(keeperUsername);
        MyUser owner = myUserService.getMyUserByUsername(principal.getName());
        Reservation reservation = new Reservation();
        reservation.setDateFrom(fromDate);
        reservation.setDateTo(toDate);
        reservation.setOwnerId(owner);
        reservation.setKeeperId(keeper);
        reservation.setTotalPrice(totalPrice);
        reservationService.saveReservation(reservation);
        return "success";
    }

    @GetMapping("/myReservations")
    public List<ReservastionDto> getMyReservations(Principal principal, HttpServletRequest request) {

        MyUser loggedUser = myUserService.getMyUserByUsername(principal.getName());
        List<Reservation> myReservations = (List<Reservation>) loggedUser.getReservationsCollection();
        List<ReservastionDto> myReservastionDto = new ArrayList<>();

        for (Reservation rsrvtn : myReservations) {
            ReservastionDto reservastionDto = new ReservastionDto();
            //if keeper
            if (request.isUserInRole("ROLE_KEEPER")) {
                reservastionDto.fillByReservationForKeeper(rsrvtn);
            } else { //else owner
                reservastionDto.fillByReservationForOwner(rsrvtn);
            }
            myReservastionDto.add(reservastionDto);
        }
        return myReservastionDto;
    }

}
