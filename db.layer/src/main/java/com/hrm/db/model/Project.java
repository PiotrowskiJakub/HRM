package com.hrm.db.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Jakub Piotrowski
 */
@Entity
@Table(name = "projects", catalog = "sbatko1")
public class Project implements java.io.Serializable
{

	private Integer prjId;
	private String prjName;
	private String prjCode;
	private String prjDescription;
	private Boolean prjFinished;
	private Set<Task> tasks = new HashSet<Task>(0);
	private Set<User> users = new HashSet<User>(0);

	public Project()
	{
	}

	public Project(String prjName, String prjCode)
	{
		this.prjName = prjName;
		this.prjCode = prjCode;
	}

	public Project(String prjName, String prjCode, String prjDescription,
			Boolean prjFinished, Set<Task> tasks, Set<User> users)
	{
		this.prjName = prjName;
		this.prjCode = prjCode;
		this.prjDescription = prjDescription;
		this.prjFinished = prjFinished;
		this.tasks = tasks;
		this.users = users;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "prj_id", unique = true, nullable = false)
	public Integer getPrjId()
	{
		return this.prjId;
	}

	public void setPrjId(Integer prjId)
	{
		this.prjId = prjId;
	}

	@Column(name = "prj_name", nullable = false, length = 200)
	public String getPrjName()
	{
		return this.prjName;
	}

	public void setPrjName(String prjName)
	{
		this.prjName = prjName;
	}

	@Column(name = "prj_code", nullable = false, length = 200)
	public String getPrjCode()
	{
		return this.prjCode;
	}

	public void setPrjCode(String prjCode)
	{
		this.prjCode = prjCode;
	}

	@Column(name = "prj_description", length = 65535)
	public String getPrjDescription()
	{
		return this.prjDescription;
	}

	public void setPrjDescription(String prjDescription)
	{
		this.prjDescription = prjDescription;
	}

	@Column(name = "prj_finished")
	public Boolean getPrjFinished()
	{
		return this.prjFinished;
	}

	public void setPrjFinished(Boolean prjFinished)
	{
		this.prjFinished = prjFinished;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "project")
	public Set<Task> getTasks()
	{
		return this.tasks;
	}

	public void setTasks(Set<Task> tasks)
	{
		this.tasks = tasks;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "users_projects", catalog = "sbatko1", joinColumns = { @JoinColumn(name = "upr_prj_id", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "upr_usr_id", nullable = false, updatable = false) })
	public Set<User> getUsers()
	{
		return this.users;
	}

	public void setUsers(Set<User> users)
	{
		this.users = users;
	}

}
