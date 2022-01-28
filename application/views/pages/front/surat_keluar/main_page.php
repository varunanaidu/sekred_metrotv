<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
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
										<button class="au-btn au-btn-icon au-btn--green au-btn--small" id="btnPrint"><i class="zmdi zmdi-print"></i>Print</button>
										<?php 
									}
									?>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-data2 table-striped" id="datatable">
									<thead>
										<tr align="center">
											<th></th>
											<th>Nomor Surat</th>
											<th>Pengirim</th>
											<th>Jabatan Pengirim</th>
											<th>Penerima</th>
											<th>Jabatan Penerima</th>
											<th>Instansi</th>
											<th>Tanggal Surat</th>
											<th>Perihal</th>
											<th>Status</th>
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
				<form method="POST" id="suratKeluar-form" accept-charset="UTF-8">
					<div class="modal-header">
						<h5 class="modal-title" style="color: black;"><?= $pagetitle; ?> - <span id="modal-type">Tambah</span></h5>
					</div>
					<div class="modal-body">
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nomor Surat <span class="text-red">*</span></label>
							<div class="col-md-2">
								<input type="text" class="form-control" name="tempno" id="tempno" readonly>
							</div>
							<div class="col-md-3">
								<select class="form-control" name="kategori" id="kategori" required>
									<option value=""></option>
									<option>Red.MetroTV</option>
									<option>Pemred.MetroTV</option>
								</select>
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control" name="months" id="months" readonly>
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control" name="years" id="years" value="<?= date('Y') ?>" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="pengirim" class="col-md-3 col-form-label">Pengirim <span class="text-red">*</span></label>
							<div class="col-md-9">
								<!-- <input type="text" class="form-control" id="pengirim" maxlength="100" name="pengirim" value="" placeholder="..." required> -->
								<select class="form-control" id="pengirim" name="pengirim" style="width: 100%;" required></select>
							</div>
						</div>
						<div class="form-group row">
							<label for="jabatan_pengirim" class="col-md-3 col-form-label">Jabatan Pengirim <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="jabatan_pengirim" maxlength="100" name="jabatan_pengirim" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="penerima" class="col-md-3 col-form-label">Penerima <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="penerima" maxlength="100" name="penerima" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="jabatan_penerima" class="col-md-3 col-form-label">Jabatan Penerima</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="jabatan_penerima" maxlength="100" name="jabatan_penerima" value="" placeholder="..." >
							</div>
						</div>
						<div class="form-group row">
							<label for="instansi" class="col-md-3 col-form-label">Instansi</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="instansi" maxlength="100" name="instansi" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label for="tempat_surat" class="col-md-3 col-form-label">Tempat Surat<span class="text-red">*</span></label>
							<div class="col-md-3">
								<input type="text" class="form-control" id="tempat_surat" maxlength="100" name="tempat_surat" value="Jakarta" placeholder="..." required>
							</div>
						
							<label for="tanggal_surat" class="col-md-3 col-form-label">Tanggal Surat <span class="text-red">*</span></label>
							<div class="col-md-3">
								<input type="date" class="form-control" id="tanggal_surat" maxlength="100" name="tanggal_surat" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="perihal" class="col-md-3 col-form-label">Perihal <span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="perihal" name="perihal" required></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="pemeriksa" class="col-md-3 col-form-label">Pemeriksa <span class="text-red">*</span></label>
							<div class="col-md-9">
								<!-- <input type="text" class="form-control" id="pemeriksa" maxlength="100" name="pemeriksa" value="" placeholder="..." required> -->
								<select class="form-control" id="pemeriksa" name="pemeriksa" style="width: 100%;" required></select>
							</div>
						</div>
						<div class="form-group row">
							<label for="isi" class="col-md-3 col-form-label">Isi <span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="isi" name="isi" required></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="text" class="collapse" id="type" name="type" value="">
						<input type="text" class="collapse" id="id" name="id" value="">
						<!-- <button type="button" class="btn btn-success btn-sm"><i class="fa fa-eye"></i> Preview</button> -->
						<button type="submit" id="btn-submit" class="btn btn-primary btn-sm">Simpan</button>
						<button type="button" id="btn-cancel" class="btn btn-danger btn-sm"><i class="fa fa-ban"></i> Batal</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
			<div class="modal-content" style="overflow-y: scroll;">
				<div id="content-pdf" class="row mt-20">
					<div class="col-md-12 col-md-offset-2">
						<object id="container_pdf" data="" type="application/pdf" width="100%" height="600px">
							<p>Your web browser doesn't have a PDF plugin.<br>Instead you can <a id="link_pdf" href="" download>click here to download the PDF file.</a></p>
						</object>
					</div>
					<div class="col-md-12 col-md-offset-2 text-center"><a id="link_pdf2" href="" download>Click here to download PDF</a></div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModal3Label" aria-hidden="true">
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