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
									<h3><a href="<?= base_url(); ?>">Beranda</a> > <?= $pagetitle ?></h3>
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
									<?php 
									if ( $log_role == 2 ) {
										?>
										<button class="au-btn au-btn-icon au-btn--blue au-btn--small" id="btnAdd"><i class="zmdi zmdi-plus"></i>Add</button>
										<?php 
									}
									?>
									<button class="au-btn au-btn-icon au-btn--green au-btn--small" id="btnPrint"><i class="zmdi zmdi-print"></i>Print</button>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-data2 table-striped" id="datatable">
									<thead>
										<tr align="center">
											<th></th>
											<th>Pengirim</th>
											<th>Jenis</th>
											<th>Tanggal Acara</th>
											<th>Jam Acara</th>
											<th>Lokasi Acara</th>
											<th>Perihal</th>
											<th>Area</th>
											<th>Keterangan</th>
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
				<form method="POST" id="suratMasuk-form" accept-charset="UTF-8">
					<div class="modal-header">
						<h5 class="modal-title" style="color: black;"><?= $pagetitle; ?> - <span id="modal-type">Tambah</span></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group row">
							<label for="pengirim" class="col-md-3 col-form-label">Pengirim <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="pengirim" maxlength="100" name="pengirim" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Jenis <span class="text-red">*</span></label>
							<div class="col-md-9">
								<select class="form-control" name="jenis_surat" id="jenis_surat" required>
									<option value=""></option>
									<option value="1">Undangan Liputan</option>
									<option value="2">Pribadi</option>
								</select>
							</div>
						</div>
						<div class="form-group row" id="kepadaContainer" style="display: none;">
							<label for="kepada" class="col-md-3 col-form-label">Kepada <span class="text-red">*</span></label>
							<div class="col-md-9">
								<!-- <input type="text" class="form-control" id="kepada" name="kepada" value="" maxlength="100" placeholder="..."> -->
								<select class="form-control" id="kepada" name="kepada" style="width: 100%;"></select>
							</div>
						</div>
						<div class="form-group row">
							<label for="tanggal_acara" class="col-md-3 col-form-label">Tanggal Acara <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="date" class="form-control" id="tanggal_acara" maxlength="100" name="tanggal_acara" value="" placeholder="..." required>
							</div>
						</div>
						<div class="bootstrap-timepicker">
							<div class="form-group row">
								<label class="col-md-3 col-form-label">Jam Acara <span class="text-red">*</span></label>

								<div class="input-group date col-md-9" id="timepicker" data-target-input="nearest">
									<input type="text" id="jam_acara" name="jam_acara" class="form-control datetimepicker-input" data-target="#timepicker"/>
									<div class="input-group-append" data-target="#timepicker" data-toggle="datetimepicker">
										<div class="input-group-text"><i class="far fa-clock"></i></div>
									</div>
								</div>
								<!-- /.input group -->
							</div>
							<!-- /.form group -->
						</div>
						<div class="form-group row">
							<label for="lokasi" class="col-md-3 col-form-label">Lokasi Acara <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="lokasi" maxlength="100" name="lokasi" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="perihal" class="col-md-3 col-form-label">Perihal <span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="perihal" name="perihal" required></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Area <span class="text-red">*</span></label>
							<div class="col-md-9">
								<select class="form-control" name="area" id="area" required>
									<option value=""></option>
									<option >Jabodetabek</option>
									<option >Non Jabodetabek</option>
									<option >Luar Negeri</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="keterangan" class="col-md-3 col-form-label">Keterangan <span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="keterangan" name="keterangan" required></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="attachment_name" class="col-md-3 col-form-label">Lampiran <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="file" name="attachment_name" id="attachment_name">
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

	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModal2Label" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
			<div class="modal-content" style="overflow-y: scroll;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group row">
						<div class="col-md-12">
							<input type="text" class="form-control" name="date_range" id="date_range" readonly="" value="">
							<p>click to change the date range </p>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="au-btn au-btn-icon au-btn--green au-btn--small" id="btn-confirm"><i class="zmdi zmdi-print"></i>Print</button>
				</div>
			</div>
		</div>
	</div>
</div>