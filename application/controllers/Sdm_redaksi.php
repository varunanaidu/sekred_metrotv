<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sdm_redaksi extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->select 		= '*';
		$this->from   		= 'view_emp';
		$this->order_by   	= ['emp_id'=>'DESC'];
		$this->order 		= ['emp_id', 'emp_fname', 'emp_phone1', 'emp_email1', 'emp_comp', 'emp_jabatan'];
		$this->search 		= ['emp_id', 'emp_fname', 'emp_phone1', 'emp_email1', 'emp_comp', 'emp_jabatan'];

	}

	public function index()
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}
		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
			base_url('asset/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/datatables.net/js/jquery.dataTables.min.js'),
			base_url('asset/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js'),
			base_url('asset/vendor/moment/moment.min.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/emp.js') 
		];
		$this->fragment['pagename'] = 'pages/front/emp/main_page.php';
		$this->fragment['pagetitle'] = 'SDM Redaksi';
		$this->load->view('layout/front/main-site', $this->fragment);
	}

	public function get_emp()
	{
		$temp = [];
		$nip = $this->input->post('nip');
		$params = ['nip'=>$nip];
		$this->load->library('guzzle');
		$temp = $this->guzzle->guzzle_HRIS('employee/get', $params);

		$check = json_decode($temp);

		$this->response['type'] = 'done';
		$this->response['msg'] = $check;
		echo json_encode($this->response);
		exit;
	}

	public function view()
	{
		$data = array();
		$res = $this->sitemodel->get_datatable($this->select, $this->from, $this->order_by, $this->search, $this->order);
		$q = $this->db->last_query();
		$a = 1;

		foreach ($res as $row) {
			$col = array();
			$col[] = $a;
			$col[] = $row->emp_fname;
			$col[] = $row->emp_phone1.'<br>'.$row->emp_phone2;
			$col[] = $row->emp_email1.'<br>'.$row->emp_email2;
			$col[] = $row->emp_comp;
			$col[] = $row->emp_jabatan;
			$col[] = '<div class="table-data-feature">
			<button class="item btn-detail" data-toggle="tooltip" data-placement="top" data-id="'.$row->emp_id.'" title="Detail"><i class="zmdi zmdi-eye"></i></button>&nbsp;
			<button class="item btn-edit" data-toggle="tooltip" data-placement="top" data-id="'.$row->emp_id.'" title="Edit"><i class="zmdi zmdi-edit"></i></button>&nbsp;
			<button class="item btn-delete" data-toggle="tooltip" data-placement="top" data-id="'.$row->emp_id.'" title="Delete"><i class="zmdi zmdi-delete"></i></button>
			</div>';
			$data[] = $col;
			$a++;
		}
		$output = array(
			"draw" 				=> $_POST['draw'],
			"recordsTotal" 		=> $this->sitemodel->get_datatable_count_all($this->from),
			"recordsFiltered" 	=> $this->sitemodel->get_datatable_count_filtered($this->select, $this->from, $this->order_by, $this->search, $this->order),
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
		$check = $this->sitemodel->view($this->from, $this->select, ['emp_id'=>$key]);
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
		$emp_nip 					= $this->input->post('emp_nip');
		$emp_fname 					= $this->input->post('emp_fname');
		$emp_nname 					= $this->input->post('emp_nname');
		$emp_photo					= '';
		$emp_birth_place  			= $this->input->post('emp_birth_place');
		$emp_birth_date  			= $this->input->post('emp_birth_date');
		$emp_nik 					= $this->input->post('emp_nik');
		$emp_address 				= $this->input->post('emp_address');
		$emp_phone1 				= $this->input->post('emp_phone1');
		$emp_phone2 				= $this->input->post('emp_phone2');
		$emp_email1 				= $this->input->post('emp_email1');
		$emp_email2 				= $this->input->post('emp_email2');
		$emp_comp 					= $this->input->post('emp_comp');
		$emp_div 					= $this->input->post('emp_div');
		$emp_dept 					= $this->input->post('emp_dept');
		$emp_jabatan 				= $this->input->post('emp_jabatan');
		$emp_ext 					= $this->input->post('emp_ext');
		$emp_program 				= $this->input->post('emp_program');
		$emp_atasan 				= $this->input->post('emp_atasan');
		$emp_atasan_phone 			= $this->input->post('emp_atasan_phone');
		$emp_kontak_darurat_nama 	= $this->input->post('emp_kontak_darurat_nama');
		$emp_kontak_darurat_nomor 	= $this->input->post('emp_kontak_darurat_nomor');
		$emp_passport 				= $this->input->post('emp_passport');
		$emp_expiry_passport 		= $this->input->post('emp_expiry_passport');

		$type 			= $this->input->post('type');
		$id 			= $this->input->post('id');

		$type = ($type == 'update') ? 'update' : 'new';

		$data = [
			'emp_nip'					=>	$emp_nip,
			'emp_fname'					=>	$emp_fname,
			'emp_nname'					=>	$emp_nname,
			'emp_birth_place'			=>	$emp_birth_place,
			'emp_birth_date'			=>	$emp_birth_date,
			'emp_nik'					=>	$emp_nik,
			'emp_address'				=>	$emp_address,
			'emp_phone1'				=>	$emp_phone1,
			'emp_phone2'				=>	$emp_phone2,
			'emp_email1'				=>	$emp_email1,
			'emp_email2'				=>	$emp_email2,
			'emp_comp'					=>	$emp_comp,
			'emp_div'					=>	$emp_div,
			'emp_dept'					=>	$emp_dept,
			'emp_jabatan'				=>	$emp_jabatan,
			'emp_ext'					=>	$emp_ext,
			'emp_program'				=>	$emp_program,
			'emp_atasan'				=>	$emp_atasan,
			'emp_atasan_phone'			=>	$emp_atasan_phone,
			'emp_kontak_darurat_nama'	=>	$emp_kontak_darurat_nama,
			'emp_kontak_darurat_nomor'	=>	$emp_kontak_darurat_nomor,
			'emp_passport'				=>	$emp_passport,
			'emp_expiry_passport'		=>	$emp_expiry_passport,
			'modified_by'				=> 	$this->log_user, 
			'modified_date'				=> 	date('Y-m-d H:i:s'),
		];

		if ( isset($_FILES['emp_photo']) && $_FILES['emp_photo']['name'] != '' ) {

			$temp_name = $_FILES['emp_photo']['name'];
			$ext = explode('.', $temp_name);
			$end = strtolower(end($ext));
			$emp_photo = md5($temp_name.date("YmdHis")).".".$end;
			$data['emp_photo'] = $emp_photo;
		}


		if ($type == 'new') {
			$data['created_by'] 	= $this->log_user;
			$data['created_date'] = date('Y-m-d H:i:s');
		}

		if ($type == 'update') {

			$this->sitemodel->update('m_emp', $data, ['emp_id'=>$id]);
			if ( isset($_FILES['emp_photo']) && $_FILES['emp_photo']['name'] != '' ) {

				$target_dir = 'asset/files/emp/'.$id.'/';

				if (!file_exists($target_dir)) {
					mkdir($target_dir, 0777, true);
				}

				move_uploaded_file($_FILES['emp_photo']['tmp_name'], $target_dir.$emp_photo);
			}

		}else{

			$id = $this->sitemodel->insert('m_emp', $data);
			if ( isset($_FILES['emp_photo']) && $_FILES['emp_photo']['name'] != '' ) {

				$target_dir = 'asset/files/emp/'.$id.'/';

				if (!file_exists($target_dir)) {
					mkdir($target_dir, 0777, true);
				}

				move_uploaded_file($_FILES['emp_photo']['tmp_name'], $target_dir.$emp_photo);
			}

		}


		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = ($type == "update") ? "Berhasil mengubah data." : "Berhasil menambahkan data.";
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
		$check = $this->sitemodel->view($this->from, $this->select, ['emp_id'=>$key]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		// Delete 
		$this->sitemodel->delete('m_emp', ['emp_id'=>$key]);
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menghapus data.";
		echo json_encode($this->response);
		exit;
	}
}
