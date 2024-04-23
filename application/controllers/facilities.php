<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Facilities extends CI_Controller {
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
    else
    {
    $data['facilities'] = $this->drug_model->get_all_data_fac('facilities');
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
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('facilities/index',$data);
    $this->load->view('common/footer');
	}
}
	public function create()
	{
    $data['attributes'] = array('class' => 'form-horizontal');
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
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('facilities/create',$data);
    $this->load->view('common/footer');
	}

  public function store()
	{
    $this->load->library('form_validation');
		$this->load->helper(array('form'));

    $this->form_validation->set_rules('name', 'Facility Name', 'required|callback_name_existance');
    $this->form_validation->set_rules('code', 'Facility Code', 'required|callback_code_existance');
    if ($this->form_validation->run() === FALSE)
		{
			$this->create();
		}
    else
		{
  	  	$data = array(
          'name' => $this->input->post('name'),
          'code' => $this->input->post('code'),
          'registered_by' => $this->session_data['loggedId']
        );
        $this->drug_model->insert_data('facilities', $data);
        $this->session->set_flashdata('message', 'You have successfully registered a new facility');
        $this->session->set_flashdata('type', 'success');
  			redirect('facilities/index');
    }
  }

  public function orderCreate()
  {
    $data = array('id' => '','name' => '');
    $data['attributes'] = array('class' => 'form-horizontal');
    $data['prop'] = array('class' => 'form-control');
    $resulta = $this->drug_model->get_all_data('facilities');
    foreach ($resulta as $rowa)
    {
      $rida = $rowa['id'];
      $dropdowna [$rida] = $rowa['name'];
    }
    $data['facilities'] = $dropdowna;

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
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('facilities/order',$data);
    $this->load->view('common/footer');
    }

public function order()
{
  $this->load->library('form_validation');
  $this->load->helper(array('form'));
  $this->form_validation->set_rules('facility', 'Requisition Officer', 'required');
  if ($this->form_validation->run() === FALSE)
  {
    $this->orderCreate();
  }
  else
  {
      $cartData=array(
        'facilityId'=>$this->input->post('facility')
      );
      $cartId=$this->drug_model->insert_data('orderf', $cartData);
    }
    $this->orderCreate();
  }

  function name_existance($name)
	{
		$name= strtolower($name);
    $user_check = $this->drug_model->avail('name', $name,'facilities');
    if($user_check !== FALSE)
		 {
			 $this->form_validation->set_message('name_existance', 'facility name already exists');
      	return FALSE;
      }
		  else
		  {
        return TRUE;
      }
	}

  function code_existance($code)
	{
		$code= strtolower($code);
    $user_check = $this->drug_model->avail('code', $code,'facilities');
    if($user_check !== FALSE)
		 {
			 $this->form_validation->set_message('code_existance', 'Facility Code already exists');
      	return FALSE;
      }
		  else
		  {
        return TRUE;
      }
	}

      public function fshow()
    {
    $facilityId = $this->uri->segment(3, 0);
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
    $data['facility']=$this->drug_model->get_data_where('facilities',$facilityId);
    $data['faccarts']=$this->drug_model->facilityFaccart($facilityId);

    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('facilities/fshow',$data);
    $this->load->view('common/footer');
    }

  public function createPdf()
  {
    $data['facilities'] = $this->drug_model->get_all_data('facilities');
    $this->load->view('facilities/createPdf',$data);
  }

  public function prodcarts()
  {
    $cartId = $this->uri->segment(3, 0);
    $facilityId = $this->uri->segment(4, 0);
    $data['cartId']=$cartId;
    $data['facility']=$this->drug_model->get_data_where('facilities',$facilityId);
    $data['cartProds']=$this->drug_model->cartProds($cartId);
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
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('facilities/cartProds',$data);
    $this->load->view('common/footer');
  }
}
