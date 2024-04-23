<ul class="breadcrumb">
  <li class="active">Dashboard</li>
</ul>
<div class="panel-body">
   <?php if(!empty($this->session->flashdata('message'))){?>
     <div class="alert alert-<?php echo $this->session->flashdata('type');?>" role="alert">
       <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
       <?php echo $this->session->flashdata('message');?>
     </div>
<?php }?>
</div>
<div class="page-content-wrap">
  <div class="row">
    <?php if (!empty($expired)) { ?>
    <div class="col-md-4">
      <div class="alert alert-danger" role="alert">
        Some Drugs are almost expired! <a href="<?php echo base_url('index.php/drug/expiryPdf3/');?>"><button type="button" class="btn btn-primary btn-xs">View</button></a>
      </div>
    </div>
  <?php } if (!empty($soon)) { ?>
    <div class="col-md-4">
      <div class="alert alert-warning" role="alert">
        Some Drugs expires soon! <a href="<?php echo base_url('index.php/drug/expiryPdf2/');?>"><button type="button" class="btn btn-primary btn-xs">View</button></a>
      </div>
    </div>
  <?php } if (!empty($order)) { ?>
    <div class="col-md-4">
      <div class="alert alert-info" role="alert">
        Some Drugs needs to be reordered! <a href="<?php echo base_url('index.php/drug/createreorderPdf/');?>"><button type="button" class="btn btn-primary btn-xs">View</button></a>
      </div>
    </div>
    <?php } ?>
  </div>
<div class="row">
  <div class="col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <div class="panel-title-box">
          <h3>List of Tracer Medicines</h3>
        </div>
      </div>
      <div class="panel-body padding-0">
        <div class="chart-holder" id="dashboard-donut-2" style="height: 200px;">
          <div class="summ">
            <table class="table table-striped table-hover">
              <thead>
                <tr>
                  <th></th>
                  <th>Tracer Drug</th>
                  <th>category</th>
                  <th>Unit of Issued</th>
                  <th>Stock</th>
                </tr>
              </thead>
              <tbody>
                <?php $i=1; foreach ($tracers as $tracer): ?>
                <tr>
                  <td><?php echo $i; $i++;?></td>
                  <td><?php echo $tracer['name'];?></td>
                  <td><?php echo $tracer['currentStock'];?></td>
                </tr>
                <?php if ($i== 3) break; endforeach ?>
              </tbody>
            </table>
            <a href="<?php echo base_url('index.php/drug/tracers/');?>"><p>View More <i class="fa fa-hand-o-right"></i></p></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <div class="panel-title-box">
          <h3>Inventory Summary</h3>
        </div>
      </div>
      <div class="panel-body padding-0">
        <div class="chart-holder" id="dashboard-donut-3" style="height: 200px;">
          <div class="summ">
            <ol>
              <li><a href="<?php echo base_url('index.php/drug/createPdf/');?>">Instock  <i class="fa fa-print"></i></a></li>
              <li><a href="<?php echo base_url('index.php/drug/createreorderPdf/');?>"> Re-Order  <i class="fa fa-print"></i></a></li>
              <li><a href="<?php echo base_url('index.php/#/createPdf2/');?>"> Losses  <i class="fa fa-print"></i></a></li>
              <li><a href="<?php echo base_url('index.php/drug/createoutofStockPdf/');?>">Out of Stock  <i class="fa fa-print"></i></a></li>
            </ol>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div class="col-md-4">
      <div class="panel panel-default">
        <div class="panel-heading">
          <div class="panel-title-box">
            <h3>Expiration Summary</h3>
          </div>
        </div>
        <div class="panel-body padding-0">
          <div class="chart-holder" id="dashboard-donut-1" style="height: 200px;">
            <div class="summ">
              <ol>
                <li><a href="<?php echo base_url('index.php/drug/expiryPdf1/');?>">Expires between 181 Days & 365 Days  <i class="fa fa-print"></i></a></li>
                <li><a href="<?php echo base_url('index.php/drug/expiryPdf2/');?>">Expires between 91 Days & 180 Days  <i class="fa fa-print"></i></a></li>
                <li><a href="<?php echo base_url('index.php/drug/expiryPdf3/');?>">Expires between 1 Day & 90 Days  <i class="fa fa-print"></i></a></li>
                <li><a href="<?php echo base_url('index.php/drug/expiredPdf/');?>">Expired by <?php echo date('M Y');?> <i class="fa fa-print"></i></a></li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>
<div class="row">
<div class="col-md-4">
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="panel-title-box">
        <h3>Received</h3>
      </div>
    </div>
    <div class="panel-body padding-0">
      <div class="chart-holder" id="dashboard-donut-2" style="height: 200px;">
        <div class="summ">
          <ol>
            <li><a href="<?php echo base_url('index.php/received/createPdf1/');?>">Items received in <?php echo date('M Y')?> <i class="fa fa-print"></i></a></li>
            <li><a href="<?php echo base_url('index.php/received/createPdf2/');?>">Items received in <?php echo date('M Y',strtotime(date('Y-m').'- 1 month'));?> <i class="fa fa-print"></i></a></li>
            <li><a href="<?php echo base_url('index.php/received/createPdf3/');?>">Items received in <?php echo date('M Y',strtotime(date('Y-m').'- 2 month'));?> <i class="fa fa-print"></i></a></li>
            <li><a href="<?php echo base_url('index.php/received/createPdf4/');?>">Items received in <?php echo date('M Y',strtotime(date('Y-m').'- 3 month'));?> <i class="fa fa-print"></i></a></li>
          </ol>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="col-md-4">
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="panel-title-box">
        <h3>Issued</h3>
      </div>
    </div>
    <div class="panel-body padding-0">
      <div class="chart-holder" id="dashboard-donut-3" style="height: 200px;">
        <div class="summ">
          <ol>
            <li><a href="<?php echo base_url('index.php/dispense/createPdf1/');?>">Items Issued in <?php echo date('M Y')?> <i class="fa fa-print"></i></a></li>
            <li><a href="<?php echo base_url('index.php/dispense/createPdf2/');?>">Items Issued in <?php echo date('M Y',strtotime(date('Y-m').'- 1 month'));?> <i class="fa fa-print"></i></a></li>
            <li><a href="<?php echo base_url('index.php/dispense/createPdf3/');?>">Items Issued in <?php echo date('M Y',strtotime(date('Y-m').'- 2 month'));?> <i class="fa fa-print"></i></a></li>
            <li><a href="<?php echo base_url('index.php/dispense/createPdf4/');?>">Items Issued in <?php echo date('M Y',strtotime(date('Y-m').'- 3 month'));?> <i class="fa fa-print"></i></a></li>
          </ol>
        </div>
      </div>
    </div>
  </div>
</div>

  <div class="col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <div class="panel-title-box">
          <h3>Notice Board</h3>
        </div>
      </div>
      <div class="panel-body padding-0">
        <div class="chart-holder" id="dashboard-donut-1" style="height: 200px;">
          <div class="summ">
            <ol>
              <li><a href="<?php echo base_url('index.php/drug/createstocktakePdf/');?>">Click here to download Stock Taking Form <?php echo date('M Y')?> <i class="fa fa-print"></i></a></li>
              <li><a href="<?php echo base_url('index.php/drug/createinstockfPdf/');?>">Click here to download InStock Form <?php echo date('M Y')?> <i class="fa fa-print"></i></a></li>
            </ol>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</div>
<!-- END PAGE CONTENT WRAPPER -->
