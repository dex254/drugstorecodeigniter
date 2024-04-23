<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stock extends CI_Controller {
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

        $ndata['login']=$this->session_data;
        if ($this->session_data['role']!=3)
        {
          $this->session->set_flashdata('message', 'You do not have access rights. Please contact the system administrator');
          $this->session->set_flashdata('type', 'danger');
          redirect($_SERVER['HTTP_REFERER'],'refresh');
        }
        else {

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
        $data['staffs'] = $this->drug_model->get_all_data('staff');
        //$ndata['nav']='active'

        $this->load->view('common/header');
        $this->load->view('common/navigation',$ndata);
        $this->load->view('stock/index',$data);
        $this->load->view('common/footer');
      }
    	}

public function create()
    {
      $data = array('id' => '');
      $data['attributes'] = array('class' => 'form-horizontal');
      $data['prop'] = array('class' => 'form-control');

      $ndata['login']=$this->session_data;
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

  $result = $this->drug_model->get_all_data_drugs('drugs');
  foreach ($result as $row)
  {
    $rid = $row['id'];
    $dropdown [$rid] = $row['name'];
  }
  $data['drugs'] = $dropdown;

  $resulta = $this->drug_model->get_all_data('uom');
  foreach ($resulta as $rowa)
  {
    $rida = $rowa['id'];
    $dropdowna [$rida] = $rowa['name'];
  }
  $data['uoms'] = $dropdowna;

      $this->load->view('common/header');
      $this->load->view('common/navigation',$ndata);
      $this->load->view('stock/create',$data);
      $this->load->view('common/footer');
}

public function store()
{
  $this->load->library('form_validation');
  $this->load->helper(array('form'));

  $this->form_validation->set_rules('drug', 'drug', 'required');
  $this->form_validation->set_rules('opStock', 'Openning Stock', 'required');
  $this->form_validation->set_rules('stock', 'Stock', 'required');
  $this->form_validation->set_rules('rDate', 'Received Date', 'required');
  $this->form_validation->set_rules('expiry', 'Expiry Date', 'required');
  $this->form_validation->set_rules('cStock', 'Current Stock', 'required');
  if ($this->form_validation->run() === FALSE)
  {
    $this->create();
  }
  else
  {
      $data = array(
        'drugId' => $this->input->post('drug'),
        'opStock' => $this->input->post('opStock'),
        'stock' => $this->input->post('stock'),
        'rDate' => $this->input->post('rDate'),
        'cStock' => $this->input->post('cStock'),
        'expiry' => $this->input->post('expiry')
      );
      $this->drug_model->insert_data('stock', $data);
    redirect($this->uri->uri_string());
  }
}
public function createstocktakePdf()
{
  $data['drugs'] = $this->drug_model->inStocktake();
  $data['title']='LIST OF DRUGS IN STOCK AS AT '.date('D, d-M-Y');
  $this->load->view('stock/createstocktakePdf',$data);
}
}
