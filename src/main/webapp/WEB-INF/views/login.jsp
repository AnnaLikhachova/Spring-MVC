<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>LOGIN</title>
<meta charset="UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
	<div id="heroProduct">
		<div class="redoverlay">
			<div class="container">
				<div class="row">
					<div class="herotext">
						<div>
							<h2 class="wow zoomInDown" data-wow-duration="3s">Welcome</h2>
						</div>
							<div>
								<h2 class="wow zoomInDown" data-wow-duration="3s">Christmas is coming</h2>
							</div>
							<div>
								<h2 class="wow zoomInDown" data-wow-duration="3s">Please log in</h2>
							</div>
							<a href="hello" class="btn btn-default">Main page</a> <a
								href="login" class="btn btn-default">Sign in</a> <a
								href="registration" class="btn btn-default">Register</a> <a
								href="product" class="btn btn-default">Products</a> <a
								href="cart" class="btn btn-default">Cart</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<center>
			<div id="heroSign">
				<form action='login' method="post">


					${loginError}
					<div>
						<label>Enter your login:</label>
					</div>
					<div>
						<input class="inputRL" type="text" id="userId" name="userId" />
					</div>
					<div>
						<label>Enter your password:</label>
					</div>
					<div>
						<input class="inputRL" type="password" id="password"
							name="password" />
					</div>
					<div>
						<button id="loginButton" class="btn btn-default">SEND</button>
					</div>
				</form>
			</div>
		</center>
</body>
</html>
