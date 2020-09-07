/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author RG
 */
@Entity
@Table(name = "addresses")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Address.findAll", query = "SELECT a FROM Address a"),
    @NamedQuery(name = "Address.findByAddressId", query = "SELECT a FROM Address a WHERE a.addressId = :addressId"),
    @NamedQuery(name = "Address.findByLongitude", query = "SELECT a FROM Address a WHERE a.longitude = :longitude"),
    @NamedQuery(name = "Address.findByLatitude", query = "SELECT a FROM Address a WHERE a.latitude = :latitude"),
    @NamedQuery(name = "Address.findByCountry", query = "SELECT a FROM Address a WHERE a.country = :country"),
    @NamedQuery(name = "Address.findByCity", query = "SELECT a FROM Address a WHERE a.city = :city"),
    @NamedQuery(name = "Address.findByStreetName", query = "SELECT a FROM Address a WHERE a.streetName = :streetName"),
    @NamedQuery(name = "Address.findByStreetNumber", query = "SELECT a FROM Address a WHERE a.streetNumber = :streetNumber"),
    @NamedQuery(name = "Address.findByPostalCode", query = "SELECT a FROM Address a WHERE a.postalCode = :postalCode"),
    @NamedQuery(name = "Address.findByPrice", query = "SELECT a FROM Address a WHERE a.price = :price")})
public class Address implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "address_id")
    private Integer addressId;

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "longitude")
    private BigDecimal longitude;

    @Basic(optional = false)
    @NotNull()
    @Column(name = "latitude")
    private BigDecimal latitude;

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "country")
    private String country;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "city")
    private String city;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "street_name")
    private String streetName;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "street_number")
    private String streetNumber;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "postal_code")
    private String postalCode;

    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private BigDecimal price;

    @JoinColumn(name = "my_user_id", referencedColumnName = "my_user_id")
    @ManyToOne(optional = false)
    private MyUser myUserId;

    public Address() {
    }

    public Address(Integer addressId) {
        this.addressId = addressId;
    }

    public Address(Integer addressId, BigDecimal longitude, BigDecimal latitude, String country, String city, String streetName, String streetNumber, String postalCode, BigDecimal price) {
        this.addressId = addressId;
        this.longitude = longitude;
        this.latitude = latitude;
        this.country = country;
        this.city = city;
        this.streetName = streetName;
        this.streetNumber = streetNumber;
        this.postalCode = postalCode;
        this.price = price;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public String getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(String streetNumber) {
        this.streetNumber = streetNumber;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public MyUser getMyUserId() {
        return myUserId;
    }

    public void setMyUserId(MyUser myUserId) {
        this.myUserId = myUserId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (addressId != null ? addressId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Address)) {
            return false;
        }
        Address other = (Address) object;
        if ((this.addressId == null && other.addressId != null) || (this.addressId != null && !this.addressId.equals(other.addressId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.PetKeeper.model.Address[ addressId=" + addressId + " ]";
    }
}
