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
							<div class="table-data__tool">
								<div class="table-data__tool-right">
									<button class="au-btn au-btn-icon au-btn--blue au-btn--small" id="btnAdd"><i class="zmdi zmdi-plus"></i>Add</button>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-data2 table-striped" id="datatable">
									<thead>
										<tr align="center">
											<th></th>
											<th>NIP</th>
											<th>Name</th>
											<th>Email</th>
											<th>Phone</th>
											<th><i class="fas fa-cogs"></i></th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- FORM MODAL -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
			<div class="modal-content" style="overflow-y: scroll;">
				<form method="POST" id="user-form" accept-charset="UTF-8">
					<div class="modal-header">
						<h5 class="modal-title" style="color: black;"><?= $pagetitle; ?> - <span id="modal-type">Tambah</span></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group row">
							<label for="user_nip" class="col-md-3 col-form-label">NIP <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="user_nip" maxlength="100" name="user_nip" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="user_fname" class="col-md-3 col-form-label">Full Name <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="user_fname" maxlength="100" name="user_fname" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="user_email" class="col-md-3 col-form-label">Email <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="email" class="form-control" id="user_email" maxlength="100" name="user_email" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="user_phone" class="col-md-3 col-form-label">Phone Number <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="user_phone" maxlength="100" name="user_phone" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="role_id" class="col-md-3 col-form-label">Access Role <span class="text-red">*</span></label>
							<div class="col-md-9">
								<select class="form-control" id="role_id" name="role_id" required>
									<option value=""></option>
									<?php 
									if ( isset($roles) and $roles != 0 ) {
										foreach ($roles as $role) {
											?>
											<option value="<?= $role->role_id ?>"><?= $role->role_name ?></option>
											<?php 
										}
									}
									?>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="text" class="collapse" id="type" name="type" value="">
						<input type="text" class="collapse" id="id" name="id" value="">
						<button type="submit" id="btn-submit" class="btn btn-primary">Simpan</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>