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
@Table(name = "leave_types", catalog = "sbatko1")
public class LeaveType implements java.io.Serializable
{

	private Integer ltpId;
	private String ltpName;
	private String ltpCode;
	private Set<Leave> leaves = new HashSet<Leave>(0);

	public LeaveType()
	{
	}

	public LeaveType(String ltpName, String ltpCode)
	{
		this.ltpName = ltpName;
		this.ltpCode = ltpCode;
	}

	public LeaveType(String ltpName, String ltpCode, Set<Leave> leaves)
	{
		this.ltpName = ltpName;
		this.ltpCode = ltpCode;
		this.leaves = leaves;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ltp_id", unique = true, nullable = false)
	public Integer getLtpId()
	{
		return this.ltpId;
	}

	public void setLtpId(Integer ltpId)
	{
		this.ltpId = ltpId;
	}

	@Column(name = "ltp_name", nullable = false, length = 200)
	public String getLtpName()
	{
		return this.ltpName;
	}

	public void setLtpName(String ltpName)
	{
		this.ltpName = ltpName;
	}

	@Column(name = "ltp_code", nullable = false, length = 200)
	public String getLtpCode()
	{
		return this.ltpCode;
	}

	public void setLtpCode(String ltpCode)
	{
		this.ltpCode = ltpCode;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "leaveType")
	public Set<Leave> getLeaves()
	{
		return this.leaves;
	}

	public void setLeaves(Set<Leave> leaves)
	{
		this.leaves = leaves;
	}

}
