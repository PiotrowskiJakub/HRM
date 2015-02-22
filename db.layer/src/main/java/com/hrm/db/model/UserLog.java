package com.hrm.db.model;


import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author Jakub Piotrowski
 */
@Entity
@Table(name="users_logs"
    ,catalog="sbatko1"
)
public class UserLog  implements java.io.Serializable {


     private Integer uloId;
     private ActionDone actionDone;
     private User userWhoAdd;
     private User userWhoViewd;
     private Date uloDate;

    public UserLog() {}

    public UserLog(ActionDone actionDone, User userWhoAdd, User userWhoViewd, Date uloDate) {
       this.actionDone = actionDone;
       this.userWhoAdd = userWhoAdd;
       this.userWhoViewd = userWhoViewd;
       this.uloDate = uloDate;
    }
   
    @Id 
    @GeneratedValue(strategy=IDENTITY)
    @Column(name="ulo_id", unique=true, nullable=false)
    public Integer getUloId() {
        return this.uloId;
    }
    
    public void setUloId(Integer uloId) {
        this.uloId = uloId;
    }

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="ulo_ado_id", nullable=false)
    public ActionDone getActionDone() {
        return this.actionDone;
    }
    
    public void setActionDone(ActionDone actionDone) {
        this.actionDone = actionDone;
    }

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="ulo_usr_id", nullable=false)
    public User getUserWhoAdd() {
        return this.userWhoAdd;
    }
    
    public void setUserWhoAdd(User userWhoAdd) {
        this.userWhoAdd = userWhoAdd;
    }

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="ulo_usr_id_add", nullable=false)
    public User getUserWhoViewd() {
        return this.userWhoViewd;
    }
    
    public void setUserWhoViewd(User userWhoViewd) {
        this.userWhoViewd = userWhoViewd;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="ulo_date", nullable=false, length=19)
    public Date getUloDate() {
        return this.uloDate;
    }
    
    public void setUloDate(Date uloDate) {
        this.uloDate = uloDate;
    }




}


