<?php
Class Aqua_model extends CI_Model
{
	/**
	 * Aqua
	 * Copyright (C) Tibralink Solutions - All Rights Reserved
 	 * Tibralink preserves the rights to distribute and modify this code under the
   * terms signed with the client on the delivery of this system.
	 */
		public function get_data($table, $id = 0)
		{
			if ($id >= 1)
			{
				$query = $this->db->get_where($table, array('id' => $id,'status' => 'Active'));
				return $query->row_array();
			}
			return false;
		}
		public function get_data_where($table, $status = 1)
		{
				$query = $this->db->get_where($table, array('status' => $status));
				return $query->result_array();
		}
		public function record_count($table)
		{
			return $this->db->count_all($table);
	  }
	  public function get_all_data($table)
		{
		   $query = $this->db->get($table);
		   return $query->result_array();
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
		public function insert_data($table,$data)
		{
			$this->db->insert($table, $data);
			$id = $this->db->insert_id();
			return (isset($id)) ? $id : FALSE;

		}
		public function get_staff()
		{
			$status='Active';
			$this->db->select('st.*,r.role');
			$this->db->from('staff st,roles r');
			$this->db->where('st.roleId=r.id');
			$this->db->where('st.status',$status);
			$query=$this->db->get();
			return $query->result_array();
		}

		public function get_matatu()
		{
			$status='Active';
			$this->db->select('mat.*,mbrs.fname, mbrs.oname');
			$this->db->from('matatu mat,members mbrs');
			$this->db->where('mat.memberId=mbrs.id');
			$this->db->where('mat.status',$status);
			$query=$this->db->get();
			return $query->result_array();
		}

		public function get_carriculum($type=0)
		{
			$this->db->select('cr.*,ct.type');
			$this->db->from('cocurriculum cr,cocarriculum_types ct');
			if ($type==0)
			{
				$this ->db-> where('cr.typeId=ct.id');
			}
			else {
				$this ->db-> where('cr.typeId=ct.id AND typeId='.$type);
			}

			$query = $this->db->get();
			return $query->result_array();
		}

		public function login($username, $password)
	 	{
	   		$this->db->select('id, username, fname, lname, password');
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
		public function get_all_data_staff($id)
		{
			$this->db->select('st_bd.*,se.*,st.*,sw.*,r.role,st_bd.id AS stbdId, st_bd.registeredBy AS sbRegisteredBy');
			$this->db->from('staff_basic_info st_bd, staff_education se,staff_tsc st, staff_work_experience sw, roles r');
			$this->db->where('st_bd.id=se.staffId');
			$this->db->where('st_bd.id=st.staffId');
			$this->db->where('st_bd.id=sw.staffId');
			$this->db->where('st_bd.id='.$id);
			$this->db->where('st_bd.roleId=r.id');
			//$this->db->where('st_bd.status=Active');
			$this->db->limit(1);
			$query = $this->db->get();
			return $query->row_array();
		}
		public function get_all_cocurriculum($id,$role)
		{
			$this->db->select('cc.*,ct.type,uc.*');
			$this->db->from('cocurriculum cc,cocarriculum_types ct, user_cocurriculum uc');
			$this->db->where('cc.typeId=ct.id');
			$this->db->where('uc.cocurriculumId=cc.id');
			$this->db->where('uc.userId='.$id);
			$this->db->where('uc.userRole='.$role);
			$this->db->group_by('uc.cocurriculumId');
			$query = $this->db->get();
			return $query->result_array();
		}
		public function update_data($table, $id, $data)
		{
			$this->db->where('id', $id);
			$this->db->update($table, $data);
		}
		public function get_all_cats()
		{
			$this->db->select('cc.*, ct.consumerType');
			$this->db->from('consumercats cc, consumertypes ct');
			$this->db->where('cc.consumerTypeId=ct.id');
			$this->db->group_by('cc.id');
			$query=$this->db->get();
			return $query->result_array();
		}
		public function get_all_deposits()
		{
			$this->db->select('dp.*, cc.consumerCat');
			$this->db->from('deposits dp, consumercats cc');
			$this->db->where('dp.consumerCatId=cc.id');
			$this->db->group_by('dp.id');
			$query=$this->db->get();
			return $query->result_array();
		}
  }
