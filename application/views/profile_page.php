<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- MAIN CONTENT-->
<form method="POST" id="updateprofile-form" accept-charset="UTF-8">
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-primary">
							<div class="card-body">
								<?php
								if ( isset($user) and $user!=0 ) {
									foreach ($user as $u) {
										?>
										<div class="row">
											<div class="col-md-4">
												<div class="account2">
													<div class="image img-cir img-120">
														<?php 
														if ( $u->user_photo != '' ) {
															?>
															<img src="<?= base_url(); ?>asset/files/profile/<?= $u->user_id.'/'.$u->user_photo ?>"/>
															<?php 
														}else{
															?>
															<img src="<?= base_url(); ?>asset/images/icon/user2.jpeg"/>
															<?php 
														}
														?>
													</div>
													<h4 class="name" style="color: black;"><?= $log_fname ?></h4>
												</div>							
											</div>
											<div class="col-md-8">
												<div class="form-group row">
													<label class="col-md-3 col-form-label">Nama Lengkap</label>
													<div class="col-md-9">
														<input type="text" class="form-control" id="user_fname" maxlength="100" name="user_fname" value="<?= $u->user_fname ?>" placeholder="..." required readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 col-form-label">NIP</label>
													<div class="col-md-9">
														<input type="text" class="form-control" id="user_nip" maxlength="100" name="user_nip" value="<?= $u->user_nip ?>" placeholder="..." required readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 col-form-label">Nomor Handphone</label>
													<div class="col-md-9">
														<input type="text" class="form-control" id="user_phone" maxlength="100" name="user_phone" value="<?= $u->user_phone ?>" placeholder="..." required>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 col-form-label">Email</label>
													<div class="col-md-9">
														<input type="email" class="form-control" id="user_email" maxlength="100" name="user_email" value="<?= $u->user_email ?>" placeholder="..." required>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 col-form-label">Foto Profile</label>
													<div class="col-md-9">
														<input type="file" class="form-control" name="user_photo" id="user_photo" accept="image/*">
													</div>
												</div>
												<button type="submit" class="btn btn-primary"> Update Profile</button>
												<a class="btn btn-danger float-right" href="<?= base_url(); ?>"> Back to Main Menu</a>
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
	</div>
</form>