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

			<c:forEach var="post" items="${postsPage.getContent()}">
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
		<nav>
			<ul class="pager">
			<c:url value="/home" var="home_url"></c:url>
			<c:if test="${postsPage.hasPrevious()}">
				<li class="previous"><a href="${home_url}?pageNo=${postsPage.getNumber()-1}"><span aria-hidden="true">&larr;</span> Newer </a></li>
			</c:if>
			<c:if test="${!postsPage.hasPrevious()}">
				<li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> Newer </a></li>
			</c:if>
			<c:if test="${postsPage.hasNext()}">
				<li class="next"><a href="${home_url}?pageNo=${postsPage.getNumber()+1}">Older <span aria-hidden="true">&rarr;</span></a></li>
			</c:if>
			<c:if test="${!postsPage.hasNext()}">
				<li class="next disabled"><a href="#">Older <span aria-hidden="true">&rarr;</span></a></li>
			</c:if>
			</ul>
		</nav>
	</div>

</body>
</html>