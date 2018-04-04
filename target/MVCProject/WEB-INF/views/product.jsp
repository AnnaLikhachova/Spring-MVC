<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- ===========================
    STYLESHEETS
    =========================== -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css//responsive.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/animate.css"/>" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/responsive.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/animate.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/evenfly.js" />"></script>
<script src="<c:url value="/resources/js/jquery.nicescroll.min.js" />"></script>
<script src="<c:url value="/resources/js/snowstorm-min.js" />"></script>
<script src="<c:url value="/resources/js/wow.min.js" />"></script>

<spring:url value="/resources/css/style.css" var="styleCss" />
<spring:url value="/resources/css/responsive.css" var="responsiveCss" />
<spring:url value="/resources/css/animate.css" var="animateCss" />
<spring:url value="/resources/js/jquery.nicescroll.min.js"
	var="jqueryJs" />
<spring:url value="/resources/js/evenfly.js" var="evenflyJs" />
<spring:url value="/resources/js/snowstorm-min.js" var="snowstormJs" />
<spring:url value="/resources/js/wow.min.js" var="wowJs" />


<!-- ===========================
    FONTS
    =========================== -->
<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,900,600|Pacifico'
	rel='stylesheet' type='text/css'>


<!-- ===========================
    AJAX
    =========================== -->
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-1.9.1.js">
</script>

<script type="text/javascript">
	function doAjax() {

		var inputText = $("#input_str").val();

		$.ajax({
			url : 'getCharNum',
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',
			mimeType : 'application/json',
			data : ({
				text : inputText
			}),
			success : function(data) {

				var result = '"' + data.text + '", ' + data.count
						+ ' characters';
				$("#result_text").text(result);
			}
		});
	}
</script>

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

	<!-- ===========================
    PRODUCTS SECTION
    =========================== -->
	<div id="products" class="container">
		<div>
			<label>Products by category:</label><br> <a
				href="?category=Candles">Candles</a><br> <a
				href="?category=Christmas Trees">Christmas Trees</a><br>
			<a href="?category=Christmas Socks">Christmas Socks</a><br>
		</div>
	</div>
	<table>
		<tr>
			<td>
			<c:forEach items="${requestScope.products}" var="item">
					<div>
					<h4>${item.productname}</h4>
					<p>${item.category}</p>
					<p>${item.description}</p>
					
					<div id="heroTablePicture">
					<img src="data:image/jpeg;base64, ${item.encode} " />
					
					<p class="price">
						<span class="highlight">${item.price}</span> / piece
					</p>
					<form action='' method='post'>
						<input type='hidden' name='id' value="${item.id}" /> <input
								type='submit' name='buy' value='buy' onclick="doAjax()" />
					</form>
				</div>
				</div>
				</c:forEach>
				</td>
			<!--PRODUCT DESCRIPTION END-->
		</tr>
	</table>
</body>
</html>
