/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

/**
 *
 * @author RG
 */
@Component
public class EmailServiceImpl implements EmailService {

//    private static final String NOREPLY_ADDRESS = "noreply@petkeeper.com";
    private static final String PETKEEPER_ADDRESS = "pet.keeper.gr@gmail.com";

    @Autowired
    private JavaMailSender emailSender;

    @Override
    public void sendSimpleMessage(String from, String subject, String text) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(from);
            message.setTo(PETKEEPER_ADDRESS);
            message.setSubject(subject);
            message.setText(text);

            emailSender.send(message);
        } catch (MailException exception) {
            exception.printStackTrace();
        }
    }

}
