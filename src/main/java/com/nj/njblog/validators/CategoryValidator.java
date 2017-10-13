package com.nj.njblog.validators;

import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.nj.njblog.entities.Category;
import com.nj.njblog.entities.Post;
import com.nj.njblog.entities.Tag;

@Component
public class CategoryValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Post.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Post post = (Post) target;
		if(post.getCategory().getId()== -1)
			errors.rejectValue("category","category.empty");
		Set<Tag> tags = post.getTags();
		if(tags.isEmpty())
			errors.rejectValue("tags", "tags.empty");
	}

}
