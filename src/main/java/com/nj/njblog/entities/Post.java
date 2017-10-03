package com.nj.njblog.entities;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "posts")
public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private String title;
	
	private String content;
	
	@Column(name = "created_on")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdOn;
	
	@ManyToOne
	@JoinColumn(name="created_by")
	private User createdBy;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	@OneToMany(mappedBy="post")
	private List<Comment> comments;
	
	@ManyToMany
	@JoinTable(name="posts_tags",
        joinColumns=
            @JoinColumn(name="post_id", referencedColumnName="ID"),
        inverseJoinColumns=
            @JoinColumn(name="tag_id", referencedColumnName="ID"))
	private List<Tag> tags;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public User getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public String getSummary() {
		if (this.content == null)
			return "";

		if (this.content.length() > 140) {
			return this.content.substring(0, 140) + "...";
		} else {
			return this.content;
		}
	}

	public String getFormatedDate() {
		DateFormat df = new SimpleDateFormat("MMMM dd, yyyy");
		String formattedDate = df.format(createdOn);
		return formattedDate;
	}

}
