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
									<button class="au-btn au-btn-icon au-btn--blue au-btn--small" id="btnAdd"><i class="zmdi zmdi-plus"></i>Add</button>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-data2 table-striped" id="datatable">
									<thead>
										<tr align="center">
											<th></th>
											<th>Nama</th>
											<th>Telepon</th>
											<th>Email</th>
											<th>Perusahaan</th>
											<th>Jabatan</th>
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

	<div class="modal fade" id="getNipModal" tabindex="-1" role="dialog" aria-labelledby="getNipModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 890px !important;">
			<div class="modal-content" style="overflow-y: scroll;">
				<div class="modal-body">
					<div class="form-group row">
						<label for="nip" class="col-md-3 col-form-label">NIP</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="nip" maxlength="100" name="nip" value="">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary float-right" id="btn-send">Send</button>
				</div>
			</div>
		</div>
	</div>

	<!-- FORM MODAL -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 890px !important;">
			<div class="modal-content" style="overflow-y: scroll;">
				<form method="POST" id="sdm-form" accept-charset="UTF-8">
					<div class="modal-header">
						<h5 class="modal-title" style="color: black;"><?= $pagetitle; ?> - <span id="modal-type">Tambah</span></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group row">
							<label for="emp_nip" class="col-md-3 col-form-label">NIP<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="emp_nip" maxlength="100" name="emp_nip" value="" placeholder="..." required readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_fname" class="col-md-3 col-form-label">Nama Lengkap <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="emp_fname" maxlength="100" name="emp_fname" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_nname" class="col-md-3 col-form-label">Nama Panggilan <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="emp_nname" maxlength="100" name="emp_nname" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Tempat Tanggal Lahir <span class="text-red">*</span></label>
							<div class="col-md-4">
								<input type="text" class="form-control" id="emp_birth_place" maxlength="100" name="emp_birth_place" value="" placeholder="" required>
							</div>
							<div class="col-md-5">
								<input type="date" class="form-control" id="emp_birth_date" maxlength="100" name="emp_birth_date" value="" placeholder="" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_nik" class="col-md-3 col-form-label">NIK<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="emp_nik" maxlength="100" name="emp_nik" value="" placeholder="NIK" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_address" class="col-md-3 col-form-label">Alamat <span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="emp_address" name="emp_address" rows="4" required></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nomor Handphone <span class="text-red">*</span></label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="emp_phone1" maxlength="100" name="emp_phone1" value="" placeholder="Nomor Telepon 1" required>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" id="emp_phone2" maxlength="100" name="emp_phone2" value="" placeholder="Nomor Telepon 2">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Email <span class="text-red">*</span></label>
							<div class="col-md-5">
								<input type="email" class="form-control" id="emp_email1" maxlength="100" name="emp_email1" value="" placeholder="Email 1" required>
							</div>
							<div class="col-md-4">
								<input type="email" class="form-control" id="emp_email2" maxlength="100" name="emp_email2" value="" placeholder="Email 2">
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_comp" class="col-md-3 col-form-label">Perusahaan<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="emp_comp" maxlength="100" name="emp_comp" value="" placeholder="Perusahaan" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_div" class="col-md-3 col-form-label">Divisi<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="emp_div" maxlength="100" name="emp_div" value="" placeholder="Divisi" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_dept" class="col-md-3 col-form-label">Departemen<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="emp_dept" maxlength="100" name="emp_dept" value="" placeholder="Departemen" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Jabatan / Ext<span class="text-red">*</span></label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="emp_jabatan" maxlength="100" name="emp_jabatan" value="" placeholder="Jabatan" required>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" id="emp_ext" maxlength="100" name="emp_ext" value="" placeholder="Nomor Extension" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_program" class="col-md-3 col-form-label">Program<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="emp_program" maxlength="100" name="emp_program" value="" placeholder="Program" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Atasan <span class="text-red">*</span></label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="emp_atasan" maxlength="100" name="emp_atasan" value="" placeholder="Nama" required>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" id="emp_atasan_phone" maxlength="100" name="emp_atasan_phone" value="" placeholder="Nomor Telepon" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Kontak Darurat <span class="text-red">*</span></label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="emp_kontak_darurat_nama" maxlength="100" name="emp_kontak_darurat_nama" value="" placeholder="Nama" required>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" id="emp_kontak_darurat_nomor" maxlength="100" name="emp_kontak_darurat_nomor" value="" placeholder="Nomor Telepon" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Passport <span class="text-red">*</span></label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="emp_passport" maxlength="100" name="emp_passport" value="" placeholder="Passport" required>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" id="emp_expiry_passport" maxlength="100" name="emp_expiry_passport" value="" placeholder="Expired Date" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Pas Photo <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="file" class="form-control" id="emp_photo" name="emp_photo" accept="image/*" required>
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

	<!-- DETAIL MODAL -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 1200px !important;">
			<div class="modal-content" style="overflow-y: scroll;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<hr style="border-top:2px solid maroon">
								<table style="width: 100%; font-size: 12pt;">
									<tr align="center">
										<td style="min-width:250px;" valign="top"><img id="text_emp_photo" src="" style="width: 200px;"></td>
									</tr>
								</table>
								<hr style="border-top:2px solid maroon">
								<table style="width: 100%; font-size: 12pt;">
									<tr>
										<td style="min-width:250px;" valign="top">NIP</td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_nip"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Nama Lengkap</td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_fname"></td>
										<td style="min-width:250px;" valign="top">Nama Panggilan </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_nname"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">NIK </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_nik"></td>
										<td style="min-width:250px;" valign="top">Tempat, Tanggal Lahir </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_dob"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Alamat </td>
										<td style="width:2%;" valign="top">:</td>
										<td colspan="4" style="min-width:250px;" id="text_emp_addr"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">No Handphone </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_telephone"></td>
										<td style="min-width:250px;" valign="top">Email </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_email"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Passport </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_passport"></td>
										<td style="min-width:250px;" valign="top">Tanggal Kadaluarsa </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_expiry_passport"></td>
									</tr>
								</table>
								<hr style="border-top:2px solid maroon">
								<table style="width: 100%; font-size: 12pt;">
									<tr>
										<td style="min-width:250px;" valign="top">Perusahaan </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_comp"></td>
										<td style="min-width:250px;" valign="top">Divisi </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_div"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Departemen </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_dept"></td>
										<td style="min-width:250px;" valign="top">Jabatan </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_jabatan"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Program </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_program"></td>
										<td style="min-width:250px;" valign="top">Ext </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_ext"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Nama Atasan </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_atasan"></td>
										<td style="min-width:250px;" valign="top">Nomor Handphone </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_atasan_phone"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Kontak Darurat </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_kontak_darurat_nama"></td>
										<td style="min-width:250px;" valign="top">Nomor Handphone </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_emp_kontak_darurat_nomor"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>