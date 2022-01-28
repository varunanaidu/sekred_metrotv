<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Form extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->select 		= '*';
		$this->from   		= 'view_form';
		$this->order_by   	= ['form_id'=>'DESC'];
		$this->order 		= ['form_id', 'form_name', 'form_description', 'form_file'];
		$this->search 		= ['form_id', 'form_name', 'form_description', 'form_file'];

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
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/form.js') 
		];
		$this->fragment['pagename'] = 'pages/front/form/main_page.php';
		$this->fragment['pagetitle'] = 'Form Redaksi';
		$this->load->view('layout/front/main-site', $this->fragment);
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
			$col[] = $row->form_name;
			$col[] = $row->form_description;
			$col[] = '<div class="table-data-feature">
			<a class="item" href="'.base_url().'asset/files/form/'.$row->form_file.'" target="_blank" data-toggle="tooltip" data-placement="top" title="Detail"><i class="zmdi zmdi-file"></i></a>&nbsp;
			</div>';
			$col[] = '<div class="table-data-feature">
			<button class="item btn-detail" data-toggle="tooltip" data-placement="top" data-id="'.$row->form_id.'"title="View"><i class="zmdi zmdi-eye"></i></button>
			<button class="item btn-edit" data-toggle="tooltip" data-placement="top" data-id="'.$row->form_id.'" title="Edit"><i class="zmdi zmdi-edit"></i></button>&nbsp;
			<button class="item btn-delete" data-toggle="tooltip" data-placement="top" data-id="'.$row->form_id.'" title="Delete"><i class="zmdi zmdi-delete"></i></button>
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
		$check = $this->sitemodel->view($this->from, $this->select, ['form_id'=>$key]);
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
		$form_name 			= $this->input->post('form_name');
		$form_description 	= $this->input->post('form_description');
		$type 				= $this->input->post('type');
		$id 				= $this->input->post('id');

		$type = ($type == 'update') ? 'update' : 'new';

		$data = [
			'form_name'			=>	$form_name,
			'form_description'	=>	$form_description,
			'modified_by'		=>  $this->log_user, 
			'modified_date'		=>  date('Y-m-d H:i:s'),
		];

		if ($type == 'new') {
			$data['created_by'] 	= $this->log_user;
			$data['created_date']	= date('Y-m-d H:i:s');
		}

		if ( isset($_FILES['form_file']) && $_FILES['form_file']['name'] != '' ) {

			$target_dir = 'asset/files/form/';

			$temp_name = $_FILES['form_file']['name'];
			$ext = explode('.', $temp_name);
			$end = strtolower(end($ext));

			if (!file_exists($target_dir)) {
				mkdir($target_dir, 0777, true);
			}

			$form_file = md5($temp_name.date("YmdHis")).".".$end;

			move_uploaded_file($_FILES['form_file']['tmp_name'], $target_dir.$form_file);

			$data['form_file'] = $form_file;
		}

		if ($type == 'update') {
			$this->sitemodel->update('m_form', $data, ['form_id'=>$id]);
		}else{
			$form_id = $this->sitemodel->insert('m_form', $data);
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
		$check = $this->sitemodel->view($this->from, $this->select, ['form_id'=>$key]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}

		foreach ($check as $row) {
			$files = 'asset/files/form/' . $row->form_file;
			unlink($files);
		}

		// Delete 
		$this->sitemodel->delete('m_form', ['form_id'=>$key]);
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menghapus data.";
		echo json_encode($this->response);
		exit;
	}
}
