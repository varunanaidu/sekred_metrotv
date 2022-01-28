<?php if ( !defined('BASEPATH') )exit('No direct script access allowed');
class Surat_keluar_model extends CI_Model{

	function _get_datatable_query($select, $from, $order_by, $search, $order, $role, $nip){
		$__order 			= $order_by;
		$__column_search 	= $search;
		$__column_order     = $order;

		$this->db->select($select);
		$this->db->from($from);

		if ( $role != 2 ) {
			$this->db->where('pengirim', $nip);
			$this->db->or_where('pemeriksa', $nip);
		}

		$i = 0;
		$search_value = $this->input->post('search')['value'];
		foreach ($__column_search as $item){
			if ($search_value){
                if ($i === 0){ // looping awal
                	$this->db->group_start(); 
                	$this->db->like("UPPER({$item})", strtoupper($search_value), FALSE);
                }
                else{
                	$this->db->or_like("UPPER({$item})", strtoupper($search_value), FALSE);
                }
                if (count($__column_search) - 1 == $i) $this->db->group_end(); 
            }
            $i++;
        }

        /* order by */
        if ($this->input->post('order') != null){
        	$this->db->order_by($__column_order[$this->input->post('order')['0']['column']], $this->input->post('order')['0']['dir']);
        } 
        else if (isset($__order)){
        	$order = $__order;
        	$this->db->order_by(key($order), $order[key($order)]);
        }

    }

    function get_datatable($select, $from, $order_by, $search, $order, $role, $nip){
    	$this->_get_datatable_query($select, $from, $order_by, $search, $order, $role, $nip);
    	if ($this->input->post('length') != -1) $this->db->limit($this->input->post('length'), $this->input->post('start'));
    	$query = $this->db->get();
    	return $query->result();
    }

    function get_datatable_count_filtered($select, $from, $order_by, $search, $order, $role, $nip){
    	$this->_get_datatable_query($select, $from, $order_by, $search, $order, $role, $nip);
    	$query = $this->db->get();
    	return $query->num_rows();
    }

    function get_datatable_count_all($from){
    	$this->db->from($from);
    	return $this->db->count_all_results();
    }
}