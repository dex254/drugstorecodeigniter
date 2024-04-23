<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sample extends CI_Controller {
  /**
	 * Aqua
	 * Copyright (C) Tibralink Limited - All Rights Reserved
 	 * Tibralink preserves the rights to distribute and modify this code under the
   * terms signed with the client on the delivery of this system.
	 */
  function __construct()
    {
   	 parent::__construct();
   	 $this->load->helper("url");   //call the form helper
   	 $this->load->helper('form');
  	 $this->load->library('session');
    }

	public function index()
	{
    $this->load->view('common/header');
    $this->load->view('common/navigation');
    $this->load->view('common/main');
    $this->load->view('common/footer');
	}
}
