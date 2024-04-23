<li class="xn-title">Navigation</li>
<li>
  <a href="<?php echo base_url('index.php/dashboard/');?>"><span class="fa fa-briefcase"></span> <span class="xn-text">Dashboard</span></a>
  <a href="<?php echo base_url('index.php/facilities/');?>"><span class="fa fa-hospital-o"></span> <span class="xn-text">Facilities</span></a>
  <a href="<?php echo base_url('index.php/staff/');?>"><span class="fa fa-users"></span> <span class="xn-text">Staff</span></a>
  <li class="xn-openable">
      <a href="#"><span class="fa fa-medkit"></span> <span class="xn-text">Drugs</span></a>
      <ul>
          <li><a href="<?php echo base_url('index.php/drug/');?>"><span class="fa fa-folder-open-o"></span>All Drugs</a></li>
          <li><a href="<?php echo base_url('index.php/received/');?>"><span class="fa fa-adjust"></span>Received Drugs</a></li>
          <li><a href="<?php echo base_url('index.php/dispense/');?>"><span class="fa fa-adjust"></span>Issued Drugs</a></li>
      </ul>
  </li>
  <li>
  <a href="<?php echo base_url('index.php/login/logout/');?>"><span class="fa fa-sign-out"></span> <span class="xn-text">Logout</span></a>
</li>
<!--
<li>
    <a align="center"><b>System developed by:</b><br> Timothy Kigen</br>ICT officer County Drug Store</a>
</li>
-->

</ul>
<!-- END X-NAVIGATION -->
</div>
<!-- END PAGE SIDEBAR -->
<!-- PAGE CONTENT -->
<div class="page-content">

    <!-- START X-NAVIGATION VERTICAL -->
    <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
        <!-- TOGGLE NAVIGATION -->
        <li class="xn-icon-button">
            <a href="#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
        </li>
        <!-- END TOGGLE NAVIGATION -->
        <!-- SEARCH -->
        <li class="xn-search">
            <form role="form">
                <input type="text" name="search" placeholder="Search..."/>
            </form>
        </li>
        <!-- END SEARCH -->
        <!-- SIGN OUT -->
        <li class="icon-button pull-right">
            <a><?php echo $login['fullName'];?></a>
        </li>
        <li class="icon-button pull-right">
          <?php if ($login['role']==3) { ?>
            <a href="<?php echo base_url('index.php/dispense/inchargeCheckout');?>">
          <?php } else { ?>
            <a href="<?php echo base_url('index.php/dispense/checkout');?>">
          <?php  }?>
            <button type="button" class="btn btn-xs btn-primary">
              <span class="fa fa-shopping-cart"> </span> <span class="badge badge-light"><?php echo $cart;?></span>
            </button>
          </a>
        </li>
        <li class="icon-button pull-right">
            <a href="<?php echo base_url('index.php/dispense/dispenseWL');?>">Workload</a>
        </li>
        <!--
        <li class="icon-button pull-right">
          <?php if ($login['role']==3) { ?>
            <a href="<?php echo base_url('index.php/workload/inchargeCheckout');?>">
          <?php } else { ?>
            <a href="<?php echo base_url('index.php/workload/checkout');?>">
          <?php  }?>
            <button type="button" class="btn btn-xs btn-primary">
              <span class="fa fa-shopping-cart"> </span> <span class="badge badge-light"><?php echo $cartwl;?></span>
            </button>
          </a>
        </li>
        <li class="icon-button pull-right">
            <a href="<?php echo base_url('index.php/workload/create');?>">Dispense WL</a>
        </li>-->

        <!--
        <li class="icon-button pull-right">
          <?php if ($login['role']==3) { ?>
            <a href="<?php echo base_url('index.php/dispense/inchargeCheckout');?>">
          <?php } else { ?>
            <a href="<?php echo base_url('index.php/dispense/checkout');?>">
          <?php  }?>
            <button type="button" class="btn btn-xs btn-primary">
              <span class="fa fa-shopping-cart"> </span> <span class="badge badge-light"><?php echo $cart;?></span>
            </button>
          </a>
        </li>-->
        <li class="icon-button pull-right">
            <a href="<?php echo base_url('index.php/dispense/batchCreate');?>">Issue</a>
        </li>
        <li class="icon-button pull-right">
          <?php if ($login['role']==3) { ?>
            <a href="<?php echo base_url('index.php/received/inchargereCheckout');?>">
          <?php } else { ?>
            <a href="<?php echo base_url('index.php/received/recheckout');?>">
          <?php  }?>
            <button type="button" class="btn btn-xs btn-primary">
              <span class="fa fa-briefcase"> </span> <span class="badge badge-light"><?php echo $recCart;?></span>
            </button>
          </a>
        </li>
        <li class="icon-button pull-right">
            <a href="<?php echo base_url('index.php/received/delivery');?>">Receive</a>
        </li>
        <!-- END SIGN OUT -->
    </ul>
    <!-- END X-NAVIGATION VERTICAL -->
