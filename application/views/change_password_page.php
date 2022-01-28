<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- MAIN CONTENT-->
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary">
                        <div class="card-body">
                            <form method="POST" id="changepass-form" accept-charset="UTF-8">
                                <div class="form-group row">
                                    <label for="old_password" class="col-md-3 col-form-label">Current Password <span class="text-red">*</span></label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" id="old_password" maxlength="100" name="old_password" value="" placeholder="..." required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="new_password" class="col-md-3 col-form-label">New Password <span class="text-red">*</span></label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" id="new_password" maxlength="100" name="new_password" value="" placeholder="..." required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="confirm_password" class="col-md-3 col-form-label">Confirm Password <span class="text-red">*</span></label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" id="confirm_password" maxlength="100" name="confirm_password" value="" placeholder="..." required>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary" id="btn-submit">Save</button>
                                <a class="btn btn-danger float-right" href="<?= base_url(); ?>"> Back to Main Menu</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END MAIN CONTENT-->