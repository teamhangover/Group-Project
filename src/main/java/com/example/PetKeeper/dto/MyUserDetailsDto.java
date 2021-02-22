package com.example.PetKeeper.dto;

/**
 *
 * @author RG
 */
public class MyUserDetailsDto {

    private String username;
    private String firstName;
    private String lastName;
    private int age;
    private String tel;
    private String uPhotoName;
    private String uDescription;

    public MyUserDetailsDto(String username, String firstName, String lastName, int age, String tel, String uPhotoName, String uDescription) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.tel = tel;
        this.uPhotoName = uPhotoName;
        this.uDescription = uDescription;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getuPhotoName() {
        return uPhotoName;
    }

    public void setuPhotoName(String uPhotoName) {
        this.uPhotoName = uPhotoName;
    }

    public String getuDescription() {
        return uDescription;
    }

    public void setuDescription(String uDescription) {
        this.uDescription = uDescription;
    }

}
