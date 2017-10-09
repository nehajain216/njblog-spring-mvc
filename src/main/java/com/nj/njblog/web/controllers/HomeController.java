package com.nj.njblog.web.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nj.njblog.entities.Category;
import com.nj.njblog.entities.Comment;
import com.nj.njblog.entities.Post;
import com.nj.njblog.entities.Tag;
import com.nj.njblog.entities.User;
import com.nj.njblog.services.BlogService;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
public class HomeController {

	@Autowired
	private BlogService blogService;

	@GetMapping("/")
	public String index() {
		return "redirect:/home";
	}

	@GetMapping("/home")
	public String HomePage(Model model) {
		List<Post> allPosts = blogService.getListOfAllPosts();
		model.addAttribute("posts", allPosts);
		return "home";
	}

	

	@GetMapping("/addpost")
	public String addPost(Model model) {
		model.addAttribute("post", new Post());
		return "addpost";
	}

	@PostMapping("/addpost")
	public String savePost(@ModelAttribute("post") Post post, @RequestParam(name="tagIds", defaultValue="") String tagIds) {
		post.setCreatedOn(new Date());
		User user = new User();
		user.setId(1);
		post.setCreatedBy(user);
		String[] tagIdsStrings = tagIds.split(",");
		post.setTags(new HashSet());
		for (String tagIdStr : tagIdsStrings) {
			Tag tag = new Tag();
			tag.setId(Integer.parseInt(tagIdStr));
			post.getTags().add(tag);
		}
		blogService.savePost(post);
		return "redirect:/home";
	}
	
	@GetMapping(value = "/viewpost/{id}")
	public String viewPost(@PathVariable("id") int postId, Model model) {
		Post post = blogService.getPostByPostId(postId);
		model.addAttribute("post", post);
		model.addAttribute("comment", new Comment());
		return "viewpost";
	}
	
	@PostMapping(value="/viewpost")
	public String addComment(@ModelAttribute("comment")Comment comment, @RequestParam("postId") String postId )
	{
		comment.setCreatedOn(new Date());
		Post post=new Post();
		post.setId(Integer.parseInt(postId));
		comment.setPost(post);
		blogService.saveComment(comment);
		return "redirect:/viewpost/"+postId;
	}
	
	@GetMapping("/editpost/{id}")
	public String editPost(@PathVariable("id") int postId, Model model)
	{
		Post post = blogService.getPostByPostId(postId);
		List<Integer> selectedTags = new ArrayList<Integer>();
		for(Tag tag : post.getTags())
		{
			selectedTags.add(tag.getId());
		}
		System.out.println("Selected Tags"+selectedTags);
		model.addAttribute("post", post);
		model.addAttribute("tags", selectedTags);
		return "editpost";
	}
	
	@PostMapping("/editpost")
	public String updatePost(@ModelAttribute("post")Post post)
	{
		System.out.println(post);
		blogService.updatePost(post);
		return "redirect:/viewpost/"+post.getId();
	}
	
	@GetMapping("/admin")
	public String adminPage(Model model)
	{
		List<Post> posts = blogService.getListOfAllPosts();
		model.addAttribute("posts", posts);
		return "admin";
	}
	
	@PostMapping("/admin")
	public String deletePost(@RequestParam("postId") String postId )
	{
		System.out.println("post to be deleted"+postId);
		blogService.deletePost(Integer.parseInt(postId));
		return "redirect:/admin";
	}
	

	@ModelAttribute("tagList")
	public List<Tag> getTagList() {
		List<Tag> allTags = blogService.getAllTags();
		return allTags;
	}
	
	@ModelAttribute("categoryList")
	public Map<Integer, String> getCategoryList() {
		List<Category> allCategories = blogService.getAllCategories();
		Map<Integer, String> categories = new HashMap<Integer, String>();
		for (Category category : allCategories) {
			categories.put(category.getId(), category.getName());
		}
		return categories;
	}

}
