/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper.model;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "reservations")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reservation.findAll", query = "SELECT r FROM Reservation r"),
    @NamedQuery(name = "Reservation.findByRsvId", query = "SELECT r FROM Reservation r WHERE r.rsvId = :rsvId"),
    @NamedQuery(name = "Reservation.findByDateFrom", query = "SELECT r FROM Reservation r WHERE r.dateFrom = :dateFrom"),
    @NamedQuery(name = "Reservation.findByDateTo", query = "SELECT r FROM Reservation r WHERE r.dateTo = :dateTo"),
    @NamedQuery(name = "Reservation.findByTotalPrice", query = "SELECT r FROM Reservation r WHERE r.totalPrice = :totalPrice")})
public class Reservation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "RSV_ID")
    private Integer rsvId;

    @JoinColumn(name = "KEEPER_ID", referencedColumnName = "my_user_id")
    @ManyToOne(optional = false)
    private MyUser keeperId;
    @JoinColumn(name = "OWNER_ID", referencedColumnName = "my_user_id")
    @ManyToOne(optional = false)
    private MyUser ownerId;

    @Basic(optional = false)
    @NotNull
    @Column(name = "DATE_FROM")
    @Temporal(TemporalType.DATE)
    private Date dateFrom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DATE_TO")
    @Temporal(TemporalType.DATE)
    private Date dateTo;

    @Basic(optional = false)
    @NotNull
    @Column(name = "TOTAL_PRICE")
    private BigDecimal totalPrice;

    public Reservation() {
    }

    public Reservation(Integer rsvId) {
        this.rsvId = rsvId;
    }

    public Reservation(Integer rsvId, Date dateFrom, Date dateTo, BigDecimal totalPrice) {
        this.rsvId = rsvId;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
        this.totalPrice = totalPrice;
    }

    public Integer getRsvId() {
        return rsvId;
    }

    public void setRsvId(Integer rsvId) {
        this.rsvId = rsvId;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public MyUser getKeeperId() {
        return keeperId;
    }

    public void setKeeperId(MyUser keeperId) {
        this.keeperId = keeperId;
    }

    public MyUser getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(MyUser ownerId) {
        this.ownerId = ownerId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (rsvId != null ? rsvId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reservation)) {
            return false;
        }
        Reservation other = (Reservation) object;
        if ((this.rsvId == null && other.rsvId != null) || (this.rsvId != null && !this.rsvId.equals(other.rsvId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.PetKeeper.model.Reservation[ rsvId=" + rsvId + " ]";
    }

}
