package com.nj.njblog.web.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nj.njblog.entities.Post;
import com.nj.njblog.services.Service;

@Controller
public class HomeController {
	
	@Autowired
	private Service service;
	
	@GetMapping("/")
	public String index()
	{
		return "redirect:/home";
	}
	
	@GetMapping("/home")
	public String HomePage(Model model) 
	{
		List<Post> allPosts = service.getListOfAllPosts();
		model.addAttribute("posts", allPosts);
		return "home";
	}
	
	@RequestMapping(value="/viewpost/{id}")
	public String viewPost(@PathVariable("id")int postId, Model model)
	{
		Post post = service.getPostByPostId(postId);
		model.addAttribute("post",post);
		return "viewpost";
	}
}
