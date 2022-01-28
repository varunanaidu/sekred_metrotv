<?php if ( !defined('BASEPATH') )exit( "No direct script access allowed" );
ob_start();
$content = '';
?>
<!Doctype html>
	<html lang="en">
	<head>
		<title>Surat Keluar</title>
		<style type="text/css">
		table tr td {
			padding:3px 0;
		}
		.center {text-align:center;}
		.right {text-align:right;}
		.strong {font-weight:bold;}
	</style>
</head>
<body>
		<?php 
		if ( isset($surat) and $surat != 0 ) {
			foreach ($surat as $row) {
				?>
				<table style="width:100%;">
					<tr>
						<td style="width: 75%;">No : <?= $row->nomor_surat ?></td>
						<td style="width: 25%; text-align: right !important;"><?= date('d F Y', strtotime($row->tanggal_surat)) ?></td>
					</tr>
					<tr>
						<td colspan="2">Hal : <?= $row->perihal ?></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2">Kepada Yth.</td>
					</tr>
					<tr>
						<td colspan="2"><?= $row->penerima ?></td>
					</tr>
					<tr>
						<td colspan="2"><?= $row->jabatan_penerima ?></td>
					</tr>
					<tr>
						<td colspan="2"><?= $row->instansi ?></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2"><?= $row->isi ?></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2">Hormat Kami, </td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2"><?= $row->pengirim ?></td>
					</tr>
					<tr>
						<td colspan="2"><?= $row->jabatan_pengirim ?></td>
					</tr>
				</table>
				<?php 
			}
		}
		?>
</body>
</html>
<?php
$content = ob_get_clean();
$content = '<page>'.$content.'</page>';
require_once(dirname(dirname(dirname(dirname(__FILE__)))).'/asset/html2pdf/html2pdf.class.php');
try
{
	$html2pdf = new HTML2PDF('P', 'A4', 'en', true, 'UTF-8', array(15, 10, 15, 15));
	$html2pdf->pdf->SetDisplayMode('fullpage');
	$html2pdf->setTestTdInOnePage(false);
	$html2pdf->writeHTML($content);
	ob_end_clean();
	$html2pdf->Output("surat_keluar" . date('YmdHis') . ".pdf");
}
catch(HTML2PDF_exception $e) {
	echo $e;
	exit;
}
ob_end_flush();