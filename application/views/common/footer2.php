<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<script src="<?php echo base_url();?>assets/js/plugins/jquery/jquery.min.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/jquery/jquery-ui.min.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/icheck/icheck.min.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/bootstrap/bootstrap-datepicker.min.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/bootstrap/bootstrap-file-input.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/bootstrap/bootstrap-select.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/validation/jquery.validate.min.js"></script>
<script src="<?php echo base_url();?>assets/js/plugins/validation/additional-methods.min.js"></script>
<!-- END PLUGINS -->


  <script src="<?php echo base_url('assets/js/sb-admin.min.js');?>"></script>
<!-- START TEMPLATE -->
<script src="<?php echo base_url();?>assets/js/plugins.js"></script>
<script src="<?php echo base_url();?>assets/js/actions.js"></script>
<!-- END TEMPLATE -->
<script>
// just for the demos, avoids form submit
jQuery.validator.setDefaults({
  debug: true,
  success: "valid"
});
$( "#checkout" ).validate({
  rules: {
    field: {
      required: true,
      min: 13
    }
  }
});
</script>

<!-- END SCRIPTS -->
</body>
</html>
