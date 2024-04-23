<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Received extends CI_Controller {
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
  var $unique;

  public function index()
  {
  $receivedId = $this->uri->segment(3, 0);
  //$dispensedId = $this->uri->segment(4, 0);
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
  $data['receive']=$this->drug_model->get_data_where('received',$receivedId);
  $data['denotes']=$this->drug_model->receivedDenote();
  //$data['issues'] = $this->drug_model->get_facilities_issued_all($facilityId,$dispensedId);
  //var_dump($data['issues']);
  //echo $loanId;

  $this->load->view('common/header');
  $this->load->view('common/navigation',$ndata);
  $this->load->view('drugs/received',$data);
  $this->load->view('common/footer');
  }

public function recshow()
    {
    $denoteId = $this->uri->segment(3, 0);
    $receivedId = $this->uri->segment(4, 0);
    $data['denoteId']=$denoteId;
    $data['denote']=$this->drug_model->get_data_where('denote',$denoteId);
    $data['denRecs']=$this->drug_model->get_delivery_received_all($denoteId);
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
    $this->load->view('drugs/recshow',$data);
    $this->load->view('common/footer');
  }


  public function delivery()
  {
    $ndata['login']=$this->session_data;
    if ($this->session_data['role']==3) {
    $denoteCart=$this->drug_model->pickrecCart($this->session_data['loggedId']);
    if($denoteCart['status']==1)
    {
      $this->session->set_flashdata('message', 'You have already created another Delivery Note');
      $this->session->set_flashdata('type', 'danger');
      redirect($_SERVER['HTTP_REFERER']);
    }
    else
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
      $this->load->view('common/header');
      $this->load->view('common/navigation',$ndata);
      $this->load->view('drugs/delivery');
      $this->load->view('common/footer');
    }
  }
  else {
    redirect('received/create', 'refresh');
  }
  }

  public function deliveryCart()
  {
    $this->load->library('form_validation');
		$this->load->helper(array('form'));

    $this->form_validation->set_rules('deliveryNo', 'Delivery Note', 'required');
    $this->form_validation->set_rules('supplier', 'Supplier', 'required');
    $this->form_validation->set_rules('funds', 'Funded By', 'required');
    $this->form_validation->set_rules('deliveredBy', 'Delivered By', 'required');
    if ($this->form_validation->run() === FALSE)
		{
			$this->delivery();
		}
    else
		{
      $data = array(
        'deliveryNo' => $this->input->post('deliveryNo'),
        'supplier' => $this->input->post('supplier'),
        'funds' => $this->input->post('funds'),
        'deliveredBy' => $this->input->post('deliveredBy'),
        'status' => 1,
        'regBy' => $this->session_data['loggedId']
      );
      $content=$this->drug_model->insert_data('denote', $data);
      redirect('', 'refresh');
    }
  }

	public function create()
	{
    $denoteCart=$this->drug_model->pickrecCart();
    if($denoteCart['status']==1)
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
			$rida = $rowa['id'];
			$dropdowna [$rida] = $rowa['name'];
		}
		$data['uoms'] = $dropdowna;
    //var_dump($data['uoms']);
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
    $data['denoteId']=$denoteCart['id'];
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('drugs/receive',$data);
    $this->load->view('common/footer');
  }
  else
    {
    $this->session->set_flashdata('message', 'There is no created delivery note yet. Please contact the officer in charge');
    $this->session->set_flashdata('type', 'danger');
    redirect($_SERVER['HTTP_REFERER']);
    }
	}

  public function store()
	{
    $this->load->library('form_validation');
		$this->load->helper(array('form'));

    $this->form_validation->set_rules('batch', 'Batch Number', 'required');
    $this->form_validation->set_rules('uom', 'Unit of Measure', 'required');
    $this->form_validation->set_rules('quantity', 'Quantity', 'required|numeric');
    $this->form_validation->set_rules('expiry', 'Expiry Date', 'required');
    if ($this->form_validation->run() === FALSE)
		{
			$this->create($this->input->post('denoteId'));
		}
    else
		{
      $drugRecords=$this->drug_model->get_data_where('drugs', $this->input->post('drug'));
      $quan=$this->drug_model->get_data_where('uom', $this->input->post('uom'));
      $stock=$this->input->post('quantity');
      $totalCost=$stock*$this->input->post('cost');
  	  	$data = array(
          'batch' => $this->input->post('batch'),
          'denoteId' => $this->input->post('denoteId'),
          'drugId' => $this->input->post('drug'),
          'uom' => $this->input->post('uom'),
          'quantity' => $this->input->post('quantity'),
          'stock' => $stock,
          'cost' => $this->input->post('cost'),
          'totalCost' => $totalCost,
          'expiry' => $this->input->post('expiry'),
          'registeredBy' => $this->session_data['loggedId']
        );
        $this->drug_model->insert_data('received', $data);
        $quant=$this->drug_model->get_data_where('uom', $this->input->post('uom'));
        $new=$this->input->post('quantity');
        $newBalance=$drugRecords['currentStock']+$new;
        $datam = array(
                    'currentStock' => $newBalance
                    );
        $this->drug_model->update_data('drugs', $this->input->post('drug'),$datam);
        $this->session->set_flashdata('message', 'You have successfully received a drug');
        $this->session->set_flashdata('type', 'success');
  			//$this->delivery($this->input->post('denoteId'));
        redirect('received/delivery', 'refresh');
    }
  }


  public function recCreate()
  {
    $data = array('id' => '','name' => '');
    $data['attributes'] = array('class' => 'form-horizontal');
    $data['prop'] = array('class' => 'form-control');
    $cart=$this->drug_model->pickrecCart($this->session_data['loggedId']);
    if($cart['status']==1)
    {
      $this->contp();
    }
    else
    {
    $ndata['login']=$this->session_data;
    if ($this->session_data['role']==3) {
    $ndata['cart'] = $this->drug_model->countWaitingrecCart();
    }
    else {
    $ndata['cart'] = $this->drug_model->countrecCart($this->session_data['loggedId']);
    }
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('drugs/rec');
    $this->load->view('common/footer');
    }
  }

  public function inchargereCheckout()
  {
    $data['attributes'] = array('id' => 'inchargereCheckout');
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
    $data['recCarts']=$this->drug_model->recartDrugs($this->session_data['loggedId']);
    $data['sum']=$this->drug_model->get_sum();
    $data['pickrecCartcart']=$this->drug_model->pickrecCart($this->session_data['loggedId']);
    //var_dump($data['sum']);
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('drugs/inchargereCheckout',$data);
    $this->load->view('common/footer1');
  }

  public function approved()
  {
    $this->load->library('form_validation');
		$this->load->helper(array('form'));
    $data = array(
      'approvedBy' => $this->session_data['loggedId'],
      'totalCost' => $this->input->post('totalCost'),
      'status' => 4);
      $recCart=$this->drug_model->pickrecCart($this->session_data['loggedId']);
      $this->drug_model->update_data('denote', $recCart['id'],$data);
      $this->createreCheckPdf($recCart['id']);

    redirect('received/delivery');
  }

  public function recheckout()
  {
    $data['attributes'] = array('id' => 'recheckout');
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
    $data['recCarts']=$this->drug_model->recCartDrugs($this->session_data['loggedId']);
    $data['pickrecCartcart']=$this->drug_model->pickrecCart($this->session_data['loggedId']);
    //var_dump($data['carts']);
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('drugs/recheckout',$data);
    $this->load->view('common/footer1');
  }

  public function deliveryNum()
  {
    $this->load->library('form_validation');
    $this->load->helper(array('form'));
    $carts=$this->drug_model->twoFields('reccart',$this->input->post('dNote'),'dNote', $this->session_data['loggedId'],'regBy');
    $this->form_validation->set_rules('orderno', 'Order Number', 'required');
    $this->form_validation->set_rules('supplier', 'Suppliers Name', 'required');
    if ($this->form_validation->run() === FALSE)
		{
			$this->recCreate();
		}
    else
		{
      if (!isset($carts['id'])) {
        $cartData=array(
          'dNote'=>$this->input->post('dNote'),
          'orderno'=>$this->input->post('orderNo'),
          'supplier'=>$this->input->post('supplier'),
          'regBy'=>$this->session_data['loggedId']
        );
        $cartId=$this->drug_model->insert_data('reccart', $cartData);
        $this->session->set_userdata('cartId', $cartId);
      }
      $this->contp();
    }
  }
  public function createPdf()
  {
    $data['receiveds'] = $this->drug_model->get_all_received();
    $this->load->view('drugs/createreceivedPdf',$data);
  }

  public function contp($value='')
  {
      //////////////////////////
      $data = array('id' => '','name' => '');
      $data['attributes'] = array('class' => 'form-horizontal');
      $data['prop'] = array('class' => 'form-control');
      /////////////////////////
      $ndata['login']=$this->session_data;
      if ($this->session_data['role']==3) {
        $ndata['cart'] = $this->drug_model->countWaitingrecCart();
      }
      else {
      $ndata['cart'] = $this->drug_model->countrecCart($this->session_data['loggedId']);
      }

      $this->load->view('common/header');
      $this->load->view('common/navigation',$ndata);
      $this->load->view('drugs/receive',$data);
      $this->load->view('common/footer');

  }

  public function createPdf1()
  {
    $data['date']=date('Y-M');
    $data['title']='LIST OF RECIEVED DRUGS AS OF '.date('D,d-M-Y');
    $data['receiveds'] = $this->drug_model->get_monthly_received(date('Y-m'));
    $this->load->view('drugs/createreceivedPdf1',$data);
  }

  public function createPdfDaily()
{
  $data['date']=date('Y-M-d');
  $data['title']='LIST OF TODAY RECIEVED DRUGS AS OF '.date('D,d-M-Y');
  $data['receiveds'] = $this->drug_model->get_daily_received(date('Y-m-d'));
  $this->load->view('drugs/createreceivedPdf1',$data);
}

  public function createPdf2()
  {
    $data['date']=date('Y-M',strtotime(date('Y-m').'- 1 month'));
    $data['title']='LIST OF RECIEVED DRUGS AS OF '.date('Y-M',strtotime(date('Y-m').'- 1 month'));
    $data['receiveds'] = $this->drug_model->get_monthly_received(date('Y-m',strtotime(date('Y-m').'- 1 month')));
    $this->load->view('drugs/createreceivedPdf1',$data);
  }

  public function createPdf3()
  {
    $data['date']=date('Y-M',strtotime(date('Y-m').'- 2 month'));
    $data['title']='LIST OF RECIEVED DRUGS AS OF '.date('Y-M',strtotime(date('Y-m').'- 2 month'));
    $data['receiveds'] = $this->drug_model->get_monthly_received(date('Y-m',strtotime(date('Y-m').'- 2 month')));
    $this->load->view('drugs/createreceivedPdf1',$data);
  }

  public function createPdf4()
  {
    $data['date']=date('Y-M',strtotime(date('Y-m').'- 3 month'));
    $data['title']='LIST OF RECIEVED DRUGS AS OF '.date('Y-M',strtotime(date('Y-m').'- 3 month'));
    $data['receiveds'] = $this->drug_model->get_monthly_received(date('Y-m',strtotime(date('Y-m').'- 3 month')));
    $this->load->view('drugs/createreceivedPdf1',$data);
  }
  public function createreCheckPdf($denoteId=null)
  {
    //var $recCartId;
    if ($denoteId==null)
    {
      $this->unique=$this->uri->segment(3, 0);
    }
    else {
      $this->unique=$denoteId;
    }
    //echo $this->unique;
    $data['values']=$this->drug_model->receiptdelivered($this->unique);
    $data['recartDetails']=$this->drug_model->recartDetails($this->unique);
    //var_dump($data['values']);
    $data['approving']=$this->drug_model->get_data_where('staff',$data['recartDetails']['approvedBy']);
    $this->load->view('drugs/createreCheckPdf',$data);
  }
  public function destroy()
  {
    $rid = $this->uri->segment(3, 0);
    $this->drug_model->delete('received','id',$rid);
    $this->recheckout();
  }

}
