
<aside class="sidebar-left border-right bg-white shadow"
	id="leftSidebar" data-simplebar>
	<a href="#"
		class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3"
		data-toggle="toggle"> <i class="fe fe-x"><span class="sr-only"></span></i>
	</a>
	<nav class="vertnav navbar navbar-light">
		<!-- nav bar -->
		<div class="w-100 mb-4 d-flex">
			<a class="navbar-brand mx-auto mt-2 flex-fill text-center"
				href="${pageContext.request.contextPath}/admin/"> <svg version="1.1" id="logo"
					class="navbar-brand-img brand-sm"
					xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					viewBox="0 0 120 120" xml:space="preserve">
                <g>
                  <polygon class="st0"
						points="78,105 15,105 24,87 87,87 	" />
                  <polygon class="st0"
						points="96,69 33,69 42,51 105,51 	" />
                  <polygon class="st0"
						points="78,33 15,33 24,15 87,15 	" />
                </g>
              </svg>
			</a>
		</div>
		<ul class="navbar-nav flex-fill w-100 mb-2">
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/admin/" class="nav-link">
					<i class="fe fe-book fe-16"></i> <span class="ml-3 item-text">Dash
						Board</span>
			</a></li>
		</ul>

		<p class="text-muted nav-heading mt-4 mb-1">
			<span>Manager</span>
		</p>
		<ul class="navbar-nav flex-fill w-100 mb-2">

			<li class="nav-item"><a href="list_users" class="nav-link">
					<i class="fe fe-book fe-16"></i> <span class="ml-3 item-text">Users
						Manager</span>
			</a></li>
			<li class="nav-item"><a href="list_categories" class="nav-link">
					<i class="fe fe-book fe-16"></i> <span class="ml-3 item-text">Categories
						Manager</span>
			</a></li>
			<li class="nav-item"><a href="list_books" class="nav-link">
					<i class="fe fe-user fe-16"></i> <span class="ml-3 item-text">Books
						Manager</span>
			</a></li>
			<li class="nav-item"><a href="list_reviews" class="nav-link">
					<i class="fe fe-folder fe-16"></i> <span class="ml-3 item-text">Reviews
						Manager</span>
			</a></li>
			<li class="nav-item"><a href="list_orders" class="nav-link">
					<i class="fe fe-compass fe-16"></i> <span class="ml-3 item-text">Orders
						Manager</span>
			</a></li>
		</ul>

		<p class="text-muted nav-heading mt-4 mb-1">
			<span>Documentation</span>
		</p>
		<ul class="navbar-nav flex-fill w-100 mb-2">
			<li class="nav-item w-100"><a class="nav-link"
				href="../docs/index.html"> <i class="fe fe-help-circle fe-16"></i>
					<span class="ml-3 item-text">Getting Start</span>
			</a></li>
		</ul>
	</nav>
</aside>
