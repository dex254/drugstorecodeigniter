<!-- PAGE TITLE -->
<div class="page-title">
  <h2><span class="fa fa-medkit"></span> Drugs</h2>
</div>
<!-- END PAGE TITLE -->
<!-- START STRIPED TABLE SAMPLE -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">List of all Drugs<a href="<?php echo base_url('index.php/drug/createdrugPdf/');?>"><i class="fa fa-print"></i></a></h3>
    <a href="<?php echo base_url('index.php/drug/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Add New Drug</button></a>
    <a href="<?php echo base_url('index.php/dispense/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Issue Drug</button></a>
    <a href="<?php echo base_url('index.php/received/recCreate/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Receive Drug</button></a>
    <a href="<?php echo base_url('index.php/facilities/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-hospital-o"></i> Add Facility</button></a>
  </div>
  <div class="panel-heading" >Add Selected</div
  <div class="panel-body">
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>#</th>
          <th>Drug Name</th>
          <th>Category</th>
          <th>Current Stock (single unit i.e tablet)</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <?php $i=1; foreach ($drugs as $drug): ?>
        <tr>
          <td><?php echo $i; $i++;?></td>
          <td><?php echo $drug['name'];?></td>
          <td><?php echo $drug['ctName'];?></td>
          <td><?php echo $drug['currentStock'];?></td>
          <td><a href="<?php echo base_url('index.php/drug/show/'.$drug['id']);?>"><button type="button" class="btn btn-info btn-xs"><i class="fa fa-search"></i> View</button></a></td>
        </tr>
        <?php endforeach ?>
      </tbody>
    </table>
  </div>
</div>
<!-- END STRIPED TABLE SAMPLE -->
