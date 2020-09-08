/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.service;

import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.repository.AddressRepository;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

/**
 *
 * @author ths13
 */
@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    AddressRepository addressRepository;

    @Override
    public Address saveAddress(Address address) {
        Address savedAddress = new Address();
        try {
            savedAddress = addressRepository.save(address);
        } catch (DataIntegrityViolationException e) {
            System.out.println("Duplicate entry!");
        }
        return savedAddress;
    }

    @Override
    public List<Address> getAllByLngLatWithinRadius(BigDecimal latitude, BigDecimal longitude) {
        List<Address> list = new ArrayList<>();
        list = addressRepository.findAllByLngLatWithinRadius(latitude, longitude);
        return list;
    }

}
