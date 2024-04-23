<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Losses extends CI_Controller {
  /**
	 * timo
	 * Copyright (C) Tibralink Limited - All Rights Reserved
 	 * Team preserves the rights to distribute and modify this code under the
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
      //$data['dispenseds'] = $this->drug_model->get_all_dispensed();
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
      $this->load->view('drugs/losses',$data);
      $this->load->view('common/footer');
    }


    	public function create()
    	{
        $data = array('id' => '','name' => '');
        $data['attributes'] = array('class' => 'form-horizontal');
        $data['prop'] = array('class' => 'form-control');
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
    			$rida = $rowa['quantity'];
    			$dropdowna [$rida] = $rowa['name'];
    		}
    		$data['uoms'] = $dropdowna;

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
        $this->load->view('drugs/losses',$data);
        $this->load->view('common/footer');
    	}

      public function store()
      {
        $this->load->library('form_validation');
        $this->load->helper(array('form'));

        $this->form_validation->set_rules('batch', 'Batch Number', 'required');
        $this->form_validation->set_rules('uom', 'Unit of Measure', 'required');
        $this->form_validation->set_rules('quantity', 'Quantity', 'required|numeric');
        if ($this->form_validation->run() === FALSE)
        {
          $this->create();
        }
        else
        {
          $drugRecords=$this->drug_model->get_data_where('drugs', $this->input->post('drug'));
          $stock=$this->input->post('quantity')*$this->input->post('uom');
            $data = array(
              'batch' => $this->input->post('batch'),
              'drugId' => $this->input->post('drug'),
              'uom' => $this->input->post('uom'),
              'quantity' => $this->input->post('quantity'),
              'registeredBy' => $this->session_data['loggedId']
            );
            $this->drug_model->insert_data('losses', $data);
            $new=$this->input->post('quantity')*$this->input->post('uom');
            $newBalance=$drugRecords['currentStock']-$new;
            $datam = array(
                        'currentStock' => $newBalance
                        );
            $this->drug_model->update_data('drugs', $this->input->post('drug'),$datam);
            $this->session->set_flashdata('message', 'You have successfully Remove Damaged drug');
            $this->session->set_flashdata('type', 'success');
            redirect('losses/index');
        }
      }
}
