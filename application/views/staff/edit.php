<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">
  <div class="row">
    <div class="col-md-12">
      <?php echo form_open_multipart('staff/update',$attributes); ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><strong>Staff</strong> Password Edit Form</h3>
            <a href="<?php echo base_url('index.php/drug/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Add New Drug</button></a>
            <a href="<?php echo base_url('index.php/dispense/batchCreate/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Dispense Drug</button></a>
            <a href="<?php echo base_url('index.php/received/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Receive Drug</button></a>
            <a href="<?php echo base_url('index.php/facilities/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-hospital-o"></i> Add Facility</button></a>
          </div>
        
					<?php }?>
          </div>
          <div class="panel-body">
            <div class="row">
              <div class="form-group">
                <label class="col-md-3 control-label">Username</label>
                <div class="col-md-9">
                  <div class="input-group">
                    <span class="input-group-addon"><span class="fa fa-pencil-square-o"></span></span>
                    <input type="text" id="username" name="username" required="required" value="<?php echo set_value('username');?>" class="form-control col-md-12 col-xs-12">
                  </div>
                  <span class="help-block"><?php echo form_error('username'); ?></span>
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-3 control-label">Facility</label>
                <div class="col-md-9">
                  <div class="input-group">
                    <span class="input-group-addon"><span class="fa fa-user"></span></span>
                    <input type="text" id="name" name="facility" required="required" value="<?php echo set_value('facility');?>" class="form-control col-md-12 col-xs-12">
                  </div>
                  <span class="help-block"><?php echo form_error('facility'); ?></span>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-3 control-label">Old Password</label>
                <div class="col-md-9 col-xs-12">
                  <div class="input-group">
                    <span class="input-group-addon"><span class="fa fa-unlock-alt"></span></span>
                    <input type="password" id="opassword" name="opassword" required="required" class="form-control col-md-12 col-xs-12">
                  </div>
                  <span class="help-block"><?php echo form_error('opassword'); ?></span>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-3 control-label">New Password</label>
                <div class="col-md-9 col-xs-12">
                  <div class="input-group">
                    <span class="input-group-addon"><span class="fa fa-unlock-alt"></span></span>
                    <input type="password" id="password" name="password" required="required" class="form-control col-md-12 col-xs-12">
                  </div>
                  <span class="help-block"><?php echo form_error('password'); ?></span>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-3 control-label">Confirm New Password</label>
                <div class="col-md-9 col-xs-12">
                  <div class="input-group">
                    <span class="input-group-addon"><span class="fa fa-unlock-alt"></span></span>
                    <input type="password" id="cpassword" name="cpassword" required="required" class="form-control col-md-12 col-xs-12">
                  </div>
                  <span class="help-block"><?php echo form_error('cpassword'); ?></span>
                </div>
              </div>
            </div>
          </div>
          <div class="panel-footer">
            <button type="reset" class="btn btn-primary pull-right">Clear</button>
            <button type="submit" class="btn btn-success pull-right">Update</button>
            <button class="btn btn-danger pull-right">Cancel</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- END PAGE CONTENT WRAPPER -->
</div>
<!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
