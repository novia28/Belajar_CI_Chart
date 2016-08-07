<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mread extends CI_Model{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
     
    public function get()
    {
        $this->db->select('*');
        $this->db->like('tanggal','2011-');
        $this->db->order_by('tanggal','asc');
        return $this->db->get('tbl_pendapatan');
    }
}