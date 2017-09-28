<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<table>
		<c:if test="${!ListOfAllPosts.isEmpty()}">

			<c:forEach var="allPosts" items="${ListOfAllPosts}">
				<tr>
					<td><h3>
							<b><c:out value="${allPosts.title}" /></b>
						</h3></td>
				</tr>
				<tr>
					<td><c:out value="${allPosts.description}" /></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>