package com.sublime.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sublime.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

}
