package com.sublime.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sublime.entity.Blog;
import com.sublime.entity.Role;
import com.sublime.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);



}
