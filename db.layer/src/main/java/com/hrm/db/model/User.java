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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * @author Jakub Piotrowski
 */
@Entity
@Table(name = "users", catalog = "sbatko1", uniqueConstraints = @UniqueConstraint(columnNames = "usr_login"))
public class User implements java.io.Serializable
{

	private Integer usrId;
	private Role role;
	private Section section;
	private User user;
	private String usrLogin;
	private String usrPassword;
	private String usrEmail;
	private Date usrDateCreation;
	private Boolean usrActive;
	private Integer usrLeaveLimit;
	private Set<User> users = new HashSet<User>(0);
	private Set<Project> projects = new HashSet<Project>(0);
	private Set<WorkLog> workLogs = new HashSet<WorkLog>(0);
	private Set<Leave> leavesForLeaWhoDecided = new HashSet<Leave>(0);
	private Set<Task> tasksForTskUsrWorkerId = new HashSet<Task>(0);
	private Set<Task> tasksForTskUsrLeaderId = new HashSet<Task>(0);
	private Set<Leave> leavesForLeaUsrId = new HashSet<Leave>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);

	public User()
	{
	}

	public User(Role role, String usrLogin, String usrPassword,
			boolean usrActive)
	{
		this.role = role;
		this.usrLogin = usrLogin;
		this.usrPassword = usrPassword;
		this.usrActive = usrActive;
	}

	public User(Role role, Section section, User user, String usrLogin,
			String usrPassword, String usrEmail, Date usrDateCreation,
			boolean usrActive, Integer usrLeaveLimit, Set<User> users,
			Set<Project> projects, Set<WorkLog> workLogs, Set<Leave> leavesForLeaWhoDecided,
			Set<Task> tasksForTskUsrWorkerId, Set<Task> tasksForTskUsrLeaderId,
			Set<Leave> leavesForLeaUsrId, Set<Comment> comments)
	{
		this.role = role;
		this.section = section;
		this.user = user;
		this.usrLogin = usrLogin;
		this.usrPassword = usrPassword;
		this.usrEmail = usrEmail;
		this.usrDateCreation = usrDateCreation;
		this.usrActive = usrActive;
		this.usrLeaveLimit = usrLeaveLimit;
		this.users = users;
		this.projects = projects;
		this.workLogs = workLogs;
		this.leavesForLeaWhoDecided = leavesForLeaWhoDecided;
		this.tasksForTskUsrWorkerId = tasksForTskUsrWorkerId;
		this.tasksForTskUsrLeaderId = tasksForTskUsrLeaderId;
		this.leavesForLeaUsrId = leavesForLeaUsrId;
		this.comments = comments;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "usr_id", unique = true, nullable = false)
	public Integer getUsrId()
	{
		return this.usrId;
	}

	public void setUsrId(Integer usrId)
	{
		this.usrId = usrId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usr_rol_id", nullable = false)
	public Role getRole()
	{
		return this.role;
	}

	public void setRole(Role role)
	{
		this.role = role;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usr_sec_id")
	public Section getSection()
	{
		return this.section;
	}

	public void setSection(Section section)
	{
		this.section = section;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usr_boss_usr_id")
	public User getUser()
	{
		return this.user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	@Column(name = "usr_login", unique = true, nullable = false, length = 100)
	public String getUsrLogin()
	{
		return this.usrLogin;
	}

	public void setUsrLogin(String usrLogin)
	{
		this.usrLogin = usrLogin;
	}

	@Column(name = "usr_password", nullable = false, length = 100)
	public String getUsrPassword()
	{
		return this.usrPassword;
	}

	public void setUsrPassword(String usrPassword)
	{
		this.usrPassword = usrPassword;
	}

	@Column(name = "usr_email", length = 150)
	public String getUsrEmail()
	{
		return this.usrEmail;
	}

	public void setUsrEmail(String usrEmail)
	{
		this.usrEmail = usrEmail;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "usr_date_creation", length = 10)
	public Date getUsrDateCreation()
	{
		return this.usrDateCreation;
	}

	public void setUsrDateCreation(Date usrDateCreation)
	{
		this.usrDateCreation = usrDateCreation;
	}

	@Column(name = "usr_active", nullable = false)
	public Boolean isUsrActive()
	{
		return this.usrActive;
	}

	public void setUsrActive(Boolean usrActive)
	{
		this.usrActive = usrActive;
	}

	@Column(name = "usr_leave_limit")
	public Integer getUsrLeaveLimit()
	{
		return this.usrLeaveLimit;
	}

	public void setUsrLeaveLimit(Integer usrLeaveLimit)
	{
		this.usrLeaveLimit = usrLeaveLimit;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<User> getUsers()
	{
		return this.users;
	}

	public void setUsers(Set<User> users)
	{
		this.users = users;
	}

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "users_projects", catalog = "sbatko1", joinColumns = { @JoinColumn(name = "upr_usr_id", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "upr_prj_id", nullable = false, updatable = false) })
	public Set<Project> getProjects()
	{
		return this.projects;
	}

	public void setProjects(Set<Project> projects)
	{
		this.projects = projects;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<WorkLog> getWorkLogs()
	{
		return this.workLogs;
	}

	public void setWorkLogs(Set<WorkLog> workLogs)
	{
		this.workLogs = workLogs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userByLeaWhoDecided")
	public Set<Leave> getLeavesForLeaWhoDecided()
	{
		return this.leavesForLeaWhoDecided;
	}

	public void setLeavesForLeaWhoDecided(Set<Leave> leavesForLeaWhoDecided)
	{
		this.leavesForLeaWhoDecided = leavesForLeaWhoDecided;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "userByTskUsrWorkerId")
	public Set<Task> getTasksForTskUsrWorkerId()
	{
		return this.tasksForTskUsrWorkerId;
	}

	public void setTasksForTskUsrWorkerId(Set<Task> tasksForTskUsrWorkerId)
	{
		this.tasksForTskUsrWorkerId = tasksForTskUsrWorkerId;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "userByTskUsrLeaderId")
	public Set<Task> getTasksForTskUsrLeaderId()
	{
		return this.tasksForTskUsrLeaderId;
	}

	public void setTasksForTskUsrLeaderId(Set<Task> tasksForTskUsrLeaderId)
	{
		this.tasksForTskUsrLeaderId = tasksForTskUsrLeaderId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userByLeaUsrId")
	public Set<Leave> getLeavesForLeaUsrId()
	{
		return this.leavesForLeaUsrId;
	}

	public void setLeavesForLeaUsrId(Set<Leave> leavesForLeaUsrId)
	{
		this.leavesForLeaUsrId = leavesForLeaUsrId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Comment> getComments()
	{
		return this.comments;
	}

	public void setComments(Set<Comment> comments)
	{
		this.comments = comments;
	}

}
