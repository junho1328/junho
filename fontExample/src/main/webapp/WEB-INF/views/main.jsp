<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>4982</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}

#page {
	margin: auto;
	text-align: center;
	width: 1200px;
	min-width: 220px;
	max-width: 100%;
	min-height: 500px;
	max-height: 100%;
}

#main {
}

header {
	display: block;
}

nav {
	display: block;
}

#nav2 {
	display: block;
}
footer {
	display: block;
}
</style>
</head>
<body>
	<div id="page">
		<div id="menu_bar">
			<header>
				<jsp:include page="include/header.jsp" />
				
			</header>
			<nav>
				<jsp:include page="include/nav.jsp" />
			</nav>

			<div id="nav2">
				<jsp:include page="include/nav2.jsp" />
			</div>
			<div>
				<jsp:include page="include/remote_controller.jsp" />
			</div>
		</div>
		<div id="main">
			<section>
				<jsp:include page="${viewName}" />
			</section>
		</div>
		<div>
			<footer>
				<jsp:include page="include/footer.jsp" />
			</footer>
		</div>
	</div>
</body>
</html>
