<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">
  <div class="row">
    <div class="col-md-12">
      <?php echo form_open_multipart('facilities/store',$attributes); ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><strong>New Facility</strong> Registration Form</h3>
            <a href="<?php echo base_url('index.php/facilities/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-hospital-o"></i> Add Facility</button></a>
          </div>
          <div class="panel-body">
             <?php if(!empty($this->session->flashdata('message'))){?>
               <div class="alert alert-<?php echo $this->session->flashdata('type');?>" role="alert">
                 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                 <?php echo $this->session->flashdata('message');?>
               </div>
					<?php }?>
          </div>
          <div class="panel-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="col-md-3 control-label">Facility Name</label>
                  <div class="col-md-9">
                    <div class="input-group">
                      <span class="input-group-addon"><span class="fa fa-h-square"></span></span>
                      <input type="text" id="name" name="name" required="required" value="<?php echo set_value('name');?>" class="form-control col-md-12 col-xs-12">
                    </div>
                    <span class="help-block"><?php echo form_error('name'); ?></span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-md-3 control-label">Facility Code</label>
                  <div class="col-md-9">
                    <div class="input-group">
                      <span class="input-group-addon"><span class="fa fa-barcode"></span></span>
                      <input type="text" id="code" name="code" required="required" value="<?php echo set_value('code');?>" class="form-control col-md-12 col-xs-12">
                    </div>
                    <span class="help-block"><?php echo form_error('code'); ?></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="panel-footer">
            <button type="reset" class="btn btn-primary pull-right">Clear</button>
            <button type="submit" class="btn btn-success pull-right">Submit</button>
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
