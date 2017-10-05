package com.nj.njblog.dao;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.nj.njblog.entities.Comment;

public interface CommentRepository extends PagingAndSortingRepository<Comment, Integer> {

}
