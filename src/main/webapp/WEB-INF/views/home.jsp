<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
<%@include file="include-css-js.jsp"%>
</head>
<body>

	<%@include file="topnav.jsp"%>
	<div class="container">
		<div id="posts">
			<c:forEach var="post" items="${posts}">
				<div class="well well-lg">
					<h3>
						<a href="viewpost/${post.id}">${post.title}</a>
					</h3>
					<p>
						<span class="glyphicon glyphicon-calendar">${post.formatedDate}</span>
						<a href="#" class="glyphicon glyphicon-comment">Leave a
							comment</a>
					</p>
					<p>${post.summary}</p>
					<p>
						Category: <span class="label label-warning">${post.category.name}</span>
					</p>

					<p>
						Tags:
						<c:forEach var="tag" items="${post.tags}">
							<span class="label label-primary">${tag.name}</span>
						</c:forEach>
					</p>
					<p>
						<a class="btn btn-primary" href="viewpost/${post.id}"
							role="button">Read more</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>