<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">
  <div class="row">
    <div class="col-md-12">
      <?php echo form_open_multipart('stock/store',$attributes); ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><strong>Drug</strong> Registration Form</h3>
            <a href="<?php echo base_url('index.php/drug/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Add New Drug</button></a>
            <a href="<?php echo base_url('index.php/dispense/batchCreate/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Issue Drug</button></a>
            <a href="<?php echo base_url('index.php/received/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Receive Drug</button></a>
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
              <div class="col-md-6">
                <div class="form-group">
                  <label class="col-md-3 control-label">Item Description</label>
                  <div class="col-md-9">
                    <?php echo form_dropdown('drug', $drugs, set_value('drug'),$prop); ?>
                    <span class="help-block"><?php echo form_error('drug'); ?></span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-md-3 control-label">Openning stock</label>
                  <div class="col-md-9">
                    <div class="input-group">
                      <span class="input-group-addon"><span class="fa fa-dashboard"></span></span>
                      <input type="text" id="opStock" name="opStock" required="required" value="<?php echo set_value('opStock');?>" class="form-control col-md-12 col-xs-12">
                    </div>
                    <span class="help-block"><?php echo form_error('opStock'); ?></span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-md-3 control-label">Stock</label>
                  <div class="col-md-9">
                    <div class="input-group">
                      <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                      <input type="text" id="stock" name="stock" required="required" value="<?php echo set_value('stock');?>" class="form-control col-md-12 col-xs-12"  placeholder="Date format should be YYYY-MM-DD">
                    </div>
                    <span class="help-block"><?php echo form_error('stock'); ?></span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-md-3 control-label">Received Date</label>
                  <div class="col-md-9">
                    <div class="input-group">
                      <span class="input-group-addon"><span class="fa fa-dashboard"></span></span>
                      <input type="text" id="rDate" name="rDate" required="required" value="<?php echo set_value('rDate');?>" class="form-control col-md-12 col-xs-12">
                    </div>
                    <span class="help-block"><?php echo form_error('rDate'); ?></span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-md-3 control-label">Expiry</label>
                  <div class="col-md-9">
                    <div class="input-group">
                      <span class="input-group-addon"><span class="fa fa-dashboard"></span></span>
                      <input type="text" id="expiry" name="expiry" required="required" value="<?php echo set_value('expiry');?>" class="form-control col-md-12 col-xs-12">
                    </div>
                    <span class="help-block"><?php echo form_error('expiry'); ?></span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-md-3 control-label">current Stock</label>
                  <div class="col-md-9">
                    <div class="input-group">
                      <span class="input-group-addon"><span class="fa fa-dashboard"></span></span>
                      <input type="text" id="cStock" name="cStock" required="required" value="<?php echo set_value('cStock');?>" class="form-control col-md-12 col-xs-12">
                    </div>
                    <span class="help-block"><?php echo form_error('cStock'); ?></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="panel-footer">
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
