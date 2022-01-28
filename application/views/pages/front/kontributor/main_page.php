<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- MAIN CONTENT-->
<div class="main-content">
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
		</div>
		<div class="row">
			<div class="col-md-12">
				<div id="world-map" style="height: 250px; width: 100%;"></div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
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
										<th>No. Rekening</th>
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

	<!-- FORM MODAL -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 890px !important;">
			<div class="modal-content" style="overflow-y: scroll;">
				<form method="POST" id="kontributor-form" accept-charset="UTF-8">
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
								<input type="text" class="form-control" id="kontributor_name" maxlength="100" name="kontributor_name" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Jenis Kelamin <span class="text-red">*</span></label>
							<div class="col-md-9">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="kontributor_gender" id="inlineRadio1" value="Laki Laki">
									<label class="form-check-label" for="inlineRadio1">Laki Laki</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="kontributor_gender" id="inlineRadio2" value="Perempuan">
									<label class="form-check-label" for="inlineRadio2">Perempuan</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Tempat Tanggal Lahir <span class="text-red">*</span></label>
							<div class="col-md-3">
								<input type="text" class="form-control" id="kontributor_birth_place" maxlength="100" name="kontributor_birth_place" value="" placeholder="..." required>
							</div>
							<div class="col-md-6">
								<input type="date" class="form-control" id="kontributor_birth_date" maxlength="100" name="kontributor_birth_date" value="" placeholder="" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Foto <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="file" class="form-control" id="kontributor_photo" name="kontributor_photo" accept="image/*">
							</div>
						</div>
						<div class="form-group row">
							<label for="emp_nik" class="col-md-3 col-form-label">Identitas<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_identity" maxlength="100" name="kontributor_identity" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Alamat <span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="kontributor_addr" name="kontributor_addr" rows="4" required placeholder="..."></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Alamat Kirim<span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="kontributor_addr_kirim" name="kontributor_addr_kirim" rows="4" required placeholder="..."></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nomor Rekening <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_rek_number" maxlength="100" name="kontributor_rek_number" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nomor Handphone <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_telephone" maxlength="100" name="kontributor_telephone" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nomor Handphone 2 <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_telephone_2" maxlength="100" name="kontributor_telephone_2" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Email <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="email" class="form-control" id="kontributor_email" maxlength="100" name="kontributor_email" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Email 2 <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="email" class="form-control" id="kontributor_email_2" maxlength="100" name="kontributor_email_2" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Skype <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_skype" maxlength="100" name="kontributor_skype" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Platform<span class="text-red">*</span></label>
							<div class="col-md-9">
								<select class="form-control" name="kontributor_platform" id="kontributor_platform" required>
									<option value=""></option>
									<option>Metro TV</option>
									<option>Medcom</option>
									<option>Media Indonesia</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Status<span class="text-red">*</span></label>
							<div class="col-md-9">
								<select class="form-control" name="kontributor_status" id="kontributor_status" required>
									<option value=""></option>
									<option>Aktif</option>
									<option>Non Aktif</option>
									<option>Calon Kontributor</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Area <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_area" maxlength="100" name="kontributor_area" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Wilayah<span class="text-red">*</span></label>
							<div class="col-md-9">
								<select class="form-control" name="kontributor_wilayah" id="kontributor_wilayah" required>
									<option value=""></option>
									<option>Jabodetabek</option>
									<option>Daerah</option>
									<option>Luar Negeri</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Provinsi <span class="text-red">*</span></label>
							<div class="col-md-9">
								<select class="form-control" id="kontributor_province" name="kontributor_province" required="">
									<option value=""></option>
									<option>Aceh</option>
									<option>Sumatera Utara</option>
									<option>Sumatera Barat</option>
									<option>Riau</option>
									<option>Jambi</option>
									<option>Sumatera Selatan</option>
									<option>Bengkulu</option>
									<option>Lampung</option>
									<option>Kep. Bangka Belitung</option>
									<option>Kep. Riau</option>
									<option>DKI Jakarta</option>
									<option>Jawa Barat</option>
									<option>Jawa Tengah</option>
									<option>Banten</option>
									<option>Jawa Timur</option>
									<option>Yogyakarta</option>
									<option>Bali</option>
									<option>Nusa Tenggara Barat</option>
									<option>Nusa Tenggara Timur</option>
									<option>Kalimantan Barat</option>
									<option>Kalimantan Tengah</option>
									<option>Kalimantan Selatan</option>
									<option>Kalimantan Timur</option>
									<option>Kalimantan Utara</option>
									<option>Sulawesi Utara</option>
									<option>Sulawesi Tengah</option>
									<option>Sulawesi Selatan</option>
									<option>Sulawesi Tenggara</option>
									<option>Gorontalo</option>
									<option>Sulawesi Barat</option>
									<option>Maluku</option>
									<option>Maluku Utara</option>
									<option>Papua</option>
									<option>Papua Barat</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Negara <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_country" maxlength="100" name="kontributor_country" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Tahun Bergabung <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="date" class="form-control" id="kontributor_entry_date" maxlength="100" name="kontributor_entry_date" value="" placeholder="" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Periode <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_periode" maxlength="100" name="kontributor_periode" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Ukuran Baju <span class="text-red">*</span></label>
							<div class="col-md-9">
								<select class="form-control" name="kontributor_ukuran_baju" id="kontributor_ukuran_baju" required>
									<option value=""></option>
									<option>S</option>
									<option>M</option>
									<option>L</option>
									<option>XL</option>
									<option>XXL</option>
									<option>XXXL</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Surat Kemitraan <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="file" class="form-control" id="kontributor_file" name="kontributor_file">
							</div>
						</div>
						<hr style="border-top:2px solid maroon">
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nama Peserta</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs" maxlength="100" name="kontributor_bpjs" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">No JKN Peserta</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs_nomor" maxlength="100" name="kontributor_bpjs_nomor" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nama Istri</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs_istri" maxlength="100" name="kontributor_bpjs_istri" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">No JKN Peserta</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs_istri_nomor" maxlength="100" name="kontributor_bpjs_istri_nomor" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nama Anak 1</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs_anak1" maxlength="100" name="kontributor_bpjs_anak1" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">No JKN Peserta</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs_anak1_nomor" maxlength="100" name="kontributor_bpjs_anak1_nomor" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nama Anak 2</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs_anak2" maxlength="100" name="kontributor_bpjs_anak2" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">No JKN Peserta</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs_anak2_nomor" maxlength="100" name="kontributor_bpjs_anak2_nomor" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Nama Anak 3</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs_anak3" maxlength="100" name="kontributor_bpjs_anak3" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">No JKN Peserta</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_bpjs_anak3_nomor" maxlength="100" name="kontributor_bpjs_anak3_nomor" value="" placeholder="...">
							</div>
						</div>
						<hr style="border-top:2px solid maroon">
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Camera</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_camera" maxlength="100" name="kontributor_camera" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 col-form-label">Software Editing</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="kontributor_software" maxlength="100" name="kontributor_software" value="" placeholder="...">
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
										<td style="min-width:250px;" valign="top"><img id="text_kontributor_photo" src="" style="width: 200px;"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top"><a id="text_kontributor_file" href="" target="_blank"><i class="fas fa-download"></i> Surat Kemitraan</a></td>
									</tr>
								</table>
								<hr style="border-top:2px solid maroon">
								<table style="width: 100%; font-size: 12pt;">
									<tr>
										<td style="min-width:250px;" valign="top">Nama </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_name"></td>
										<td style="min-width:250px;" valign="top">Identitas </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_identity"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Tempat, Tanggal Lahir </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_dob"></td>
										<td style="min-width:250px;" valign="top">Alamat </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_addr"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">No Handphone </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_telephone"></td>
										<td style="min-width:250px;" valign="top">Email </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_email"></td>
									</tr>
								</table>
								<hr style="border-top:2px solid maroon">
								<table style="width: 100%; font-size: 12pt;">
									<tr>
										<td style="min-width:250px;" valign="top">Status </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_status"></td>
										<td style="min-width:250px;" valign="top">Platform </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_platform"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Tanggal Bergabung </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_entry_date"></td>
										<td style="min-width:250px;" valign="top">Periode </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_periode"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Area </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_area"></td>
										<td style="min-width:250px;" valign="top">Wilayah </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_wilayah"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Provinsi </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_province"></td>
										<td style="min-width:250px;" valign="top">Negara </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_country"></td>
									</tr>
								</table>
								<hr style="border-top:2px solid maroon">
								<table style="width: 100%; font-size: 12pt;">
									<tr>
										<td style="min-width:250px;" valign="top">Nomor Rekening </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_rek_number"></td>
										<td style="min-width:250px;" valign="top">Ukuran Baju </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_ukuran_baju"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Skype </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_skype"></td>
										<td style="min-width:250px;" valign="top">Alamat Kirim</td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_addr_kirim"></td>
									</tr>
								</table>
								<hr style="border-top:2px solid maroon">
								<table style="width: 100%; font-size: 12pt;">
									<tr>
										<td style="min-width:250px;" valign="top">Nama Peserta BPJS </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs"></td>
										<td style="min-width:250px;" valign="top">No JKN </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs_nomor"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Nama Peserta BPJS (Istri) </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs_istri"></td>
										<td style="min-width:250px;" valign="top">No JKN </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs_istri_nomor"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Nama Peserta BPJS (Anak 1) </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs_anak1"></td>
										<td style="min-width:250px;" valign="top">No JKN </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs_anak1_nomor"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Nama Peserta BPJS (Anak 2) </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs_anak2"></td>
										<td style="min-width:250px;" valign="top">No JKN </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs_anak2_nomor"></td>
									</tr>
									<tr>
										<td style="min-width:250px;" valign="top">Nama Peserta BPJS (Anak 3) </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs_anak3"></td>
										<td style="min-width:250px;" valign="top">No JKN </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_bpjs_anak3_nomor"></td>
									</tr>
								</table>
								<hr style="border-top:2px solid maroon">
								<table style="width: 100%; font-size: 12pt;">
									<tr>
										<td style="min-width:250px;" valign="top">Kamera </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_camera"></td>
										<td style="min-width:250px;" valign="top">Software Editing </td>
										<td style="width:2%;" valign="top">:</td>
										<td style="min-width:250px;" id="text_kontributor_software"></td>
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