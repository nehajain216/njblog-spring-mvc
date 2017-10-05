<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
<%@include file="include-css-js.jsp" %>
</head>
<body>

	<%@include file="topnav.jsp" %>
	
	<form:form action="addpost" method="POST" modelAttribute="post">
		<div class="container">
			<div id="posts">
				<div class="well well-lg">
					<label for="inputTitle" class="control-label">Title* :</label><br>
					<form:input type="text" path="title" /><br> 
					
					<label for="inputContent" class="control-label">Content* :</label><br>
					<form:textarea path="content" rows="6" cols="150" /><br> 
					
					<label for="inputCategory" class="control-label">Category:</label>
					<form:select path="category.id">
						<form:option value="0" label="Select" />
						<form:options items="${categoryList}" />
					</form:select><br>
					
					<label for="inputTags" class="control-label">Tags:</label>
					<c:forEach var="tag" items="${tagList}">
					<input type="checkbox" name="tagIds" value="${tag.id}"/> ${tag.name}
					</c:forEach>
					
					<input type="submit" value="submit">
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>