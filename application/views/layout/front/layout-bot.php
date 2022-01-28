<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
</div>
<!-- END PAGE CONTAINER-->
</div>
<script type="text/javascript">var base_url = '<?= base_url(); ?>'</script>
<!-- Jquery JS-->
<script src="<?= base_url(); ?>asset/vendor/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->
<script src="<?= base_url(); ?>asset/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="<?= base_url(); ?>asset/vendor/slick/slick.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/wow/wow.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/animsition/animsition.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/counter-up/jquery.counterup.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/circle-progress/circle-progress.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="<?= base_url(); ?>asset/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/select2/select2.min.js"></script>
<!-- Main JS-->
<script src="<?= base_url(); ?>asset/js/main.js"></script>
<!-- Page Script -->
<?php 
if ( isset($js) ) {
	for ( $i = 0; $i < sizeof($js); $i++) { 
		?>
		<script src="<?= $js[$i] ?>"></script>
		<?php 
	}
}
?>
</body>

</html>
<!-- end document-->