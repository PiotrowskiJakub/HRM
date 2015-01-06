package com.hrm.db.dao;

import java.util.Set;

import com.hrm.db.model.Project;
import com.hrm.db.model.Task;

public interface TestDao
{
	Boolean checkUser(String login, String password);
	Set<Project> getUserProjects(String login);
	Set<Task> getUserTasks(String login);
}
