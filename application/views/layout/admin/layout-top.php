<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Required meta tags-->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="au theme template">
	<meta name="author" content="Hau Nguyen">
	<meta name="keywords" content="au theme template">

	<!-- Title Page-->
	<title>Sekred Online</title>

	<!-- Fontfaces CSS-->
	<link href="<?= base_url(); ?>asset/css/font-face.css" rel="stylesheet" media="all">
	<!-- <link href="<?= base_url(); ?>asset/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all"> -->
	<link href="<?= base_url(); ?>asset/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
	<link href="<?= base_url(); ?>asset/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

	<!-- Bootstrap CSS-->
	<link href="<?= base_url(); ?>asset/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

	<!-- Vendor CSS-->
	<link href="<?= base_url(); ?>asset/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
	<link href="<?= base_url(); ?>asset/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
	<link href="<?= base_url(); ?>asset/vendor/wow/animate.css" rel="stylesheet" media="all">
	<link href="<?= base_url(); ?>asset/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
	<link href="<?= base_url(); ?>asset/vendor/slick/slick.css" rel="stylesheet" media="all">
	<link href="<?= base_url(); ?>asset/vendor/select2/select2.min.css" rel="stylesheet" media="all">
	<link href="<?= base_url(); ?>asset/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

	<!-- Main CSS-->
	<link href="<?= base_url(); ?>asset/css/theme.css" rel="stylesheet" media="all">
	
	<?php 
	if ( isset($css) ) {
		for ( $i = 0; $i < sizeof($css); $i++) { 
			?>
			<link rel="stylesheet" href="<?= $css[$i] ?>" type="text/css"></link>
			<?php 
		}
	}
	?>
</head>

<body class="background animsition">
	<div class="page-wrapper">
		<!-- PAGE CONTAINER-->
		<div class="">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header4-wrap">
							<div class="header-logo">
								<h2 class="title-1"> Sekred Online </h2>
							</div>
							<div class="header-button">
								<div class="account-wrap">
									<div class="account-item clearfix js-item-menu">
										<div class="image">
											<?php 
											if ( isset($log_photo) and $log_photo != '' ) {
												?>
												<img src="<?= base_url(); ?>asset/files/profile/<?= $log_user.'/'.$log_photo ?>"/>
												<?php 
											}else{
												?>
												<img src="<?= base_url(); ?>asset/images/icon/user2.jpeg"/>
												<?php 
											}
											?>
										</div>
										<div class="content">
											<a class="js-acc-btn" href="javascript:void(0)"><?= $log_fname ?></a>
										</div>
										<div class="account-dropdown js-dropdown">
											<div class="info clearfix">
												<div class="image">
													<?php 
													if ( isset($log_photo) and $log_photo != '' ) {
														?>
														<img src="<?= base_url(); ?>asset/files/profile/<?= $log_user.'/'.$log_photo ?>"/>
														<?php 
													}else{
														?>
														<img src="<?= base_url(); ?>asset/images/icon/user2.jpeg"/>
														<?php 
													}
													?>
												</div>
												<div class="content">
													<h5 class="name">
														<a href="javascript:void(0)"><?= $log_fname ?></a>
													</h5>
													<span class="email"><?= $log_email ?></span>
												</div>
											</div>
											<div class="account-dropdown__footer">
												<a href="<?= base_url('site/profile') ?>">
													<i class="zmdi zmdi-account-box"></i>Profile</a>
												</div>
												<div class="account-dropdown__footer">
													<a href="<?= base_url('site/changed_password') ?>">
														<i class="zmdi zmdi-key"></i>Change Password</a>
													</div>
													<div class="account-dropdown__footer">
														<a href="<?= base_url('site/signout') ?>">
															<i class="zmdi zmdi-power"></i>Logout</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</header>
<!-- HEADER DESKTOP-->