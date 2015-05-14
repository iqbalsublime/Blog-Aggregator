package com.sublime.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sublime.entity.Blog;
import com.sublime.entity.Role;
import com.sublime.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer> {
	
	List<Blog> findByUser(User user);

}
