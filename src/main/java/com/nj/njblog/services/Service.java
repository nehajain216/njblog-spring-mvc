package com.nj.njblog.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nj.njblog.dao.DAO;
import com.nj.njblog.entities.Post;

@Component
public class Service {

	private DAO dao;

	@Autowired
	public Service(DAO dao) {
		this.dao = dao;
	}

	public List<Post> getListOfAllPosts() {
		Iterable<Post> iterable = dao.findAll();
		List<Post> allPosts = new ArrayList<>();
		iterable.iterator().forEachRemaining(allPosts::add);
		return allPosts;
	}
}
