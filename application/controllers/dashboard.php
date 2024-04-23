<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {
  /**
	 * Aqua
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

      $this->session_data=$this->session->userdata('logged_in');
      if (empty($this->session_data))
      {
        redirect('login');
      }
    }

	public function index()
	{
    $data['order'] = $this->drug_model->reorder();
    //var_dump($data['order']);
    $data['soon'] = $this->drug_model->get_expiry_drugs(date('Y-m-d',strtotime(date('Y-m-d').'+ 91 day')),date('Y-m-d',strtotime(date('Y-m-d').'+ 180 day')));
    $data['expired'] = $this->drug_model->get_expiry_drugs(date('Y-m-d',strtotime(date('Y-m-d').'+ 1 day')),date('Y-m-d',strtotime(date('Y-m-d').'+ 90 day')));
    //var_dump($data['expired']);
    $data['drugs'] = $this->drug_model->get_drugs();
    //var_dump($data['drugs']);
    $data['tracers'] = $this->drug_model->get_tracer();
    if ($this->session_data['role']==3)
    {
    $ndata['cart'] = $this->drug_model->countWaitingCart();
    $ndata['cartwl'] = $this->drug_model->countWaitingCartwl();
    $ndata['recCart'] = $this->drug_model->countWaitingrecCart();
    }
    else
    {
    $ndata['cart'] = $this->drug_model->countCart($this->session_data['loggedId']);
    $ndata['cartwl'] = $this->drug_model->countCartwl($this->session_data['loggedId']);
    $ndata['recCart'] = $this->drug_model->countrecCart($this->session_data['loggedId']);
    }
    //var_dump($ndata);
    $ndata['login']=$this->session_data;
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('dash',$data);
    $this->load->view('common/footer1');
	}
}
