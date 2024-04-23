<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dispense extends CI_Controller {
  /**
	 * Aqua
	 * Copyright (C) Tibralink Limited - All Rights Reserved
 	 * Tibralink preserves the rights to distribute and modify this code under the
   * terms signed with the client on the delivery of this system.
	 */
  function __construct()
    {
      parent::__construct();
      ini_set('max_execution_time', 0);
      ini_set('memory_limit', '-1');
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

    var $cartIdGl;

  public function index()
  	{
    $issuedId = $this->uri->segment(3, 0);
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
    $data['issue']=$this->drug_model->get_data_where('productcart',$issuedId);
    $data['faccarts']=$this->drug_model->issuedFaccartwl();

    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('drugs/dispensed',$data);
    $this->load->view('common/footer');
    }

    /*
    * This function is used to dispense drugs through the use of workloads
    */

    public function dispenseWL()
    {
      $drugs=$this->drug_model->get_all_data('drugs');
      $facilities=$this->drug_model->get_all_data('facilities');
      $last=$this->drug_model->get_last_record('dispensewl','id');
      foreach ($drugs as $drug)
      {
        $dispenseId=$last['dispenseId']+1;
    if($drug['tracer']==9)
        {
        $facilities=$this->drug_model->get_someantid_facilities();
        foreach ($facilities as $facility)
        {
          $totalWl=$this->drug_model->sumantidTracer();
          $wlRatio=$facility['antidWorkload']/$totalWl['sumwl'];
          $quantity=round($wlRatio*$drug['currentStock']);
          $data=array(
            'drugId'=>$drug['id'],
            'facilityId'=>$facility['id'],
            'dispenseId'=>$dispenseId,
            'quantity'=>$quantity,
            'registeredBy'=>$this->session_data['loggedId']
          );
          $this->drug_model->insert_data('dispensewl', $data);
        }
      }

      elseif($drug['category']==4)
              {
              $facilities=$this->drug_model->get_somelab_facilities();
              foreach ($facilities as $facility)
              {
                $totalWl=$this->drug_model->sumlabTracer();
                $wlRatio=$facility['workload']/$totalWl['sumwl'];
                $quantity=round($wlRatio*$drug['currentStock']);
                $data=array(
                  'drugId'=>$drug['id'],
                  'facilityId'=>$facility['id'],
                  'dispenseId'=>$dispenseId,
                  'quantity'=>$quantity,
                  'registeredBy'=>$this->session_data['loggedId']
                );
                $this->drug_model->insert_data('dispensewl', $data);
              }
            }
        elseif($drug['istatus']==1)
        {
        $facilities=$this->drug_model->get_some_facilities(1);
        foreach ($facilities as $facility)
        {
          $totalWl=$this->drug_model->sumTracer(1);
          $wlRatio=$facility['workload']/$totalWl['sumwl'];
          $quantity=round($wlRatio*$drug['currentStock']);
          $data=array(
            'drugId'=>$drug['id'],
            'facilityId'=>$facility['id'],
            'dispenseId'=>$dispenseId,
            'quantity'=>$quantity,
            'registeredBy'=>$this->session_data['loggedId']
          );
          $this->drug_model->insert_data('dispensewl', $data);
        }
      }
      elseif ($drug['istatus']==2)
      {
        $facilities=$this->drug_model->get_some_facilities(2);
        foreach ($facilities as $facility)
        {
          $totalWl=$this->drug_model->sumTracer(2);
          $wlRatio=$facility['workload']/$totalWl['sumwl'];
          $quantity=round($wlRatio*$drug['currentStock']);
          $data=array(
            'drugId'=>$drug['id'],
            'facilityId'=>$facility['id'],
            'dispenseId'=>$dispenseId,
            'quantity'=>$quantity,
            'registeredBy'=>$this->session_data['loggedId']
          );
          $this->drug_model->insert_data('dispensewl', $data);
        }
      }
      elseif ($drug['istatus']==3)
      {
        $facilities=$this->drug_model->get_some_facilities(3);
        foreach ($facilities as $facility)
        {
          $totalWl=$this->drug_model->sumTracer(3);
          $wlRatio=$facility['workload']/$totalWl['sumwl'];
          $quantity=round($wlRatio*$drug['currentStock']);
          $data=array(
            'drugId'=>$drug['id'],
            'facilityId'=>$facility['id'],
            'dispenseId'=>$dispenseId,
            'quantity'=>$quantity,
            'registeredBy'=>$this->session_data['loggedId']
          );
          $this->drug_model->insert_data('dispensewl', $data);
        }
      }
      elseif ($drug['istatus']==4)
      {
        $facilities=$this->drug_model->get_some_facilities(4);
        foreach ($facilities as $facility)
        {
          $totalWl=$this->drug_model->sumTracer(4);
          $wlRatio=$facility['workload']/$totalWl['sumwl'];
          $quantity=round($wlRatio*$drug['currentStock']);
          $data=array(
            'drugId'=>$drug['id'],
            'facilityId'=>$facility['id'],
            'dispenseId'=>$dispenseId,
            'quantity'=>$quantity,
            'registeredBy'=>$this->session_data['loggedId']
          );
          $this->drug_model->insert_data('dispensewl', $data);
        }
      }
      elseif ($drug['istatus']==5)
      {
        $facilities=$this->drug_model->get_some_facilities(5);
        foreach ($facilities as $facility)
        {
          $totalWl=$this->drug_model->sumTracer(5);
          $wlRatio=$facility['workload']/$totalWl['sumwl'];
          $quantity=round($wlRatio*$drug['currentStock']);
          $data=array(
            'drugId'=>$drug['id'],
            'facilityId'=>$facility['id'],
            'dispenseId'=>$dispenseId,
            'quantity'=>$quantity,
            'registeredBy'=>$this->session_data['loggedId']
          );
          $this->drug_model->insert_data('dispensewl', $data);
        }
      }
    }
    $this->dispense_wn_pdf();
    }

    public function dispense_wl_pdf()
    {
      $drugs=$this->drug_model->get_all_data('drugs');
      $data['facilities']=$this->drug_model->get_all_data('facilities');
      $last=$this->drug_model->get_last_record('dispensewl','id');
      $x=$last['dispenseId']+1;
      $data['dispensedwls']=$this->drug_model->dispensewl($x);
      $this->load->view('drugs/dispense_wl_pdf',$data);
    }
    public function dispense_wn_pdf()
    {
      $drugs=$this->drug_model->get_all_data('drugs');
      $data['facilities']=$this->drug_model->get_all_data('facilities');
      $last=$this->drug_model->get_last_record('dispensewl','id');
      $x=$last['dispenseId'];
      $data['dispensedwls']=$this->drug_model->dispensewl($x);
      //echo $x;
      //var_dump($data['dispensedwls']);
      //echo
      /*foreach ($data['facilities'] as $value)
      {
        echo $value['name'].' === '.$value['workload'];
        echo "<br>";
        echo "===================================================";
        echo "<br>";


      foreach ($data['dispensedwls'] as $key)
      {
        if ($key['facilityId']==$value['id']) {
        echo $key['quantity'].' === '.$key['name'].' === '.$key['facilityId'];
        echo "<br>";
      }
      }
    }*/
      $this->load->view('drugs/dispense_wl_pdf',$data);
    }




    public function isshow()
        {
        $faccartId = $this->uri->segment(3, 0);
        $issuedId = $this->uri->segment(4, 0);
        $data['dispenseId']=$faccartId;
        $data['faccart']=$this->drug_model->issuedFac($faccartId);
        $data['facProds']=$this->drug_model->get_cart_issued_all($faccartId);
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
        $this->load->view('drugs/isshow',$data);
        $this->load->view('common/footer');
      }

    public function batchCreate()
    {
      $cart=$this->drug_model->pickCartwl($this->session_data['loggedId']);
      if($cart['status']==3)
      {
        $this->contp();
      }
      else
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
      $this->load->view('drugs/batchFac',$data);
      $this->load->view('common/footer');
      }
    }

  public function batchNumbers()
  {
    $carts=$this->drug_model->twoFields('faccart',$this->input->post('facility'),'facilityId',$this->session_data['loggedId'],'regBy');
    $this->load->library('form_validation');
		$this->load->helper(array('form'));
    $this->form_validation->set_rules('requisition', 'Requisition Officer', 'required');
    $this->form_validation->set_rules('designation', 'Designation', 'required');
    if ($this->form_validation->run() === FALSE)
		{
			$this->create();
		}
    else
		{
      if (!isset($carts['id'])) {
        $cartData=array(
          'facilityId'=>$this->input->post('facility'),
          'requisition'=>$this->input->post('requisition'),
          'designation'=>$this->input->post('designation'),
          'regBy'=>$this->session_data['loggedId']
        );
        $cartId=$this->drug_model->insert_data('faccart', $cartData);
        //$facs=$this->drug_model->get_data_where('facilities', $this->input->post('facility'));
        $this->session->set_userdata('cartId', $cartId);
      }
      $this->contp();
    }
  }

  public function contp($value='')
  {
      //////////////////////////
      $data = array('id' => '','name' => '');
      $data['attributes'] = array('class' => 'form-horizontal');
      $data['prop'] = array('class' => 'form-control');
      $resulta = $this->drug_model->get_all_data('drugs');
      foreach ($resulta as $rowa)
      {
        $rida = $rowa['id'];
        $dropdowna [$rida] = $rowa['name'];
      }
      $data['drugs'] = $dropdowna;
      /////////////////////////
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
      //$drugId=$this->input->post('drug');
      //$data['batchDetails'] = $this->drug_model->get_batchDetails($drugId);

      $this->load->view('common/header');
      $this->load->view('common/navigation',$ndata);
      $this->load->view('drugs/batchDispense',$data);
      $this->load->view('common/footer');

  }

  public function batchNums()
  {
    $drugId=$this->input->post('drug');
    $data['batchDetails'] = $this->drug_model->get_batchDetails($drugId);

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
    $this->load->view('drugs/batchNumbers',$data);
    $this->load->view('common/footer');
  }

  public function batchNumst()
  {
    $drugId=$this->uri->segment(3, 0);
    $data['batchDetails'] = $this->drug_model->get_batchDetails($drugId);

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
    $this->load->view('drugs/batchNumbers',$data);
    $this->load->view('common/footer');
  }

	public function create()
	{
      $data['attributes'] = array('class' => 'form-horizontal');
      $receivedId = $this->uri->segment(3, 0);
      $data['batchDetails'] = $this->drug_model->get_single_batchDetails($receivedId);
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
      $this->load->view('drugs/dispense',$data);
      $this->load->view('common/footer');
	}

  public function store()
	{
    $this->load->library('form_validation');
		$this->load->helper(array('form'));
    $this->form_validation->set_rules('quantity', 'Quantity', 'required|numeric');
    $this->form_validation->set_rules('drug', 'Drug Name', 'required');
    if ($this->form_validation->run() === FALSE)
		{
			$this->create();
		}
    else
		{
        $cart=$this->drug_model->pickCartwl($this->session_data['loggedId']);
        //var_dump($cart);
        $data = array(
          'faccartwlId' => $cart['id'],
          'drugId' => $this->input->post('drug'),
          'quantity' => $this->input->post('quantity'),
          'regBy' => $this->session_data['loggedId']
        );
        $this->drug_model->insert_data('prodcartwl', $data);
        $this->session->set_flashdata('message', 'You have successfully added drug into the cart');
        $this->session->set_flashdata('type', 'success');
  			redirect('dispense/batchCreate');
    }
  }

  public function facShow()
  {
    $cartId = $this->uri->segment(3, 0);
    $data['cartProds']=$this->drug_model->cartProds($cartId);
    $data['faccart']=$this->drug_model->pickCheckCart($cartId);
    $datan = array(
                'status' => 3,
                'approvedBy' => $this->session_data['loggedId']
                );
    $this->drug_model->update_data('faccart', $cartId,$datan);
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
    $this->load->view('drugs/facShow',$data);
    $this->load->view('common/footer1');
  }

  public function checked()
  {
    $this->load->library('form_validation');
    $val1=sizeof($this->input->post())-2;
    $val=$val1/3;
    for ($i=1; $i<=$val; $i++) {
      $datapc = array(
        'approvedQuant' => $this->input->post('approvedquant'.$i)
      );
      $this->drug_model->update_data('prodcartwl', $this->input->post('pcid'.$i),$datapc);
      $drugRecords=$this->drug_model->get_data_where('drugs', $this->input->post('drugId'.$i));
      $newBalance=$drugRecords['currentStock']-$this->input->post('approvedquant'.$i);
      $datam = array(
                  'currentStock' => $newBalance
                  );
      $this->drug_model->update_data('drugs', $this->input->post('drugId'.$i),$datam);
      $this->cartIdGl=$this->input->post('cartId'.$i);
    }

    $datafc = array(
      'approvedBy' => $this->session_data['loggedId'],
      'status' => 4
    );
    $this->drug_model->update_data('faccart', $this->input->post('cartId'),$datafc);
    $this->createCheckPdf($this->input->post('cartId'));
  }

  public function createCheckPdf($cartId)
  {
    $data['values']=$this->drug_model->receiptIssued($cartId);
    $data['cartDetails']=$this->drug_model->cartDetails($cartId);
    $data['issuing']=$this->drug_model->staffDispense('regBy',$cartId);
    $data['approving']=$this->drug_model->get_data_where('staff',$data['cartDetails']['approvedBy']);
    $this->load->view('drugs/createCheckPdf',$data);
  }

  public function createAnotherCheckPdf()
  {
    $cartId = $this->uri->segment(3, 0);
    $data['values']=$this->drug_model->receiptIssued($cartId);
    $data['cartDetails']=$this->drug_model->cartDetails($cartId);
    $data['issuing']=$this->drug_model->staffDispense('regBy',$cartId);
    $data['approving']=$this->drug_model->get_data_where('staff',$data['cartDetails']['approvedBy']);
    $this->load->view('drugs/createCheckPdf',$data);
  }

  public function checkout()
  {
    $data['attributes'] = array('id' => 'checkout');
    $ndata['login']=$this->session_data;
    if ($this->session_data['role']==1)
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
    $data['carts']=$this->drug_model->cartDrugswl($this->session_data['loggedId']);
    $data['pickcart']=$this->drug_model->pickCart($this->session_data['loggedId']);
    //var_dump($data['carts']);
    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('drugs/checkout',$data);
    $this->load->view('common/footer1');
  }

  public function inchargeCheckout()
  {
    $inProgress=$this->drug_model->checkInProgress($this->session_data['loggedId']);
    if (isset($inProgress['id']))
    {
      $this->session->set_flashdata('message', 'Please complete approving the items below before starting another one!');
      $this->session->set_flashdata('type', 'danger');
      redirect('dispense/facShow/'.$inProgress['id']);
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

    $data['faccarts'] = $this->drug_model->faccartCheck();

    $this->load->view('common/header');
    $this->load->view('common/navigation',$ndata);
    $this->load->view('drugs/inchargeCheckout',$data);
    $this->load->view('common/footer');
    }
  }

  public function requested()
  {
    $this->load->library('form_validation');
		$this->load->helper(array('form'));
    $data = array(
      'status' => 2);
      $cart=$this->drug_model->pickCart($this->session_data['loggedId']);
      $this->drug_model->update_data('faccart', $cart['id'],$data);
    $val=(sizeof($this->input->post()))/4;
    for ($i=1; $i<=$val; $i++) {
  		{
    $data = array(
        'faccartwlId' => $cart['id'],
        'drugId' => $this->input->post('drugId'.$i),
        'quantity' => $this->input->post('quantity'.$i),
        'regBy' => $this->session_data['loggedId']
      );
    $this->drug_model->insert_data('prodcartwl', $data);
      }

    }
    redirect('dispense/batchCreate');
  }

    public function createPdf()
    {
      $data['dispenseds'] = $this->drug_model->get_all_dispensed();
      $this->load->view('drugs/createdispensedPdf',$data);
    }

    public function createPdf1()
    {
      $data['date']=date('Y-M');
      $data['dispenseds'] = $this->drug_model->get_monthly_dispensed(date('Y-m'));
      //var_dump($data['dispenseds']);
      $this->load->view('drugs/createdispensedPdf1',$data);
    }

    public function createPdfIssued()
  {
    $data['date']=date('Y-M-d');
    $data['title']='LIST OF TODAY ISSUED DRUGS AS OF '.date('D,d-M-Y');
    $data['dispenseds'] = $this->drug_model->get_daily_dispensed(date('Y-m-d'));
    $this->load->view('drugs/createdispensedPdf1',$data);
  }


    public function createPdf2()
    {
      $data['date']=date('Y-M',strtotime(date('Y-m').'- 1 month'));
      $data['dispenseds'] = $this->drug_model->get_monthly_dispensed(date('Y-m',strtotime(date('Y-m').'- 1 month')));
      $this->load->view('drugs/createdispensedPdf1',$data);
    }

    public function createPdf3()
    {
      $data['date']=date('Y-M',strtotime(date('Y-m').'- 2 month'));
      $data['dispenseds'] = $this->drug_model->get_monthly_dispensed(date('Y-m',strtotime(date('Y-m').'- 2 month')));
      $this->load->view('drugs/createdispensedPdf1',$data);
    }

    public function createPdf4()
    {
      $data['date']=date('Y-M',strtotime(date('Y-m').'- 3 month'));
      $data['dispenseds'] = $this->drug_model->get_monthly_dispensed(date('Y-m',strtotime(date('Y-m').'- 3 month')));
      $this->load->view('drugs/createdispensedPdf1',$data);
    }

    public function destroy()
    {
      $rid = $this->uri->segment(3, 0);
      $this->drug_model->delete('dispensewl','id',$rid);
      $this->checkout();
    }

}
