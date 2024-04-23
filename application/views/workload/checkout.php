<!-- PAGE TITLE -->
<div class="page-title">
  <h2><span class="fa fa-hospital-o"></span> Drug Dispensation</h2>
</div>
<!-- END PAGE TITLE -->
<!-- START STRIPED TABLE SAMPLE -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Checkout List</h3>
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
    <?php if (isset($pickcartwl)){?>
      <b>Facility: </b><?php echo $pickcartwl['fcsName'];?> <b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Requisition Officer: </b><?php echo $pickcartwl['requisition'];?> <b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Designation: </b><?php echo $pickcartwl['designation'];?>
    <?php } else { ?>
      <div class="alert alert-danger" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        You have not selected a facility and requisitioning officer. Please click <a href="<?php echo base_url('index.php/dispense/batchCreate');?>">here</a>
      </div>
    <?php } ?>
    <?php echo form_open_multipart('workload/requested',$attributes); ?>
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>#</th>
          <th>Category</th>
          <th></th>
          <th>Item description</th>
          <th>U.O.M</th>
          <th>Current Stock</th>
          <th>Quantity</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <?php $i=1; foreach ($cartswl as $cart): ?>
        <tr>
          <td><?php echo $i;?></td>
          <td><?php echo $cart['ctName'];?></td>
          <td></td>
          <td><?php echo $cart['drName'];?></td>
          <td><?php echo $cart['uom'];?></td>
          <td><?php echo $cart['currentStock'];?></td>
          <td><input type="text" id="quantity" name="<?php echo 'quantity'.$i?>" required="required" value="<?php echo $cart['quantity'];?>" class="form-control col-md-12 col-xs-12">
          <span class="help-block"><?php echo form_error('quantity'); ?></span></td>
          <td><a href="<?php echo base_url('index.php/workload/destroy/'.$cart['id']);?>"><button type="button" class="btn btn-danger"><span class="fa fa-trash"></span>Delete</button></a></td>
        </tr>
        <input type="hidden" name="<?php echo 'drugId'.$i?>" value="<?php echo $cart['drId'];?>">
        <input type="hidden" name="<?php echo 'pcid'.$i?>" value="<?php echo $cart['id'];?>">
        <input type="hidden" name="<?php echo 'facilityId'.$i?>" value="<?php echo $cart['facilityId'];$i++;?>">
        <?php endforeach ?>
        <tr>
          <td>
            <a href="<?php echo base_url('index.php/workload/dispatchwl/');?>"><button type="button" class="btn btn-warning"><span class="fa fa-chevron-left"></span> Continue selecting drugs</button></a>
          </td>
          <td></td>
          <td></td>
          <td></td>
          <td>End</td>
          <td></td>
          <td></td>
          <td>
            <button type="submit" class="btn btn-success"><span class="fa fa-check"></span> Request</button>
          </td>
        </tr>
      </tbody>
    </table>
    </form>
  </div>
</div>
<!-- END STRIPED TABLE SAMPLE -->
