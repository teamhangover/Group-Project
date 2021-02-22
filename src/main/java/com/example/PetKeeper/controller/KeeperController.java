package com.example.PetKeeper.controller;

import com.example.PetKeeper.dto.KeepersAvailabilityDto;
import com.example.PetKeeper.mapper.KeepersAvailabilityDtoMapper;
import com.example.PetKeeper.model.KeepersAvailability;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.service.MyUserDetailsService;
import com.example.PetKeeper.service.MyUserService;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.PetKeeper.service.KeepersAvailabilityService;
import java.security.Principal;
import java.util.List;

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
    @Autowired
    KeepersAvailabilityService keeperAvailabilityService;

    @GetMapping("dashboard")
    public String showKeeperHome() {
        return "keeper-home";
    }

    @ResponseBody
    @PostMapping("/changeDateStatus")
    public String changeDateStatus(@RequestParam("date") Date date, Principal principal) {

        MyUser loggedInMyUser = myUserService
                .getMyUserByUsername(principal.getName());

        KeepersAvailability keepersAvailability = KeepersAvailabilityDtoMapper
                .mapToKeepersAvailability(date, loggedInMyUser);

        keeperAvailabilityService.saveOrDeleteUnavailableDate(keepersAvailability);
        return "success";
    }

    @ResponseBody
    @PostMapping("/getUnavailableDates")
    public List<KeepersAvailabilityDto> getAllUnavailableDates(Principal principal) {

        return KeepersAvailabilityDtoMapper
                .mapToKeepersAvailabilityDtoList(
                        keeperAvailabilityService
                                .getAllUnavailableDatesByMyUser(
                                        myUserService
                                                .getMyUserByUsername(principal.getName())));
    }

}
