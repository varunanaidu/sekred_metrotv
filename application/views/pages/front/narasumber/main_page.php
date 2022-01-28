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
											<th>Email</th>
											<th>No. Handphone</th>
											<th>Alamat</th>
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
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 1015px !important;">
			<div class="modal-content" style="overflow-y: scroll;">
				<form method="POST" id="narasumber-form" accept-charset="UTF-8">
					<div class="modal-header">
						<h5 class="modal-title" style="color: black;"><?= $pagetitle; ?> - <span id="modal-type">Tambah</span></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nama Lengkap <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="narasumber_name" maxlength="100" name="narasumber_name" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nomor Handphone <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="narasumber_telephone" maxlength="100" name="narasumber_telephone" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nomor Handphone 2 <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="narasumber_telephone_2" maxlength="100" name="narasumber_telephone_2" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Email <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="email" class="form-control" id="narasumber_email" maxlength="100" name="narasumber_email" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Email 2 <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="email" class="form-control" id="narasumber_email_2" maxlength="100" name="narasumber_email_2" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Alamat <span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="narasumber_addr" name="narasumber_addr" rows="4" required placeholder="..."></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Kota <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="narasumber_city" maxlength="100" name="narasumber_city" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Jabatan <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="narasumber_jabatan" maxlength="100" name="narasumber_jabatan" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Instansi <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="narasumber_instansi" maxlength="100" name="narasumber_instansi" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_nik" class="col-md-3 col-form-label">Nama Asisten/Manager/Sekertaris<span class="text-red">*</span></label>
							<div class="col-md-2">
								<select class="form-control" name="partner_type" id="partner_type" required>
									<option value=""></option>
									<option>ASISTEN</option>
									<option>MANAGER</option>
									<option>SEKERTARIS</option>
								</select>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="partner_name" maxlength="100" name="partner_name" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nomor Handphone Asisten/Manager/Sekertaris<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="narasumber_partner_number" maxlength="100" name="narasumber_partner_number" value="" placeholder="..." required>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Keterangan <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="narasumber_keterangan" maxlength="100" name="narasumber_keterangan" value="" placeholder="..." required>
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
									<tr>
										<td style="min-width:250px;" valign="top">Nama </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_name"></td>
										<td style="min-width:250px;" valign="top">Jabatan </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_jabatan"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">No Handphone </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_telephone"></td>
										<td style="min-width:250px;" valign="top">Email </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_email"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Alamat </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_addr"></td>
										<td style="min-width:250px;" valign="top">Kota </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_city"></td>
									</tr>
								</table>
								<hr style="border-top:2px solid maroon">
								<table style="width: 100%; font-size: 12pt;">
									<tr>
										<td style="min-width:250px;" valign="top">Instansi </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_instansi"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Kerabat </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_partner"></td>
										<td style="min-width:250px;" valign="top">Nomor Handphone </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_partner_number"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Keterangan </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_narasumber_keterangan"></td>
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