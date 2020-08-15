/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author glamb
 */
@Entity
@Table(name = "keepers_availability")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "KeepersAvailability.findAll", query = "SELECT k FROM KeepersAvailability k"),
    @NamedQuery(name = "KeepersAvailability.findByAvId", query = "SELECT k FROM KeepersAvailability k WHERE k.avId = :avId"),
    @NamedQuery(name = "KeepersAvailability.findByUnavailableDate", query = "SELECT k FROM KeepersAvailability k WHERE k.unavailableDate = :unavailableDate")})
public class KeepersAvailability implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "AV_ID")
    private Integer avId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "UNAVAILABLE_DATE")
    @Temporal(TemporalType.DATE)
    private Date unavailableDate;
    @JoinColumn(name = "KEEPER_ID", referencedColumnName = "my_user_id")
    @ManyToOne(optional = false)
    private MyUser keeperId;

    public KeepersAvailability() {
    }

    public KeepersAvailability(Integer avId) {
        this.avId = avId;
    }

    public KeepersAvailability(Integer avId, Date unavailableDate) {
        this.avId = avId;
        this.unavailableDate = unavailableDate;
    }

    public Integer getAvId() {
        return avId;
    }

    public void setAvId(Integer avId) {
        this.avId = avId;
    }

    public Date getUnavailableDate() {
        return unavailableDate;
    }

    public void setUnavailableDate(Date unavailableDate) {
        this.unavailableDate = unavailableDate;
    }

    public MyUser getKeeperId() {
        return keeperId;
    }

    public void setKeeperId(MyUser keeperId) {
        this.keeperId = keeperId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (avId != null ? avId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof KeepersAvailability)) {
            return false;
        }
        KeepersAvailability other = (KeepersAvailability) object;
        if ((this.avId == null && other.avId != null) || (this.avId != null && !this.avId.equals(other.avId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.PetKeeper.model.KeepersAvailability[ avId=" + avId + " ]";
    }
    
}
