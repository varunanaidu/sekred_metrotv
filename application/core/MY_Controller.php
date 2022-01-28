<?php if ( !defined('BASEPATH') )exit('No direct script access allowed');

class MY_Controller extends CI_Controller{

	protected $select 	 = '';
	protected $from 	 = '';
	protected $order_by  = [];
	protected $search    = [];
	protected $order     = [];

	protected $fragment  = [];
	protected $response  = [];

	protected $log_user  = 1;
	protected $log_name  = '';
	protected $log_nip   = '';
	protected $log_fname = '';
	protected $log_email = '';
	protected $log_role  = '';
	
	function __construct(){
		parent::__construct();
		date_default_timezone_set('Asia/Jakarta');
		
		if ($this->hasLogin()) {
			$this->log_user  = $this->session->userdata(SESS)->log_user;
			$this->log_name  = $this->session->userdata(SESS)->log_name;
			$this->log_nip   = $this->session->userdata(SESS)->log_nip;
			$this->log_fname = $this->session->userdata(SESS)->log_fname;
			$this->log_email = $this->session->userdata(SESS)->log_email;
			$this->log_role  = $this->session->userdata(SESS)->log_role;

			$this->fragment['log_user']  = $this->log_user;
			$this->fragment['log_name']  = $this->log_name;
			$this->fragment['log_nip']   = $this->log_nip;
			$this->fragment['log_fname'] = $this->log_fname;
			$this->fragment['log_email'] = $this->log_email;
			$this->fragment['log_role']  = $this->log_role;

			$this->fragment['info_redaksi'] = $this->sitemodel->view('view_informasi', '*', ['is_active'=>1], NULL, "created_date DESC", 3);
			$this->fragment['log_photo'] = '';
			
			$photo = $this->sitemodel->view('view_user', 'user_photo', ['user_id'=>$this->log_user]);
			
			if ( $photo[0]->user_photo != '' ) {
				$this->fragment['log_photo'] = $photo[0]->user_photo;
			}

			// echo json_encode($this->fragment);die;

		}
	}
	
	function hasLogin() {
		return $this->session->userdata(SESS);
	}

	function compress_image($source_url, $destination_url, $quality) {
		$info = getimagesize($source_url);

		if ($info['mime'] == 'image/jpeg')
			$image = imagecreatefromjpeg($source_url);
		elseif ($info['mime'] == 'image/gif')
			$image = imagecreatefromgif($source_url);
		elseif ($info['mime'] == 'image/png')
			$image = imagecreatefrompng($source_url);
		imagejpeg($image, $destination_url, $quality);

		return true;
	}
}