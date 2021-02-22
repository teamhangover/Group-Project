package com.example.PetKeeper.controller;

import com.example.PetKeeper.dto.KeeperDto;
import com.example.PetKeeper.dto.ReservationDto;
import com.example.PetKeeper.mapper.AddressDtoMapper;
import com.example.PetKeeper.mapper.KeeperDtoMapper;
import com.example.PetKeeper.mapper.MyUserDetailsDtoMapper;
import com.example.PetKeeper.mapper.ReservationDtoMapper;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Reservation;
import com.example.PetKeeper.service.MyUserService;
import com.example.PetKeeper.service.ReservationService;
import com.example.PetKeeper.service.RoleService;
import java.math.BigDecimal;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    public KeeperDto preReservation(@PathVariable("username") String username) {

        MyUser keeper = myUserService.getMyUserByUsername(username);

        return KeeperDtoMapper.mapToKeeperDto(
                MyUserDetailsDtoMapper
                        .mapToMyUserDetailsDto(keeper.getMyUserDetails()),
                AddressDtoMapper
                        .mapToAddressDto(keeper.getAddress()));
    }

    //refactor so to get ReservationDto , map it to Reservation model and return success? true: false;
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

    @RequestMapping(value = "/myReservations", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<ReservationDto> getMyReservations(Principal principal, HttpServletRequest request) {

        MyUser loggedUser = myUserService.getMyUserByUsername(principal.getName());
        List<Reservation> myReservations;

        boolean isKeeper = request.isUserInRole("ROLE_KEEPER");

        if (isKeeper) {
            myReservations = (List<Reservation>) loggedUser.getReservationsCollection();
        } else {
            myReservations = reservationService.getReservationsByOwnerId(loggedUser);
        }

        return myReservations.size() > 0
                ? ReservationDtoMapper.mapToReservationDtoList(myReservations, isKeeper)
                : null;
    }

}
