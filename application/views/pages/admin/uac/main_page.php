<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- MAIN CONTENT-->
<div class="main-content">
	<div class="section__content section__content--p30">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="overview-item overview-item--c1-news">
						<div class="overview__inner">
							<div class="overview-box clearfix">
								<div class="text">
									<h3><a href="<?= base_url(); ?>">Beranda</a> > <a href="<?= base_url(); ?>admin">Administrasi</a> > <?= $pagetitle ?></h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="card card-primary">
						<div class="card-body">
							<form method="POST" accept-charset="UTF-8" id="uac-form">
								<div class="form-group row">
									<label class="col-md-3 col-form-label">Users</label>
									<div class="col-md-9">
										<select class="form-control" id="user" name="user" style="width: 100%;"></select>
									</div>
								</div>
								<div class="col-md-12">
									<div class="col-xs-12" id="content-uac" style="height:400px;overflow-y:scroll;">
									</div>
									<div class="col-xs-12">
										<button class="btn btn-primary" id="btn-submit">Save</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>