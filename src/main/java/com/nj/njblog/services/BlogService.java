package com.nj.njblog.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

	static final int PAGE_SIZE = 3;
	@PersistenceContext
	private EntityManager em;

	@Autowired
	public BlogService(PostRepository postRepository, TagRepository tagRepository,
			CategoryRepository categoryRepository, CommentRepository commentRepository) {
		this.postRepository = postRepository;
		this.tagRepository = tagRepository;
		this.categoryRepository = categoryRepository;
		this.commentRepository = commentRepository;
	}

	public Page<Post> getListOfAllPosts(int pageNumber) {
		PageRequest pageRequest = new PageRequest(pageNumber, PAGE_SIZE, new Sort(Sort.Direction.DESC, "createdOn"));
		Page<Post> page = postRepository.findAll(pageRequest);
		return page;
	}

	public Page<Post> getListOfAllPostsEm(int pageNumber) {
		TypedQuery<Post> query = em.createQuery("From Post p orderBy p.createdOn DESC", Post.class);
		query.setFirstResult((pageNumber) * PAGE_SIZE);
		query.setMaxResults(PAGE_SIZE);
		List<Post> postList = query.getResultList();

		Query queryTotal = em.createQuery("Select count(p.id) from Post p");
		long countResult = (long) queryTotal.getSingleResult();

		int numberOfPages = (int) ((countResult / PAGE_SIZE) + 1);

		boolean hasPreviousPage = false;
		if (pageNumber>0)
			hasPreviousPage = true;
		boolean hasNextPage = false;
		if (pageNumber < numberOfPages)
			hasNextPage = true;
		return null;
	}

	public Post getPostByPostId(int postId) {
		Post post = postRepository.findOne(postId);
		return post;
	}

	public List<Tag> getAllTags() {
		Iterable<Tag> iterable = tagRepository.findAll();
		List<Tag> allTags = new ArrayList<>();
		iterable.iterator().forEachRemaining(allTags::add);
		return allTags;
	}

	public List<Category> getAllCategories() {
		Iterable<Category> iterable = categoryRepository.findAll();
		List<Category> allCategories = new ArrayList<>();
		iterable.iterator().forEachRemaining(allCategories::add);
		return allCategories;
	}

	public void savePost(Post post) {
		postRepository.save(post);
	}

	public void updatePost(Post post) {
		Post postToUpdate = postRepository.findOne(post.getId());
		postToUpdate.setTitle(post.getTitle());
		postToUpdate.setContent(post.getContent());
		postToUpdate.setCategory(post.getCategory());
		postToUpdate.setTags(post.getTags());
		postRepository.save(postToUpdate);
	}

	public void saveComment(Comment comment) {
		commentRepository.save(comment);
	}

	public void deletePost(int postId) {
		Post post = postRepository.findOne(postId);
		postRepository.delete(post);
	}
}
