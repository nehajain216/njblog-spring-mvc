<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/styles.css"/>">
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/njblog-spring-mvc/home">Neha Tech Blog</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/njblog-spring-mvc/home">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

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
						<a class="btn btn-primary" href="viewpost/${post.id}" role="button">Read more</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>