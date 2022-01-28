<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- MAIN CONTENT-->
<div class="main-content">
  <?php
  if ( isset($data) and $data != 0 ) {
    $allow_ext = ['pdf', 'jpg', 'jpeg', 'png', 'gif'];
    foreach ($data as $row) {
      $filename = explode('.', $row->attachment_name);
      $ext = end($filename);
      ?>
      <div class="section__content section__content--p30">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="overview-item overview-item--c1-news">
                <div class="overview__inner">
                  <div class="overview-box clearfix">
                    <div class="text">
                      <h3><a href="<?= base_url(); ?>">Beranda</a> > <a href="<?= base_url(); ?>surat_masuk"> Surat Masuk</a> > Detail Surat Masuk </h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="card card-primary">
                <div class="card-body">
                  <div class="text-center">
                    <?php 
                    if ( in_array($ext, $allow_ext) ) {
                      ?>
                      <object data="<?= base_url(); ?>asset/files/surat_masuk/<?= $row->surat_id.'/'.$row->attachment_name ?>" width="100%" height="600px"><p>Your web browser not supported.<br>Instead you can <a href="<?= base_url(); ?>asset/files/surat_masuk/<?= $row->surat_id.'/'.$row->attachment_name ?>" >click here to download attachment.</a></p></object>
                      <?php 
                    }else {
                     ?>
                     <p>Your web browser not supported.<br>Instead you can <a href="<?= base_url(); ?>asset/files/surat_masuk/<?= $row->surat_id.'/'.$row->attachment_name ?>" >click here to download attachment.</a></p>
                     <?php 
                   }
                   ?>
                 </div>
               </div>
               <div class="card-footer">
                <div class="table-data__tool-right">
                  <?php 
                  if ( $log_role == 2 ) {
                   ?>
                   <button class="au-btn au-btn-icon au-btn--green au-btn--small" id="btn-edit" data-id="<?= $row->surat_id ?>"><i class="zmdi zmdi-edit"></i>Edit</button>
                   <?php 
                 }
                 ?>
                 <a class="au-btn au-btn-icon au-btn--green au-btn--small" href="<?= base_url(); ?>asset/files/surat_masuk/<?= $row->surat_id.'/'.$row->attachment_name ?>" target="_blank" download><i class="zmdi zmdi-download"></i>Download</a>
               </div>
             </div>
           </div>

           <?php 
           if ( $row->jenis_surat == 2 ) {
            ?>
            <!-- KOLOM DISPOSISI -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="title-3">
                  Disposisi
                </h3>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <div class="au-card au-card--no-shadow au-card--no-pad au-card--border">
                      <div class="au-task au-task--border">
                        <div class="au-task-list js-scrollbar3">
                          <?php 
                          if ( isset($data_disposisi) and $data_disposisi != 0 ) {
                            foreach ($data_disposisi as $disposisi) {
                              if ( $disposisi->disposisi_title != '' and $disposisi->disposisi_content != '' ) {
                               ?>
                               <div class="au-task__item au-task__item--primary">
                                <div class="au-task__item-inner">
                                  <h5 class="task"><a href="javascript:void(0)"><?= $disposisi->disposisi_content ?></a></h5>
                                  <span class="time"><?= $disposisi->disposisi_title ?> - <?= $disposisi->user_fname ?></span><br>
                                  <span class="time"><?= date('d F Y H:i:s', strtotime($disposisi->created_date)) ?></span>
                                </div>
                              </div>
                              <?php 
                            }
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
                if ( $log_role != 1 ) {
                 ?>
                 <a class="au-btn au-btn-icon au-btn--blue au-btn--small" href="<?= base_url(); ?>surat_masuk/disposisi/<?= $row->surat_id ?>">Disposisi</a> 
                 <?php 
               }
               ?>
             </div>
           </div>
         </div>
         <?php 
       }
       ?>

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
</div>