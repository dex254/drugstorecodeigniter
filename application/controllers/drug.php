<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Drug extends CI_Controller {
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
    
      $this->session_data=$this->session->userdata('logged_in');
      if (empty($this->session_data))
      {
        redirect('login');
      }
    }

  public function index()
	{
    $data['drugs'] = $this->drug_model->get_drugs();
    $sdata= array('drugs');
    //sort ($sdata);
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
    $this->load->view('common/main',$data);
    $this->load->view('common/footer');
	}

  public function tracers()
  {
    $data['drugs'] = $this->drug_model->get_tracer();
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
    $this->load->view('drugs/tracers',$data);
    $this->load->view('common/footer');
  }

	public function create()
	{
    $data = array('id' => '','category' => '');
    $data['attributes'] = array('class' => 'form-horizontal');
    $data['prop'] = array('class' => 'form-control');
    $result = $this->drug_model->get_all_data('categories');
    foreach ($result as $row)
		{
			$rid = $row['id'];
			$dropdown [$rid] = $row['name'];
		}
		$data['categories'] = $dropdown;

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
    $this->load->view('drugs/create',$data);
    $this->load->view('common/footer');
	}

  public function store()
	{
    $this->load->library('form_validation');
		$this->load->helper(array('form'));

    $this->form_validation->set_rules('name', 'Drug Name', 'required|callback_name_existance');
    if ($this->form_validation->run() === FALSE)
		{
			$this->create();
		}
    else
		{
  	  	$datadrug = array(
          'name' => $this->input->post('name'),
          'category' => $this->input->post('category'),
          'registered_by' => $this->session_data['loggedId']
        );
        $this->drug_model->insert_data('drugs', $datadrug);
        $this->session->set_flashdata('message', 'You have successfully registered a new drug');
        $this->session->set_flashdata('type', 'success');
  			redirect('dashboard');
    }
  }

  function name_existance($name)
	{
		$name= strtolower($name);
    $user_check = $this->drug_model->avail('name', $name,'drugs');
    if($user_check !== FALSE)
		 {
			 $this->form_validation->set_message('name_existance', 'Drug name already exists');
      	return FALSE;
      }
		  else
		  {
        return TRUE;
      }
	}

    public function show()
{
  $facilityId = $this->uri->segment(4, 0);
  $drugId = $this->uri->segment(3, 0);
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
  $data['drug']=$this->drug_model->get_facility_issued_all($drugId);
  $data['issues'] = $this->drug_model->get_facilities_issued_all($facilityId,$drugId);
  //var_dump($data['issues']);
  //echo $loanId;

  $this->load->view('common/header');
  $this->load->view('common/navigation',$ndata);
  $this->load->view('drugs/show',$data);
  $this->load->view('common/footer');
 }

  public function createItemPdf()
  {
    $data['date']=date('Y-M');
    $data['title']=date('M Y').' ITEM REPORT AS OF '.date('D,d-M-Y');
    $data['drugs'] = $this->drug_model->get_issued_item();
    //var_dump($data['drugs']);
    $this->load->view('drugs/createItemPdf',$data);
  }
  public function createSingleDrugPdf()
  {
    $data['drugs'] = $this->drug_model->get_quantity_issued();
    $data['title']='Drug Issued to Each Facility '.date('D, d-M-Y');
    $this->load->view('drugs/createSingleDrugPdf',$data);
  }
  public function createreportPdf()
  {
    $data['date']=date('Y-M');
    $data['title']=date('M Y').' DRUGS MONTHLY REPORT AS OF '.date('D,d-M-Y');
    $data['drugs'] = $this->drug_model->get_monthly_report(date('Y-m'));
    //var_dump($data['drugs']);
    $this->load->view('drugs/createreportPdf',$data);
  }

  public function createdrugPdf()
  {
    $data['drugs'] = $this->drug_model->get_all_drugs();
    $data['title']='LIST OF OUT OF ALL DRUGS AS AT '.date('D, d-M-Y');
    $this->load->view('drugs/createdrugPdf',$data);
  }
  public function createstocktakePdf()
  {
    $data['drugs'] = $this->drug_model->get_all_drugs();
    $data['title']='ANNUAL STOCK TAKE 2019/2020 CENTRAL DRUG STORE';
    $this->load->view('drugs/createstocktakePdf',$data);
  }

  public function createinstockfPdf()
  {
    $data['drugs'] = $this->drug_model->inStock();
    $data['title']='ANNUAL STOCK TAKE 2018/2019 CENTRAL DRUG STORE';
    $this->load->view('drugs/createinstockfPdf',$data);
  }
  public function createPdf()
  {
    $data['drugs'] = $this->drug_model->inStock();
    $data['title']='LIST OF DRUGS IN STOCK AS AT '.date('D, d-M-Y');
    $this->load->view('drugs/createstockPdf',$data);
  }
  public function createreceivedPdf()
  {
    $data['drugs'] = $this->drug_model->inStockr();
    $data['title']='LIST OF DRUGS IN STOCK AS AT '.date('D, d-M-Y');
    $this->load->view('drugs/createstockrPdf',$data);
  }
  public function createoutofStockPdf()
  {
    $data['drugs'] = $this->drug_model->outofStock();
    $data['title']='LIST OF OUT OF STOCK DRUGS AS AT '.date('D, d-M-Y');
    $this->load->view('drugs/createstockPdf',$data);
  }
  public function createreorderPdf()
  {
    $data['drugs'] = $this->drug_model->reorder();
    $data['title']='LIST OF DRUGS TO BE RE-ORDERED AS AT '.date('D, d-M-Y');
    $this->load->view('drugs/createstockPdf',$data);
  }

  public function expiryPdf1()
  {
    $data['drugs'] = $this->drug_model->get_expiry_drugs(date('Y-m-d',strtotime(date('Y-m-d').'+ 181 day')),date('Y-m-d',strtotime(date('Y-m-d').'+ 364 day')));
    $data['title']='LIST OF DRUGS TO EXPIRE BETWEEN '.date('Y-m-d',strtotime(date('Y-m-d').'+ 181 day')).' AND '.date('Y-m-d',strtotime(date('Y-m-d').'+ 364 day'));
    $this->load->view('drugs/expiryPdf',$data);
  }

  public function expiryPdf2()
  {
    $data['drugs'] = $this->drug_model->get_expiry_drugs(date('Y-m-d',strtotime(date('Y-m-d').'+ 91 day')),date('Y-m-d',strtotime(date('Y-m-d').'+ 180 day')));
    $data['title']='LIST OF DRUGS TO EXPIRE BETWEEN '.date('Y-m-d',strtotime(date('Y-m-d').'+ 91 day')).' - '.date('Y-m-d',strtotime(date('Y-m-d').'+ 180 day'));
    $this->load->view('drugs/expiryPdf',$data);
  }

  public function expiryPdf3()
  {

    $data['drugs'] = $this->drug_model->get_expiry_drugs(date('Y-m-d',strtotime(date('Y-m-d').'+ 1 day')),date('Y-m-d',strtotime(date('Y-m-d').'+ 90 day')));
    //var_dump($data['drugs']);
    $data['title']='LIST OF DRUGS TO EXPIRE BETWEEN '.date('Y-m-d',strtotime(date('Y-m-d').'+ 1 day')).' - '.date('Y-m-d',strtotime(date('Y-m-d').'+ 90 day'));
    $this->load->view('drugs/expiryPdf',$data);
  }

  public function expiredPdf()
  {
    $data['drugs'] = $this->drug_model->get_expired_drugs(date('Y-m-d'));
    $data['title']='LIST OF EXPIRED DRUGS AS OF '.date('D,d-m-Y');
    $this->load->view('drugs/expiryPdf',$data);
  }
}
