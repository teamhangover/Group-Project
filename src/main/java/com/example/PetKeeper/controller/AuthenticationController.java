package com.example.PetKeeper.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author glamb
 */
@Controller
public class AuthenticationController {
    
    @GetMapping("/loginPage")
    public String showLoginPage() {
        return "login";
    }
    
    @GetMapping("/access-denied")
    public String showAccessDeniedPage() {
        return "access-denied";
    }
}
