package com.hrm.db.dao;

import java.util.Set;

import com.hrm.db.model.Project;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;

public interface ProjectManagerDao
{
	User getUser(String login);
	Set<Project> getUserProjects(String login);
	Set<Task> getUserTasks(String login);
	Project getProject(String name);
}
