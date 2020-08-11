/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author RG
 */
@Entity
@Table(name = "my_user_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MyUserDetails.findAll", query = "SELECT m FROM MyUserDetails m"),
    @NamedQuery(name = "MyUserDetails.findByDetailsId", query = "SELECT m FROM MyUserDetails m WHERE m.detailsId = :detailsId"),
    @NamedQuery(name = "MyUserDetails.findByFirstName", query = "SELECT m FROM MyUserDetails m WHERE m.firstName = :firstName"),
    @NamedQuery(name = "MyUserDetails.findByLastName", query = "SELECT m FROM MyUserDetails m WHERE m.lastName = :lastName"),
    @NamedQuery(name = "MyUserDetails.findByAge", query = "SELECT m FROM MyUserDetails m WHERE m.age = :age"),
    @NamedQuery(name = "MyUserDetails.findByTel", query = "SELECT m FROM MyUserDetails m WHERE m.tel = :tel"),
    @NamedQuery(name = "MyUserDetails.findByUDescription", query = "SELECT m FROM MyUserDetails m WHERE m.uDescription = :uDescription"),
    @NamedQuery(name = "MyUserDetails.findByUPhotoName", query = "SELECT m FROM MyUserDetails m WHERE m.uPhotoName = :uPhotoName")})
public class MyUserDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "details_id")
    private Integer detailsId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "first_name")
    private String firstName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "last_name")
    private String lastName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "age")
    private int age;
    @Size(max = 15)
    @Column(name = "tel")
    private String tel;
    @Size(max = 300)
    @Column(name = "u_description")
    private String uDescription;
    @Size(max = 60)
    @Column(name = "u_photo_name")
    private String uPhotoName;
    @JoinColumn(name = "my_user_id", referencedColumnName = "my_user_id")
    @OneToOne(optional = false)
    private MyUser myUserId;

    public MyUserDetails() {
    }

    public MyUserDetails(Integer detailsId) {
        this.detailsId = detailsId;
    }

    public MyUserDetails(Integer detailsId, String firstName, String lastName, int age) {
        this.detailsId = detailsId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
    }

    public Integer getDetailsId() {
        return detailsId;
    }

    public void setDetailsId(Integer detailsId) {
        this.detailsId = detailsId;
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

    public String getUDescription() {
        return uDescription;
    }

    public void setUDescription(String uDescription) {
        this.uDescription = uDescription;
    }

    public String getUPhotoName() {
        return uPhotoName;
    }

    public void setUPhotoName(String uPhotoName) {
        this.uPhotoName = uPhotoName;
    }

    public MyUser getMyUserId() {
        return myUserId;
    }

    public void setMyUserId(MyUser myUserId) {
        this.myUserId = myUserId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (detailsId != null ? detailsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MyUserDetails)) {
            return false;
        }
        MyUserDetails other = (MyUserDetails) object;
        if ((this.detailsId == null && other.detailsId != null) || (this.detailsId != null && !this.detailsId.equals(other.detailsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.PetKeeper.model.MyUserDetails[ detailsId=" + detailsId + " ]";
    }
    
}
