<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- MAIN CONTENT-->
<div class="main-content">
	<?php
	if ( isset($data) and $data != 0 ) {
		foreach ($data as $row) {
			?>
			<div class="section__content section__content--p30">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="overview-item overview-item--c1-news">
								<div class="overview__inner">
									<div class="overview-box clearfix">
										<div class="text">
											<h3><a href="<?= base_url(); ?>">Beranda</a> > <a href="<?= base_url(); ?>surat_keluar"> Surat Keluar</a> > Detail Surat Keluar </h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="card card-primary">
								<div class="card-body">
									<div class="row">
										<div class="col-md-12">
											<div class="au-card au-card--no-shadow au-card--no-pad au-card--border">
												<div class="au-task au-task--border">
													<div class="au-task-list js-scrollbar3">
														<?php 
														if ( isset($data_notes) and $data_notes != 0 ) {
															foreach ($data_notes as $notes) {
																?>
																<div class="au-task__item au-task__item--primary">
																	<div class="au-task__item-inner">
																		<h5 class="task"><a href="javascript:void(0)"><?= $notes->notes_context ?></a></h5>
																		<span class="time"><?= $notes->user_nip ?> - <?= $notes->user_fname ?></span><br>
																		<span class="time"><?= date('d F Y H:i:s', strtotime($notes->notes_date)) ?></span>
																	</div>
																</div>
																<?php 
															}
														}
														?>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<div class="table-data__tool-right">
										<?php 
										if ( $log_role == 2 && $row->status_id == 1) {
											?>
											<button class="au-btn au-btn-icon au-btn--green au-btn--small" id="btn-edit" data-id="<?= $row->surat_id ?>"><i class="zmdi zmdi-edit"></i>Edit</button>
											<?php 
											if ( $row->status_id == 2 ) {
												?>
												<button class="au-btn au-btn-icon au-btn--green au-btn--small" id="btn-print" data-id="<?= $row->surat_id ?>"><i class="zmdi zmdi-print"></i>Print</button>
												<?php 
											}
										}
										?>
										<?php 
										if (  $log_role == 2 || $log_nip == $row->pemeriksa || $log_nip == $row->pengirim ) {
											if ( $row->status_id == 1 ) {
												?>
												<button class="au-btn au-btn-icon au-btn--green au-btn--small" id="btn-approve" data-id="<?= $row->surat_id ?>"><i class="fas fa-check"></i> Approve</button>
												<?php 
											}
											?>
											<button class="au-btn au-btn-icon au-btn--green au-btn--small" id="btn-send" data-id="<?= $row->surat_id ?>"><i class="fas fa-sticky-note"></i> Notes</button>
											<?php 
										}
										?>
										<a class="au-btn au-btn-icon au-btn--green au-btn--small" href="<?= base_url(); ?>/surat_keluar/generate_word3/<?= $row->surat_id ?>" target="_blank" download><i class="zmdi zmdi-download"></i>Download</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php 
		}
	} 
	?>

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
							<label for="jabatan_penerima" class="col-md-3 col-form-label">Jabatan Penerima <span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="jabatan_penerima" maxlength="100" name="jabatan_penerima" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="instansi" class="col-md-3 col-form-label">Instansi<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="instansi" maxlength="100" name="instansi" value="" placeholder="...">
							</div>
						</div>
						<div class="form-group row">
							<label for="tempat_surat" class="col-md-3 col-form-label">Tempat Surat<span class="text-red">*</span></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="tempat_surat" maxlength="100" name="tempat_surat" value="" placeholder="..." required>
							</div>
						</div>
						<div class="form-group row">
							<label for="tanggal_surat" class="col-md-3 col-form-label">Tanggal Surat <span class="text-red">*</span></label>
							<div class="col-md-9">
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

	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModal2Label" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
			<div class="modal-content" style="overflow-y: scroll;">
				<form method="POST" id="notes-form" accept-charset="UTF-8">
					<div class="modal-header">
						<h5 class="modal-title" style="color: black;"><span id="modal-type">Tambah</span></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group row">
							<label for="notes_context" class="col-md-3 col-form-label">Pesan <span class="text-red">*</span></label>
							<div class="col-md-9">
								<textarea class="form-control" id="notes_context" name="notes_context" rows="4" required></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="text" class="collapse" id="surat_id" name="surat_id" value="">
						<button type="submit" id="btn-submit2" class="btn btn-primary">Simpan</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>