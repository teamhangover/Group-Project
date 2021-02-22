package com.example.PetKeeper.mapper;

import com.example.PetKeeper.dto.AddressDto;
import com.example.PetKeeper.model.Address;
import com.example.PetKeeper.model.MyUser;

/**
 *
 * @author RG
 */
public class AddressDtoMapper {

    public static AddressDto mapToAddressDto(Address address) {

        return new AddressDto(
                address.getLongitude(),
                address.getLatitude(),
                address.getCountry(),
                address.getCity(),
                address.getStreetName(),
                address.getStreetNumber(),
                address.getPostalCode(),
                address.getPrice());
    }

    public static Address mapToAddress(AddressDto addressDto, MyUser myUser) {
        Address temp = new Address();

        temp.setAddressId(myUser.getAddress().getAddressId());
        temp.setMyUserId(myUser);
        temp.setCity(addressDto.getCity());
        temp.setCountry(addressDto.getCountry());
        temp.setLatitude(addressDto.getLatitude());
        temp.setLongitude(addressDto.getLongitude());
        temp.setPostalCode(addressDto.getPostalCode());
        temp.setPrice(addressDto.getPrice());
        temp.setStreetName(addressDto.getStreetName());
        temp.setStreetNumber(addressDto.getStreetNumber());

        return temp;
    }
}
