<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Post</title>
<%@include file="include-css-js.jsp"%>
</head>
<body>

	<%@include file="topnav.jsp"%>

	<div class="container">
		<div id="posts">
			<div class="well well-lg">
				<div>
					<h3>
						<span>${post.title}</span>
					</h3>
					<p align="right">
						<a href='<c:url value="/editpost/${post.id}"></c:url>'>Edit</a>
					</p>

					<p>
						<span class="glyphicon glyphicon-calendar">${post.formatedDate}</span>
					</p>
					<p>${post.content}</p>
					<p>
						Category: <span class="label label-warning">${post.category.name}</span>
					</p>

					<p>
						Tags:
						<c:forEach var="tag" items="${post.tags}">
							<span class="label label-primary">${tag.name}</span>
						</c:forEach>
					</p>
				</div>
			</div>
			<div class="well well-lg">
				<p>

					<c:forEach var="comment" items="${post.comments}">
						<div class="panel panel-default">
							<div class="panel-body">
								<p>
									<b>${comment.name}</b>
								</p>
								<p>${comment.formatedDate}</p>
								<p>${comment.content}</p>
							</div>
						</div>
					</c:forEach>

				</p>
			</div>
		</div>
		<form:form action="../viewpost" method="POST" modelAttribute="comment">
			<div class="well well-lg">
				<h3>LEAVE A REPLY</h3>
				<b>Your email address will not be published. Required fields are
					marked *</b><br> <br> <label for="inputcomment"
					class="control-label">Comment</label><br>
				<form:textarea path="content" rows="6" cols="150" />
				<br> <label for="inputName" class="control-label">Name*
					:</label><br>
				<form:input path="name" />
				<br> <label for="inputEmail" class="control-label">Email*
					:</label><br>
				<form:input path="email" />
				<input type="hidden" name="postId" value="${post.id}"> <br>
				<input type="submit" value="submit">
			</div>
		</form:form>
	</div>

</body>
</html>