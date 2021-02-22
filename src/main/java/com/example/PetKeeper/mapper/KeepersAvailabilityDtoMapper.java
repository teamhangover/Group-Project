package com.example.PetKeeper.mapper;

import com.example.PetKeeper.dto.KeepersAvailabilityDto;
import com.example.PetKeeper.model.KeepersAvailability;
import com.example.PetKeeper.model.MyUser;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author RG
 */
public class KeepersAvailabilityDtoMapper {

    public static KeepersAvailabilityDto mapToKeepersAvailabilityDto(KeepersAvailability unavailableDate) {
        return new KeepersAvailabilityDto(
                unavailableDate.getUnavailableDate()
        );
    }

    public static List<KeepersAvailabilityDto> mapToKeepersAvailabilityDtoList(List<KeepersAvailability> unavailableDates) {
        List<KeepersAvailabilityDto> result = new ArrayList<>();

        unavailableDates.forEach(unavailableDate -> {
            result.add(mapToKeepersAvailabilityDto(unavailableDate));
        });

        return result;
    }
    
    public static KeepersAvailability mapToKeepersAvailability(Date date, MyUser myUser){
        KeepersAvailability keepersAvailability = new KeepersAvailability();
        keepersAvailability.setUnavailableDate(date);
        keepersAvailability.setKeeperId(myUser);
        
        return keepersAvailability;
    }
}
