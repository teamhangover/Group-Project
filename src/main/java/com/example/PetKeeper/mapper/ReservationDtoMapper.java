package com.example.PetKeeper.mapper;

import com.example.PetKeeper.dto.ReservationDto;
import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Pet;
import com.example.PetKeeper.model.Reservation;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author RG
 */
public class ReservationDtoMapper {

    public static ReservationDto mapToReservationDto(Reservation reservation, boolean isKeeper) {
        ReservationDto reservationDto;

        if (isKeeper) {
            reservationDto = mapToCommonFieldsOfReservationDtoByMyUser(reservation.getOwnerId());

            List<Pet> pets = (List<Pet>) reservation.getOwnerId().getPetsCollection();
            reservationDto.setOwnerPetType(pets.get(0).getPetType());
            reservationDto.setAddressStr(null);
        } else {
            reservationDto = mapToCommonFieldsOfReservationDtoByMyUser(reservation.getKeeperId());

            reservationDto.setAddressStr(reservation.getKeeperId().getAddress().toString());
            reservationDto.setOwnerPetType(null);
        }

        reservationDto.setTotalPrice(reservation.getTotalPrice());
        reservationDto.setDateFrom(reservation.getDateFrom());
        reservationDto.setDateTo(reservation.getDateTo());

        return reservationDto;

    }

    private static ReservationDto mapToCommonFieldsOfReservationDtoByMyUser(MyUser myUser) {
        ReservationDto reservationDto = new ReservationDto();
        reservationDto.setFirstName(myUser.getMyUserDetails().getFirstName());
        reservationDto.setLastName(myUser.getMyUserDetails().getLastName());
        reservationDto.setProfPhoto(myUser.getMyUserDetails().getUPhotoName());

        return reservationDto;
    }

    public static Reservation mapToReservation(ReservationDto reservationDto, MyUser keeper, MyUser owner) {
        Reservation reservation = new Reservation();
        reservation.setOwnerId(owner);
        reservation.setKeeperId(keeper);
        reservation.setDateFrom(reservationDto.getDateFrom());
        reservation.setDateTo(reservationDto.getDateTo());
        reservation.setTotalPrice(reservationDto.getTotalPrice());

        return reservation;
    }

    public static List<ReservationDto> mapToReservationDtoList(List<Reservation> reservations, boolean isKeeper) {
        List<ReservationDto> myReservastionsDto = new ArrayList<>();

        for (Reservation rsrvtn : reservations) {
            myReservastionsDto.add(mapToReservationDto(rsrvtn, isKeeper));
        }
        return myReservastionsDto;

    }

}
