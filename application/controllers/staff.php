<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Staff extends CI_Controller {
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
    $this->load->model('drug_model','',TRUE);
    $this->session_data = $this->session->userdata('logged_in');
    if(empty($this->session_data))
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
    $this->load->view('staff/index',$data);
    $this->load->view('common/footer');
  }
	}

  public function show()
	{

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

    $resulta = $this->drug_model->get_all_data('roles');
        foreach ($resulta as $rowa)
    		{
    			$rida = $rowa['id'];
    			$dropdowna [$rida] = $rowa['role'];
    		}
    		$data['rolesb'] = $dropdowna;

    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('staff/create',$data);
    $this->load->view('common/footer');
	}

  public function store()
	{
    $this->load->library('form_validation');
		$this->load->helper(array('form'));

    $this->form_validation->set_rules('fname', 'First Name', 'trim|required|alpha');
		$this->form_validation->set_rules('lname', 'Other Names', 'trim|required|alpha');
		$this->form_validation->set_rules('username', 'Username', 'trim|required|callback_username_existance|min_length[6]');
    $this->form_validation->set_rules('facility', 'Facility Name', 'required');
    $this->form_validation->set_rules('role', 'Role', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[6]');
		$this->form_validation->set_rules('cpassword', 'Password Confirmation', 'trim|required|matches[password]');
    if ($this->form_validation->run() === FALSE)
		{
			$this->create();
		}
    else
		{
  	  	$datastaff = array(
					'fname' => $this->input->post('fname'),
					'lname' => $this->input->post('lname'),
          'username' => $this->input->post('username'),
          'roleId' => $this->input->post('role'),
          'facility' => $this->input->post('facility'),
          'password' => do_hash($this->input->post('password')),
          'registeredBy' => $this->session_data['loggedId']
					);
        $staffRegId=$this->drug_model->insert_data('staff', $datastaff);
        $this->session->set_flashdata('message', 'You have successfully registered a staff member');
        $this->session->set_flashdata('type', 'success');
				$this->index();
		}
	}
  function username_existance($username)
	{
		$username= strtolower($username);
    $user_check = $this->drug_model->avail('username', $username,'staff');
    if($user_check !== FALSE)
		 {
			 $this->form_validation->set_message('username_existance', 'Username already exists');
      	return FALSE;
      }
		  else
		  {
        return TRUE;
      }
	}

  public function edit()
	{
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
    $data['attributes'] = array('class' => 'form-horizontal');

    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('staff/edit',$data);
    $this->load->view('common/footer');
	}

  public function update()
	{
    $this->load->library('form_validation');
		$this->load->helper(array('form'));

    $this->form_validation->set_rules('username', 'Username', 'trim|required');
    $this->form_validation->set_rules('opassword', 'Old Password', 'trim|required|min_length[6]');
    $this->form_validation->set_rules('password', 'New Password', 'trim|required|min_length[6]|differs[opassword]');
    $this->form_validation->set_rules('cpassword', 'Confirm New Password', 'trim|required|min_length[6]|matches[password]');
    if ($this->form_validation->run() === FALSE)
		{
			$this->edit();
		}
		else
		{
      $username = $this->input->post('username');
      $opassword  = $this->input->post('opassword');
      $row = $this->drug_model->login($username,$opassword);
      if ($row)
      {
        $data['password']=do_hash($this->input->post('password'));
        $this->drug_model->update_data('staff', $row['id'], $data);
        if($row['id']==$this->session_data['loggedId'])
        {
          $this->session->set_flashdata('message', 'Successfully Changed your password');
          $this->session->set_flashdata('type', 'success');
          redirect('login/logout');
        }
        else
        {
          $this->session->set_flashdata('message', 'Successfully Changed '.$row['fname'].'s password');
          $this->session->set_flashdata('type', 'success');
          redirect('staff/index/');
        }
      }
      else
      {
        $this->session->set_flashdata('message', 'Wrong username and old password combination');
        $this->session->set_flashdata('type', 'danger');
        $this->edit();
      }
    }
	}

  public function destroy()
	{
    $userId = $this->uri->segment(3, 0);
    $data['status']='Deleted';
    $this->drug_model->update_data('staff', $userId, $data);
    $this->index();
	}
}
