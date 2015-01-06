package com.hrm.db.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author Jakub Piotrowski
 */
@Entity
@Table(name = "tasks", catalog = "sbatko1")
public class Task implements java.io.Serializable
{

	private Integer tskId;
	private Project project;
	private TaskPriority taskPriority;
	private User userByTskUsrWorkerId;
	private User userByTskUsrLeaderId;
	private String nazwa;
	private String tskDescription;
	private Date tskCreationDate;
	private Integer tskTime;
	private Boolean tskFinished;
	private Set<WorkLog> workLogs = new HashSet<WorkLog>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);

	public Task()
	{
	}

	public Task(User userByTskUsrWorkerId, User userByTskUsrLeaderId,
			String nazwa, Date tskCreationDate, Integer tskTime, Boolean tskFinished)
	{
		this.userByTskUsrWorkerId = userByTskUsrWorkerId;
		this.userByTskUsrLeaderId = userByTskUsrLeaderId;
		this.nazwa = nazwa;
		this.tskCreationDate = tskCreationDate;
		this.tskTime = tskTime;
		this.tskFinished = tskFinished;
	}

	public Task(Project project, TaskPriority taskPriority,
			User userByTskUsrWorkerId, User userByTskUsrLeaderId,
			String nazwa, String tskDescription, Date tskCreationDate,
			Integer tskTime, Boolean tskFinished, Set<WorkLog> workLogs, Set<Comment> comments)
	{
		this.project = project;
		this.taskPriority = taskPriority;
		this.userByTskUsrWorkerId = userByTskUsrWorkerId;
		this.userByTskUsrLeaderId = userByTskUsrLeaderId;
		this.nazwa = nazwa;
		this.tskDescription = tskDescription;
		this.tskCreationDate = tskCreationDate;
		this.tskTime = tskTime;
		this.tskFinished = tskFinished;
		this.workLogs = workLogs;
		this.comments = comments;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "tsk_id", unique = true, nullable = false)
	public Integer getTskId()
	{
		return this.tskId;
	}

	public void setTskId(Integer tskId)
	{
		this.tskId = tskId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tsk_prj_id")
	public Project getProject()
	{
		return this.project;
	}

	public void setProject(Project project)
	{
		this.project = project;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tsk_tpr_id")
	public TaskPriority getTaskPriority()
	{
		return this.taskPriority;
	}

	public void setTaskPriority(TaskPriority taskPriority)
	{
		this.taskPriority = taskPriority;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tsk_usr_worker_id", nullable = false)
	public User getUserByTskUsrWorkerId()
	{
		return this.userByTskUsrWorkerId;
	}

	public void setUserByTskUsrWorkerId(User userByTskUsrWorkerId)
	{
		this.userByTskUsrWorkerId = userByTskUsrWorkerId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tsk_usr_leader_id", nullable = false)
	public User getUserByTskUsrLeaderId()
	{
		return this.userByTskUsrLeaderId;
	}

	public void setUserByTskUsrLeaderId(User userByTskUsrLeaderId)
	{
		this.userByTskUsrLeaderId = userByTskUsrLeaderId;
	}

	@Column(name = "nazwa", nullable = false, length = 65535)
	public String getNazwa()
	{
		return this.nazwa;
	}

	public void setNazwa(String nazwa)
	{
		this.nazwa = nazwa;
	}

	@Column(name = "tsk_description", length = 65535)
	public String getTskDescription()
	{
		return this.tskDescription;
	}

	public void setTskDescription(String tskDescription)
	{
		this.tskDescription = tskDescription;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "tsk_creation_date", nullable = false, length = 19)
	public Date getTskCreationDate()
	{
		return this.tskCreationDate;
	}

	public void setTskCreationDate(Date tskCreationDate)
	{
		this.tskCreationDate = tskCreationDate;
	}

	@Column(name = "tsk_time", nullable = false)
	public Integer getTskTime()
	{
		return this.tskTime;
	}

	public void setTskTime(Integer tskTime)
	{
		this.tskTime = tskTime;
	}
	
	@Column(name = "tsk_finished")
	public Boolean getTskFinished()
	{
		return this.tskFinished;
	}

	public void setTskFinished(Boolean tskFinished)
	{
		this.tskFinished = tskFinished;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "task")
	public Set<WorkLog> getWorkLogs()
	{
		return this.workLogs;
	}

	public void setWorkLogs(Set<WorkLog> workLogs)
	{
		this.workLogs = workLogs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "task")
	public Set<Comment> getComments()
	{
		return this.comments;
	}

	public void setComments(Set<Comment> comments)
	{
		this.comments = comments;
	}

}
