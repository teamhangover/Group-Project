/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "address_photos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AddressPhoto.findAll", query = "SELECT a FROM AddressPhoto a"),
    @NamedQuery(name = "AddressPhoto.findByPhotoId", query = "SELECT a FROM AddressPhoto a WHERE a.photoId = :photoId"),
    @NamedQuery(name = "AddressPhoto.findByPhotoName", query = "SELECT a FROM AddressPhoto a WHERE a.photoName = :photoName")})
public class AddressPhoto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "photo_id")
    private Integer photoId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "photo_name")
    private String photoName;
    @JoinColumn(name = "address_id", referencedColumnName = "address_id")
    @ManyToOne(optional = false)
    private Address addressId;

    public AddressPhoto() {
    }

    public AddressPhoto(Integer photoId) {
        this.photoId = photoId;
    }

    public AddressPhoto(Integer photoId, String photoName) {
        this.photoId = photoId;
        this.photoName = photoName;
    }

    public Integer getPhotoId() {
        return photoId;
    }

    public void setPhotoId(Integer photoId) {
        this.photoId = photoId;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public Address getAddressId() {
        return addressId;
    }

    public void setAddressId(Address addressId) {
        this.addressId = addressId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (photoId != null ? photoId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AddressPhoto)) {
            return false;
        }
        AddressPhoto other = (AddressPhoto) object;
        if ((this.photoId == null && other.photoId != null) || (this.photoId != null && !this.photoId.equals(other.photoId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.DoggyWalker.model.AddressPhoto[ photoId=" + photoId + " ]";
    }
    
}
