<?php
Class Drug_model extends CI_Model
{
	/**
	 * Drug Store
	 * Copyright (C) Timo - All Rights Reserved
 	 * Timo preserves the rights to distribute and modify this code under the
   * terms signed with the client on the delivery of this system.
	 */
    public function login($username, $password)
    {
        $this->db->select('id, username, fname, lname, password, roleId');
        $this->db->from('staff');
        $this->db->where('username', $username);
        $this->db->where('password', sha1($password));
        $this->db->limit(1);
        $query = $this->db->get();
        if($query -> num_rows() == 1)
        {
          return $query->row_array();
        }
        else
        {
          return false;
        }
    }

    public function get_batchDetails($drugId)
    {
      $this->db->select('rc.*,dr.name AS drName, dr.currentStock, um.name AS uomName');
			$this->db->from('received rc, drugs dr, uom um');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('dr.id',$drugId);
			$this->db->where('rc.stock>','0');
      $this->db->group_by('rc.id');
        $this->db->order_by('expiry','asc');
			$query=$this->db->get();
			return $query->result_array();
    }

    public function get_single_batchDetails($drugId)
    {
      $this->db->select('rc.*,dr.name AS drName, dr.currentStock, um.name AS uomName');
			$this->db->from('received rc, drugs dr, uom um');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.id',$drugId);
      $this->db->group_by('rc.id');
			$query=$this->db->get();
			return $query->row_array();
    }
    public function get_all_data($table)
		{
		   $query = $this->db->get($table);
		   return $query->result_array();
		}
    public function get_all_data_fac($table)
    {
       $query = $this->db->get($table);
       $this->db->order_by('subCounty','asc');
       return $query->result_array();
    }

    public function get_all_data_drugs($table)
		{
      $this->db->order_by('name','asc');
		   $query = $this->db->get($table);
		   return $query->result_array();
		}

    public function get_last_val($table,$field,$order)
		{
      $this->db->order_by($field,$order);
      $this->db->limit(1);
		   $query = $this->db->get($table);
		   return $query->row_array();
		}

    public function insert_data($table,$data)
		{
			$this->db->insert($table, $data);
			$id = $this->db->insert_id();
			return (isset($id)) ? $id : FALSE;
		}

    public function avail($field, $value,$table)
 		{
	   		$this->db->select($field);
	   		$this ->db-> from($table);
	   		$this ->db-> where($field, $value);
	   		$this ->db-> limit(1);

	   		$query = $this ->db-> get();

	   		if($query -> num_rows() == 1)
	   		{
	     		return $query->result();
	   		}
	   		else
	   		{
	     		return false;
	   		}
 		}

    public function get_drugs()
		{
			$this->db->select('dr.*,ct.name AS ctName');
			$this->db->from('drugs dr,categories ct');
      $this->db->where('dr.category=ct.id');
      $this->db->group_by('dr.id');
			$query=$this->db->get();
			return $query->result_array();
		}
    public function get_available_drugs()
    {
			$this->db->select('dr.*,ct.name AS ctName, um.name AS uom, rc.stock AS stock');
			$this->db->from('drugs dr,categories ct, received rc, uom um');
      $this->db->where('dr.category=ct.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('dr.currentStock>',0);
      $this->db->group_by('dr.id');
			$query=$this->db->get();
			return $query->result_array();
    }
    public function getRows($proID)
    {
        $this->db->select('dr.*, fc.workloadRatio AS workloadRatio,um.name AS uom' );
        $this->db->from('drugs dr,facilities fc, faccartwl fcw, received rc, uom um');
        $this->db->where('rc.drugId=dr.id');
        $this->db->where('rc.uom=um.id');
        $this->db->where('fcw.facilityId=fc.id');
        if($proID)
        {
            $this->db->where('dr.id', $proID);
            $query = $this->db->get();
            $result = $query->row_array();
        }
        else
        {
            $this->db->order_by('name', 'asc');
            $query = $this->db->get();
            $result = $query->result_array();
        }
        // Return fetched data
        return !empty($result)?$result:false;
      }

    public function get_facility_all()
    {
			$this->db->select('fc.*, st.fname AS fname, st.lname AS lname');
			$this->db->from('facilities fc, staff st');
			$query = $this->db->get();
			return $query->row_array();
    }

    public function get_facility_issued_all($drugId)
    {
			$this->db->select('dr.*, ct.name AS ctName, um.name AS umName');
			$this->db->from('drugs dr, categories ct, uom um, received rc');
      $this->db->where('dr.category=ct.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.drugId=dr.id');
			$this->db->where('dr.id',$drugId);
			$query = $this->db->get();
			return $query->row_array();
    }
    public function get_delivery_received_all($denoteId)
    {
			$this->db->select('rc.*, dr.name AS drName, um.name AS umName');
			$this->db->from('received rc, drugs dr, denote dn, uom um');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.denoteId=dn.id');
			$this->db->where('rc.denoteId',$denoteId);
      $this->db->group_by('rc.id');
			$query = $this->db->get();
			return $query->result_array();
    }
    public function get_quantity_issued()
    {
      $this->db->select('dwl.*, dr.name AS drName, fac.name AS facName,um.name AS umName');
      $this->db->from('dispensewl dwl, drugs dr, facilities fac, received rc, uom um');
      $this->db->where('dwl.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('dwl.facilityId=fac.id');
      $this->db->where('dwl.quantity >',0);
      $this->db->group_by('fac.id');
      $query=$this->db->get();
      return $query->result_array();
    }
    public function get_cart_issued_all($faccartId)
    {
			$this->db->select('pcwl.*, dr.name AS drName, um.name AS umName, rc.batch AS batch, rc.expiry AS expiry');
			$this->db->from('prodcartwl pcwl, drugs dr, received rc, facilities fc, uom um');
      $this->db->where('pcwl.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.drugId=dr.id');
			$this->db->where('pcwl.faccartwlId',$faccartId);
      $this->db->order_by('faccartwlId',"DESC");
      $this->db->group_by('dr.id');
			$query = $this->db->get();
			return $query->result_array();
    }

    public function get_facilities_issued_all($facilityId,$drugId)
    {
			$this->db->select('pdc.*, st.fname AS fname, fac.name AS facName, st.lname AS lname, fc.requisition AS requisition');
			$this->db->from('prodcartwl pdc, drugs dr, staff st, facilities fac,faccart fc');
      $this->db->where('pdc.faccartwlId=fc.id');
			$this->db->where('fc.facilityId=fac.id');
      $this->db->where('fc.regBy=st.id');
			$this->db->where('pdc.drugId',$drugId);
      $this->db->group_by('pdc.id');
			$query = $this->db->get();
			return $query->result_array();
    }

    public function get_all_dispensed()
		{
			$this->db->select('pdc.*, dr.name AS drName, ct.name as ctName, fc.name as fcName');
			$this->db->from('productcart pdc, drugs dr, categories ct, facilities fc, faccart fac');
      $this->db->where('pdc.drugId=dr.id');
      $this->db->where('dr.category=ct.id');
      $this->db->where('fac.facilityId=fc.id');
      $this->db->group_by('pdc.id');
			$query=$this->db->get();
			return $query->result_array();
		}

    public function recartDrugs()
    {
      $this->db->select('rc.*, dr.id AS drId, dr.name AS drName, um.name AS umName, dn.status, st.fname AS fName');
      $this->db->from('drugs dr, uom um, received rc, denote dn, staff st');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('rc.registeredBy=st.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.denoteId=dn.id');
      $this->db->where('dn.status',1);
      $query=$this->db->get();
			return $query->result_array();
    }

    public function recCartDrugs($logged)
    {
      $this->db->select('rc.*, dr.id AS drId, dr.name AS drName, um.name AS umName, dn.status');
      $this->db->from('drugs dr, uom um, received rc, denote dn');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.denoteId=dn.id');
      $this->db->where('dn.status',1);
      $this->db->where('rc.registeredBy',$logged);
      $query=$this->db->get();
			return $query->result_array();
    }

    public function cartDrugs($logged)
    {
      $this->db->select('fc.facilityId AS facilityId, ct.name AS ctName, dr.id AS drId, dr.name AS drName, pc.quantity AS pcQuantity, pc.batch, pc.id, pc.receivedId, rc.expiry, rc.quantity AS rcQuant, rc.stock AS rcStock');
      $this->db->from('faccart fc, drugs dr,categories ct, productcart pc, received rc');
      $this->db->where('dr.category=ct.id');
      $this->db->where('fc.id=pc.cartId');
      $this->db->where('fc.status',1);
      $this->db->where('dr.id=pc.drugId');
      $this->db->where('rc.id=pc.receivedId');
      $this->db->order_by('pc.id',"ASC");
      $this->db->where('pc.regBy',$logged);
      $query=$this->db->get();
			return $query->result_array();
    }

  public function cartDrugswl()
    {
      $this->db->select('dwl.*, fc.facilityId AS facilityId, ct.name AS ctName, dr.id AS drId, rc.expiry AS expiry, dr.name AS drName, dr.currentStock AS currentStock, dwl.quantity AS quantity, rc.uom AS uom, um.name AS umName');
      $this->db->from('faccart fc, drugs dr,categories ct, dispensewl dwl, received rc, uom um');
      $this->db->where('dr.category=ct.id');
      $this->db->where('fc.status=dwl.status');
      $this->db->where('fc.facilityId=dwl.facilityId');
      $this->db->where('dr.id=dwl.drugId');
      $this->db->where('um.id=rc.uom');
      $this->db->where('dr.id=rc.drugId');
      $this->db->where('fc.status',1);
      $this->db->where('dwl.quantity >',0);
      $this->db->order_by('dwl.id',"ASC");
      $this->db->group_by('dr.id');
      $query=$this->db->get();
			return $query->result_array();
    }

    public function get_expiry_drugs($date1,$date2)
		{
      $this->db->select('rc.*, dr.name AS drName, ct.name as ctName');
			$this->db->from('received rc, drugs dr,categories ct');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('dr.category=ct.id');
      $this->db->where('rc.expiry>=',$date1);
      $this->db->where('rc.expiry<=',$date2);
      $this->db->where('rc.stock>',0);
			$query=$this->db->get();
			return $query->result_array();
		}

    public function get_expired_drugs($date)
		{
      $this->db->select('rc.*, dr.name AS drName, ct.name as ctName');
			$this->db->from('received rc, drugs dr,categories ct');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('dr.category=ct.id');
      $this->db->where('rc.expiry<=',$date);
      $this->db->where('rc.stock>',0);
			$query=$this->db->get();
			return $query->result_array();
		}

    public function get_tracer()
		{
			$this->db->select('dr.*,ct.name AS ctName');
			$this->db->from('drugs dr,categories ct');
      $this->db->where('dr.category=ct.id');
			$this->db->where('dr.tracer','1');
			$query=$this->db->get();
			return $query->result_array();
		}

    public function get_all_drugs()
        {
          $this->db->select('dr.*, ct.name AS ctName');
          $this->db->from('drugs dr, categories ct');
          $this->db->where('dr.category=ct.id');
          $this->db->group_by('dr.id');
          $query=$this->db->get();
          return $query->result_array();
        }

    public function get_monthly_report($month)
		{
			$this->db->select('dr.name AS drName, um.name AS umName, rc.batch AS batch, SUM(rc.quantity) AS rcQuantity, SUM(ds.quantity) AS dsQuantity, dr.currentStock');
			$this->db->from('received rc, productcart ds, drugs dr,uom um');
      $this->db->where('rc.batch=ds.batch');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('DATE_FORMAT(rc.date,"%Y-%m")',$month);
      $this->db->where('DATE_FORMAT(ds.date,"%Y-%m")',$month);
      $this->db->group_by('dr.id');
			$query=$this->db->get();
			return $query->result_array();
		}

    public function get_monthly_received($month)
		{
			$this->db->select('rc.*, dr.name AS drName, um.name AS umName, ct.name as ctName, rc.batch AS rcBatch');
			$this->db->from('received rc, drugs dr,categories ct, uom um');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('dr.category=ct.id');
      $this->db->where('DATE_FORMAT(dr.date,"%Y-%m")',$month);
      $this->db->group_by('rc.id');
			$query=$this->db->get();
			return $query->result_array();
		}

        public function get_all_received()
    {
      $this->db->select('rc.*, dr.name AS drName, um.name AS umName, ct.name as ctName');
      $this->db->from('received rc, drugs dr,categories ct, uom um');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('dr.category=ct.id');
      $this->db->group_by('rc.id');
      $query=$this->db->get();
      return $query->result_array();

    }

        public function get_daily_received($day)
    {
      $this->db->select('rc.*, dr.name AS drName, um.name AS umName, ct.name as ctName');
      $this->db->from('received rc, drugs dr,categories ct, uom um');
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('dr.category=ct.id');
      $this->db->where('DATE_FORMAT(rc.date,"%Y-%m-%d")',$day);
      $this->db->group_by('rc.id');
      $query=$this->db->get();
      return $query->result_array();
    }

      public function get_issued_item()
      {
  			$this->db->select('ds.*, dr.name AS drName, ct.name as ctName, fc.name as fcName');
  			$this->db->from('dispensed ds, drugs dr,categories ct, facilities fc');
        $this->db->where('ds.drugId=dr.id');
        $this->db->where('dr.category=ct.id');
        $this->db->where('ds.facilityId=fc.id');
        $this->db->group_by('ds.id');
  			$query=$this->db->get();
  			return $query->result_array();
      }

        public function get_monthly_dispensed($month)
    		{
    			$this->db->select('pdc.*, dr.name AS drName, ct.name as ctName, fc.name as fcName');
    			$this->db->from('productcart pdc, drugs dr,categories ct, facilities fc, faccart fac');
          $this->db->where('pdc.drugId=dr.id');
          $this->db->where('dr.category=ct.id');
          $this->db->where('fac.facilityId=fc.id');
          $this->db->where('DATE_FORMAT(dr.date,"%Y-%m")',$month);
          $this->db->group_by('pdc.id');
    			$query=$this->db->get();
    			return $query->result_array();
        }

        public function get_daily_dispensed()
        {
          $this->db->select('ds.*, dr.name AS drName, ct.name as ctName, fc.name as fcName');
          $this->db->from('dispensed ds, drugs dr,categories ct, facilities fc');
          $this->db->where('ds.drugId=dr.id');
          $this->db->where('dr.category=ct.id');
          $this->db->where('ds.facilityId=fc.id');
          $this->db->where('DATE_FORMAT(ds.date,"%Y-%m-%d")',$day);
          $this->db->group_by('ds.id');
          $query=$this->db->get();
          return $query->result_array();
        }

    public function outofStock()
    {
      $this->db->select('dr.*, ct.name AS ctName');
      $this->db->from('drugs dr, categories ct');
      $this->db->where('dr.category=ct.id');
      $this->db->where('dr.currentStock',0);
      $this->db->group_by('dr.id');
      $query=$this->db->get();
      return $query->result_array();
    }

      public function reorder()
      {
        $this->db->select('dr.*, ct.name AS ctName');
        $this->db->from('drugs dr, categories ct');
        $this->db->where('dr.category=ct.id');
        $this->db->where('dr.currentStock <= 1000');
        $this->db->group_by('dr.id');
        $query=$this->db->get();
        return $query->result_array();
      }

      public function inStock()
      {
        $this->db->select('dr.*, ct.name AS ctName, um.name AS umName, rc.expiry AS expiry');
        $this->db->from('drugs dr, categories ct, received rc, uom um');
        $this->db->where('dr.category=ct.id');
        $this->db->where('rc.drugId=dr.id');
        $this->db->where('rc.uom=um.id');
        $this->db->where('dr.currentStock>0');
        $this->db->group_by('dr.id');
        $query=$this->db->get();
        return $query->result_array();
      }
      public function inStockr()
      {
        $this->db->select('rc.*, dr.name AS name, dr.istatus AS istatus, ct.name AS ctName, um.name AS umName');
        $this->db->from('drugs dr, categories ct, received rc, uom um');
        $this->db->where('dr.category=ct.id');
        $this->db->where('rc.drugId=dr.id');
        $this->db->where('rc.uom=um.id');
        $this->db->where('rc.stock>0');
        $this->db->group_by('rc.id');
        $query=$this->db->get();
        return $query->result_array();
      }

      public function inStocktake()
      {
        $this->db->select('dr.*, st.opStock AS opStock,st.stock AS stock,st.rDate AS rDate,st.cStock AS cStock,st.expiry AS expiry');
        $this->db->from('drugs dr, stock st');
        $this->db->where('st.drugId=dr.id');
        $this->db->group_by('st.id');
        $query=$this->db->get();
        return $query->result_array();
      }

    public function get_data_where($table,$id)
		{
				$query = $this->db->get_where($table, array('id' => $id));
				return $query->row_array();
		}

    public function update_data($table, $id, $data)
		{
			$this->db->where('id', $id);
			$this->db->update($table, $data);
		}
    public function oneField($table, $field, $value)
    {
      $query = $this->db->get_where($table, array($field => $value));
      return $query->row_array();
    }

    public function twoFields($table, $value1, $field1, $value2, $field2)
    {
      $query = $this->db->get_where($table, array($field1 => $value1, $field2 => $value2));
      return $query->row_array();
    }

    public function pickrecCart()
    {
      $this->db->select("dn.*");
      $this->db->from("denote dn");
      $this->db->where("dn.status",1);
      $this->db->limit(1);
      $this->db->order_by('dn.id',"DESC");
      $query = $this->db->get();
      return $query->row_array();
    }

    public function get_sum()
    {
        $this->db->select("sum(rc.totalCost) AS GtotalCost, dn.status");
        $this->db->from("denote dn, received rc");
        $this->db->where('rc.denoteId=dn.id');
        $this->db->where("dn.status",1);
        $query = $this->db->get();
        return $query->row_array();
    }
    public function pickdrug()
    {
      $this->db->select("dr.*");
      $this->db->from("drugs dr, dispensewl dwl");
      $this->db->where('dwl.drugId=dr.id');
      $query = $this->db->get();
      return $query->row_array();
    }
    public function pickCart($regBy)
    {
      $this->db->select("fc.*,fcs.name AS fcsName");
      $this->db->from("faccart fc, facilities fcs");
      $this->db->where('fc.facilityId=fcs.id');
      $this->db->where("fc.regBy",$regBy);
      $this->db->where("fc.status",1);
      $this->db->limit(1);
      $this->db->order_by('fc.id',"DESC");
      $query = $this->db->get();
      return $query->row_array();
    }
    public function pickCartwl($regBy)
    {
      $this->db->select("fc.*,fcs.name AS fcsName");
      $this->db->from("faccart fc, facilities fcs");
      $this->db->where('fc.facilityId=fcs.id');
      $this->db->where("fc.approvedBy",$regBy);
      $this->db->where("fc.status",3);
      $this->db->limit(1);
      $this->db->order_by('fc.id',"DESC");
      $query = $this->db->get();
      return $query->row_array();
    }
    public function pickCartwll($regBy)
    {
      $this->db->select("dswl.*,fcs.name AS fcsName, fc.status");
      $this->db->from("dispensewl dswl, facilities fcs, faccart fc");
      $this->db->where('dswl.facilityId=fcs.id');
      $this->db->where("dswl.registeredBy",$regBy);
      $this->db->where("dswl.status",1);
      $this->db->limit(1);
      $this->db->order_by('dswl.id',"DESC");
      $query = $this->db->get();
      return $query->row_array();
    }

    public function countrecCart($logged)
    {
      $this->db->select('rcc.id, rc.drugId');
      $this->db->from('denote rcc, received rc');
      $this->db->where('rcc.id=rc.denoteId');
      $this->db->where('rc.registeredBy',$logged);
      $this->db->where('rcc.status',1);
      $this->db->group_by('rc.id');
      return $this->db->count_all_results();
    }

    public function countCart($logged)
    {
      $this->db->select('fc.id, pc.drugId');
      $this->db->from('faccart fc, productcart pc');
      $this->db->where('fc.id=pc.cartId');
      $this->db->where('pc.regBy',$logged);
      $this->db->where('fc.status',1);
      $this->db->group_by('pc.id');
      $this->db->order_by('pc.id',"DESC");
      return $this->db->count_all_results();
    }

    public function countCartwl($logged)
    {
      $this->db->select('fc.id, pc.drugId');
      $this->db->from('faccartwl fc, prodcartwl pc');
      $this->db->where('fc.id=pc.faccartwlId');
      $this->db->where('pc.regBy',$logged);
      $this->db->where('fc.status',1);
      $this->db->group_by('pc.id');
      $this->db->order_by('pc.id',"DESC");
      return $this->db->count_all_results();
    }

    public function countWaitingrecCart()
    {
      $this->db->select('rc.id,dn.status');
      $this->db->from('received rc, denote dn');
      $this->db->where('rc.denoteId=dn.id');
      $this->db->where('dn.status',1);
      $this->db->group_by('rc.id');
      return $this->db->count_all_results();
    }
    public function countWaitingCart()
    {
      $this->db->select('fc.id');
      $this->db->from('faccart fc');
      $this->db->where('fc.status',2);
      $this->db->group_by('fc.id');
      return $this->db->count_all_results();
    }
    public function countWaitingCartwl()
    {
      $this->db->select('dswl.id');
      $this->db->from('dispensewl dswl, facilities fl');
      $this->db->where('dswl.status',1);
      $this->db->group_by('fl.id');
      return $this->db->count_all_results();
    }

    public function delete($table,$field,$id)
    {
      $this->db->delete($table, array($field => $id));
    }

    public function receiptIssued($faccartwlId)
    {
      $this->db->select('pc.*, dr.name AS drugName, ct.name AS ctName,um.name AS umName,pc.id as pcid, rc.expiry AS expiry');
      $this->db->from('prodcartwl pc, drugs dr, categories ct, received rc, uom um');
      $this->db->where('pc.faccartwlId',$faccartwlId);
      $this->db->where('pc.drugId=dr.id');
      $this->db->where('dr.category=ct.id');
      $this->db->where('rc.uom=um.id');
      $this->db->group_by('pc.id');
      $query = $this->db->get();
      return $query->result_array();
    }

    public function receiptdelivered($recCartId)
    {
      $this->db->select('rc.*, dr.name AS drugName,um.name AS umName, dn.status');
      $this->db->from('drugs dr, received rc, uom um, denote dn');
      $this->db->where('rc.denoteId',$recCartId);
      $this->db->where('rc.drugId=dr.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('rc.denoteId=dn.id');
      $this->db->where('dn.status',4);
      $this->db->group_by('rc.id');
      $query = $this->db->get();
      return $query->result_array();
    }

    public function facprodcart($receivedId)
    {
      $this->db->select('SUM(dwl.quantity) AS quantSum, fc.status');
      $this->db->from('dispenseWL dwl, faccart fc');
      $this->db->where('pc.cartId=fc.id');
      $this->db->where('fc.status',2);
      $this->db->where('pc.receivedId',$receivedId);
      $query = $this->db->get();
      return $query->row_array();
    }
    public function get_some_facilities($id)
    {
      $level=$id-1;
      $this->db->select('f.*');
      $this->db->from('facilities f');
      $this->db->where('f.levelId >',$level);
      $query = $this->db->get();
      return $query->result_array();
    }
    public function get_someantid_facilities()
    {
      $this->db->select('f.*');
      $this->db->from('facilities f');
      $this->db->where('f.antidWorkload >',0);
      $query = $this->db->get();
      return $query->result_array();
    }
    public function get_somelab_facilities()
    {
      $this->db->select('f.*');
      $this->db->from('facilities f');
      $this->db->where('f.tracer',6);
      $query = $this->db->get();
      return $query->result_array();
    }
    public function sumTracer($istatus)
    {
      $x=$istatus-1;
      $this->db->select('SUM(fc.workload) AS sumwl');
      $this->db->from('facilities fc');
      $this->db->where('fc.levelId >',$x);
      $query = $this->db->get();
      return $query->row_array();
    }
    public function sumantidTracer()
    {
      $this->db->select('SUM(fc.antidWorkload) AS sumwl');
      $this->db->from('facilities fc');
      $this->db->where('fc.antidWorkload >',0);
      $query = $this->db->get();
      return $query->row_array();
    }

    public function sumlabTracer()
    {
      $this->db->select('SUM(fc.workload) AS sumwl');
      $this->db->from('facilities fc');
      $this->db->where('fc.tracer',6);
      $query = $this->db->get();
      return $query->row_array();
    }
    public function sumTracer1()
    {
      $this->db->select('SUM(workload) AS sumwl');
      $this->db->from('facilities fc, drugs dr');
      $this->db->where('dr.istatus=fc.levelId');
      $this->db->where('dr.istatus <',3);
      $query = $this->db->get();
      return $query->row_array();
    }
    public function sumTracer2()
    {
      $this->db->select('SUM(workload) AS sumwl');
      $this->db->from('facilities fc, drugs dr');
      $this->db->where('dr.istatus=fc.levelId');
      $this->db->where('dr.istatus <',4);
      $query = $this->db->get();
      return $query->row_array();
    }

    public function sumTracer3()
    {
      $this->db->select('SUM(workload) AS sumwl');
      $this->db->from('facilities fc, drugs dr');
      $this->db->where('dr.istatus=fc.levelId');
      $this->db->where('dr.istatus <',5);
      $query = $this->db->get();
      return $query->row_array();
    }

    public function sumTracer4()
    {
      $this->db->select('SUM(workload) AS sumwl');
      $this->db->from('facilities fc, drugs dr');
      $this->db->where('dr.istatus=fc.levelId');
      $this->db->where('dr.istatus <',6);
      $query = $this->db->get();
      return $query->row_array();
    }

    public function facprodcartwl($drugId)
    {
      $this->db->select('SUM(pc.quantity) AS quantSum, fc.status');
      $this->db->from('prodcartwl pc, faccartwl fc');
      $this->db->where('pc.faccartwlId=fc.id');
      $this->db->where('fc.status',2);
      $this->db->where('pc.drugId',$drugId);
      $query = $this->db->get();
      return $query->row_array();
    }

    public function faccartCheck()
    {
      $this->db->select('fc.*, fl.name AS flName, st.fname, st.lname');
      $this->db->from('faccart fc, facilities fl, staff st');
      $this->db->where('fc.facilityId=fl.id');
      $this->db->where('fc.regBy=st.id');
      $this->db->where('fc.status=2 OR status=3');
      $this->db->group_by('fc.id');
      $query = $this->db->get();
      return $query->result_array();
    }

    public function dswlcartCheck()
    {
      $this->db->select('fc.*, fl.name AS flName, st.fname, st.lname');
      $this->db->from('faccart fc, facilities fl, staff st');
      $this->db->where('fc.facilityId=fl.id');
      $this->db->where('fc.regBy=st.id');
      $this->db->where('fc.status=2');
      $this->db->group_by('fl.id');
      $query = $this->db->get();
      return $query->result_array();
    }
    public function cartProds($cartId)
    {
      $this->db->select('ct.name AS ctName, dr.id AS drId, dr.name AS drName,dr.currentStock AS currentStock, um.name AS umName, pc.quantity AS pcQuantity, pc.id,  rc.expiry, pc.faccartwlId, pc.approvedquant');
      $this->db->from('drugs dr,categories ct, faccart fct, facilities fc, prodcartwl pc, received rc, uom um');
      $this->db->where('dr.category=ct.id');
      $this->db->where('rc.uom=um.id');
      $this->db->where('pc.faccartwlId=fct.id');
      $this->db->where('pc.faccartwlId',$cartId);
      $this->db->order_by('pc.id',"ASC");
      $this->db->where('dr.id=pc.drugId');
      $this->db->group_by('dr.id');
      $query=$this->db->get();
			return $query->result_array();
    }

    public function recartDetails($recCartId)
    {
      $this->db->select('dn.*, st.fname, st.lname');
      $this->db->from('denote dn, staff st');
      $this->db->where('dn.approvedBy=st.id');
      $this->db->where('dn.id',$recCartId);
      $query = $this->db->get();
      return $query->row_array();
    }

    public function cartDetails($cartId)
    {
      $this->db->select('fc.*, fl.name AS flName, st.fname, st.lname');
      $this->db->from('faccart fc, facilities fl, staff st');
      $this->db->where('fc.facilityId=fl.id');
      $this->db->where('fc.regBy=st.id');
      $this->db->where('fc.id',$cartId);
      $query = $this->db->get();
      return $query->row_array();
    }

    public function staffDispense($field,$cartId)
    {
      $this->db->select('st.*, fc.id');
      $this->db->from('faccart fc, staff st');
      $this->db->where('fc.id',$cartId);
      $this->db->where('fc.'.$field.'=st.id');
      $query = $this->db->get();
      return $query->row_array();
    }

    public function checkInProgress($loggedId)
    {
      $this->db->select('fc.*');
      $this->db->from('faccart fc');
      $this->db->where('fc.status',3);
      $this->db->where('fc.approvedBy',$loggedId);
      $query = $this->db->get();
      return $query->row_array();
    }

    public function pickCheckCart($cartId)
    {
      $this->db->select("fc.*,fcs.name AS fcsName");
      $this->db->from("faccart fc, facilities fcs");
      $this->db->where('fc.facilityId=fcs.id');
      $this->db->where("fc.id",$cartId);
      $query = $this->db->get();
      return $query->row_array();
    }

    public function facilityFaccart($facilityId)
    {
      $this->db->select("fc.*,st.fname, st.lname, ss.name as statusName");
      $this->db->from("faccart fc, staff st, status ss");
      $this->db->where('fc.regBy=st.id');
      $this->db->where('fc.status=ss.id');
      $this->db->where('fc.facilityId',$facilityId);
      $query=$this->db->get();
			return $query->result_array();
    }

    public function receiveDenote()
    {
      $this->db->select("dn.*, st.fname, st.lname");
      $this->db->from("denote dn, staff st, received rc");
      $this->db->where('dn.approvedBy=st.id');
      $this->db->group_by('rc.id');
      $query=$this->db->get();
			return $query->result_array();
    }

    public function get_last_record($table,$column)
    {
       $this->db->select('*');
       $this->db->from($table);
       $this->db->order_by($column, 'DESC');
       $query=$this->db->get();
       return $query->row_array();
    }

    public function dispensewl($last)
    {
      $this->db->select("dwl.quantity, dg.name, dwl.facilityId,um.name AS umName");
      $this->db->from("dispensewl dwl, drugs dg,received rc, uom um");
      $this->db->where("dwl.drugId=dg.id");
      $this->db->where("rc.drugId=dg.id");
      $this->db->where("rc.uom=um.id");
      $this->db->where("dwl.drugId=dg.id");
      $this->db->where("dwl.dispenseId",$last);
      $this->db->where("dwl.quantity >", 0);
      $this->db->group_by('dwl.id');
      $query=$this->db->get();
			return $query->result_array();
    }

    public function receivedDenote()
    {
      $this->db->select("dn.*,st.fname, st.lname");
      $this->db->from("denote dn, staff st, received rc");
      $this->db->where('dn.approvedBy=st.id');
      $this->db->group_by('dn.id');
      $query=$this->db->get();
			return $query->result_array();
    }

    public function issuedFaccart()
    {
      $this->db->select("dwl.*,s.name AS sName, ds.name AS dsName, st.fname AS fname,st.lname AS lname, fac.name AS fcName");
      $this->db->from("prodcartwl dwl, status s, staff st, facilities fac, dispensestatus ds");
      $this->db->where('dwl.status=s.id');
      $this->db->where('dwl.dispenseId=ds.id');
      $this->db->where('dwl.registeredBy=st.id');
      $this->db->where('dwl.facilityId=fac.id');
      $this->db->group_by(array('fac.id','dwl.dispenseId'));
      $query=$this->db->get();
			return $query->result_array();
    }
    public function issuedFaccartwl()
    {
      $this->db->select("fc.*,s.name AS sName, st.fname AS fname,st.lname AS lname, fac.name AS fcName, fac.id AS facilityId");
      $this->db->from("prodcartwl dwl, faccart fc, status s, staff st, facilities fac");
      $this->db->where('fc.status=s.id');
      $this->db->where('fc.regBy=st.id');
      $this->db->where('dwl.faccartwlId=fc.id');
      $this->db->group_by('fac.id');
      $query=$this->db->get();
      return $query->result_array();
    }
    public function issuedFac($faccartId)
    {
      $this->db->select("fc.*,s.name AS sName, fac.name AS facName");
      $this->db->from("faccart fc, status s, facilities fac");
      $this->db->where('fc.status=s.id');
      $this->db->where('fc.facilityId=fac.id');
      $this->db->group_by('fc.id',$faccartId);
      $query=$this->db->get();
			return $query->result_array();
    }
  }
