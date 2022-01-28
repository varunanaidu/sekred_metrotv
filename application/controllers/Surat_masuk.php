<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Surat_masuk extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->select 		= '*';
		$this->from   		= 'view_surat_masuk';
		$this->order_by   	= ['surat_id'=>'DESC'];
		$this->order 		= ['surat_id', 'pengirim', 'jenis_surat', 'tanggal_acara', 'jam_acara', 'lokasi', 'perihal', 'area', 'keterangan'];
		$this->search 		= ['surat_id', 'pengirim', 'jenis_surat', 'tanggal_acara', 'jam_acara', 'lokasi', 'perihal', 'area', 'keterangan'];

	}

	public function index()
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}
		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
			base_url('asset/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css'),
			base_url('asset/vendor/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css'),
			base_url('asset/vendor/daterangepicker/daterangepicker.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/datatables.net/js/jquery.dataTables.min.js'),
			base_url('asset/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js'),
			base_url('asset/vendor/moment/moment.min.js'),
			base_url('asset/vendor/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js'),
			base_url('asset/vendor/daterangepicker/daterangepicker.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/surat_masuk.js') 
		];
		$this->fragment['pagename'] = 'pages/front/surat_masuk/main_page.php';
		$this->fragment['pagetitle'] = 'Surat Masuk';
		$this->load->view('layout/front/main-site', $this->fragment);
	}

	public function detail($surat_id)
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}

		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
			base_url('asset/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css'),
			base_url('asset/vendor/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/datatables.net/js/jquery.dataTables.min.js'),
			base_url('asset/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js'),
			base_url('asset/vendor/moment/moment.min.js'),
			base_url('asset/vendor/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/detail_surat_masuk.js') 
		];
		$this->fragment['data'] = $this->sitemodel->view($this->from, $this->select, ['surat_id'=>$surat_id]);

		$q_disposisi = "SELECT * FROM view_disposisi WHERE surat_id = ".$surat_id." ";
		if ( $this->log_role != 2 ) {
			$q_disposisi .= " AND disposisi_title = '".$this->log_nip."'";
		}

		$this->fragment['data_disposisi'] = $this->sitemodel->custom_query($q_disposisi);
		$this->fragment['pagename'] = 'pages/front/surat_masuk/detail_page.php';
		$this->fragment['pagetitle'] = 'Surat Masuk';
		$this->load->view('layout/front/main-site', $this->fragment);
	}

	public function disposisi($surat_id)
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}

		if ( $this->log_role == 1 ) {
			redirect('surat_masuk');
		}

		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/disposisi.js') 
		];
		$this->fragment['data'] = $this->sitemodel->view('view_disposisi', $this->select, ['surat_id'=>$surat_id]);
		$this->fragment['surat_id'] = $surat_id;
		$this->fragment['pagename'] = 'pages/front/surat_masuk/disposisi_page.php';
		$this->fragment['pagetitle'] = 'Surat Masuk';
		// echo json_encode($this->fragment);die;
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
		$data['check'] = $this->sitemodel->custom_query(" SELECT * FROM view_surat_masuk WHERE created_date BETWEEN '".$minDate."' AND '".$maxDate."' ");
		$data['minDate'] = $minDate;
		$data['maxDate'] = $maxDate;
		// echo json_encode($data);die;
		$this->load->view('pages/front/surat_masuk/print_page', $data);
	}

	public function view()
	{
		$this->load->model('surat_masuk_model');
		$data = array();
		$res = $this->surat_masuk_model->get_datatable($this->select, $this->from, $this->order_by, $this->search, $this->order, $this->log_role, $this->log_nip);
		$q = $this->db->last_query();
		$a = 1;

		foreach ($res as $row) {
			
			$button = '<div class="table-data-feature">
			<a class="item btn-detail" data-toggle="tooltip" data-placement="top" href="'.base_url().'surat_masuk/detail/'.$row->surat_id.'" title="View"><i class="zmdi zmdi-eye"></i></a>';
			if ( $this->log_role == 2 ) {
				$button .= '<button class="item btn-delete" data-toggle="tooltip" data-placement="top" data-id="'.$row->surat_id.'" title="Delete"><i class="zmdi zmdi-delete"></i></button>';
			}
			$button .= '</div>';

			$col = array();
			$col[] = $a;
			$col[] = $row->pengirim;
			$col[] = ($row->jenis_surat == 1 ? 'Undangan Liputan' : 'Pribadi');
			$col[] = date('d-m-Y', strtotime($row->tanggal_acara));
			$col[] = date('H:i:s', strtotime($row->jam_acara));
			$col[] = $row->lokasi;
			$col[] = $row->perihal;
			$col[] = $row->area;
			$col[] = $row->keterangan;
			$col[] = $button;
			
			$data[] = $col;
			$a++;
		}
		$output = array(
			"draw" 				=> $_POST['draw'],
			"recordsTotal" 		=> $this->surat_masuk_model->get_datatable_count_all($this->from),
			"recordsFiltered" 	=> $this->surat_masuk_model->get_datatable_count_filtered($this->select, $this->from, $this->order_by, $this->search, $this->order, $this->log_role, $this->log_nip),
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
		$pengirim 		= $this->input->post('pengirim');
		$jenis_surat 	= $this->input->post('jenis_surat');
		$kepada  		= ( $this->input->post('kepada') ? $this->input->post('kepada') : '' );
		$tanggal_acara  = $this->input->post('tanggal_acara');
		$jam_acara 		= $this->input->post('jam_acara');
		$lokasi 		= $this->input->post('lokasi');
		$perihal 		= $this->input->post('perihal');
		$area 			= $this->input->post('area');
		$keterangan 	= $this->input->post('keterangan');

		$type 			= $this->input->post('type');
		$id 			= $this->input->post('id');

		$type = ($type == 'update') ? 'update' : 'new';

		$data_surat = [
			'surat_type'	=> 1,
			'modified_by'	=> $this->log_user, 
			'modified_date'	=> date('Y-m-d H:i:s'),
		];

		$data_detail = [
			'nomor_surat'		=> '',
			'jenis_surat'		=> $jenis_surat,
			'kepada'			=> $kepada,
			'pengirim'			=> $pengirim,
			'jabatan_pengirim'	=> '',
			'penerima'			=> '',
			'jabatan_penerima'	=> '',
			'instansi'			=> '',
			'tanggal_acara'		=> date('Y-m-d', strtotime($tanggal_acara)),
			'jam_acara'			=> date('H:i:s', strtotime($jam_acara)),
			'tempat_surat'		=> '',
			'tanggal_surat'		=> '',
			'lokasi'			=> $lokasi,
			'perihal'			=> $perihal,
			'area'				=> $area,
			'keterangan'		=> $keterangan,
			'pemeriksa'			=> '',
			'isi'				=> '',
		];


		if ($type == 'new') {
			$data_surat['created_by'] 	= $this->log_user;
			$data_surat['created_date'] = date('Y-m-d H:i:s');
		}

		if ($type == 'update') {

			$this->sitemodel->update('m_surat', $data_surat, ['surat_id'=>$id]);
			$this->sitemodel->update('md_surat', $data_detail, ['surat_id'=>$id]);

		}else{

			$id = $this->sitemodel->insert('m_surat', $data_surat);
			$data_detail['surat_id'] = $id;
			$detail_surat = $this->sitemodel->insert('md_surat', $data_detail);

			if ( $jenis_surat == 2 ) {
			// EMAIL SECTIONS
				$email_receiver = $this->get_email_kepada($id);
				$subject = "Pemberitahuan Aplikasi Sekred Online";
				$data_email['email']['title'] = "Anda mendapatkan surat masuk. Silahkan klik link dibawah ini untuk melihat detail.";
				$data_email['email']['content'] = base_url().'surat_masuk/detail/'.$id;
				$data_email['page'] = 'surat_masuk_mail';
				$content = $this->load->view('emails/template', $data_email, true);

				for ( $i = 0; $i < sizeof($email_receiver); $i++) { 
					$isSent = sendEmail($email_receiver[$i], $subject, $content, "Sekred Online");
					if (! $isSent) {
						$msg['msg'] = "Oops, we failed to send an email to." . $email_receiver[$i];
						echo json_encode($msg);
						return;
					}
				}
			}

		}

		if ( isset($_FILES['attachment_name']) && $_FILES['attachment_name']['name'] != '' ) {

			if ( $type == 'update' ) {
				$attachment = $this->sitemodel->view('m_attachment_surat', '*', ['surat_id'=>$id]);
				foreach ($attachment as $att) {
					$files = 'asset/files/surat_masuk/'.$id.'/'.$att->attachment_name;
					unlink($files);
					$this->sitemodel->delete('m_attachment_surat', ['surat_id'=> $att->surat_id]);
				}
				
			}

			$target_dir = 'asset/files/surat_masuk/'.$id.'/';

			$temp_name = $_FILES['attachment_name']['name'];
			$ext = explode('.', $temp_name);
			$end = strtolower(end($ext));

			if (!file_exists($target_dir)) {
				mkdir($target_dir, 0777, true);
			}

			$attachment_name = md5($temp_name.date("YmdHis")).".".$end;

			move_uploaded_file($_FILES['attachment_name']['tmp_name'], $target_dir.$attachment_name);

			$data_attachment = [
				'surat_id'			=> $id,
				'attachment_name'	=> $attachment_name,
			];

			$result_att = $this->sitemodel->insert('m_attachment_surat', $data_attachment);
		}

		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = ($type == "update") ? "Berhasil mengubah data." : "Berhasil menambahkan data.";
		echo json_encode($this->response);
		exit;
	}

	public function save_disposisi()
	{
		// echo json_encode($this->input->post());die;
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		// PARAMS
		$data_disposisi 	= $this->input->post('data_disposisi');
		$surat_id  			= $this->input->post('surat_id');

		for ( $i = 0; $i < sizeof($data_disposisi) ; $i++) { 

			$email_to = '';
			if ( empty($data_disposisi[$i]['disposisi_title']) == FALSE ) {
				$check_email = $this->sitemodel->view('view_user', 'user_email', ['user_nip'=>$data_disposisi[$i]['disposisi_title']]);
				$email_to = $check_email[0]->user_email;
			}

			$data = [
				'surat_id' 			=> $surat_id,
				'disposisi_title'	=> ( empty($data_disposisi[$i]['disposisi_title']) ? '' : $data_disposisi[$i]['disposisi_title'] ),
				'disposisi_content'	=> ( empty($data_disposisi[$i]['disposisi_content']) ? '' : $data_disposisi[$i]['disposisi_content'] ),
				'created_by'		=> $this->log_user,
				'created_date'		=> date('Y-m-d H:i:s'),
			];

			if ( empty($data_disposisi[$i]['disposisi_id']) == FALSE ) {
				$result = $this->sitemodel->update('tr_disposisi', $data, ['disposisi_id'=>$data_disposisi[$i]['disposisi_id'] ]);
			}else{
				$result = $this->sitemodel->insert('tr_disposisi', $data);
			}

			if ($email_to != '') {
			# send email
				$subject = "Pemberitahuan Aplikasi Sekred Online";
				$data_email['email']['title'] = "Anda mendapatkan disposisi. Silahkan klik link dibawah ini untuk melihat detail.";
				$data_email['email']['content'] = base_url().'surat_masuk/detail/'.$surat_id;
				$data_email['page'] = 'surat_masuk_mail';
				$content = $this->load->view('emails/template', $data_email, true);
				$isSent = sendEmail($email_to, $subject, $content, "Sekred Online");

			// IF ERROR (SHOW LIST EMAIL NOT SENT)
				if (! $isSent) {
					$msg['msg'] = "Oops, we failed to send an email to." . $email_to;
					echo json_encode($msg);
					return;
				}
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
		$this->sitemodel->delete('m_surat', ['surat_id'=>$key]);
		$this->sitemodel->delete('md_surat', ['surat_id'=>$key]);

		$attachment = $this->sitemodel->view('m_attachment_surat', '*', ['surat_id'=>$key]);
		foreach ($attachment as $att) {
			$files = 'asset/files/surat_masuk/'.$key.'/'.$att->attachment_name;
			unlink($files);
			$this->sitemodel->delete('m_attachment_surat', ['surat_id'=> $att->surat_id]);
		}

		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menghapus data.";
		echo json_encode($this->response);
		exit;
	}

	public function get_email_kepada($surat_id)
	{
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}

		$check = $this->sitemodel->view('view_surat_masuk', '*', ['surat_id'=>$surat_id]);
		$result = [ $check[0]->user_email ];

		return $result;
	}
}