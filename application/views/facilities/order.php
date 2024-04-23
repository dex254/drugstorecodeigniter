<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">
  <div class="row">
    <div class="col-md-12">
      <?php echo form_open_multipart('facilities/order',$attributes); ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><strong>Order</strong> Registration Form</h3>
            <a href="<?php echo base_url('index.php/drug/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Add New Drug</button></a>
            <a href="<?php echo base_url('index.php/dispense/batchCreate/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Dispense Drug</button></a>
            <a href="<?php echo base_url('index.php/received/recCreate/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Receive Drug</button></a>
            <a href="<?php echo base_url('index.php/facilities/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-hospital-o"></i> Add Facility</button></a>
          </div>
          <div class="panel-body">
             <?php if(!empty($this->session->flashdata('message'))){?>
               <div class="alert alert-<?php echo $this->session->flashdata('type');?>" role="alert">
                 <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                 <?php echo $this->session->flashdata('message');?>
               </div>
					<?php }?>
          </div>
          <div class="panel-body">
            <div class="row">
              <div class="col-md-9">
                <div class="form-group">
                  <label class="col-md-3 control-label">Facility</label>
                    <div class="col-md-9">
                      <?php echo form_dropdown('facility', $facilities, set_value('facility',$name),$prop); ?>
                      <span class="help-block"><?php echo form_error('facility'); ?></span>
                    </div>
                  </div>
                  <button type="reset" class="btn btn-danger pull-right">Clear</button>
                  <button type="submit" class="btn btn-success pull-right">Submit</button>
                </div>
              </div>
            </div>
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
