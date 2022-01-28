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

		$check = $this->sitemodel->view('m_user', '*', ['user_id'=>$this->log_user]);
		foreach ($check as $c) {
			if ( $c->changed_password == 0 ) {
				redirect( base_url('site/changed_password') );
			}
		}

		$temp_menu = $this->sitemodel->view('view_nav', '*', ['is_stricted'=>0], NULL, 'nav_order ASC');
		$additional_menu = $this->sitemodel->view('view_uac', '*', ['user_id'=>$this->log_user, 'nav_id'=>2]);
		if ( $additional_menu != 0 ) {
			$temp_menu[] = $additional_menu[0];
		}

		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
		];

		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/js/pages/front.js') 
		];
		$this->fragment['menu']	= $temp_menu;
		$this->fragment['pagename'] = 'pages/front/site_page.php';
		$this->load->view('layout/front/main-site', $this->fragment);
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

	public function login()
	{
		if( $this->hasLogin() ) redirect();
		$this->load->view('login_page');
	}

	public function changed_password()
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}

		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/change_password.js') 
		];
		$this->fragment['pagename'] = 'change_password_page.php';
		$this->load->view('layout/front/main-site', $this->fragment);
	}

	public function profile()
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}

		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/profile.js') 
		];

		$this->fragment['user'] = $this->sitemodel->view('view_user', '*', ['user_id'=>$this->log_user]);

		$this->fragment['pagename'] = 'profile_page.php';
		$this->load->view('layout/front/main-site', $this->fragment);
	}

	public function signin()
	{
		// echo json_encode($this->input->post());die;
		$this->load->library('form_validation');
		$this->form_validation->set_rules('user_name','Username','required');
		$this->form_validation->set_rules('user_pass','Password','required');

		if ($this->form_validation->run() == false) {
			$this->response['msg'] = validation_errors();
			echo json_encode($this->response);
			exit;
		}

		$user_name = $this->input->post('user_name');
		$user_pass = $this->input->post('user_pass');

		$check = $this->sitemodel->view('m_user', '*', ['user_name'=>$user_name]);
		if (!$check) {$this->response['msg'] = "No user found.";echo json_encode($this->response);exit;}

		if (! password_verify($user_pass, $check[0]->user_pass)) {
			$this->response['msg'] = "Invalid email address or password.";
			echo json_encode($this->response);
			exit;					
		}

		$data_sess = [
			'log_user'	=> $check[0]->user_id,
			'log_name'	=> $check[0]->user_name,
			'log_nip'	=> $check[0]->user_nip,
			'log_fname'	=> $check[0]->user_fname,
			'log_email'	=> $check[0]->user_email,
			'log_role'	=> $check[0]->role_id,
		];

		$this->session->set_userdata(SESS, (object)$data_sess);
		$this->response['type'] = 'done';
		$this->response['msg'] = "Successfully login.";
		echo json_encode($this->response);
	}

	public function update_password()
	{
		// echo json_encode($this->input->post());die;
		$this->load->library('form_validation');
		$this->form_validation->set_rules('old_password','Password','required');
		$this->form_validation->set_rules('new_password','Password','required');
		$this->form_validation->set_rules('confirm_password','Password Confimation','required');

		if ($this->form_validation->run() == false) {
			$this->response['msg'] = validation_errors();
			echo json_encode($this->response);
			exit;
		}

		if ( $this->input->post('new_password') != $this->input->post('confirm_password') ) {
			$this->response['msg'] = 'Password not match';
			echo json_encode($this->response);
			exit;
		}

		$new_password = $this->input->post('new_password');

		$check = $this->sitemodel->view('m_user', '*', ['user_id'=>$this->log_user]);
		if (!$check) {$this->response['msg'] = "No user found.";echo json_encode($this->response);exit;}

		$data = [
			'user_pass'			=> password_hash($new_password, PASSWORD_DEFAULT),
			'changed_password'	=> 1,
			'modified_by'		=> $this->log_user,
			'modified_date'		=> date('Y-m-d H:i:s'),
		];

		$this->sitemodel->update('m_user', $data, ['user_id'=>$this->log_user]);

		$this->response['type'] = 'done';
		$this->response['msg'] = "Successfully change password.";
		echo json_encode($this->response);
	}

	public function update_profile()
	{
		// echo json_encode($this->input->post());die;
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}
		// PARAMS
		$user_fname 	= $this->input->post('user_fname');
		$user_nip 		= $this->input->post('user_nip');
		$user_email  	= $this->input->post('user_email');
		$user_phone  	= $this->input->post('user_phone');

		$data = [
			'user_fname'		=> $user_fname,
			'user_nip'			=> $user_nip,
			'user_email'		=> $user_email,
			'user_phone'		=> $user_phone,
			'modified_by'		=> $this->log_user,
			'modified_date'		=> date('Y-m-d H:i:s'),
		];

		if ( isset($_FILES['user_photo']) && $_FILES['user_photo']['name'] != '' ) {

			$target_dir = 'asset/files/profile/'.$this->log_user.'/';

			$temp_name = $_FILES['user_photo']['name'];
			$ext = explode('.', $temp_name);
			$end = strtolower(end($ext));

			if (!file_exists($target_dir)) {
				mkdir($target_dir, 0777, true);
			}

			$user_photo = md5($temp_name.date("YmdHis")).".".$end;

			move_uploaded_file($_FILES['user_photo']['tmp_name'], $target_dir.$user_photo);

			$data['user_photo'] = $user_photo;
		}

		$this->sitemodel->update('m_user', $data, ['user_id'=>$this->log_user]);
		
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil mengubah data.";
		echo json_encode($this->response);
		exit;
	}

	public function signout()
	{
		$this->session->sess_destroy();
		redirect ( base_url() );
	}
}
