<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

  /**
	 * County Drug Store
	 * Copyright (C) timo - All Rights Reserved
 	 * timo preserves the rights to distribute and modify this code under the
   * terms signed with the client on the delivery of this system.
	 */
   function __construct()
 	{
 		parent::__construct();
 		$this->load->helper("url");   //call the form helper
 		$this->load->helper('form');
    $this->load->model('drug_model','',TRUE);
    $this->load->library('session');
 	}

  public function index()
	{
    $data['attributes'] = array('class' => 'form-horizontal');

		$this->load->view('login',$data);
	}

  public function verify()
  {
    $username = $this->input->post('username');
    $password  = $this->input->post('password');

    $this->load->library('form_validation');
    $this->load->helper('security');

    $this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean');
    $this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');
    if($this->form_validation->run() == FALSE)
    {
      redirect('login');
    }
    else
    {
      $this->check_login($username,$password);
    }
  }

  function check_login($user,$pwd)
	{
    $row = $this->drug_model->login($user,$pwd);
    if($row)
		 {
         $sess_array = array(
					               'loggedId'   => $row['id'],
                 	       'fullName' => $row['fname']. ' ' . $row['lname'],
                         'username' => $row['username'],
                         'role' => $row['roleId']
                            );
         $this->session->set_userdata('logged_in', $sess_array);

            redirect('dashboard');


      }
      else
      {
        $this->session->set_flashdata('message', 'Wrong username and password combination');
        $this->session->set_flashdata('type', 'danger');
        redirect('login');
      }
    }
    public function logout()
    {
      $this->session->unset_userdata('logged_in');
      $this->index();
    }
}
