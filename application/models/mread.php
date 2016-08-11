<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mread extends CI_Model{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
     
    public function getChartData_Angkatan(){	
		$query = $this->db->query('SELECT *, COUNT(*) as jumlah FROM alumni GROUP BY TAHUN_MASUK');
		return $query;
    }
	
	public function getChartData_Jurusan(){	
		$query = $this->db->query('SELECT *, COUNT(*) as jumlah2 FROM alumni GROUP BY ID_PRODI');
		return $query;
    }
	
	public function getJurusan($id){
		
		//$query = $this->db->query("SELECT * FROM program_studi WHERE ID_PRODI='$id'");
		//return $query;
		
		$this->db->select('*');
		$this->db->from('program_studi');
		$this->db->where('ID_PRODI', $id);
		$query = $this->db->get();
		$result = $query->result();
		return $result;
	}
}