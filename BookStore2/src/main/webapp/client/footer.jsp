
<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-7">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt cilisis.</p>

					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-5">
					<div class="footer__widget">
						<h6>Quick links</h6>
						<ul>
							<li><a href="#">About</a></li>
							<li><a href="#">Blogs</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-4">
					<div class="footer__widget">
						<h6>Account</h6>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Orders Tracking</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Wishlist</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-8 col-sm-8">
					<div class="footer__newslatter">
						<h6>NEWSLETTER</h6>
						<form action="#">
							<input type="text" placeholder="Email">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-youtube-play"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					<div class="footer__copyright__text">
						<p>
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved 
						</p>
					</div>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</div>
			</div>
		</div>
	</footer>
		<script>
		// ========= Toast notification =========
			const id = ${loggedCustomer.userId};
			
		var wsUrl;
		if (window.location.protocol == 'http:') {
			wsUrl = 'ws://';
		} else {
			wsUrl = 'wss://';
		}

		const notiSocket = new WebSocket(wsUrl + window.location.host
				+ "/BookStore/notification");

		notiSocket.onopen = function() {
			console.log("Toast is connected");
			console.log(id);
		};

		notiSocket.onmessage = function(event) {
		    var toastObj = JSON.parse(event.data);
		    console.log("Successful");
		    console.log("Successful" + toastObj);
		    console.log(toastObj);
			var name = toastObj.name;
		    // Display the custom notification
		    var mess = name +  " has just ordered " + toastObj.totalItems +  " products with a total amount of "+ toastObj.totalPrice+ "$ from Buylicious!";
		    console.log(mess);
		    displayCustomNotification(mess);
		};

		// Function to display the custom notification
		function displayCustomNotification(message) {
		    const customNotification = document.getElementById("customNotification");
		    customNotification.innerHTML = message;
		    customNotification.style.display = "block";

		    setTimeout(function() {
		        customNotification.style.display = "none";
		    }, 5000); // Hide the notification after 10 seconds (adjust as needed)
		}

		notiSocket.onclose = function(event) {
			console.log("Toast is closed.");
		};

		notiSocket.onerror = function(error) {
			console.error("Toast error: " + error.message);
		};

		function sendToastNotificationInfo() {
			notiSocket.send(JSON.stringify({
				action : "order-toast",
				userID : id,
			}));
		}
	</script>
	
	<!-- Footer Section End -->
	<!-- Js Plugins -->
