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
	<c:url var="editpost_url" value="/editpost"></c:url>
	<form:form action="${editpost_url}" method="POST" commandName="post">
		<div class="container">
			<div id="posts">
				<div class="well well-lg">
					<form:input path="id" type="hidden" />
					<b>Title* :</b>
					<form:input path="title" />
					<form:errors path="title" cssClass="error"></form:errors>
					<br> <br> <b>Content* :</b>
					<form:textarea path="content" rows="6" cols="150" />
					<form:errors path="content" cssClass="error"></form:errors>
					<br> <br> <b>Category*: </b>
					<form:select path="category.id">
						<form:option selected="true" value="${category.id}" />
						<form:options items="${categoryList}" />

					</form:select>
					<form:errors path="category.id" cssClass="error"></form:errors>
					<br> <br> <b>Tags*: </b>
					<c:forEach var="tag" items="${tagList}">
						<input type="checkbox" name="tagIds" value="${tag.id}"
							<c:if test="${post.hasTag(tag.id)}"> checked</c:if> /> ${tag.name}
							</c:forEach>
					<form:errors path="tags" cssClass="error"></form:errors>
					<br> <br> <input type="submit" value="submit">
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>