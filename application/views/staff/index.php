<!-- PAGE TITLE -->
<div class="page-title">
  <h2><span class="fa fa-users"></span> Staff</h2>
</div>
<!-- END PAGE TITLE -->
<!-- START STRIPED TABLE SAMPLE -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">List of all staff</h3>
    <a href="<?php echo base_url('index.php/staff/create/');?>"><button type="button" class="btn btn-primary btn pull-right"><i class="fa fa-plus"></i> Add New Staff</button></a>
  </div>
  <div class="panel-body">
    
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Role</th>
          <th>Username</th>
          <th>Facility</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <?php $i=1; foreach ($staffs as $staff): ?>
        <tr>
          <td><?php echo $i; $i++;?></td>
          <td><?php echo $staff['fname'].' '.$staff['lname'];?></td>
          <td><?php echo $staff['roleId'];?></td>
          <td><?php echo $staff['username'];?></td>
          <td><?php echo $staff['facility'];?></td>
          <td>
            <a href="<?php echo base_url('index.php/staff/edit/'.$staff['id']);?>"><button type="button" class="btn btn-default btn-xs"><i class="fa fa-edit"></i> Edit</button></a>
            <a href="<?php echo base_url('index.php/staff/destroy/'.$staff['id']);?>"><button type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</button></a>
          </td>
        </tr>
        <?php endforeach ?>
      </tbody>
    </table>
  </div>
</div>
<!-- END STRIPED TABLE SAMPLE -->
