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
@Table(name = "sections", catalog = "sbatko1")
public class Section implements java.io.Serializable
{

	private Integer secId;
	private String secName;
	private String secCode;
	private Set<User> users = new HashSet<User>(0);

	public Section()
	{
	}

	public Section(String secName, String secCode)
	{
		this.secName = secName;
		this.secCode = secCode;
	}

	public Section(String secName, String secCode, Set<User> users)
	{
		this.secName = secName;
		this.secCode = secCode;
		this.users = users;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "sec_id", unique = true, nullable = false)
	public Integer getSecId()
	{
		return this.secId;
	}

	public void setSecId(Integer secId)
	{
		this.secId = secId;
	}

	@Column(name = "sec_name", nullable = false, length = 200)
	public String getSecName()
	{
		return this.secName;
	}

	public void setSecName(String secName)
	{
		this.secName = secName;
	}

	@Column(name = "sec_code", nullable = false, length = 200)
	public String getSecCode()
	{
		return this.secCode;
	}

	public void setSecCode(String secCode)
	{
		this.secCode = secCode;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "section")
	public Set<User> getUsers()
	{
		return this.users;
	}

	public void setUsers(Set<User> users)
	{
		this.users = users;
	}

}
