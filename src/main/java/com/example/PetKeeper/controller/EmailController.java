/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.controller;

import com.example.PetKeeper.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author RG
 */
@RestController
public class EmailController {

    @Autowired
    EmailService emailService;

    @PostMapping("/sendEmail")
    public String sendEmail(@RequestParam("subject") String subject,
            @RequestParam("text") String text,
            @RequestParam("email") String senderEmail) {

        emailService.sendSimpleMessage(senderEmail, subject, text);
        return "success";
    }

}
