<?php if ( !defined('BASEPATH') )exit('No direct script access allowed');?>
 ?>
<!Doctype html>
	<html lang="en">
	<head>
		<!-- Fontfaces CSS-->
		<link href="<?= base_url(); ?>asset/css/font-face.css" rel="stylesheet" media="all">
		<!-- <link href="<?= base_url(); ?>asset/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all"> -->
		<link href="<?= base_url(); ?>asset/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
		<link href="<?= base_url(); ?>asset/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
		<?php
		ini_set('memory_limit','-1');
		// file name for download
		$filename = "laporan_surat_masuk_" . date('YmdHis') . ".xls";

		header("Content-Type: application/vnd.ms-excel");
		header("Content-Disposition: attachment; filename=\"$filename\"");
		// header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		?>
		<title>Laportan Surat Masuk</title>
		<style type="text/css">
		body{
			font-size:100%;
			font-family:Arial !important;
		}

		label{font-weight:bold;}
		.text-center{text-align:center;}
		.color-green{
			color :#008c00;
			font-weight : bold;
		}
		.color-red{
			color :#b30000;
			font-weight : bold;
		}
		.color-yellow{
			color :#d9d900;
			font-weight : bold;
		}
		.color-black{
			color :#000000;
			font-weight : bold;
		}

		.priceBlack{
			color :#000000;
			font-weight : bold;
			text-align: right;
		}
		.title-text{
			color :#000000;
			font-weight : bold;
			text-align: center;
		}

		.bg-grey{
			background-color: gray;
			color :#000000;
			font-weight : bold;
		}

		.bg-blue{
			background-color: #3333ff;
			color :#000000;
			font-weight : bold;
		}
	</style>
</head>
<body>
	<?php 
	$min = '';
	$max = '';
	if ( isset($minDate) ) {
		$min = $minDate;
	}
	if ( isset($maxDate) ) {
		$max = $maxDate;
	}
	 ?>
	<h2 class="title-text"><?= "Laporan Surat Masuk ".date('d F Y', strtotime($min)).' - '.date('d F Y', strtotime($max)) ?></h2>
	<table border="1" style="width:100%; border: 1px solid black">
		<tr align="center">
			<th>No</th>
			<th>Pengirim</th>
			<th>Jenis</th>
			<th>Tanggal Acara</th>
			<th>Jam Acara</th>
			<th>Lokasi Acara</th>
			<th>Perihal</th>
			<th>Area</th>
			<th>Keterangan</th>
		</tr>
		<?php 
		if ( isset($check) and $check != 0 ) {
			$a = 1;
			foreach ($check as $row) {
				?>
				<tr align="center">
					<td><?= $a; ?></td>
					<td><?= $row->pengirim ?></td>
					<td><?= ($row->jenis_surat == 1 ? 'Undangan Liputan' : 'Pribadi') ?></td>
					<td><?= date('d-m-Y', strtotime($row->tanggal_acara)) ?></td>
					<td><?= date('H:i:s', strtotime($row->jam_acara)) ?></td>
					<td><?= $row->lokasi ?></td>
					<td><?= $row->perihal ?></td>
					<td><?= $row->area ?></td>
					<td><?= $row->keterangan ?></td>
				</tr>
				<?php 
				$a++;
			}
		}
		?>
	</table>
</body>
</html>
