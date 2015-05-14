package com.sublime.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sublime.entity.Blog;
import com.sublime.entity.Item;
import com.sublime.entity.Role;
import com.sublime.entity.User;
import com.sublime.repository.BlogRepository;
import com.sublime.repository.ItemRepository;
import com.sublime.repository.RoleRepository;
import com.sublime.repository.UserRepository;

@Transactional
@Service
public class InitDbService {

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BlogRepository blogRepository;

	@Autowired
	private ItemRepository itemRepository;

	@PostConstruct
	public void init() {
		
			Role roleUser = new Role();
			roleUser.setName("ROLE_USER");
			roleRepository.save(roleUser);

			Role roleAdmin = new Role();
			roleAdmin.setName("ROLE_ADMIN");
			roleRepository.save(roleAdmin);

			User userAdmin = new User();
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			userAdmin.setName("admin");
			userAdmin.setEnabled(true);
			userAdmin.setPassword(encoder.encode("admin"));
			List<Role> roles = new ArrayList<Role>();
			roles.add(roleAdmin);
			roles.add(roleUser);
			userAdmin.setRoles(roles);
			userRepository.save(userAdmin);

			Blog blogJavavids = new Blog();
			blogJavavids.setName("JavaVids");
			blogJavavids
					.setUrl("http://feeds.feedburner.com/javavids?format=xml");
			blogJavavids.setUser(userAdmin);
			blogRepository.save(blogJavavids);

			 Item item1 = new Item();
			 item1.setBlog(blogJavavids);
			 item1.setTitle("first");
			 item1.setLink("http://www.javavids.com");
			 item1.setPublishedDate(new Date());
			 itemRepository.save(item1);
			
			 Item item2 = new Item();
			 item2.setBlog(blogJavavids);
			 item2.setTitle("second");
			 item2.setLink("http://www.javavids.com");
			 item2.setPublishedDate(new Date());
			 itemRepository.save(item2);
			 
			 Item item3 = new Item();
			 item3.setBlog(blogJavavids);
			 item3.setTitle("second");
			 item3.setLink("http://www.javavids.com");
			 item3.setPublishedDate(new Date());
			 itemRepository.save(item3);
			 
			 Item item4 = new Item();
			 item4.setBlog(blogJavavids);
			 item4.setTitle("second");
			 item4.setLink("http://www.javavids.com");
			 item4.setPublishedDate(new Date());
			 itemRepository.save(item4);
			 
			 Item item5 = new Item();
			 item5.setBlog(blogJavavids);
			 item5.setTitle("second");
			 item5.setLink("http://www.javavids.com");
			 item5.setPublishedDate(new Date());
			 itemRepository.save(item5);
			 
			 Item item6 = new Item();
			 item6.setBlog(blogJavavids);
			 item6.setTitle("second");
			 item6.setLink("http://www.javavids.com");
			 item6.setPublishedDate(new Date());
			 itemRepository.save(item6);
		

	}
}
