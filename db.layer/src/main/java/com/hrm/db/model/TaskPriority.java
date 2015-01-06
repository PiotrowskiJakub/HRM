package com.hrm.db.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Jakub Piotrowski
 */
@Entity
@Table(name = "task_priorities", catalog = "sbatko1")
public class TaskPriority implements java.io.Serializable
{

	private Integer tprId;
	private String tprName;
	private String tprCode;
	private Set<Task> tasks = new HashSet<Task>(0);

	public TaskPriority()
	{
	}

	public TaskPriority(String tprName, String tprCode)
	{
		this.tprName = tprName;
		this.tprCode = tprCode;
	}

	public TaskPriority(String tprName, String tprCode, Set<Task> tasks)
	{
		this.tprName = tprName;
		this.tprCode = tprCode;
		this.tasks = tasks;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "tpr_id", unique = true, nullable = false)
	public Integer getTprId()
	{
		return this.tprId;
	}

	public void setTprId(Integer tprId)
	{
		this.tprId = tprId;
	}

	@Column(name = "tpr_name", nullable = false, length = 100)
	public String getTprName()
	{
		return this.tprName;
	}

	public void setTprName(String tprName)
	{
		this.tprName = tprName;
	}

	@Column(name = "tpr_code", nullable = false, length = 100)
	public String getTprCode()
	{
		return this.tprCode;
	}

	public void setTprCode(String tprCode)
	{
		this.tprCode = tprCode;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "taskPriority")
	public Set<Task> getTasks()
	{
		return this.tasks;
	}

	public void setTasks(Set<Task> tasks)
	{
		this.tasks = tasks;
	}

}
