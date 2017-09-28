package com.nj.njblog.web.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nj.njblog.entities.Post;
import com.nj.njblog.services.Service;

@Controller
public class HomeController {
	
	@Autowired
	private Service service;
	
	@GetMapping("/")
	public String index()
	{
		System.out.println("hello from index");
		return "index";
	}
	
	@GetMapping("/home")
	public String HomePage(Model model) 
	{
		System.out.println("hello from home");
		List<Post> allPosts = service.getListOfAllPosts();
		model.addAttribute("ListOfAllPosts", allPosts);
		return "home";
	}
}
