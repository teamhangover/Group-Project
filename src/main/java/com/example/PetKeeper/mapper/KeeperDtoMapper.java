package com.example.PetKeeper.mapper;

import com.example.PetKeeper.dto.AddressDto;
import com.example.PetKeeper.dto.KeeperDto;
import com.example.PetKeeper.dto.MyUserDetailsDto;
import com.example.PetKeeper.model.Address;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author RG
 */
public class KeeperDtoMapper {

    public static KeeperDto mapToKeeperDto(MyUserDetailsDto myUserDetailsDto, AddressDto addressDto) {
        return new KeeperDto(myUserDetailsDto, addressDto);
    }

    public static List<KeeperDto> mapToKeeperDtoList(List<Address> addresses) {

        List<KeeperDto> result = new ArrayList<>();

        addresses.forEach(address -> {
            result.add(
                    mapToKeeperDto(
                            MyUserDetailsDtoMapper.mapToMyUserDetailsDto(address.getMyUserId().getMyUserDetails()),
                            AddressDtoMapper.mapToAddressDto(address)
                    )
            );
        });
        return result;
    }
}
