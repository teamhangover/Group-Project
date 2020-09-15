/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.repository;

import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.model.MyUser;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author glamb
 */
@Repository
public interface AddressRepository extends JpaRepository<Address, Integer> {

    public Address findByMyUserId(MyUser myUser);

    //this native query finds addresses within 3km from the given lat/lng (center)
  @Query(value="SELECT * FROM addresses a HAVING ( 6371 * acos( cos( radians( ?1 ) ) * cos( radians( a.latitude ) ) * cos( radians( a.longitude ) - radians( ?2 ) ) + sin( radians( ?1 ) ) * sin( radians( a.latitude ) ) ) ) < 3;"
            , nativeQuery = true)
    List<Address> findAllByLngLatWithinRadius(@Param("lat") BigDecimal lat, @Param("lng") BigDecimal lng);
}
