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
@Table(name = "pets")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pet.findAll", query = "SELECT p FROM Pet p"),
    @NamedQuery(name = "Pet.findByPetId", query = "SELECT p FROM Pet p WHERE p.petId = :petId"),
    @NamedQuery(name = "Pet.findByPetName", query = "SELECT p FROM Pet p WHERE p.petName = :petName"),
    @NamedQuery(name = "Pet.findByPetType", query = "SELECT p FROM Pet p WHERE p.petType = :petType"),
    @NamedQuery(name = "Pet.findByPetDescription", query = "SELECT p FROM Pet p WHERE p.petDescription = :petDescription")})
public class Pet implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "pet_id")
    private Integer petId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "pet_name")
    private String petName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "pet_type")
    private String petType;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 300)
    @Column(name = "pet_description")
    private String petDescription;
    @JoinColumn(name = "my_user_id", referencedColumnName = "my_user_id")
    @ManyToOne(optional = false)
    private MyUser myUserId;

    public Pet() {
    }

    public Pet(Integer petId) {
        this.petId = petId;
    }

    public Pet(Integer petId, String petName, String petType, String petDescription) {
        this.petId = petId;
        this.petName = petName;
        this.petType = petType;
        this.petDescription = petDescription;
    }

    public Integer getPetId() {
        return petId;
    }

    public void setPetId(Integer petId) {
        this.petId = petId;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public String getPetDescription() {
        return petDescription;
    }

    public void setPetDescription(String petDescription) {
        this.petDescription = petDescription;
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
        hash += (petId != null ? petId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pet)) {
            return false;
        }
        Pet other = (Pet) object;
        if ((this.petId == null && other.petId != null) || (this.petId != null && !this.petId.equals(other.petId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.PetKeeper.model.Pet[ petId=" + petId + " ]";
    }
    
}
