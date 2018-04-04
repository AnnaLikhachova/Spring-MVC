<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
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
							<h2 class="wow zoomInDown" data-wow-duration="3s">Christmas
								is coming</h2>
						</div>
						<div>
							<h2 class="wow zoomInDown" data-wow-duration="3s">Please
								fill in registration form</h2>
						</div>
						<div>
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
	</div>
	<div id="heroReg">

		<form action="registration" method="post">
			<center>
				<div class="field">
					<label>Enter your login:</label>
					<div>
						<form:errors path="user.login" />
					</div>
					<div class="input">
						<input class="inputRL" type="text" name="login" value=""
							id="login" />
					</div>
				</div>

				<div class="field">
					<label>Enter your password:</label>
					<div>
						<form:errors path="user.psw" />
					</div>
					<div class="input">
						<input class="inputRL" type="password" name="psw" value=""
							id="psw" />
					</div>
				</div>

				<div class="field">
					<label>Re-type your password:</label>
					<div>
						<form:errors path="user.repsw" />
					</div>
					<div class="input">
						<input class="inputRL" type="password" name="repsw" value=""
							id="repsw" />
					</div>
				</div>

				<div class="field">
					<label>Enter your name:</label>
					<div>
						<form:errors path="user.name" />
					</div>
					<div class="input">
						<input class="inputRL" type="text" name="name" value="" id="name" />
					</div>
				</div>

				<div class="field">
					<label>Enter your gender:</label>
					<div>
						<form:errors path="user.gender" />
					</div>
					<div class="input">
						M<input class="inputRL" type="radio" name="gender" value="male"
							id="gender" /> F<input type="radio" name="gender" value="female"
							id="gender" />
					</div>
				</div>

				<div class="field">
					<label>Enter your area:</label>
					<div>
						<form:errors path="user.area" />
					</div>
					<div class="input" id="area">
						<select name='area'>
							<option value='1'>Ukraine</option>
							<option value='2'>USA</option>
							<option value='3'>Canada</option>
						</select>
					</div>
				</div>

				<div class="field">
					<label>Enter your comments:</label>
					<div class="input">
						<textarea name='comment' cols='40' rows='10'></textarea>
					</div>
				</div>
				<div class="field">
					<label>Download Amigo Browser</label>
					<div class="input">
						<input type="checkbox" name="agree" value="" id="login" />
					</div>
				</div>

				<div class="field">
					<div class="input">
						<a href="registration" class="btn btn-default">Reset</a>
					</div>
				</div>

				<div class="field">
					<div class="input">
						<input type="submit" class="btn btn-default" value="SEND"
							id="login" />
					</div>
				</div>
			</center>
		</form>
	</div>
</body>
</html>
