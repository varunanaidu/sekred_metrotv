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
									<h3 class="title-5 m-b-35"><a href="<?= base_url(); ?>">Beranda</a> > <a href="<?= base_url(); ?>surat_masuk"> Surat Masuk</a> > Disposisi Surat </h3>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<form method="POST" class="form-horizontal" id="disposisi-form" accept-charset="UTF-8">
							<div class="card-header">
								Disposisi Surat
							</div>
							<div class="card-body card-block">
								<?php 
								if ( isset($data) and $data != 0 ) {
									$length = sizeof($data) ;

									for ($i=0; $i < $length; $i++) { 
										?>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="disposisi_title" class=" form-control-label">Disposisi <?= $i+1 ?></label>
											</div>
											<div class="col-12 col-md-9">
												<select class="form-control select2" name="data_disposisi[<?= $i ?>][disposisi_title]" id="disposisi_title" data-value="<?= $data[$i]->disposisi_title ?>">
													<option value="<?= $data[$i]->disposisi_title ?>" selected><?= $data[$i]->disposisi_title.' - '. $data[$i]->user_fname?></option>
												</select>
												<input type="hidden" id="disposisi_id" name="data_disposisi[<?= $i ?>][disposisi_id]" class="form-control" value="<?= $data[$i]->disposisi_id ?>">
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="disposisi_content" class=" form-control-label">Isi Disposisi</label>
											</div>
											<div class="col-12 col-md-9">
												<textarea id="disposisi_content" name="data_disposisi[<?= $i ?>][disposisi_content]" rows="9" placeholder="..." class="form-control"><?= $data[$i]->disposisi_content ?></textarea>
											</div>
										</div>
										<?php 
									}

								}else{
									for ( $i = 0; $i < 3 ; $i++) { 
										?>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="disposisi_title" class=" form-control-label">Disposisi <?= $i+1 ?></label>
											</div>
											<div class="col-12 col-md-9">
												<select class="form-control select2" name="data_disposisi[<?= $i ?>][disposisi_title]" id="disposisi_title"></select>
												<input type="hidden" id="disposisi_id" name="data_disposisi[<?= $i ?>][disposisi_id]" class="form-control">
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="disposisi_content" class=" form-control-label">Isi Disposisi</label>
											</div>
											<div class="col-12 col-md-9">
												<textarea id="disposisi_content" name="data_disposisi[<?= $i ?>][disposisi_content]" rows="9" placeholder="..." class="form-control"></textarea>
											</div>
										</div>
										<?php 
									}
								}
								?>
							</div>
							<div class="card-footer">
								<input type="text" class="collapse" name="surat_id" id="surat_id" value="<?= $surat_id ?>">
								<button type="submit" id="btn-submit" class="btn btn-primary btn-sm"><i class="fa fa-check"></i> Simpan</button>
								<button type="button" id="btn-back" class="btn btn-danger btn-sm" data-id="<?= $surat_id ?>"><i class="fa fa-ban"></i> Batal</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>