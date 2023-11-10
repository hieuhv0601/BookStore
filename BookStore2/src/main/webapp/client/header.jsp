
	<!-- Header Section Begin -->
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-3 col-lg-2">
					<div class="header__logo">
						<a href="${pageContext.request.contextPath}"><img
							src="${pageContext.request.contextPath}/assets/img/logo.png"
							alt=""></a>
					</div>
				</div>
				<div class="col-xl-6 col-lg-7">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="./index.html">Home</a></li>
							<li><div class="search-form mx-auto">
									<form class="form-inline" action="search" method="get">
										<input class="form-control search-input" type="text"
											id="search" name="keyword" placeholder="Search...">
									</form>
								</div></li>
							<li><a href="#">Categories</a>
								<ul class="dropdown">
									<c:forEach var="category" items="${categoriesList}"
										varStatus="status">
										<li class="submenu-item"><a
											href="view_category?id=${category.categoryId}"
											class="nav-link"> <b><c:out
														value="${category.categoryName}" escapeXml="false" /></b>
										</a></li>
									</c:forEach>
								</ul></li>
							<li><a href="javascript:void(0);">${loggedCustomer.username}</a>
								<ul class="dropdown">
									<li><a href="view_profile">Account & Security</a></li>
									<li><a href="view_address">Address</a></li>
									<li><a href="view_orders">My Orders</a></li>
									<li><a href="logout">Logout</a></li>
								</ul></li>

						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__right">
						<div class="header__right__auth">
							<c:if test="${loggedCustomer == null}">
								<a href="login">Login</a>
								<a href="register">Register</a>
							</c:if>
						</div>
						<ul class="header__right__widget">
							<c:if test="${loggedCustomer != null}">
								<li><a href="#"><span class="icon_heart_alt"></span>
										<div class="tip">2</div> </a></li>
								<li><a href="view_cart"><span class="icon_bag_alt"></span>
										<div class="tip">${listItems.size()}</div> </a></li>
							</c:if>

						</ul>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<div id="customNotification" class="custom-notification"></div>
	

