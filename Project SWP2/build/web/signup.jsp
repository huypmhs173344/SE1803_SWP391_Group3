
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Sign up</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- LINEARICONS -->
		<link rel="stylesheet" href="fonts/linearicons/style.css">
		
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/style_1.css">
	</head>

	<body>

		<div class="wrapper">
			<div class="inner">
				<img src="images/image-1.png" alt="" class="image-1">
                                <form action="signup" method="post">
					<h3>New Account</h3>
					<div class="form-holder">
						<span class="lnr lnr-user"></span>
                                                <input type="text" class="form-control" placeholder="Username" name="name">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-phone-handset"></span>
                                                <input type="text" class="form-control" placeholder="Phone Number" name="phone">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-envelope"></span>
                                                <input type="text" class="form-control" placeholder="Adress" name="adress">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
                                                <input type="password" class="form-control" placeholder="Password" name="pass">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
                                                <input type="password" class="form-control" placeholder="Confirm Password" name="repass">
					</div>
                                        ${f}
					<button>
						<span>Register</span>
					</button>
				</form>
				<img src="images/image-2.png" alt="" class="image-2">
			</div>
			
		</div>
		
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/main.js"></script>
	</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>