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
import javax.persistence.UniqueConstraint;

/**
 * @author Jakub Piotrowski
 */
@Entity
@Table(name = "roles", catalog = "sbatko1", uniqueConstraints = @UniqueConstraint(columnNames = "rol_code"))
public class Role implements java.io.Serializable
{

	private Integer rolId;
	private String rolName;
	private String rolCode;
	private Set<User> users = new HashSet<User>(0);

	public Role()
	{
	}

	public Role(String rolName, String rolCode)
	{
		this.rolName = rolName;
		this.rolCode = rolCode;
	}

	public Role(String rolName, String rolCode, Set<User> users)
	{
		this.rolName = rolName;
		this.rolCode = rolCode;
		this.users = users;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "rol_id", unique = true, nullable = false)
	public Integer getRolId()
	{
		return this.rolId;
	}

	public void setRolId(Integer rolId)
	{
		this.rolId = rolId;
	}

	@Column(name = "rol_name", nullable = false, length = 100)
	public String getRolName()
	{
		return this.rolName;
	}

	public void setRolName(String rolName)
	{
		this.rolName = rolName;
	}

	@Column(name = "rol_code", unique = true, nullable = false, length = 100)
	public String getRolCode()
	{
		return this.rolCode;
	}

	public void setRolCode(String rolCode)
	{
		this.rolCode = rolCode;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
	public Set<User> getUsers()
	{
		return this.users;
	}

	public void setUsers(Set<User> users)
	{
		this.users = users;
	}

}
