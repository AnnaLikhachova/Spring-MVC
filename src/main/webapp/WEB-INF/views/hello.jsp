<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- ===========================
    THEME INFO
    =========================== -->
<meta name="description"
	content="SantaGo is a graet shop to buy Christmas presents.">
<meta name="keywords"
	content="Christmas, Free Christmas, Christmas products, ">
<meta name="author" content="Anna">

<!-- ===========================
    SITE TITLE
    =========================== -->
<title>SantaGo - Free Christmas Sales and Affiliate Landing Page
	Template</title>

<!-- ===========================
    FAVICONS
    =========================== -->
<link rel="icon" href="img/favicon.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="img/apple-touch-icon-ipad-retina.png" />
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-iphone-retina.png" />
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-ipad.png" />
<link rel="apple-touch-icon" sizes="57x57"
	href="img/apple-touch-icon-iphone.png" />

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
    GOOGLE ANALYTICS (Optional)
    =========================== -->

<!-- #NOTE: Replace this line with your analytics code -->

<!--ANALYTICS END-->

<!--[if IE]>
        <script src="https://cdn.jsdelivr.net/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!-- ===========================
    HERO SECTION
    =========================== -->
	<div id="hero">
		<div class="redoverlay">
			<div class="container">
				<div class="row">
					<div class="herotext">
					<div><h5>Welcome ${loggedUser.name}</h5></div>
					<div>
						<form action='' method='post'>
							<input type="hidden" class="btn-relative2" name="logout"
								value="${loggedUser.name}" /> <input type="submit" class="btn-relative2"
								name="logout" value="logout" />
							</form>	
						</div>	
					<a href="login" class="btn btn-default">Sign in</a> 
						<a href="registration"
							class="btn btn-default">Register</a> 
						<a href="product"
							class="btn btn-default">Products</a> 
							<a href="cart"
							class="btn btn-default">Cart</a> 
						<h2 class="wow zoomInDown" data-wow-duration="3s">HoHo
							Holiday Sale Started!</h2>
						<h1 class="wow flipInY">It is The time</h1>
							<a nclass="btn btn-reverse wow zoomIn" href="#products">
							<h3>
								To save upto 75% this holiday <span class="optional">or
									bang your head!</span>
							</h3>
						</a>
						<!--#NOTE: texts inside the OPTIONAL tag above would be hidden on smaller mobile screens -->
						<img alt="" class="bigbell wow tada infinite" data-wow-duration="30s"
							src="<spring:url value="/resources/img/bell.png" />" >
					</div>

				</div>
			</div>
			<div class="santa wow bounceInDown" data-wow-duration="2s">
						<img alt="" src="<spring:url value="/resources/img/santa.png" />">
					</div>
		</div>
	</div>
	<!--HERO SECTION END-->

	<!-- ===========================
    OVERVIEW SECTION
    =========================== -->
	<div id="overview" class="container">
		<!--SECTIONHEAD START-->
		<div class="sectionhead">
			<h2>
				Best <span class="highlight">offers</span> on christmas ever
			</h2>
			<p>SantaGo is another free Bootstrap HTML Christmas sales and
				affiliate page template built and distributed by EvenFly Team as a
				small Cristmas gift under Creative Commons 3.0 license.</p>
			<hr>
		</div>
		<!--SECTIONHEAD END-->

		<!--OVERVIEW ITEMS-->
		<div class="row">
			<div class="col-md-6 col-lg-4">
				<img src="<spring:url value="/resources/img/o1.png" />" alt="">
				<h4>Exclusively on EvenFly</h4>
				<p></p>
			</div>
			<!--ITEM END-->

			<div class="col-md-6 col-lg-4">
				<img src="<spring:url value="/resources/img/o2.png" />" alt="">
				<h4>Money back guarantee</h4>
				<p></p>
			</div>
			<!--ITEM END-->

			<div class="col-md-6 col-lg-4">
				<img src="<spring:url value="/resources/img/o3.png" />" alt="">
				<h4>Free worldwide home deivery</h4>
				<p></p>
			</div>
			<!--ITEM END-->

			<div class="col-md-6 col-lg-4">
				<img src="<spring:url value="/resources/img/o4.png" />" alt="">
				<h4>Pre & Post purchase support</h4>
				<p></p>
			</div>
			<!--ITEM END-->

			<div class="col-md-6 col-lg-4">
				<img src="<spring:url value="/resources/img/o5.png" />" alt="">
				<h4>Surprise gift included</h4>
				<p></p>
			</div>
			<!--ITEM END-->

			<div class="col-md-6 col-lg-4">
				<img src="<spring:url value="/resources/img/o6.png" />" alt="">
				<h4>It will be free forever</h4>
				<p></p>
			</div>
			<!--ITEM END-->
		</div>
		<!--OVERVIEW ITEMS END-->
	</div>
	<!--OVERVIEW SECTION END-->

	<!-- ===========================
    CALL-TO-ACTION SECTION
    =========================== -->
	<div class="calltoaction">
		<div class="lightoverlay">
			<div class="container">
				<div class="col-md-4">
					<img src="<spring:url value="/resources/img/tree.gif" />" alt="">
				</div>
				<!--CALL-TO-ACTION IMAGE END-->

				<div class="sectionhead content col-md-8">
					<h2>
						Best <span class="highlight">free Christmas</span> song
					</h2>
					<p>
						Here you find the best Christmas song to enjoy with your friends, if you have any 
						suggestions, feel free to <a href="mailto:support@venfly.com">email us</a> anytime.
					</p>
					<a href="" class="btn btn-default">Download</a>
				</div>
				<!--CALL-TO-ACTION CONTENT END-->
			</div>
			<!--CALL-TO-ACTION CONTAINER END-->
		</div>
		<!--CALL-TO-ACTION OVERLAY END-->
	</div>
	<!--CALL-TO-ACTION END-->

	

	<!-- ===========================
    SUBSCRIBE SECTION
    =========================== -->
	<div id="subscribe">
		<div class="darkoverlay">
			<div class="container text-center">
				<img class="santaicon wow tada infinite" data-wow-duration="20s" src="<spring:url value="/resources/img/santa-sm.png" />"
				 alt="">
				<div class="sectionhead">
					<h2>
						Don’t miss the <span class="highlight">upcoming hot deals</span>
						amymore
					</h2>
					<p>Just give us your email address below, and forget it. We’ll
						send you every time we have something special for you. No worries,
						Santa never send spam mails. And you can unsubscribe anytime as
						well.</p>
				</div>
				<!--SECTIONHEAD END-->

				<!--MAILCHIMP FORM START-->
				<div class="mailchimp">
					<form
						action="http://evenfly.us8.list-manage.com/subscribe/post?u=62bca83399cf0083546588b62&amp;id=f85a072005"
						method="post" id="mc-embedded-subscribe-form"
						name="mc-embedded-subscribe-form" class="validate" target="_blank"
						novalidate>
						<!-- #NOTE: Replace this with your Mailchimp action URL -->

						<input type="text" value="" name="FNAME" id="mce-FNAME"
							placeholder="First Name" required> <input type="email"
							value="" name="EMAIL" id="mce-EMAIL" placeholder="Email Address"
							required> <input type="submit" value="Subscribe"
							name="subscribe" id="mc-embedded-subscribe"
							class="btn btn-inverse">
					</form>
				</div>
			</div>
			<!--SUBSCRIBE CONTAINER END-->
		</div>
		<!--OVERLAY END-->
	</div>
	<!--SUBSCRIBE SECTION END-->

	<!-- ===========================
    FOOTER
    =========================== -->
	<footer class="container text-center">
		<h2 class="logo">
			Santa<span class="highlight">Go</span>
		</h2>
		<img class="santacap" src="<spring:url value="/resources/img/santa_cap.png" />"  alt="">
		<P>
			We wish you Merry Christmas!
		</P>
		<hr>
	</footer>
	<!--FOOTER END-->

	<!-- ===========================
    SOCIAL ICONS
    =========================== -->
	<div class="sticky-container">
		<ul class="sticky">
			<li><a href="https://www.facebook.com"> <img title="" alt="" 
		src="<spring:url value="/resources/img/santa_cap.png" />"  />
					<p>Facebook</p>
			</a></li>

			<li><a href="https://twitter.com"> <img title="" alt="" src="<spring:url value="/resources/img/twitter.svg" />" />
					<p>Twitter</p>
			</a></li>

			<li><a href="https://ru.pinterest.com"> <img title="" alt="" src="<spring:url value="/resources/img/pinterest.svg" />" />
					<p>Pinterest</p>
			</a></li>

			<li><a href="https://www.linkedin.com"> <img title="" alt="" src="<spring:url value="/resources/img/linkedin.svg" />" />
					<p>Linkedin</p>
			</a></li>

			<li><a href="https://plus.google.com"> <img title="" alt="" src="<spring:url value="/resources/img/google_plus.svg" />" 
					 />
					<p>Google Plus</p>
			</a></li>

			<li><a href="https://www.instagram.com"> <img title="" alt="" src="<spring:url value="/resources/img/instagram.svg" />" />
					<p>Instagram</p>
			</a></li>

		</ul>
	</div>
	<!-- ===========================
    NECESSARY SCRIPTS
    =========================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<script src="js/evenfly.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/snowstorm-min.js"></script>
	<script>
		new WOW().init();
	</script>
</body>
</html>