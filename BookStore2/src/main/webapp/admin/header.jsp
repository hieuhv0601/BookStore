<nav class="topnav navbar navbar-light">
	<button type="button"
		class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
		<i class="fe fe-menu navbar-toggler-icon"></i>
	</button>
	<form class="form-inline mr-auto searchform text-muted">
		<input
			class="form-control mr-sm-2 bg-transparent border-0 pl-4 text-muted"
			type="search" placeholder="Type something..." aria-label="Search">
	</form>
	<ul class="nav">
		<li class="nav-item"><a class="nav-link text-muted my-2" href="#"
			id="modeSwitcher" data-mode="light"> <i class="fe fe-sun fe-16"></i>
		</a></li>
		<li class="nav-item nav-notif"><a
			class="nav-link text-muted my-2" href="./#" data-toggle="modal"
			data-target=".modal-notif"> <span class="fe fe-bell fe-16"></span>
				<span class="dot dot-md bg-success"></span>
		</a></li>

		<li class="nav-item dropdown"><a
			class="nav-link dropdown-toggle text-muted pr-0" href="#"
			id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <span
				class="avatar avatar-sm mt-2"> <img
					src="./assets/avatars/face-1.jpg" alt="..."
					class="avatar-img rounded-circle">
			</span>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="navbarDropdownMenuLink">
				<a class="dropdown-item" href="#">Profile</a> <a
					class="dropdown-item" href="#">Settings</a> <a
					class="dropdown-item" href="<%=request.getContextPath()%>/admin/logout">Logout</a>
			</div></li>
	</ul>
</nav>

<div class="modal fade modal-notif modal-slide" tabindex="-1"
	role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="defaultModalLabel">Notifications</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="list-group list-group-flush my-n3">
					<div class="list-group-item bg-transparent">
						<div class="row align-items-center">
							<div class="col-auto">
								<span class="fe fe-box fe-24"></span>
							</div>
							<div class="col">
								<small><strong>Package has uploaded successfull</strong></small>
								<div class="my-0 text-muted small">Package is zipped and
									uploaded</div>
								<small class="badge badge-pill badge-light text-muted">1m
									ago</small>
							</div>
						</div>
					</div>
					<div class="list-group-item bg-transparent">
						<div class="row align-items-center">
							<div class="col-auto">
								<span class="fe fe-download fe-24"></span>
							</div>
							<div class="col">
								<small><strong>Widgets are updated successfull</strong></small>
								<div class="my-0 text-muted small">Just create new layout
									Index, form, table</div>
								<small class="badge badge-pill badge-light text-muted">2m
									ago</small>
							</div>
						</div>
					</div>
					<div class="list-group-item bg-transparent">
						<div class="row align-items-center">
							<div class="col-auto">
								<span class="fe fe-inbox fe-24"></span>
							</div>
							<div class="col">
								<small><strong>Notifications have been sent</strong></small>
								<div class="my-0 text-muted small">Fusce dapibus, tellus
									ac cursus commodo</div>
								<small class="badge badge-pill badge-light text-muted">30m
									ago</small>
							</div>
						</div>
						<!-- / .row -->
					</div>
					<div class="list-group-item bg-transparent">
						<div class="row align-items-center">
							<div class="col-auto">
								<span class="fe fe-link fe-24"></span>
							</div>
							<div class="col">
								<small><strong>Link was attached to menu</strong></small>
								<div class="my-0 text-muted small">New layout has been
									attached to the menu</div>
								<small class="badge badge-pill badge-light text-muted">1h
									ago</small>
							</div>
						</div>
					</div>
					<!-- / .row -->
				</div>
				<!-- / .list-group -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-block"
					data-dismiss="modal">Clear All</button>
			</div>
		</div>
	</div>
</div>

