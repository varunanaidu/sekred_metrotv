<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kontributor extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->select 		= '*';
		$this->from   		= 'view_kontributor';
		$this->order_by   	= ['kontributor_id'=>'DESC'];
		$this->order 		= ['kontributor_id', 'kontributor_name', 'kontributor_email', 'kontributor_telephone', 'kontributor_addr', 'kontributor_rek_number'];
		$this->search 		= ['kontributor_id', 'kontributor_name', 'kontributor_email', 'kontributor_telephone', 'kontributor_addr', 'kontributor_rek_number'];

	}

	public function index()
	{
		if (!$this->hasLogin()) {
			redirect('site/login');
		}
		$this->fragment['css'] = [
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.css'),
			base_url('asset/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css'),
			base_url('asset/vendor/daterangepicker/daterangepicker.css'),
			base_url('asset/vendor/jqvmap/jqvmap.min.css'),
		];
		$this->fragment['js'] = [ 
			base_url('asset/vendor/sweetalert2/dist/sweetalert2.min.js'),
			base_url('asset/vendor/datatables.net/js/jquery.dataTables.min.js'),
			base_url('asset/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js'),
			base_url('asset/vendor/moment/moment.min.js'),
			base_url('asset/vendor/daterangepicker/daterangepicker.js'),
			base_url('asset/vendor/jqvmap/jquery.vmap.min.js'),
			base_url('asset/vendor/jqvmap/maps/jquery.vmap.indonesia.js'),
			base_url('asset/vendor/jquery-form/jquery.form.min.js'),
			base_url('asset/js/pages/kontributor.js') 
		];
		$this->fragment['pagename'] = 'pages/front/kontributor/main_page.php';
		$this->fragment['pagetitle'] = 'Data Kontributor';
		$this->load->view('layout/front/main-site', $this->fragment);
	}

	public function get_map()
	{
		/*** Check Session ***/
		if ( !$this->hasLogin() ){$this->response['msg'] = "Session expired, Please refresh your browser.";echo json_encode($this->response);exit;}
		/*** Accessing DB Area ***/
		$check = $this->sitemodel->view('view_count_kontributor', '*');
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		/*** Result Area ***/
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
			$col[] = $row->kontributor_name;
			$col[] = $row->kontributor_email.'<br>'.$row->kontributor_email_2;
			$col[] = $row->kontributor_telephone.'<br>'.$row->kontributor_telephone_2;
			$col[] = $row->kontributor_addr;
			$col[] = $row->kontributor_rek_number;
			$col[] = '<div class="table-data-feature">
			<button class="item btn-detail" data-toggle="tooltip" data-placement="top" data-id="'.$row->kontributor_id.'" title="Detail"><i class="zmdi zmdi-eye"></i></button>&nbsp;
			<button class="item btn-edit" data-toggle="tooltip" data-placement="top" data-id="'.$row->kontributor_id.'" title="Edit"><i class="zmdi zmdi-edit"></i></button>&nbsp;
			<button class="item btn-delete" data-toggle="tooltip" data-placement="top" data-id="'.$row->kontributor_id.'" title="Delete"><i class="zmdi zmdi-delete"></i></button>
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
		$check = $this->sitemodel->view($this->from, $this->select, ['kontributor_id'=>$key]);
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
		$kontributor_name 			= $this->input->post('kontributor_name');
		$kontributor_gender			= $this->input->post('kontributor_gender');
		$kontributor_birth_date		= $this->input->post('kontributor_birth_date');
		$kontributor_birth_place	= $this->input->post('kontributor_birth_place');
		$kontributor_photo 			= '';
		$kontributor_identity 		= $this->input->post('identity_type').'-'.$this->input->post('identity_number');
		$kontributor_addr			= $this->input->post('kontributor_addr');
		$kontributor_addr_kirim		= $this->input->post('kontributor_addr_kirim');
		$kontributor_rek_number		= $this->input->post('kontributor_rek_number');
		$kontributor_telephone		= $this->input->post('kontributor_telephone');
		$kontributor_telephone_2	= $this->input->post('kontributor_telephone_2');
		$kontributor_email			= $this->input->post('kontributor_email');
		$kontributor_email_2		= $this->input->post('kontributor_email_2');
		$kontributor_skype			= $this->input->post('kontributor_skype');
		$kontributor_platform		= $this->input->post('kontributor_platform');
		$kontributor_status			= $this->input->post('kontributor_status');
		$kontributor_area			= $this->input->post('kontributor_area');
		$kontributor_wilayah		= $this->input->post('kontributor_wilayah');
		$kontributor_province		= $this->input->post('kontributor_province');
		$kontributor_country		= $this->input->post('kontributor_country');
		$kontributor_entry_date		= $this->input->post('kontributor_entry_date');
		$kontributor_ukuran_baju	= $this->input->post('kontributor_ukuran_baju');
		$periode 					= explode(' - ', $this->input->post('kontributor_periode'));
		$kontributor_periode_start 	= date('Y-m-d', strtotime($periode[0]));
		$kontributor_periode_end 	= date('Y-m-d', strtotime($periode[1]));
		$kontributor_file 			= '';

		$kontributor_bpjs				= $this->input->post('kontributor_bpjs');
		$kontributor_bpjs_nomor			= $this->input->post('kontributor_bpjs_nomor');
		$kontributor_bpjs_istri			= $this->input->post('kontributor_bpjs_istri');
		$kontributor_bpjs_istri_nomor	= $this->input->post('kontributor_bpjs_istri_nomor');
		$kontributor_bpjs_anak1			= $this->input->post('kontributor_bpjs_anak1');
		$kontributor_bpjs_anak1_nomor	= $this->input->post('kontributor_bpjs_anak1_nomor');
		$kontributor_bpjs_anak2			= $this->input->post('kontributor_bpjs_anak2');
		$kontributor_bpjs_anak2_nomor	= $this->input->post('kontributor_bpjs_anak2_nomor');
		$kontributor_bpjs_anak3			= $this->input->post('kontributor_bpjs_anak3');
		$kontributor_bpjs_anak3_nomor	= $this->input->post('kontributor_bpjs_anak3_nomor');

		$kontributor_camera		= $this->input->post('kontributor_camera');
		$kontributor_software	= $this->input->post('kontributor_software');

		$type 			= $this->input->post('type');
		$id 			= $this->input->post('id');

		$type = ($type == 'update') ? 'update' : 'new';

		$data = [
			'kontributor_name'			=> $kontributor_name,
			'kontributor_gender'		=> $kontributor_gender,
			'kontributor_birth_date'	=> $kontributor_birth_date,
			'kontributor_birth_place'	=> $kontributor_birth_place,
			'kontributor_identity'		=> $kontributor_identity,
			'kontributor_addr'			=> $kontributor_addr,
			'kontributor_addr_kirim'	=> $kontributor_addr_kirim,
			'kontributor_rek_number'	=> $kontributor_rek_number,
			'kontributor_telephone'		=> $kontributor_telephone,
			'kontributor_telephone_2'	=> $kontributor_telephone_2,
			'kontributor_email'			=> $kontributor_email,
			'kontributor_email_2'		=> $kontributor_email_2,
			'kontributor_skype'			=> $kontributor_skype,
			'kontributor_platform'		=> $kontributor_platform,
			'kontributor_status'		=> $kontributor_status,
			'kontributor_area'			=> $kontributor_area,
			'kontributor_wilayah'		=> $kontributor_wilayah,
			'kontributor_province'		=> $kontributor_province,
			'kontributor_country'		=> $kontributor_country,
			'kontributor_entry_date'	=> $kontributor_entry_date,
			'kontributor_ukuran_baju'	=> $kontributor_ukuran_baju,
			'kontributor_periode_start'	=> $kontributor_periode_start,
			'kontributor_periode_end'	=> $kontributor_periode_end,
			'modified_by'				=>  $this->log_user, 
			'modified_date'				=>  date('Y-m-d H:i:s'),
		];

		if ( isset($_FILES['kontributor_photo']) && $_FILES['kontributor_photo']['name'] != '' ) {

			$temp_name = $_FILES['kontributor_photo']['name'];
			$ext = explode('.', $temp_name);
			$end = strtolower(end($ext));
			$kontributor_photo = md5($temp_name.date("YmdHis")).".".$end;
			$data['kontributor_photo'] = $kontributor_photo;
		}

		if ( isset($_FILES['kontributor_file']) && $_FILES['kontributor_file']['name'] != '' ) {

			$temp_name = $_FILES['kontributor_file']['name'];
			$ext = explode('.', $temp_name);
			$end = strtolower(end($ext));
			$kontributor_file = md5($temp_name.date("YmdHis")).".".$end;
			$data['kontributor_file'] = $kontributor_file;
		}

		$data_bpjs = [
			'kontributor_bpjs' 				=> $kontributor_bpjs,
			'kontributor_bpjs_nomor' 		=> $kontributor_bpjs_nomor,
			'kontributor_bpjs_istri' 		=> $kontributor_bpjs_istri,
			'kontributor_bpjs_istri_nomor' 	=> $kontributor_bpjs_istri_nomor,
			'kontributor_bpjs_anak1' 		=> $kontributor_bpjs_anak1,
			'kontributor_bpjs_anak1_nomor' 	=> $kontributor_bpjs_anak1_nomor,
			'kontributor_bpjs_anak2' 		=> $kontributor_bpjs_anak2,
			'kontributor_bpjs_anak2_nomor' 	=> $kontributor_bpjs_anak2_nomor,
			'kontributor_bpjs_anak3' 		=> $kontributor_bpjs_anak3,
			'kontributor_bpjs_anak3_nomor' 	=> $kontributor_bpjs_anak3_nomor,
		];

		$data_alat = [
			'kontributor_camera' 	=> $kontributor_camera,
			'kontributor_software' 	=> $kontributor_software,
		];

		if ($type == 'new') {
			$data['created_by'] 	= $this->log_user;
			$data['created_date']	= date('Y-m-d H:i:s');
		}

		if ($type == 'update') {

			$this->sitemodel->update('m_kontributor', $data, ['kontributor_id'=>$id]);
			$this->sitemodel->update('m_kontributor_bpjs', $data_bpjs, ['id'=>$id]);
			$this->sitemodel->update('m_kontributor_alat', $data_alat, ['id'=>$id]);

			if ( isset($_FILES['kontributor_photo']) && $_FILES['kontributor_photo']['name'] != '' ) {

				$target_dir = 'asset/files/kontributor/'.$id.'/';

				if (!file_exists($target_dir)) {
					mkdir($target_dir, 0777, true);
				}

				move_uploaded_file($_FILES['kontributor_photo']['tmp_name'], $target_dir.$kontributor_photo);
			}
			if ( isset($_FILES['kontributor_file']) && $_FILES['kontributor_file']['name'] != '' ) {

				$target_dir = 'asset/files/kontributor/'.$id.'/';

				if (!file_exists($target_dir)) {
					mkdir($target_dir, 0777, true);
				}

				move_uploaded_file($_FILES['kontributor_file']['tmp_name'], $target_dir.$kontributor_file);
			}

		}else{

			$id = $this->sitemodel->insert('m_kontributor', $data);

			$data_bpjs['id'] = $id;
			$bpjs = $this->sitemodel->insert('m_kontributor_bpjs', $data_bpjs);

			$data_alat['id'] = $id;
			$alat = $this->sitemodel->insert('m_kontributor_alat', $data_alat);

			if ( isset($_FILES['kontributor_photo']) && $_FILES['kontributor_photo']['name'] != '' ) {

				$target_dir = 'asset/files/kontributor/'.$id.'/';

				if (!file_exists($target_dir)) {
					mkdir($target_dir, 0777, true);
				}

				move_uploaded_file($_FILES['kontributor_photo']['tmp_name'], $target_dir.$kontributor_photo);
			}
			if ( isset($_FILES['kontributor_file']) && $_FILES['kontributor_file']['name'] != '' ) {

				$target_dir = 'asset/files/kontributor/'.$id.'/';

				if (!file_exists($target_dir)) {
					mkdir($target_dir, 0777, true);
				}

				move_uploaded_file($_FILES['kontributor_file']['tmp_name'], $target_dir.$kontributor_file);
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
		$check = $this->sitemodel->view($this->from, $this->select, ['kontributor_id'=>$key]);
		if (!$check) {$this->response['msg'] = "No data found.";echo json_encode($this->response);exit;}
		// Delete 
		$this->sitemodel->delete('m_kontributor', ['kontributor_id'=>$key]);
		$this->sitemodel->delete('m_kontributor_bpjs', ['id'=>$key]);
		$this->sitemodel->delete('m_kontributor_alat', ['id'=>$key]);
		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['msg'] = "Berhasil menghapus data.";
		echo json_encode($this->response);
		exit;
	}
}
