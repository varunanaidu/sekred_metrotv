<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_access extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->select 		= '*';
		$this->from   		= 'view_uac';

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
			base_url('asset/js/pages/uac.js') 
		];
		$this->fragment['pagename'] = 'pages/admin/uac/main_page.php';
		$this->fragment['pagetitle'] = 'User Access';
		$this->load->view('layout/admin/main-site', $this->fragment);
	}

	public function search_emp()
	{
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		$term = $this->input->get("term");
		// echo json_encode($term);die;
		$res = [];
		$check = $this->sitemodel->custom_query("SELECT * FROM m_user WHERE user_name LIKE '%".$term."%' OR user_fname LIKE '%".$term."%' ");
		// echo json_encode($check);die;
		if($check){
			foreach ($check as $row) {
				$sub_res = [];
				$sub_res['id'] = $row->user_id;
				$sub_res['text'] = $row->user_nip.' - '.$row->user_fname;
				$res[] = $sub_res;
			}
		}

		echo json_encode($res);
		exit;
	}

	public function setup()
	{
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameter.";echo json_encode($this->response);exit;}
		/*** Params ***/
		/*** Required Area ***/
		$key = $this->input->post("key");
		/*** Optional Area ***/
		/*** Validate Area ***/
		$html = '<div class="table-responsive"><table class="table table-bordered table-striped">
		<thead>
		<tr>
		<th>#</th>
		<th>Menu</th>
		<th><i class="fa fa-cog"></i></th>
		</tr>
		</thead>
		<tbody>
		';

		$cekNav = $this->sitemodel->view('view_nav', '*', ['is_stricted'=>1]);

		if ($cekNav) {
			$a = 1;
			foreach ($cekNav as $row) {
				$checked  = '';
				// $cekUac = $this->Uac_model->find($key, $row->nav_id);
				$cekUac = $this->sitemodel->view($this->from, $this->select, ['user_id'=>$key, 'nav_id'=>$row->nav_id]);
				if ($cekUac) {
					$checked = 'checked="checked" ';
				}
				$html .= '<tr>
				<td>' . $a . '</td>
				<td>' . $row->nav_name . '</td>
				<td> <input type="checkbox" name="ckbox[]" value="'.$row->nav_id.'" '.$checked.' > </td>
				</tr>';
				$a++;
			}
		}

		$html .= '</tbody></table></div>';
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = $html;
		echo json_encode($this->response);
		exit;
	}

	public function save()
	{
		// echo json_encode($this->input->post());die;
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameter.";echo json_encode($this->response);exit;}
		/*** Params ***/
		/*** Required Area ***/
		$user = $this->input->post("user");
		$ckbox = $this->input->post("ckbox");
		/*** Optional Area ***/
		/*** Validate Area ***/
		if ( empty($user) ){$this->response['msg'] = "Please choose user.";echo json_encode($this->response);exit;}
		/*** Accessing DB Area ***/
		$this->sitemodel->delete("m_uac", ["user_id"=>$user]);
		for($i = 0; $i < count($ckbox); $i++){
			$exp = explode(";", $ckbox[$i]);
			if ( count($exp) > 1 ){
				// $find = $this->uac_model->find($user, $exp[0]);
				$find = $this->sitemodel->view($this->from, $this->select, ['user_id'=>$user, 'nav_id'=>$exp[0]]);
				if ( !$find ){
					$data = [
						"user_id"		=> $user,
						"nav_id"		=> $exp[0],
						"created_date"	=> date("Y-m-d H:i:s"),
						"created_by"	=> $this->log_user
					];
					$this->sitemodel->insert("m_uac", $data);
				}
				$data = [
					"user_id"		=> $user,
					"nav_id"		=> $exp[1],
					"created_date"	=> date("Y-m-d H:i:s"),
					"created_by"	=> $this->log_user
				];
				$this->sitemodel->insert("m_uac", $data);
			}
			else{
				$data = [
					"user_id"		=> $user,
					"nav_id"		=> $ckbox[$i],
					"created_date"	=> date("Y-m-d H:i:s"),
					"created_by"	=> $this->log_user
				];
				$this->sitemodel->insert("m_uac", $data);
			}
		}
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Successfully setup user.";
		echo json_encode($this->response);
		exit;
	}

}