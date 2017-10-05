delete from comments;
delete from posts_tags;
delete from posts;
delete from categories;
delete from tags;
delete from users;

insert into users(id, name, email, password) values(1,'neha','neha@admin.com','admin');

insert into categories(id, name) values(1,'Java');
insert into categories(id, name) values(2,'JavaEE');
insert into categories(id, name) values(3,'Spring');
insert into categories(id, name) values(4,'Misc');


insert into tags(id, name) values(1,'Java');
insert into tags(id, name) values(2,'JavaEE');
insert into tags(id, name) values(3,'JPA');
insert into tags(id, name) values(4,'Hibernate');
insert into tags(id, name) values(5,'Spring');
insert into tags(id, name) values(6,'SpringMVC');
insert into tags(id, name) values(7,'SpringBOOT');
insert into tags(id, name) values(8,'JSF');

insert into posts (id, category_id, title, content, created_by, created_on) values 
(1, 1, 'spring introduction', 'Spring is spring', 1, now());

insert into posts (id, category_id, title, content, created_by, created_on) values 
(2, 1, 'springMVC introduction', 'SpringMVC is springMVC', 1, now());

insert into posts (id, category_id, title, content, created_by, created_on) values 
(3, 2, 'Hibernate introduction', 'Hibernate is Hibernate', 1, now());

insert into posts (id, category_id, title, content, created_by, created_on) values 
(4, 3, 'JPA introduction', 'JPA is JPA', 1, now());

insert into comments (id,content, created_on, name, post_id) values (1, 'Good', now(), 'Neha', 1);
insert into comments (id,content, created_on, name, post_id) values (2, 'Very Useful', now(), 'Siva', 1);
insert into comments (id,content, created_on, name, post_id) values (3, 'Great Post', now(), 'Reddy', 1);
