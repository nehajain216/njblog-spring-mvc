package com.nj.njblog.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.nj.njblog.entities.Category;
import com.nj.njblog.entities.Post;

@Repository
public interface PostRepository extends PagingAndSortingRepository<Post, Integer>  {

	@Modifying
	@Query("update Post p set p.title= ?1, p.content= ?2, p.category=?4 where p.id= ?3")
	public void updateByPostId(String title, String content, int postId, Category category);
	
}
