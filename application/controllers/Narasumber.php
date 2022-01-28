<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Narasumber extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->select 		= '*';
		$this->from   		= 'view_narasumber';
		$this->order_by   	= ['narasumber_id'=>'DESC'];
		$this->order 		= ['narasumber_id', 'narasumber_name', 'narasumber_email', 'narasumber_telephone', 'narasumber_addr'];
		$this->search 		= ['narasumber_id', 'narasumber_name', 'narasumber_email', 'narasumber_telephone', 'narasumber_addr'];

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
			base_url('asset/js/pages/narasumber.js') 
		];
		$this->fragment['pagename'] = 'pages/front/narasumber/main_page.php';
		$this->fragment['pagetitle'] = 'Data Narasumber';
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
			$col[] = $row->narasumber_name;
			$col[] = $row->narasumber_email.'<br>'.$row->narasumber_email_2;
			$col[] = $row->narasumber_telephone.'<br>'.$row->narasumber_telephone_2;
			$col[] = $row->narasumber_addr;
			$col[] = '<div class="table-data-feature">
			<button class="item btn-detail" data-toggle="tooltip" data-placement="top" data-id="'.$row->narasumber_id.'" title="Detail"><i class="zmdi zmdi-eye"></i></button>&nbsp;
			<button class="item btn-edit" data-toggle="tooltip" data-placement="top" data-id="'.$row->narasumber_id.'" title="Edit"><i class="zmdi zmdi-edit"></i></button>&nbsp;
			<button class="item btn-delete" data-toggle="tooltip" data-placement="top" data-id="'.$row->narasumber_id.'" title="Delete"><i class="zmdi zmdi-delete"></i></button>
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
		$check = $this->sitemodel->view($this->from, $this->select, ['narasumber_id'=>$key]);
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
		$narasumber_name 			= $this->input->post('narasumber_name');
		$narasumber_telephone 		= $this->input->post('narasumber_telephone');
		$narasumber_telephone_2 	= $this->input->post('narasumber_telephone_2');
		$narasumber_email 			= $this->input->post('narasumber_email');
		$narasumber_email_2 		= $this->input->post('narasumber_email_2');
		$narasumber_addr 			= $this->input->post('narasumber_addr');
		$narasumber_city 			= $this->input->post('narasumber_city');
		$narasumber_jabatan 		= $this->input->post('narasumber_jabatan');
		$narasumber_instansi 		= $this->input->post('narasumber_instansi');
		$narasumber_partner 		= $this->input->post('partner_type').'-'.$this->input->post('partner_name');
		$narasumber_partner_number 	= $this->input->post('narasumber_partner_number');
		$narasumber_keterangan 		= $this->input->post('narasumber_keterangan');

		$type 			= $this->input->post('type');
		$id 			= $this->input->post('id');

		$type = ($type == 'update') ? 'update' : 'new';

		$data = [
			'narasumber_name'			=> $narasumber_name,
			'narasumber_telephone'		=> $narasumber_telephone,
			'narasumber_telephone_2'	=> $narasumber_telephone_2,
			'narasumber_email'			=> $narasumber_email,
			'narasumber_email_2'		=> $narasumber_email_2,
			'narasumber_addr'			=> $narasumber_addr,
			'narasumber_city'			=> $narasumber_city,
			'narasumber_jabatan'		=> $narasumber_jabatan,
			'narasumber_instansi'		=> $narasumber_instansi,
			'narasumber_partner'		=> $narasumber_partner,
			'narasumber_partner_number'	=> $narasumber_partner_number,
			'narasumber_keterangan'		=> $narasumber_keterangan,
			'modified_by'				=>  $this->log_user,
			'modified_date'				=>  date('Y-m-d H:i:s'),
		];

		if ($type == 'new') {
			$data['created_by'] 	= $this->log_user;
			$data['created_date']	= date('Y-m-d H:i:s');
		}

		if ($type == 'update') {

			$this->sitemodel->update('m_narasumber', $data, ['narasumber_id'=>$id]);

		}else{

			$narasumber_id = $this->sitemodel->insert('m_narasumber', $data);

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
		$check = $this->sitemodel->view($this->from, $this->select, ['narasumber_id'=>$key]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		// Delete 
		$this->sitemodel->delete('m_narasumber', ['narasumber_id'=>$key]);
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menghapus data.";
		echo json_encode($this->response);
		exit;
	}
}
