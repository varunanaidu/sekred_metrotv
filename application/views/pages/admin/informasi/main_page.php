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
											<th>Informasi</th>
											<th>Active</th>
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
				<form method="POST" id="informasi-form" accept-charset="UTF-8">
					<div class="modal-header">
						<h5 class="modal-title" style="color: black;"><?= $pagetitle; ?> - <span id="modal-type">Tambah</span></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Informasi <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="informasi_text" maxlength="100" name="informasi_text" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Isi <span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="informasi_content" name="informasi_content" rows="4" placeholder="..." required></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Active <span class="text-red">*</span></label>
							<div class="col-md-9">
								<div class="form-check">
									<div class="radio">
										<label for="is_active1" class="form-check-label ">
											<input type="radio" id="is_active1" name="is_active" value="1" class="form-check-input">Active
										</label>
									</div>
									<div class="radio">
										<label for="is_active0" class="form-check-label ">
											<input type="radio" id="is_active0" name="is_active" value="0" class="form-check-input">Not Active
										</label>
									</div>
								</div>
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