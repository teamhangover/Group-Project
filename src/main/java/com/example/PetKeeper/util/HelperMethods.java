package com.example.PetKeeper.util;

import com.example.PetKeeper.model.MyUser;
import com.example.PetKeeper.model.Role;

/**
 *
 * @author RG
 */
public class HelperMethods {

    public static boolean isKeeper(MyUser myUser, Role keeperRole) {
        return myUser.getRolesCollection().contains(keeperRole);
    }
}
