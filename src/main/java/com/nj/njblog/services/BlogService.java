package com.nj.njblog.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nj.njblog.dao.CategoryRepository;
import com.nj.njblog.dao.CommentRepository;
import com.nj.njblog.dao.PostRepository;
import com.nj.njblog.dao.TagRepository;
import com.nj.njblog.entities.Category;
import com.nj.njblog.entities.Comment;
import com.nj.njblog.entities.Post;
import com.nj.njblog.entities.Tag;

@Service
@Transactional
public class BlogService {

	private PostRepository postRepository;
	private TagRepository tagRepository;
	private CategoryRepository categoryRepository;
	private CommentRepository commentRepository;

	@Autowired
	public BlogService(PostRepository postRepository,TagRepository tagRepository, CategoryRepository categoryRepository, CommentRepository commentRepository) {
		this.postRepository = postRepository;
		this.tagRepository = tagRepository;
		this.categoryRepository = categoryRepository;
		this.commentRepository = commentRepository;
	}

	public List<Post> getListOfAllPosts() {
		Iterable<Post> iterable = postRepository.findAll();
		List<Post> allPosts = new ArrayList<>();
		iterable.iterator().forEachRemaining(allPosts::add);
		return allPosts;
	}
	
	public Post getPostByPostId(int postId)
	{
		Post post = postRepository.findOne(postId);
		return post;
	}
	
	public List<Tag> getAllTags()
	{
		Iterable<Tag> iterable = tagRepository.findAll();
		List<Tag> allTags = new ArrayList<>();
		iterable.iterator().forEachRemaining(allTags::add);
		return allTags;
	}
	
	public List<Category> getAllCategories()
	{
		Iterable<Category> iterable = categoryRepository.findAll();
		List<Category> allCategories = new ArrayList<>();
		iterable.iterator().forEachRemaining(allCategories::add);
		return allCategories;
	}
	
	public void savePost(Post post)
	{
		postRepository.save(post);
	}
	
	public void saveComment(Comment comment)
	{
		commentRepository.save(comment);
	}
}
