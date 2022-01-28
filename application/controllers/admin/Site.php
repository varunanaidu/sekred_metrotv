<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Site extends MY_Controller {

	function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}

		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
		];

		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/js/pages/admin.js') 
		];
		$this->fragment['menu'] = $this->sitemodel->view('view_uac', '*', ['user_id'=>$this->log_user, 'nav_id !='=>2], NULL, 'nav_order ASC');
		$this->fragment['pagename'] = 'pages/admin/site_page.php';
		$this->load->view('layout/admin/main-site', $this->fragment);
	}

	public function show_information()
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
		/*** Accessing DB Area ***/
		$check = $this->sitemodel->view('view_informasi', '*', ['informasi_id'=>$key]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = $check;
		echo json_encode($this->response);
		exit;
	}
}
