<?php defined('BASEPATH') OR exit('No direct script access allowed');
$this->load->view('layout/front/layout-top');
$this->load->view($pagename);
$this->load->view('layout/front/layout-bot'); ?>