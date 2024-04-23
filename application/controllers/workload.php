<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Workload extends CI_Controller {
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
        $cart=$this->drug_model->pickCartwl($this->session_data['loggedId']);
        if($cart['status']==1)
        {
          $this->dispatchwl();
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
        $this->load->view('workload/create',$data);
        $this->load->view('common/footer');
        }
      }

      public function dispatchwl()
      {
        $data['drugs'] = $this->drug_model->get_available_drugs();
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
        $this->load->view('workload/index',$data);
        $this->load->view('common/footer');
      }

      public function store()
      {
        $carts=$this->drug_model->twoFields('faccartWl',$this->input->post('facility'),'facilityId',$this->session_data['loggedId'],'regBy');
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
              'status' => 1,
              'regBy'=>$this->session_data['loggedId']
            );
            $cartId=$this->drug_model->insert_data('faccartWl', $cartData);
            $this->session->set_userdata('cartId', $cartId);
          }
          $this->dispatchwl();
        }
      }


    function addToCart()
  		{
        $prod_id = $this->uri->segment(3, 0);
        //echo $prod_id;
  			// Fetch specific product by ID
  			$product = $this->drug_model->getRows($prod_id);
        //var_dump($product);
        $quant=$product['currentStock']*$product['workloadRatio'];
  			$cart=$this->drug_model->pickCartwl($this->session_data['loggedId']);
  			// Add product to the cart
  			$data = array(
  					'drugId'    => $product['id'],
            'faccartwlId'    => $cart['id'],
  					'uom'    => $product['uom'],
  					'quantity'    => $quant,
            'regBy' => $this->session_data['loggedId']
  			);
  			$basketspareId=$this->drug_model->insert_data('prodcartwl', $data);
  			// Redirect to the cart page
  			$this->dispatchwl();
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
            $this->wlshow();
          }
        }

      public function check()
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

        $data['faccarts'] = $this->drug_model->dswlcartCheck();

        $this->load->view('common/header');
        $this->load->view('common/navigation',$ndata);
        $this->load->view('workload/check',$data);
        $this->load->view('common/footer');
        }
      }

      public function wlshow()
      {
        $data['attributes'] = array('id' => 'checkout');
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
        $data['cartswl']=$this->drug_model->cartDrugswl($this->session_data['loggedId']);
        $data['pickcartwl']=$this->drug_model->pickCartwl($this->session_data['loggedId']);
        //var_dump($data['cartswl']);
        $this->load->view('common/header');
        $this->load->view('common/navigation',$ndata);
        $this->load->view('workload/checkout',$data);
        $this->load->view('common/footer1');

          }

      public function requested()
      {

        $this->load->library('form_validation');
    		$this->load->helper(array('form'));
        //$val=sizeof($this->input->post())/4;
        //echo $val;
        $data = array(
          'status' => 2);
          $cart=$this->drug_model->pickCart($this->session_data['loggedId']);
          $this->drug_model->update_data('faccart', $cart['id'],$data);


        $val=(sizeof($this->input->post()))/4;
        for ($i=1; $i<=$val; $i++) {
          //$drug=$this->drug_model->get_data_where('drugs',$this->input->post('drugId'.$i));
          $this->form_validation->set_rules('quantity'.$i, 'Quantity', 'required');
          if ($this->form_validation->run() === FALSE)
      		{
      			$this->checkout();
      		}
          else
      		{
          $datam = array(
            'quantity' => $this->input->post('quantity'.$i),
            'drugId' => $this->input->post('drugId'.$i),
            'faccartwlId'    => $cart['id'],
            'regBy'=>$this->session_data['loggedId']
          );
            $this->drug_model->insert_data('prodcartwl',$datam);
          }
        }
        redirect('dispense/batchCreate');
      }


            public function checked()
            {
              //var_dump($this->input->post());
              $this->load->library('form_validation');
              $val1=sizeof($this->input->post())-2;
              $val=$val1/4;
              for ($i=1; $i<=$val; $i++) {
                $receivedRecords=$this->drug_model->get_data_where('received', $this->input->post('receivedId'.$i));
                $this->form_validation->set_rules('approvedquant'.$i, 'Approved Quantity', 'required|numeric|less_than_equal_to['.$receivedRecords['stock'].']');
                if ($this->form_validation->run() === FALSE)
            		{
            			$this->facshow();
            		}
                else
            		{
                $datapc = array(
                  'approvedquant' => $this->input->post('approvedquant'.$i)
                );
                //var_dump($datafc);
                //$this->drug_model->insert_data('dispensed', $data);
                $this->drug_model->update_data('productcart', $this->input->post('pcid'.$i),$datapc);
                $drugRecords=$this->drug_model->get_data_where('drugs', $this->input->post('drugId'.$i));
                $newBalance=$drugRecords['currentStock']-$this->input->post('approvedquant'.$i);
                $newStockBalance=$receivedRecords['stock']-$this->input->post('approvedquant'.$i);
                $datam = array(
                            'currentStock' => $newBalance
                            );
                $datan = array(
                            'stock' => $newStockBalance
                            );
                $this->drug_model->update_data('drugs', $this->input->post('drugId'.$i),$datam);
                $this->drug_model->update_data('received', $this->input->post('receivedId'.$i),$datan);
                //$this->drug_model->delete('productcart','id',$this->input->post('pcid'.$i));
                $this->cartIdGl=$this->input->post('cartId'.$i);
              }
            }

              $datafc = array(
                'approvedBy' => $this->session_data['loggedId'],
                'status' => 4
              );
              $this->drug_model->update_data('faccart', $this->input->post('cartId'),$datafc);
              $this->createCheckPdf($this->input->post('cartId'));
            }


      public function createCheckPdf($faccartwlId)
      {
        $data['values']=$this->drug_model->receiptIssuedwl($faccartwlId);
        $data['cartDetailswl']=$this->drug_model->cartDetailswl($faccartwlId);
        $data['issuing']=$this->drug_model->staffDispensewl('regBy',$faccartwlId);
        //$data['approving']=$this->drug_model->get_data_where('staff',$data['cartDetails']['approvedBy']);
        $this->load->view('workload/createCheckPdf',$data);
      }

      public function destroy()
      {
        $rid = $this->uri->segment(3, 0);
        $this->drug_model->delete('dispensewl','id',$rid);
        $this->wlshow();
      }



      public function stores()
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
