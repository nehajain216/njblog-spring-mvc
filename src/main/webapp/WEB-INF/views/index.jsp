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
	<div class="container">
		<ul class="nav nav-pills navbar navbar-inverse">
			<li role="presentation" class="active"><a href="#">Home</a></li>
			<li role="presentation"><a href="#">Profile</a></li>
			<li role="presentation"><a href="#">Messages</a></li>
		</ul>
		<div class="col-sm-8 blog-main">
			<div class="blog-post">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">Panel content</div>
				</div>
			</div>
			<!-- /.blog-post -->

			<nav aria-label="...">
				<ul class="pager">
					<li class="previous"><a href="#"><span aria-hidden="true">&larr;</span>
							Older</a></li>
					<li class="next"><a href="#">Newer <span
							aria-hidden="true">&rarr;</span></a></li>
				</ul>
			</nav>

			<footer class="blog-footer">
				<p>
					Blog template built for <a href="http://njblog.com">Bootstrap</a>
					by <a href="https://twitter.com/NehaJain">@njblog</a>.
				</p>
				<p>
					<a href="#">Back to top</a>
				</p>
			</footer>
		</div>
		<!-- /.blog-main -->
		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
			<div class="sidebar-module sidebar-module-inset">
				<h4>About</h4>
				<p>
					Neha Jain is working as a Senior Java developer with 8+ years of experience.
					Familiar with Core Java, Hibernate/JPA, Spring, Spring MVC.
				</p>
			</div>
			<div class="sidebar-module">
				<h4>Archives</h4>
				<ol class="list-unstyled">
					<li><a href="#">March 2014</a></li>
					<li><a href="#">February 2014</a></li>
					<li><a href="#">January 2014</a></li>
					<li><a href="#">December 2013</a></li>
					<li><a href="#">November 2013</a></li>
					<li><a href="#">October 2013</a></li>
					<li><a href="#">September 2013</a></li>
					<li><a href="#">August 2013</a></li>
					<li><a href="#">July 2013</a></li>
					<li><a href="#">June 2013</a></li>
					<li><a href="#">May 2013</a></li>
					<li><a href="#">April 2013</a></li>
				</ol>
			</div>
			<div class="sidebar-module">
				<h4>Elsewhere</h4>
				<ol class="list-unstyled">
					<li><a href="#">GitHub</a></li>
					<li><a href="#">Twitter</a></li>
					<li><a href="#">Facebook</a></li>
				</ol>
			</div>
		</div>
		<!-- /.blog-sidebar -->
	</div><!-- /.container -->

</body>
</html>