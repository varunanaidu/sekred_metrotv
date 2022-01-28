<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_management extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->select 		= '*';
		$this->from   		= 'view_user';
		$this->order_by   	= ['user_id'=>'DESC'];
		$this->order 		= ['user_id', 'user_nip', 'user_fname', 'user_email', 'user_phone'];
		$this->search 		= ['user_id', 'user_nip', 'user_fname', 'user_email', 'user_phone'];

	}

	public function index()
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}
		$this->fragment['roles'] = $this->sitemodel->view('m_role', '*');

		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
			base_url('asset/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/datatables.net/js/jquery.dataTables.min.js'),
			base_url('asset/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/user.js') 
		];
		$this->fragment['pagename'] = 'pages/admin/user/main_page.php';
		$this->fragment['pagetitle'] = 'User Management';
		$this->load->view('layout/admin/main-site', $this->fragment);
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
			$col[] = $row->user_nip;
			$col[] = $row->user_fname;
			$col[] = $row->user_email;
			$col[] = $row->user_phone;
			$col[] = '<div class="table-data-feature">
			<button class="item btn-edit" data-toggle="tooltip" data-placement="top" data-id="'.$row->user_id.'" title="Edit"><i class="zmdi zmdi-edit"></i></button>
			<button class="item btn-delete" data-toggle="tooltip" data-placement="top" data-id="'.$row->user_id.'" title="Delete"><i class="zmdi zmdi-delete"></i></button>
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
		$check = $this->sitemodel->view($this->from, $this->select, ['user_id'=>$key]);
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
		$role_id 		= $this->input->post('role_id');
		$user_nip 		= $this->input->post('user_nip');
		$user_fname 	= $this->input->post('user_fname');
		$user_email  	= $this->input->post('user_email');
		$user_phone  	= $this->input->post('user_phone');

		$type 			= $this->input->post('type');
		$id 			= $this->input->post('id');

		$type = ($type == 'update') ? 'update' : 'new';

		$data = [
			'role_id'			=> $role_id,
			'user_nip'			=> $user_nip,
			'user_fname'		=> $user_fname,
			'user_email'		=> $user_email,
			'user_phone'		=> $user_phone,
			'modified_by'		=> $this->log_user,
			'modified_date'		=> date('Y-m-d H:i:s'),
		];

		if ($type == 'new') {
			$check = $this->sitemodel->view('m_user', '*', ['user_name'=>$user_nip]);
			if ($check) {$this->response['msg'] = "Data sudah ada.";echo json_encode($this->response);exit;}

			$data['user_name'] 			= $user_nip;
			$data['user_pass'] 			= password_hash('mgn2021', PASSWORD_DEFAULT);
			$data['changed_password'] 	= 0;
			$data['created_by'] 		= $this->log_user;
			$data['created_date'] 		= date('Y-m-d H:i:s');
		}

		if ($type == 'update') {
			$this->sitemodel->update('m_user', $data, ['user_id'=>$id]);
		}else{
			$user_id = $this->sitemodel->insert('m_user', $data);
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
		$check = $this->sitemodel->view($this->from, $this->select, ['user_id'=>$key]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		// Delete 
		$this->sitemodel->delete('m_user', ['user_id'=>$key]);
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menghapus data.";
		echo json_encode($this->response);
		exit;
	}
}
