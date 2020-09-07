/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.repository;

import com.example.PetKeeper.model.KeepersAvailability;
import com.example.PetKeeper.model.MyUser;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author RG
 */
@Repository
public interface KeepersAvailabilityRepository extends JpaRepository<KeepersAvailability, Integer> {

    @Query("SELECT k FROM KeepersAvailability k WHERE k.unavailableDate = :unavailableDate AND k.keeperId = :keeperId")
    KeepersAvailability findByUnavailableDateAndKeeperId(@Param("unavailableDate") Date unavailableDate, @Param("keeperId") MyUser keeperId);
    
    List<KeepersAvailability> findByKeeperId(MyUser keeperId);
}
