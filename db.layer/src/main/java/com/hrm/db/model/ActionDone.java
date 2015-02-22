package com.hrm.db.model;


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Jakub Piotrowski
 */
@Entity
@Table(name="action_done"
    ,catalog="sbatko1"
)
public class ActionDone  implements java.io.Serializable {
     private Integer adoId;
     private String adoName;
     private Set<UserLog> userLogs = new HashSet<UserLog>(0);

    public ActionDone() {}

	
    public ActionDone(Integer adoId, String adoName) {
        this.adoId = adoId;
        this.adoName = adoName;
    }
    public ActionDone(Integer adoId, String adoName, Set<UserLog> usersLogses) {
       this.adoId = adoId;
       this.adoName = adoName;
       this.userLogs = usersLogses;
    }
   
    @Id 
    @Column(name="ado_id", unique=true, nullable=false)
    public Integer getAdoId() {
        return this.adoId;
    }
    
    public void setAdoId(Integer adoId) {
        this.adoId = adoId;
    }

    
    @Column(name="ado_name", nullable=false, length=200)
    public String getAdoName() {
        return this.adoName;
    }
    
    public void setAdoName(String adoName) {
        this.adoName = adoName;
    }

    @OneToMany(fetch=FetchType.EAGER, mappedBy="actionDone")
    public Set<UserLog> getUserLogs() {
        return this.userLogs;
    }
    
    public void setUserLogs(Set<UserLog> userLogs) {
        this.userLogs = userLogs;
    }
}


