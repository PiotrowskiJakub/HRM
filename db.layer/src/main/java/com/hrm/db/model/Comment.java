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
@Table(name = "comments", catalog = "sbatko1")
public class Comment implements java.io.Serializable
{

	private Integer comId;
	private Task task;
	private User user;
	private String comComment;
	private Date comDate;

	public Comment()
	{
	}

	public Comment(Task task, User user)
	{
		this.task = task;
		this.user = user;
	}

	public Comment(Task task, User user, String comComment, Date comDate)
	{
		this.task = task;
		this.user = user;
		this.comComment = comComment;
		this.comDate = comDate;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "com_id", unique = true, nullable = false)
	public Integer getComId()
	{
		return this.comId;
	}

	public void setComId(Integer comId)
	{
		this.comId = comId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "com_tsk_id", nullable = false)
	public Task getTask()
	{
		return this.task;
	}

	public void setTask(Task task)
	{
		this.task = task;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "com_usr_id", nullable = false)
	public User getUser()
	{
		return this.user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	@Column(name = "com_comment", length = 65535)
	public String getComComment()
	{
		return this.comComment;
	}

	public void setComComment(String comComment)
	{
		this.comComment = comComment;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "com_date", length = 19)
	public Date getComDate()
	{
		return this.comDate;
	}

	public void setComDate(Date comDate)
	{
		this.comDate = comDate;
	}
}
