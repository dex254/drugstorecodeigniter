<!-- PAGE TITLE -->
<div class="page-title">
  <h2><span class="fa fa-hospital-o"></span> Facilities</h2>
</div>
<!-- END PAGE TITLE -->
<!-- START STRIPED TABLE SAMPLE -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">List of all facilities <a href="<?php echo base_url('index.php/facilities/createPdf/');?>"><i class="fa fa-file"></i></a></h3>
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
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <tr>
          <th>#</th>
          <th>Facility Name</th>
          <th>Facility Code</th>
          <th>Level</th>
          <th>Ward</th>
          <th>Sub County</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <?php $i=1; foreach ($facilities as $facility): ?>
        <tr>
          <td><?php echo $i; $i++;?></td>
          <td><?php echo $facility['name'];?></td>
          <td><?php echo $facility['code'];?></td>
          <td><?php echo $facility['levelId'];?></td>
          <td><?php echo $facility['ward'];?></td>
          <td><?php echo $facility['subCounty'];?></td>
          <td><a href="<?php echo base_url('index.php/facilities/fshow/'.$facility['id']);?>"><button type="button" class="btn btn-info btn-xs"><i class="fa fa-search"></i> View</button></a></td>
        </tr>
        <?php endforeach ?>
      </tbody>
    </table>
  </div>
</div>
<!-- END STRIPED TABLE SAMPLE -->
