<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>Tiny Dashboard - A Bootstrap Dashboard Template</title>
<!-- Simple bar CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/simplebar.css">
<!-- Fonts CSS -->
<link
	href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<!-- Icons CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/dropzone.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/uppy.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/jquery.steps.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/quill.snow.css">
<!-- Date Range Picker CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/daterangepicker.css">
<!-- App CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/app-light.css"
	id="lightTheme">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/app-dark.css"
	id="darkTheme" disabled>
</head>
<body class="vertical  light  ">
	<div class="wrapper">

		<jsp:directive.include file="header.jsp" />
		<jsp:directive.include file="sidebar.jsp" />


		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="row">
							<div class="col-md-6 col-xl-3 mb-4">
								<div class="card shadow bg-primary text-white border-0">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-3 text-center">
												<span class="circle circle-sm bg-primary-light"> <i
													class="fe fe-16 fe-shopping-bag text-white mb-0"></i>
												</span>
											</div>
											<div class="col pr-0">
												<p class="small text-muted mb-0">Monthly Sales</p>
												<span class="h3 mb-0 text-white">$1250</span> <span
													class="small text-muted">+5.5%</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-xl-3 mb-4">
								<div class="card shadow border-0">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-3 text-center">
												<span class="circle circle-sm bg-primary"> <i
													class="fe fe-16 fe-shopping-cart text-white mb-0"></i>
												</span>
											</div>
											<div class="col pr-0">
												<p class="small text-muted mb-0">Orders</p>
												<span class="h3 mb-0">1,869</span> <span
													class="small text-success">+16.5%</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-xl-3 mb-4">
								<div class="card shadow border-0">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-3 text-center">
												<span class="circle circle-sm bg-primary"> <i
													class="fe fe-16 fe-filter text-white mb-0"></i>
												</span>
											</div>
											<div class="col">
												<p class="small text-muted mb-0">Conversion</p>
												<div class="row align-items-center no-gutters">
													<div class="col-auto">
														<span class="h3 mr-2 mb-0"> 86.6% </span>
													</div>
													<div class="col-md-12 col-lg">
														<div class="progress progress-sm mt-2" style="height: 3px">
															<div class="progress-bar bg-success" role="progressbar"
																style="width: 87%" aria-valuenow="87" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-xl-3 mb-4">
								<div class="card shadow border-0">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-3 text-center">
												<span class="circle circle-sm bg-primary"> <i
													class="fe fe-16 fe-activity text-white mb-0"></i>
												</span>
											</div>
											<div class="col">
												<p class="small text-muted mb-0">AVG Orders</p>
												<span class="h3 mb-0">$80</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end section -->
						<div class="row align-items-center my-2">
							<div class="col-auto ml-auto">
								<form class="form-inline">
									<div class="form-group">
										<label for="reportrange" class="sr-only">Date Ranges</label>
										<div id="reportrange" class="px-2 py-2 text-muted">
											<i class="fe fe-calendar fe-16 mx-2"></i> <span class="small"></span>
										</div>
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-sm">
											<span class="fe fe-refresh-ccw fe-12 text-muted"></span>
										</button>
										<button type="button" class="btn btn-sm">
											<span class="fe fe-filter fe-12 text-muted"></span>
										</button>
									</div>
								</form>
							</div>
						</div>
						<!-- charts-->
						<div class="row my-4">
							<div class="col-md-12">
								<div class="chart-box">
									<div id="columnChart"></div>
								</div>
							</div>
							<!-- .col -->
						</div>
						<!-- end section -->
						<!-- info small box -->
						<div class="row">
							<div class="col-md-4">
								<div class="card shadow mb-4">
									<div class="card-body">
										<div class="chart-widget">
											<div id="gradientRadial"></div>
										</div>
										<div class="row">
											<div class="col-6 text-center">
												<p class="text-muted mb-0">Yesterday</p>
												<h4 class="mb-1">126</h4>
												<p class="text-muted mb-2">+5.5%</p>
											</div>
											<div class="col-6 text-center">
												<p class="text-muted mb-0">Today</p>
												<h4 class="mb-1">86</h4>
												<p class="text-muted mb-2">-5.5%</p>
											</div>
										</div>
									</div>
									<!-- .card-body -->
								</div>
								<!-- .card -->
							</div>
							<!-- .col -->
							<div class="col-md-4">
								<div class="card shadow mb-4">
									<div class="card-body">
										<div class="chart-widget mb-2">
											<div id="radialbar"></div>
										</div>
										<div class="row items-align-center">
											<div class="col-4 text-center">
												<p class="text-muted mb-1">Cost</p>
												<h6 class="mb-1">$1,823</h6>
												<p class="text-muted mb-0">+12%</p>
											</div>
											<div class="col-4 text-center">
												<p class="text-muted mb-1">Revenue</p>
												<h6 class="mb-1">$6,830</h6>
												<p class="text-muted mb-0">+8%</p>
											</div>
											<div class="col-4 text-center">
												<p class="text-muted mb-1">Earning</p>
												<h6 class="mb-1">$4,830</h6>
												<p class="text-muted mb-0">+8%</p>
											</div>
										</div>
									</div>
									<!-- .card-body -->
								</div>
								<!-- .card -->
							</div>
							<!-- .col -->
							<div class="col-md-4">
								<div class="card shadow mb-4">
									<div class="card-body">
										<p class="mb-0">
											<strong class="mb-0 text-uppercase text-muted">Today</strong>
										</p>
										<h3 class="mb-0">$2,562.30</h3>
										<p class="text-muted">+18.9% Last week</p>
										<div class="chart-box mt-n5">
											<div id="lineChartWidget"></div>
										</div>
										<div class="row">
											<div class="col-4 text-center mt-3">
												<p class="mb-1 text-muted">Completions</p>
												<h6 class="mb-0">26</h6>
												<span class="small text-muted">+20%</span> <span
													class="fe fe-arrow-up text-success fe-12"></span>
											</div>
											<div class="col-4 text-center mt-3">
												<p class="mb-1 text-muted">Goal Value</p>
												<h6 class="mb-0">$260</h6>
												<span class="small text-muted">+6%</span> <span
													class="fe fe-arrow-up text-success fe-12"></span>
											</div>
											<div class="col-4 text-center mt-3">
												<p class="mb-1 text-muted">Conversion</p>
												<h6 class="mb-0">6%</h6>
												<span class="small text-muted">-2%</span> <span
													class="fe fe-arrow-down text-danger fe-12"></span>
											</div>
										</div>
									</div>
									<!-- .card-body -->
								</div>
								<!-- .card -->
							</div>
							<!-- .col-md -->
							<div class="col-md-6">
								<div class="card shadow mb-4">
									<div class="card-body">
										<div class="card-title">
											<strong>Products</strong> <a
												class="float-right small text-muted" href="#!">View all</a>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div id="chart-box">
													<div id="donutChartWidget"></div>
												</div>
											</div>
											<div class="col-md-12">
												<div class="row align-items-center my-3">
													<div class="col">
														<strong>Cloud Server</strong>
														<div class="my-0 text-muted small">Global, Services</div>
													</div>
													<div class="col-auto">
														<strong>+85%</strong>
													</div>
													<div class="col-3">
														<div class="progress" style="height: 4px;">
															<div class="progress-bar" role="progressbar"
																style="width: 85%" aria-valuenow="85" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</div>
												</div>
												<div class="row align-items-center my-3">
													<div class="col">
														<strong>CDN</strong>
														<div class="my-0 text-muted small">Global, Services</div>
													</div>
													<div class="col-auto">
														<strong>+75%</strong>
													</div>
													<div class="col-3">
														<div class="progress" style="height: 4px;">
															<div class="progress-bar" role="progressbar"
																style="width: 75%" aria-valuenow="75" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</div>
												</div>
												<div class="row align-items-center my-3">
													<div class="col">
														<strong>Databases</strong>
														<div class="my-0 text-muted small">Local, DC</div>
													</div>
													<div class="col-auto">
														<strong>+62%</strong>
													</div>
													<div class="col-3">
														<div class="progress" style="height: 4px;">
															<div class="progress-bar" role="progressbar"
																style="width: 62%" aria-valuenow="62" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</div>
												</div>
											</div>
											<!-- .col-md-12 -->
										</div>
										<!-- .row -->
									</div>
									<!-- .card-body -->
								</div>
								<!-- .card -->
							</div>
							<!-- .col-md -->
							<div class="col-md-6">
								<div class="card shadow mb-4">
									<div class="card-body">
										<div class="card-title">
											<strong>Region</strong> <a
												class="float-right small text-muted" href="#!">View all</a>
										</div>
										<div class="map-box"
											style="position: relative; width: 350px; min-height: 130px; margin: 0 auto;">
											<div id="dataMapUSA"></div>
										</div>
										<div class="row align-items-center h-100 my-2">
											<div class="col">
												<p class="mb-0">France</p>
												<span class="my-0 text-muted small">+10%</span>
											</div>
											<div class="col-auto text-right">
												<span>118</span><br />
												<div class="progress mt-2" style="height: 4px;">
													<div class="progress-bar" role="progressbar"
														style="width: 85%" aria-valuenow="85" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
										</div>
										<div class="row align-items-center my-2">
											<div class="col">
												<p class="mb-0">Netherlands</p>
												<span class="my-0 text-muted small">+0.6%</span>
											</div>
											<div class="col-auto text-right">
												<span>1008</span><br />
												<div class="progress mt-2" style="height: 4px;">
													<div class="progress-bar" role="progressbar"
														style="width: 85%" aria-valuenow="85" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
										</div>
										<div class="row align-items-center my-2">
											<div class="col">
												<p class="mb-0">Italy</p>
												<span class="my-0 text-muted small">+1.6%</span>
											</div>
											<div class="col-auto text-right">
												<span>67</span><br />
												<div class="progress mt-2" style="height: 4px;">
													<div class="progress-bar" role="progressbar"
														style="width: 85%" aria-valuenow="85" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
										</div>
										<div class="row align-items-center my-2">
											<div class="col">
												<p class="mb-0">Spain</p>
												<span class="my-0 text-muted small">+118%</span>
											</div>
											<div class="col-auto text-right">
												<span>186</span><br />
												<div class="progress mt-2" style="height: 4px;">
													<div class="progress-bar" role="progressbar"
														style="width: 85%" aria-valuenow="85" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- .col -->
						</div>
						<!-- / .row -->
						<div class="row">
							<!-- Recent orders -->
							<div class="col-md-12">
								<h6 class="mb-3">Last orders</h6>
								<table class="table table-borderless table-striped">
									<thead>
										<tr role="row">
											<th>ID</th>
											<th>Purchase Date</th>
											<th>Name</th>
											<th>Phone</th>
											<th>Address</th>
											<th>Total</th>
											<th>Payment</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="col">1331</th>
											<td>2020-12-26 01:32:21</td>
											<td>Kasimir Lindsey</td>
											<td>(697) 486-2101</td>
											<td>996-3523 Et Ave</td>
											<td>$3.64</td>
											<td>Paypal</td>
											<td>Shipped</td>
											<td>
												<div class="dropdown">
													<button class="btn btn-sm dropdown-toggle more-vertical"
														type="button" data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">
														<span class="text-muted sr-only">Action</span>
													</button>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#">Edit</a> <a
															class="dropdown-item" href="#">Remove</a> <a
															class="dropdown-item" href="#">Assign</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="col">1156</th>
											<td>2020-04-21 00:38:38</td>
											<td>Melinda Levy</td>
											<td>(748) 927-4423</td>
											<td>Ap #516-8821 Vitae Street</td>
											<td>$4.18</td>
											<td>Paypal</td>
											<td>Pending</td>
											<td>
												<div class="dropdown">
													<button class="btn btn-sm dropdown-toggle more-vertical"
														type="button" data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">
														<span class="text-muted sr-only">Action</span>
													</button>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#">Edit</a> <a
															class="dropdown-item" href="#">Remove</a> <a
															class="dropdown-item" href="#">Assign</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="col">1038</th>
											<td>2019-06-25 19:13:36</td>
											<td>Aubrey Sweeney</td>
											<td>(422) 405-2736</td>
											<td>Ap #598-7581 Tellus Av.</td>
											<td>$4.98</td>
											<td>Credit Card</td>
											<td>Processing</td>
											<td>
												<div class="dropdown">
													<button class="btn btn-sm dropdown-toggle more-vertical"
														type="button" data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">
														<span class="text-muted sr-only">Action</span>
													</button>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#">Edit</a> <a
															class="dropdown-item" href="#">Remove</a> <a
															class="dropdown-item" href="#">Assign</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="col">1227</th>
											<td>2021-01-22 13:28:00</td>
											<td>Timon Bauer</td>
											<td>(690) 965-1551</td>
											<td>840-2188 Placerat, Rd.</td>
											<td>$3.46</td>
											<td>Paypal</td>
											<td>Processing</td>
											<td>
												<div class="dropdown">
													<button class="btn btn-sm dropdown-toggle more-vertical"
														type="button" data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">
														<span class="text-muted sr-only">Action</span>
													</button>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#">Edit</a> <a
															class="dropdown-item" href="#">Remove</a> <a
															class="dropdown-item" href="#">Assign</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="col">1956</th>
											<td>2019-11-11 16:23:17</td>
											<td>Kelly Barrera</td>
											<td>(117) 625-6737</td>
											<td>816 Ornare, Street</td>
											<td>$4.16</td>
											<td>Credit Card</td>
											<td>Shipped</td>
											<td>
												<div class="dropdown">
													<button class="btn btn-sm dropdown-toggle more-vertical"
														type="button" data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">
														<span class="text-muted sr-only">Action</span>
													</button>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#">Edit</a> <a
															class="dropdown-item" href="#">Remove</a> <a
															class="dropdown-item" href="#">Assign</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="col">1669</th>
											<td>2021-04-12 07:07:13</td>
											<td>Kellie Roach</td>
											<td>(422) 748-1761</td>
											<td>5432 A St.</td>
											<td>$3.53</td>
											<td>Paypal</td>
											<td>Shipped</td>
											<td>
												<div class="dropdown">
													<button class="btn btn-sm dropdown-toggle more-vertical"
														type="button" data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">
														<span class="text-muted sr-only">Action</span>
													</button>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#">Edit</a> <a
															class="dropdown-item" href="#">Remove</a> <a
															class="dropdown-item" href="#">Assign</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="col">1909</th>
											<td>2020-05-14 00:23:11</td>
											<td>Lani Diaz</td>
											<td>(767) 486-2253</td>
											<td>3328 Ut Street</td>
											<td>$4.29</td>
											<td>Paypal</td>
											<td>Pending</td>
											<td>
												<div class="dropdown">
													<button class="btn btn-sm dropdown-toggle more-vertical"
														type="button" data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">
														<span class="text-muted sr-only">Action</span>
													</button>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#">Edit</a> <a
															class="dropdown-item" href="#">Remove</a> <a
															class="dropdown-item" href="#">Assign</a>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- / .col-md-3 -->
						</div>
						<!-- end section -->
					</div>
				</div>
				<!-- .row -->
			</div>
			<!-- .container-fluid -->
		</main>
		<!-- main -->
	</div>
	<!-- .wrapper -->
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/simplebar.min.js"></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/daterangepicker.js'></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/jquery.stickOnScroll.js'></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/tinycolor-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/d3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/topojson.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/datamaps.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/datamaps-zoomto.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/datamaps.custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/Chart.min.js"></script>
	<script>
      /* defind global options */
      Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
      Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/gauge.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/apexcharts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/apexcharts.custom.js"></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/jquery.mask.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/select2.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/jquery.steps.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/jquery.validate.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/jquery.timepicker.js'></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/dropzone.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/uppy.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/assets/js/admin/quill.min.js'></script>
	<script>
      $('.select2').select2(
      {
        theme: 'bootstrap4',
      });
      $('.select2-multi').select2(
      {
        multiple: true,
        theme: 'bootstrap4',
      });
      $('.drgpicker').daterangepicker(
      {
        singleDatePicker: true,
        timePicker: false,
        showDropdowns: true,
        locale:
        {
          format: 'MM/DD/YYYY'
        }
      });
      $('.time-input').timepicker(
      {
        'scrollDefault': 'now',
        'zindex': '9999' /* fix modal open */
      });
      /** date range picker */
      if ($('.datetimes').length)
      {
        $('.datetimes').daterangepicker(
        {
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale:
          {
            format: 'M/DD hh:mm A'
          }
        });
      }
      var start = moment().subtract(29, 'days');
      var end = moment();

      function cb(start, end)
      {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
      $('#reportrange').daterangepicker(
      {
        startDate: start,
        endDate: end,
        ranges:
        {
          'Today': [moment(), moment()],
          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month': [moment().startOf('month'), moment().endOf('month')],
          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
      }, cb);
      cb(start, end);
      $('.input-placeholder').mask("00/00/0000",
      {
        placeholder: "__/__/____"
      });
      $('.input-zip').mask('00000-000',
      {
        placeholder: "____-___"
      });
      $('.input-money').mask("#.##0,00",
      {
        reverse: true
      });
      $('.input-phoneus').mask('(000) 000-0000');
      $('.input-mixed').mask('AAA 000-S0S');
      $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ',
      {
        translation:
        {
          'Z':
          {
            pattern: /[0-9]/,
            optional: true
          }
        },
        placeholder: "___.___.___.___"
      });
      // editor
      var editor = document.getElementById('editor');
      if (editor)
      {
        var toolbarOptions = [
          [
          {
            'font': []
          }],
          [
          {
            'header': [1, 2, 3, 4, 5, 6, false]
          }],
          ['bold', 'italic', 'underline', 'strike'],
          ['blockquote', 'code-block'],
          [
          {
            'header': 1
          },
          {
            'header': 2
          }],
          [
          {
            'list': 'ordered'
          },
          {
            'list': 'bullet'
          }],
          [
          {
            'script': 'sub'
          },
          {
            'script': 'super'
          }],
          [
          {
            'indent': '-1'
          },
          {
            'indent': '+1'
          }], // outdent/indent
          [
          {
            'direction': 'rtl'
          }], // text direction
          [
          {
            'color': []
          },
          {
            'background': []
          }], // dropdown with defaults from theme
          [
          {
            'align': []
          }],
          ['clean'] // remove formatting button
        ];
        var quill = new Quill(editor,
        {
          modules:
          {
            toolbar: toolbarOptions
          },
          theme: 'snow'
        });
      }
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function()
      {
        'use strict';
        window.addEventListener('load', function()
        {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form)
          {
            form.addEventListener('submit', function(event)
            {
              if (form.checkValidity() === false)
              {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
	<script>
      var uptarg = document.getElementById('drag-drop-area');
      if (uptarg)
      {
        var uppy = Uppy.Core().use(Uppy.Dashboard,
        {
          inline: true,
          target: uptarg,
          proudlyDisplayPoweredByUppy: false,
          theme: 'dark',
          width: 770,
          height: 210,
          plugins: ['Webcam']
        }).use(Uppy.Tus,
        {
          endpoint: 'https://master.tus.io/files/'
        });
        uppy.on('complete', (result) =>
        {
          console.log('Upload complete! We’ve uploaded these files:', result.successful)
        });
      }
    </script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/apps.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
	<script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>
</body>
</html>