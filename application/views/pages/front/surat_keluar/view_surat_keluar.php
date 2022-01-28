<?php if ( !defined('BASEPATH') )exit('No direct script access allowed');?>
<!Doctype html>
	<html lang="en">
	<head>
		<?php
		ini_set('memory_limit','-1');
		$filename = $nomor_surat.".doc";
		header("Content-Disposition: attachment; filename=\"$filename\"");
		header("Content-Type: application/vnd.ms-word");

		?>
	</head>
	<body>
		<?php 
		if ( isset($surat) and $surat != 0 ) {
			foreach ($surat as $row) {
				?>
				<table style="width:100%; border: none;">
					<tr>
						<td>No</td>
						<td>: <?= $row->nomor_surat ?></td>
						<td style="text-align: right;"><?= $row->tempat_surat .', '. date('d F Y', strtotime($row->tanggal_surat)) ?></td>
					</tr>
					<tr>
						<td>Perihal</td>
						<td colspan="2">: <?= $row->perihal ?></td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td colspan="3" style="font-weight: bold;">Kepada Yth.</td>
					</tr>
					<tr>
						<td colspan="3" style="font-weight: bold;"><?= $row->penerima ?></td>
					</tr>
					<tr>
						<td colspan="3" style="font-weight: bold;"><?= $row->jabatan_penerima ?></td>
					</tr>
					<tr>
						<td colspan="3" style="font-weight: bold;"><?= $row->instansi ?></td>
					</tr>
					<tr>
						<td colspan="3" style="font-weight: bold;">di Tempat</td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td colspan="3"><?= $row->isi ?></td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td colspan="3">Hormat Kami, </td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td colspan="3" style="font-weight: bold; text-decoration: underline;"><?= $row->pengirim_name ?></td>
					</tr>
					<tr>
						<td colspan="3"><?= $row->jabatan_pengirim ?></td>
					</tr>
				</table>
				<?php 
			}
		}
		?>
	</body>
	</html>
