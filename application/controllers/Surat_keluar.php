<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH.'vendor/autoload.php';
use PhpOffice\PhpWord\PhpWord;

class Surat_keluar extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->select 		= '*';
		$this->from   		= 'view_surat_keluar_transaction';
		$this->order_by   	= ['tr_id'=>'DESC'];
		$this->order 		= ['', 'nomor_surat', 'pengirim', 'jabatan_pengirim', 'penerima', 'jabatan_penerima', 'instansi', 'tanggal_surat', 'perihal', 'status_name'];
		$this->search 		= ['', 'nomor_surat', 'pengirim', 'jabatan_pengirim', 'penerima', 'jabatan_penerima', 'instansi', 'tanggal_surat', 'perihal', 'status_name'];

	}

	public function index()
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}
		$this->fragment['css'] = [
			base_url('asset/vendor/summernote/summernote-bs4.min.css'),
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
			base_url('asset/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css'),
			base_url('asset/vendor/daterangepicker/daterangepicker.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/summernote/summernote-bs4.min.js'),
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/datatables.net/js/jquery.dataTables.min.js'),
			base_url('asset/vendor/moment/moment.min.js'),
			base_url('asset/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js'),
			base_url('asset/vendor/daterangepicker/daterangepicker.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/surat_keluar.js') 
		];
		$this->fragment['pagename'] = 'pages/front/surat_keluar/main_page.php';
		$this->fragment['pagetitle'] = 'Surat Keluar';
		$this->load->view('layout/front/main-site', $this->fragment);
	}

	public function detail($surat_id)
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}

		$this->fragment['css'] = [
			base_url('asset/vendor/summernote/summernote-bs4.min.css'),
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
			base_url('asset/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css'),
			base_url('asset/vendor/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/summernote/summernote-bs4.min.js'),
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/datatables.net/js/jquery.dataTables.min.js'),
			base_url('asset/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js'),
			base_url('asset/vendor/moment/moment.min.js'),
			base_url('asset/vendor/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/detail_surat_keluar.js') 
		];

		$this->fragment['data'] = $this->sitemodel->view($this->from, $this->select, ['surat_id'=>$surat_id]);
		$this->fragment['data_notes'] = $this->sitemodel->view('view_notes_surat_keluar', '*', ['surat_id'=>$surat_id], NULL, 'notes_date DESC');
		$this->fragment['pagename'] = 'pages/front/surat_keluar/detail_page.php';
		$this->fragment['pagetitle'] = 'Surat Keluar';
		$this->load->view('layout/front/main-site', $this->fragment);
	}

	public function search_sdm()
	{
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		$term = $this->input->get("term");
		// echo json_encode($term);die;
		$res = [];
		$check = $this->sitemodel->custom_query("SELECT * FROM m_emp WHERE emp_nip LIKE '%".$term."%' OR emp_fname LIKE '%".$term."%' ");
		// echo json_encode($check);die;
		if($check){
			foreach ($check as $row) {
				$sub_res = [];
				$sub_res['id'] = $row->emp_nip;
				$sub_res['text'] = $row->emp_nip.' - '.$row->emp_fname;
				$res[] = $sub_res;
			}
		}

		echo json_encode($res);
		exit;
	}

	public function get_jabatan()
	{
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		/*** Params ***/
		/*** Required Area ***/
		$key = $this->input->post("key");
		/*** Validate Area ***/
		if ( empty($key) ){$this->response['msg'] = "Invalid parameter.";echo json_encode($this->response);exit;}
		$check = $this->sitemodel->view('view_emp', 'emp_jabatan', ['emp_nip'=>$key]);
		$this->response['type'] = 'done';
		$this->response['jabatan_pengirim'] = $check[0]->emp_jabatan;
		// echo json_encode($this->response['content']);die;
		echo json_encode($this->response);
		exit;
	}

	public function view_pdf()
	{
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		/*** Params ***/
		/*** Required Area ***/
		$key = $this->input->post("key");
		/*** Optional Area ***/
		/*** Validate Area ***/
		if ( empty($key) ){$this->response['msg'] = "Invalid parameter.";echo json_encode($this->response);exit;}
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['content'] = base_url("surat_keluar/generate_pdf/".$key);
		// echo json_encode($this->response['content']);die;
		echo json_encode($this->response);
		exit;
	}

	public function print($param)
	{
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		$maxDate = '';
		$minDate = '';

		if ( $param ) {
			$temp = explode('_', $param);
			$minDate = $temp[0].' 00:00:00';
			$maxDate = $temp[1].' 00:00:00';
		}
		$data['check'] = $this->sitemodel->custom_query(" SELECT * FROM view_surat_keluar_transaction WHERE created_date BETWEEN '".$minDate."' AND '".$maxDate."' ");
		$data['minDate'] = $minDate;
		$data['maxDate'] = $maxDate;
		// echo json_encode($data);die;
		$this->load->view('pages/front/surat_keluar/print_page', $data);
	}

	public function generate_pdf($surat_id)
	{
		$check = $this->sitemodel->view($this->from, $this->select, ['surat_id'=>$surat_id]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		$data['surat'] = $check;
		$content = $this->load->view("pdf/surat_keluar_pdf", $this->fragment + $data);
	}

	public function generate_word()
	{
		$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor('asset/template/template.docx');
		$check = $this->sitemodel->view($this->from, $this->select, ['surat_id'=>2]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		$isi;
		foreach ($check as $row) {
			$isi = $row->isi;
			$templateProcessor->setValues([
				'nomor_surat' 		=> $row->nomor_surat,
				'pengirim'	 		=> $row->pengirim,
				'jabatan_pengirim' 	=> $row->jabatan_pengirim,
				'penerima'			=> $row->penerima,
				'jabatan_penerima' 	=> $row->jabatan_penerima,
				'instansi' 			=> $row->instansi,
				'tanggal_surat' 	=> date('d F Y', strtotime($row->tanggal_surat)),
				'perihal' 			=> $row->perihal,
				'pemeriksa' 		=> $row->pemeriksa,
			]);
		}
		header("Content-Disposition: attachment; filename=template.docx");
		$templateProcessor->saveAs('php://output');
	}

	public function generate_word2()
	{
		$phpWord = new \PhpOffice\PhpWord\PhpWord();
		$check = $this->sitemodel->view($this->from, $this->select, ['surat_id'=>2]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		$isi;
		foreach ($check as $row) {
			$section = $phpWord->addSection();
			$section->addText($row->nomor_surat);
			/*$section = $phpWord->addSection();*/
			$section->addText($row->pengirim);
			/*$section = $phpWord->addSection();*/
			$section->addText($row->jabatan_pengirim);
			/*$section = $phpWord->addSection();*/
			$section->addText($row->penerima);
			/*$section = $phpWord->addSection();*/
			$section->addText($row->jabatan_penerima);
			/*$section = $phpWord->addSection();*/
			$section->addText($row->instansi);
			/*$section = $phpWord->addSection();*/
			$section->addText(date('d F Y', strtotime($row->tanggal_surat)));
			/*$section = $phpWord->addSection();*/
			$section->addText($row->perihal);
			/*$section = $phpWord->addSection();*/
			$section->addText($row->pemeriksa);
			/*$section = $phpWord->addSection();*/
			$section->addText($row->isi);
		}
		$objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
		header("Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document");
		header("Content-Disposition: attachment; filename=myFile.docx");
		$objWriter->save('php://output');
	}

	public function generate_word3($surat_id)
	{
		$check = $this->sitemodel->view($this->from, $this->select, ['surat_id'=>$surat_id]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		$data['surat'] = $check;
		$data['nomor_surat'] = $check[0]->nomor_surat;
		$this->load->view('pages/front/surat_keluar/view_surat_keluar', $data);
	}

	public function view()
	{
		$this->load->model('surat_keluar_model');
		$data = array();
		$res = $this->surat_keluar_model->get_datatable($this->select, $this->from, $this->order_by, $this->search, $this->order, $this->log_role, $this->log_nip);
		$q = $this->db->last_query();
		$a = 1;

		foreach ($res as $row) {
			$col = array();

			$button = '<div class="table-data-feature"><a class="item" data-toggle="tooltip" data-placement="top" href="'.base_url().'surat_keluar/detail/'.$row->surat_id.'" title="Detail"><i class="zmdi zmdi-eye"></i></a>';
			if ( $this->log_role == 2 ) {
				// $button .= '<button class="item btn-edit" data-toggle="tooltip" data-placement="top" data-id="'.$row->surat_id.'"  data-name="'.$row->nomor_surat.'" title="Edit"><i class="zmdi zmdi-edit"></i></button>';

				$button .= '<button class="item btn-delete" data-toggle="tooltip" data-placement="top" data-id="'.$row->surat_id.'"  data-name="'.$row->nomor_surat.'" title="Delete"><i class="zmdi zmdi-delete"></i></button>';
			}
			$button .= '</div>';

			$col[] = $a;
			$col[] = $row->nomor_surat;
			$col[] = $row->pengirim.$row->pengirim_name;
			$col[] = $row->jabatan_pengirim;
			$col[] = $row->penerima;
			$col[] = $row->jabatan_penerima;
			$col[] = $row->instansi;
			$col[] = date('d-m-Y', strtotime($row->tanggal_surat));
			$col[] = $row->perihal;
			$col[] = $row->status_name;
			$col[] = $button;
			$data[] = $col;
			$a++;
		}
		$output = array(
			"draw" 				=> $_POST['draw'],
			"recordsTotal" 		=> $this->surat_keluar_model->get_datatable_count_all($this->from),
			"recordsFiltered" 	=> $this->surat_keluar_model->get_datatable_count_filtered($this->select, $this->from, $this->order_by, $this->search, $this->order, $this->log_role, $this->log_nip),
			"data" 				=> $data,
			"q"					=> $q

		);
		echo json_encode($output);
		exit;
	}

	public function find(){
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		/*** Params ***/
		/*** Required Area ***/
		$key = $this->input->post("key");
		/*** Optional Area ***/
		/*** Validate Area ***/
		if ( empty($key) ){$this->response['msg'] = "Invalid parameter.";echo json_encode($this->response);exit;}
		/*** Accessing DB Area ***/
		$check = $this->sitemodel->view($this->from, $this->select, ['surat_id'=>$key]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = $check;
		echo json_encode($this->response);
		exit;
	}

	public function save()
	{
		// echo json_encode($this->input->post());die;
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		// PARAMS
		$pengirim 			= $this->input->post('pengirim');
		$jabatan_pengirim 	= $this->input->post('jabatan_pengirim');
		$penerima  			= $this->input->post('penerima');
		$jabatan_penerima  	= $this->input->post('jabatan_penerima');
		$instansi 			= $this->input->post('instansi');
		$tempat_surat 		= $this->input->post('tempat_surat');
		$tanggal_surat 		= $this->input->post('tanggal_surat');
		$perihal 			= $this->input->post('perihal');
		$pemeriksa 			= $this->input->post('pemeriksa');
		$isi 				= $this->input->post('isi');

		$tempno 			= $this->input->post('tempno');
		$kategori 			= $this->input->post('kategori');
		$months 			= $this->input->post('months');
		$years 				= $this->input->post('years');

		$nomor_surat 		= $tempno.'/'.$kategori.'/'.$months.'/'.$years ;

		$type 				= $this->input->post('type');
		$id 				= $this->input->post('id');

		$type = ($type == 'update') ? 'update' : 'new';

		$data_detail = [
			'nomor_surat'		=> $nomor_surat,
			'jenis_surat'		=> '',
			'kepada'			=> '',
			'pengirim'			=> $pengirim,
			'jabatan_pengirim'	=> $jabatan_pengirim,
			'penerima'			=> $penerima,
			'jabatan_penerima'	=> $jabatan_penerima,
			'instansi'			=> $instansi,
			'tanggal_acara'		=> '',
			'jam_acara'			=> '',
			'tempat_surat'		=> $tempat_surat,
			'tanggal_surat'		=> date('Y-m-d', strtotime($tanggal_surat)),
			'lokasi'			=> '',
			'perihal'			=> $perihal,
			'area'				=> '',
			'keterangan'		=> '',
			'pemeriksa'			=> $pemeriksa,
			'isi'				=> $isi,
		];

		$data_tr = [
			'surat_id'		=> $id,
			'status_id'		=> 1,
			'created_by'	=> $this->log_user,
			'created_date'	=> date('Y-m-d H:i:s'),
			'modified_by'	=> $this->log_user,
			'modified_date'	=> date('Y-m-d H:i:s'),
		];

		if ($type == 'new') {
			$data_tr['created_by'] 	= $this->log_user;
			$data_tr['created_date'] 	= date('Y-m-d H:i:s');
		}

		if ($type == 'update') {

			$data_surat = [
				'modified_by'	=> $this->log_user,
				'modified_date' => date('Y-m-d H:i:s'),
			];

			$this->sitemodel->update('m_surat', $data_surat, ['surat_id'=>$id]);
			$this->sitemodel->update('md_surat', $data_detail, ['surat_id'=>$id]);

		}else{

			$data_detail['surat_id'] = $id;
			$result = $this->sitemodel->insert('md_surat', $data_detail);
			$result = $this->sitemodel->insert('tr_surat', $data_tr);

			$data_nomor = [
				"last_number" => (int)$tempno
			];
			$insert_nomor = $this->sitemodel->insert('m_nomor_surat', $data_nomor);
		}

		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = ($type == "update") ? "Berhasil mengubah data." : "Berhasil menambahkan data.";
		echo json_encode($this->response);
		exit;
	}

	public function save_notes()
	{
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		// PARAMS
		$surat_id = $this->input->post('surat_id');
		// echo json_encode( $this->get_email($surat_id) );die;
		$notes_context = $this->input->post('notes_context');

		$data = [
			"surat_id" 		=> $surat_id,
			"notes_context"	=> $notes_context,
			"notes_by"		=> $this->log_user,
			"notes_date"	=> date('Y-m-d H:i:s')
		];

		$insert_notes = $this->sitemodel->insert('tr_notes_surat_keluar', $data);


		// EMAIL SECTIONS
		$email_receiver = $this->get_email($surat_id);
		$subject = "Pemberitahuan Aplikasi Sekred Online";
		$data_email['email']['title'] = "Anda mendapatkan pesan. Silahkan klik link dibawah ini untuk melihat detail.";
		$data_email['email']['content'] = base_url().'surat_keluar/detail/'.$surat_id;
		$data_email['page'] = 'surat_keluar_mail';
		$content = $this->load->view('emails/template', $data_email, true);

		for ( $i = 0; $i < sizeof($email_receiver); $i++) { 
			$isSent = sendEmail($email_receiver[$i], $subject, $content, "Sekred Online");
			if (! $isSent) {
				$msg['msg'] = "Oops, we failed to send an email to." . $email_receiver[$i];
				echo json_encode($msg);
				return;
			}
		}

		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menambahkan data.";
		echo json_encode($this->response);
		exit;
	}

	public function approve_surat()
	{
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		// PARAMS
		$surat_id = $this->input->post('surat_id');

		$data_tr = [
			'surat_id'		=> $surat_id,
			'status_id'		=> 2,
			'created_by'	=> $this->log_user,
			'created_date'	=> date('Y-m-d H:i:s'),
			'modified_by'	=> $this->log_user,
			'modified_date'	=> date('Y-m-d H:i:s'),
		];

		$result = $this->sitemodel->insert('tr_surat', $data_tr);

		// EMAIL SECTIONS
		$email_receiver = $this->get_email($surat_id);
		$subject = "Pemberitahuan Aplikasi Sekred Online";
		$data_email['email']['title'] = "Surat telah disetujui. Silahkan klik link dibawah ini untuk melihat detail.";
		$data_email['email']['content'] = base_url().'surat_keluar/detail/'.$surat_id;
		$data_email['page'] = 'surat_keluar_mail';
		$content = $this->load->view('emails/template', $data_email, true);

		for ( $i = 0; $i < sizeof($email_receiver); $i++) { 
			$isSent = sendEmail($email_receiver[$i], $subject, $content, "Sekred Online");
			if (! $isSent) {
				$msg['msg'] = "Oops, we failed to send an email to." . $email_receiver[$i];
				echo json_encode($msg);
				return;
			}
		}
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menambahkan data.";
		echo json_encode($this->response);
		exit;
	}

	public function print_surat()
	{
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		// PARAMS
		$surat_id = $this->input->post('surat_id');

		$data_tr = [
			'surat_id'		=> $surat_id,
			'status_id'		=> 3,
			'created_by'	=> $this->log_user,
			'created_date'	=> date('Y-m-d H:i:s'),
			'modified_by'	=> $this->log_user,
			'modified_date'	=> date('Y-m-d H:i:s'),
		];

		$result = $this->sitemodel->insert('tr_surat', $data_tr);

		// EMAIL SECTIONS
		$email_receiver = $this->get_email($surat_id);
		$subject = "Pemberitahuan Aplikasi Sekred Online";
		$data_email['email']['title'] = "Surat telah dicetak. Silahkan klik link dibawah ini untuk melihat detail.";
		$data_email['email']['content'] = base_url().'surat_keluar/detail/'.$surat_id;
		$data_email['page'] = 'surat_keluar_mail';
		$content = $this->load->view('emails/template', $data_email, true);

		for ( $i = 0; $i < sizeof($email_receiver); $i++) { 
			$isSent = sendEmail($email_receiver[$i], $subject, $content, "Sekred Online");
			if (! $isSent) {
				$msg['msg'] = "Oops, we failed to send an email to." . $email_receiver[$i];
				echo json_encode($msg);
				return;
			}
		}
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menambahkan data.";
		echo json_encode($this->response);
		exit;
	}

	public function delete(){
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		/*** Params ***/
		/*** Required Area ***/
		$key = $this->input->post("key");
		/*** Optional Area ***/
		/*** Validate Area ***/
		if ( empty($key) ){$this->response['msg'] = "Invalid parameter.";echo json_encode($this->response);exit;}
		/*** Accessing DB Area ***/
		$check = $this->sitemodel->view($this->from, $this->select, ['surat_id'=>$key]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		// Delete 
		$this->sitemodel->delete('tr_surat', ['surat_id'=>$key]);
		$this->sitemodel->delete('m_surat', ['surat_id'=>$key]);
		$this->sitemodel->delete('md_surat', ['surat_id'=>$key]);
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menghapus data.";
		echo json_encode($this->response);
		exit;
	}

	public function convert_to_romans($months)
	{
		$ret;
		switch ($months) {
			case '01':
			$ret = 'I';
			break;
			case '02':
			$ret = 'II';
			break;
			case '03':
			$ret = 'III';
			break;
			case '04':
			$ret = 'IV';
			break;
			case '05':
			$ret = 'V';
			break;
			case '06':
			$ret = 'VI';
			break;
			case '07':
			$ret = 'VII';
			break;
			case '08':
			$ret = 'VIII';
			break;
			case '09':
			$ret = 'IX';
			break;
			case '10':
			$ret = 'X';
			break;
			case '11':
			$ret = 'XI';
			break;
			case '12':
			$ret = 'XII';
			break;
		}

		return $ret;
	}

	public function open_modal()
	{

		$data = [
			'surat_type'	=> 2,
			'created_by'	=> $this->log_user,
			'created_date'	=> date('Y-m-d H:i:s'),
			'modified_by'	=> $this->log_user, 
			'modified_date'	=> date('Y-m-d H:i:s'),
		];

		$id = $this->sitemodel->insert('m_surat', $data);
		$nomor_surat = $this->get_last_nomor()+1;
		$length  = strlen($nomor_surat);
		switch ($length) {
			case '1':
			$nomor_surat = '000'.$nomor_surat;
			break;
			case '2':
			$nomor_surat = '00'.$nomor_surat;
			break;
			case '3':
			$nomor_surat = '0'.$nomor_surat;
			break;
			case '4':
			$nomor_surat = $nomor_surat;
			break;
		}
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = $id;
		$this->response['msg_2'] = $nomor_surat;
		$this->response['months'] = $this->convert_to_romans(date('m'));
		echo json_encode($this->response);
		exit;
	}

	public function get_last_nomor()
	{
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Params ***/
		$nomor_surat = 0;
		$check = $this->sitemodel->view('view_nomor_surat', '*');
		if ( empty($check) == FALSE ) {
			$nomor_surat = $check[0]->last_number;
		}

		return $nomor_surat;
	}

	public function close_modal()
	{
		$delete = $this->sitemodel->delete('m_surat', ['surat_id'=>$this->input->post('id')]);
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = 'Closed';
		echo json_encode($this->response);
		exit;
	}

	public function get_email($surat_id)
	{
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}

		$check = $this->sitemodel->view('view_surat_keluar_transaction', '*', ['surat_id'=>$surat_id]);
		$result = [ $check[0]->pengirim_email, $check[0]->pemeriksa_email ];

		return $result;
	}
}
