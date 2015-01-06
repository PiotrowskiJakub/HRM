package com.hrm.db.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
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
@Table(name = "leaves", catalog = "sbatko1")
public class Leave implements java.io.Serializable
{

	private Integer leaId;
	private LeaveType leaveType;
	private User userByLeaWhoDecided;
	private User userByLeaUsrId;
	private Date leaDay;
	private String leaReason;
	private Boolean leaStatus;

	public Leave()
	{
	}

	public Leave(User userByLeaUsrId, Date leaDay)
	{
		this.userByLeaUsrId = userByLeaUsrId;
		this.leaDay = leaDay;
	}

	public Leave(LeaveType leaveType, User userByLeaWhoDecided,
			User userByLeaUsrId, Date leaDay, String leaReason,
			Boolean leaStatus)
	{
		this.leaveType = leaveType;
		this.userByLeaWhoDecided = userByLeaWhoDecided;
		this.userByLeaUsrId = userByLeaUsrId;
		this.leaDay = leaDay;
		this.leaReason = leaReason;
		this.leaStatus = leaStatus;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "lea_id", unique = true, nullable = false)
	public Integer getLeaId()
	{
		return this.leaId;
	}

	public void setLeaId(Integer leaId)
	{
		this.leaId = leaId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lea_ltp_id")
	public LeaveType getLeaveType()
	{
		return this.leaveType;
	}

	public void setLeaveType(LeaveType leaveType)
	{
		this.leaveType = leaveType;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lea_who_decided")
	public User getUserByLeaWhoDecided()
	{
		return this.userByLeaWhoDecided;
	}

	public void setUserByLeaWhoDecided(User userByLeaWhoDecided)
	{
		this.userByLeaWhoDecided = userByLeaWhoDecided;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lea_usr_id", nullable = false)
	public User getUserByLeaUsrId()
	{
		return this.userByLeaUsrId;
	}

	public void setUserByLeaUsrId(User userByLeaUsrId)
	{
		this.userByLeaUsrId = userByLeaUsrId;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "lea_day", nullable = false, length = 10)
	public Date getLeaDay()
	{
		return this.leaDay;
	}

	public void setLeaDay(Date leaDay)
	{
		this.leaDay = leaDay;
	}

	@Column(name = "lea_reason", length = 65535)
	public String getLeaReason()
	{
		return this.leaReason;
	}

	public void setLeaReason(String leaReason)
	{
		this.leaReason = leaReason;
	}

	@Column(name = "lea_status")
	public Boolean getLeaStatus()
	{
		return this.leaStatus;
	}

	public void setLeaStatus(Boolean leaStatus)
	{
		this.leaStatus = leaStatus;
	}

}
