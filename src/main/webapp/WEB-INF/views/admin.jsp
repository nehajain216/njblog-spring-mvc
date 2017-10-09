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
					<a href="">Delete</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>