package com.nj.njblog.dao;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import com.nj.njblog.entities.Post;

@Repository
public interface DAO extends PagingAndSortingRepository<Post, Integer>  {

	
}
