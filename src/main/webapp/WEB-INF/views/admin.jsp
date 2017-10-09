<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					<div>
						<h3>
							<a href="viewpost/${post.id}">${post.title}</a>
						</h3>
						<c:url value="/admin" var="deletePost"></c:url>
						<form action="${deletePost}" method="POST">
							<input name="postId" type="hidden" value="${post.id}" /> <input
								type="submit" value="delete" onClick="return confirm('Are you sure you want to delete this Post?')" />
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>