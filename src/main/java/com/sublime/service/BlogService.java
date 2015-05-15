package com.sublime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sublime.entity.Blog;
import com.sublime.entity.User;
import com.sublime.repository.BlogRepository;
import com.sublime.repository.UserRepository;

@Service
public class BlogService {
	
	@Autowired
	BlogRepository blogRepository;
	
	@Autowired
	UserRepository userRepository;

	public void save(Blog blog, String name) {
		User user = userRepository.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);
		
	}

	public void remove(int id) {
		blogRepository.delete(id);
		
	}

	

}
