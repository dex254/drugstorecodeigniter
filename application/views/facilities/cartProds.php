
<!-- START CONTENT FRAME -->
<div class="content-frame">
    <!-- START CONTENT FRAME TOP -->
    <div class="content-frame-top">
        <div class="page-title">
            <h2><span class="fa fa-user"></span>Facility Details</h2>
        </div>
          <!--
        <div class="pull-right">
            <button class="btn btn-default"><span class="fa fa-print"></span> Print</button>
            <button class="btn btn-default content-frame-left-toggle"><span class="fa fa-bars"></span></button>
        </div>-->
    </div>
    <!-- END CONTENT FRAME TOP -->

    <!-- START CONTENT FRAME LEFT -->
    <div class="content-frame-left">
        <div class="block">
            <div class="list-group border-bottom">
              <a href="#" class="list-group-item"><span class="fa fa-user"></span>  <b>Facility Name: </b> <?php echo $facility['name'];?></a>
                <a href="#" class="list-group-item"><span class="fa fa-user"></span>  <b>Facility Code: </b> <?php echo $facility['code'];?></a>
                <a href="#" class="list-group-item"><span class="fa fa-money"></span> <b>Facility Type: </b> <?php echo $facility['facilityType'];?> </a>
                <a href="#" class="list-group-item"><span class="fa fa-user"></span>  <b>Level: </b> <?php echo $facility['level'];?></a>
                <a href="#" class="list-group-item"><span class="fa fa-user"></span>  <b>Sub County: </b> <?php echo $facility['subCounty'];?></a>
                <a href="#" class="list-group-item"><span class="fa fa-user"></span>  <b>Ward: </b> <?php echo $facility['ward'];?></a>
                <a href="#" class="list-group-item"><span class="fa fa-user"></span>  <b>Contacts: </b> <?php echo $facility['phone'];?></a>
            </div>
        </div>
    </div>
    <!-- END CONTENT FRAME LEFT -->
    <!-- START CONTENT FRAME BODY -->

    <div class="content-frame-body">
      <a href="<?php echo base_url('index.php/dispense/createAnotherCheckPdf/'.$cartId);?>"><button type="button" class="btn btn-info btn pull-right"><i class="fa fa-print"></i> Print Item List</button></a>
      <div class="panel panel-default">
        <div class="panel-body">
           <?php if(!empty($this->session->flashdata('message'))){?>
             <div class="alert alert-<?php echo $this->session->flashdata('type');?>" role="alert">
               <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
               <?php echo $this->session->flashdata('message');?>
             </div>
        <?php }?>
        </div>
        <div class="panel-body">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>#</th>
              <th>Category</th>
              <th>Item description</th>
              <th>Batch</th>
              <th>Expiry</th>
              <th>Requested Quantity</th>
              <th>Approved Quantity</th>
            </tr>
          </thead>
          <tbody>
            <?php $i=1; foreach ($cartProds as $cart): ?>
            <tr>
              <td><?php echo $i;?></td>
              <td><?php echo $cart['ctName'];?></td>
              <td><?php echo $cart['drName'];?></td>
              <td><?php echo $cart['batch'];?></td>
              <td><?php echo $cart['expiry'];?></td>
              <td><?php echo $cart['pcQuantity'];?></td>
              <td><?php echo $cart['approvedquant'];?></td>
            </tr>
            <?php $i++; endforeach ?>
          </tbody>
      </div>
    </div>
  </div>
    <!-- END CONTENT FRAME BODY -->
</div>
