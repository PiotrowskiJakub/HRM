package com.hrm.db.dao;

import java.util.List;
import java.util.Set;

import com.hrm.db.model.Project;
import com.hrm.db.model.Role;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;

public interface TestDao
{
	Boolean checkUser(String login, String password);
	Set<Project> getUserProjects(String login);
	Set<Task> getUserTasks(String login);
	List<User> getAllUsers();
	Role getRole(String code);
	void addUser(User user);
	void deleteUser(String login);
	User getUser(String login);
	void editUser(User user);
	void changeUserStatus(String login);
}
