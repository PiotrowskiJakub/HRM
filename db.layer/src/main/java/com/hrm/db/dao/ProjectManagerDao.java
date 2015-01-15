package com.hrm.db.dao;

import java.util.Set;

import com.hrm.db.model.Comment;
import com.hrm.db.model.Project;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;
import com.hrm.db.model.WorkLog;

public interface ProjectManagerDao
{
	User getUser(String login);
	Set<Project> getUserProjects(String login);
	Set<Task> getUserTasks(String login);
	Project getProject(String name);
	Task getTask(String login);
	void editTask(Task task);
	void addComment(Comment comment);
	void addWorkLog(WorkLog workLog);
}
