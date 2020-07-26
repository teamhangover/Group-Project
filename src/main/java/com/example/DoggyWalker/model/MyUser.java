/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author RG
 */
@Entity
@Table(name = "my_users")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MyUser.findAll", query = "SELECT m FROM MyUser m"),
    @NamedQuery(name = "MyUser.findByMyUserId", query = "SELECT m FROM MyUser m WHERE m.myUserId = :myUserId"),
    @NamedQuery(name = "MyUser.findByUsername", query = "SELECT m FROM MyUser m WHERE m.username = :username"),
    @NamedQuery(name = "MyUser.findByMyPassword", query = "SELECT m FROM MyUser m WHERE m.myPassword = :myPassword"),
    @NamedQuery(name = "MyUser.findByEmail", query = "SELECT m FROM MyUser m WHERE m.email = :email")})
public class MyUser implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "my_user_id")
    private Integer myUserId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "my_password")
    private String myPassword;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "email")
    private String email;
    @JoinTable(name = "my_users_roles", joinColumns = {
        @JoinColumn(name = "my_user_id", referencedColumnName = "my_user_id")}, inverseJoinColumns = {
        @JoinColumn(name = "role_id", referencedColumnName = "role_id")})
    @ManyToMany
    private Collection<Role> rolesCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "myUserId")
    private Collection<Pet> petsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "myUserId")
    private Collection<Address> addressesCollection;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "myUserId")
    private MyUserDetails myUserDetails;

    public MyUser() {
    }

    public MyUser(Integer myUserId) {
        this.myUserId = myUserId;
    }

    public MyUser(Integer myUserId, String username, String myPassword, String email) {
        this.myUserId = myUserId;
        this.username = username;
        this.myPassword = myPassword;
        this.email = email;
    }

    public Integer getMyUserId() {
        return myUserId;
    }

    public void setMyUserId(Integer myUserId) {
        this.myUserId = myUserId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMyPassword() {
        return myPassword;
    }

    public void setMyPassword(String myPassword) {
        this.myPassword = myPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @XmlTransient
    public Collection<Role> getRolesCollection() {
        return rolesCollection;
    }

    public void setRolesCollection(Collection<Role> rolesCollection) {
        this.rolesCollection = rolesCollection;
    }

    @XmlTransient
    public Collection<Pet> getPetsCollection() {
        return petsCollection;
    }

    public void setPetsCollection(Collection<Pet> petsCollection) {
        this.petsCollection = petsCollection;
    }

    @XmlTransient
    public Collection<Address> getAddressesCollection() {
        return addressesCollection;
    }

    public void setAddressesCollection(Collection<Address> addressesCollection) {
        this.addressesCollection = addressesCollection;
    }

    public MyUserDetails getMyUserDetails() {
        return myUserDetails;
    }

    public void setMyUserDetails(MyUserDetails myUserDetails) {
        this.myUserDetails = myUserDetails;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (myUserId != null ? myUserId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MyUser)) {
            return false;
        }
        MyUser other = (MyUser) object;
        if ((this.myUserId == null && other.myUserId != null) || (this.myUserId != null && !this.myUserId.equals(other.myUserId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.DoggyWalker.model.MyUser[ myUserId=" + myUserId + " ]";
    }
    
}
