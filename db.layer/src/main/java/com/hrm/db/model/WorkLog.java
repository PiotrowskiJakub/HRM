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
@Table(name = "work_logs", catalog = "sbatko1")
public class WorkLog implements java.io.Serializable
{

	private Integer wloId;
	private Task task;
	private User user;
	private String wloComment;
	private Date wloDate;
	private Double wloTime;

	public WorkLog()
	{
	}

	public WorkLog(Task task, User user, Date wloDate, Double wloTime)
	{
		this.task = task;
		this.user = user;
		this.wloDate = wloDate;
		this.wloTime = wloTime;
	}

	public WorkLog(Task task, User user, String wloComment, Date wloDate,
			Double wloTime)
	{
		this.task = task;
		this.user = user;
		this.wloComment = wloComment;
		this.wloDate = wloDate;
		this.wloTime = wloTime;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "wlo_id", unique = true, nullable = false)
	public Integer getWloId()
	{
		return this.wloId;
	}

	public void setWloId(Integer wloId)
	{
		this.wloId = wloId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "wlo_tsk_id", nullable = false)
	public Task getTask()
	{
		return this.task;
	}

	public void setTask(Task task)
	{
		this.task = task;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "wlo_usr_id", nullable = false)
	public User getUser()
	{
		return this.user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	@Column(name = "wlo_comment", length = 65535)
	public String getWloComment()
	{
		return this.wloComment;
	}

	public void setWloComment(String wloComment)
	{
		this.wloComment = wloComment;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "wlo_date", nullable = false, length = 19)
	public Date getWloDate()
	{
		return this.wloDate;
	}

	public void setWloDate(Date wloDate)
	{
		this.wloDate = wloDate;
	}

	@Column(name = "wlo_time", nullable = false, precision = 22, scale = 0)
	public Double getWloTime()
	{
		return this.wloTime;
	}

	public void setWloTime(Double wloTime)
	{
		this.wloTime = wloTime;
	}

}
