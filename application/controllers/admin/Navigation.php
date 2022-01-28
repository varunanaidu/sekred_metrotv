<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Navigation extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->select 		= '*';
		$this->from   		= 'view_nav';
		$this->order_by   	= ['nav_order'=>'ASC'];
		$this->order 		= ['nav_order', 'nav_name', 'nav_icon'];
		$this->search 		= ['nav_order', 'nav_name', 'nav_icon'];

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
			base_url('asset/js/pages/navigation.js') 
		];
		$this->fragment['pagename'] = 'pages/admin/navigation/main_page.php';
		$this->fragment['pagetitle'] = 'Navigation';
		$this->load->view('layout/admin/main-site', $this->fragment);
	}

	public function view()
	{
		$data = array();
		$res = $this->sitemodel->get_datatable($this->select, $this->from, $this->order_by, $this->search, $this->order);
		$q = $this->db->last_query();

		foreach ($res as $row) {
			$col = array();
			$col[] = $row->nav_order.($row->is_stricted == 1 ? ' - Admin' : '');
			$col[] = $row->nav_name;
			$col[] = $row->nav_icon;
			$col[] = '<div class="table-data-feature">
			<button class="item btn-edit" data-toggle="tooltip" data-placement="top" data-id="'.$row->nav_id.'" title="Edit"><i class="zmdi zmdi-edit"></i></button>
			<button class="item btn-delete" data-toggle="tooltip" data-placement="top" data-id="'.$row->nav_id.'" title="Delete"><i class="zmdi zmdi-delete"></i></button>
			</div>';
			$data[] = $col;
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
		$check = $this->sitemodel->view($this->from, $this->select, ['nav_id'=>$key]);
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
		$nav_name 		= $this->input->post('nav_name');
		$nav_ctr 		= $this->input->post('nav_ctr');
		$nav_icon  		= $this->input->post('nav_icon');
		$nav_order  	= $this->input->post('nav_order');
		$is_stricted 	= $this->input->post('is_stricted');

		$type 			= $this->input->post('type');
		$id 			= $this->input->post('id');

		$type = ($type == 'update') ? 'update' : 'new';

		$data = [
			'nav_name'			=> $nav_name,
			'nav_ctr'	=> $nav_ctr,
			'nav_icon'			=> $nav_icon,
			'nav_order'			=> $nav_order,
			'is_stricted'		=> $is_stricted,
		];

		if ($type == 'update') {

			$this->sitemodel->update('m_nav', $data, ['nav_id'=>$id]);

		}else{

			$nav_id = $this->sitemodel->insert('m_nav', $data);

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
		$check = $this->sitemodel->view($this->from, $this->select, ['nav_id'=>$key]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		// Delete 
		$this->sitemodel->delete('m_nav', ['nav_id'=>$key]);
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menghapus data.";
		echo json_encode($this->response);
		exit;
	}
}
