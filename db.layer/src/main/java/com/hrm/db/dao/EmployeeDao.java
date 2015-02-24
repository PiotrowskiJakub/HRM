package com.hrm.db.dao;

import java.util.List;
import java.util.Set;

import com.hrm.db.model.ActionDone;
import com.hrm.db.model.Comment;
import com.hrm.db.model.Leave;
import com.hrm.db.model.Role;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;
import com.hrm.db.model.UserLog;
import com.hrm.db.model.WorkLog;

public interface EmployeeDao
{
	User getUser(String login);
	Task getTask(Integer id);
	Boolean checkUser(String login, String password);
	Role getUserRole(String login);
	Boolean isUserActive(String login);
	Set<Task> getUserTasks(String login);
	Set<Comment> getUserComments(String login);
	Set<Leave> getUserLeaves(String login);
	Set<WorkLog> getUserWorkLogs(String login);
	Set<WorkLog> getUserWorkLogsById(Integer id);
	Set<Comment> getTaskComments(Integer id);
	List<UserLog> getAllUserLogs();
	String getActionDoneName(Integer id);
	ActionDone getActionDone(Integer id);
	void addUserLog(UserLog userLog);
	void addUserLeave(String login, Leave leave);
	void addUserWorkLog(String login, WorkLog workLog);
	void addTaskComment(Integer id, Comment comment);
}
