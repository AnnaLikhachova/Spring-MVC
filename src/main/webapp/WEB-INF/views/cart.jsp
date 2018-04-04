<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
							<h5>Welcome ${loggedUser.name}</h5>
						</div>
						<div>
							<form action='' method='post'>
								<input type="hidden" class="btn-relative2" name="logout"
									value="${loggedUser.name}" /> <input type="submit"
									class="btn-relative2" name="logout" value="logout" />
							</form>
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


	<div id="products" class="container">

		<div>Your order: ${sessionScope.sum}</div>

		<!--SMALL ITEM START-->
		<c:forEach items="${sessionScope.cart}" var="item">
			<div class="col-md-6">
				<!--SMALL PRODUCT IMAGE START-->
				<div class="col-md-4 text-center">
					<img src="data:image/jpeg;base64, ${item.key.encode} " />
				</div>
				<!--PRODUCT IMAGE END-->

				<!--SMALL PRODUCT DESCRIPTION START-->
				<div class="col-md-8">
					<h4>
						 Product: ${item.key.productname}
					</h4>
					<p>Category: ${item.key.category}</p>
					<p>Quantity: ${item.value}</p>
					<p class="price">
						<span class="highlight"><div>Price:
								${item.key.price*item.value}</div></span>
					</p>
					<form action='' method='post'>
						<input type='hidden' name='id' value="${item.key.id}" /> <input
							type='submit' name='add' value='add' ' /> <input type='hidden'
							name='id' value="${item.key.id}" /> <input type='submit'
							name='delete' value='delete' />
					</form>
				</div>

			</div>
		</c:forEach>
		<!--SMALL PRODUCT DESCRIPTION END-->
	</div>

</body>
</html>