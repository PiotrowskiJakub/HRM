package com.hrm.db.dao;

import java.util.List;
import java.util.Set;

import com.hrm.db.model.Project;
import com.hrm.db.model.Role;
import com.hrm.db.model.Section;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;

public interface AdminDao
{
	List<User> getAllUsers();
	List<Role> getAllRoles();
	List<Section> getAllSection();
	Role getRoleByCode(String code);
	Role getRoleByName(String name);
	Section getSectionByCode(String code);
	Section getSectionByName(String name);
	void addUser(User user);
	void deleteUser(String login);
	User getUser(String login);
	void editUser(User user);
	List<Project> getProjects();
	Set<Project> getUserProjects(String login);
	Set<Task> getUserTasks(String login);
	void changeUserStatus(String login);
}
