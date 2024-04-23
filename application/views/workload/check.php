<!-- PAGE TITLE -->
<div class="page-title">
  <h2><span class="fa fa-hospital-o"></span> Drug Dispensation</h2>
</div>
<!-- END PAGE TITLE -->
<!-- START STRIPED TABLE SAMPLE -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">List of Requested Items</h3>
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
          <th>#</th>
          <th>Facility</th>
          <th>Requisition Officer</th>
          <th>Issuing Officer</th>
          <th>Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <?php $i=1; foreach ($faccarts as $faccart): ?>
        <tr>
          <td><?php echo $i;?></td>
          <td><?php echo $faccart['flName'];?></td>
          <td><?php echo $faccart['requisition'];?></td>
          <td><?php echo $faccart['fname'].' '.$faccart['lname'];?></td>
          <td><?php echo $faccart['regTime'];?></td>
          <td>
            <?php if ($faccart['status']==2) { ?>
              <a href="<?php echo base_url('index.php/dispense/facShow/'.$faccart['id']);?>"><button type="button" class="btn btn-info"><span class="fa fa-eye"></span>View</button></a>
            <?php } else { ?>
            <span class="badge badge-light">In Progress...</span>
          <?php } ?>
            </td>
        </tr>
        <?php $i++; endforeach ?>
      </tbody>
    </table>
  </div>
</div>
<!-- END STRIPED TABLE SAMPLE -->
