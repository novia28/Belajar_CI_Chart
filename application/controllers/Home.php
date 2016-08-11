<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	
	public function __construct()
	{
		parent::__construct();
		$this->load->helper(array('url','html'));
		$this->load->model('mread');
	}
		 
	public function index()
	{
		$data = array();
		$data_kategori = array();
		$data2 = array();
		$data_jurusan = array();
		
		foreach ($this->mread->getChartData_Angkatan()->result_array() as $row){
			$data[] = (int) $row['jumlah'];
			$data_kategori[] = (int) $row['TAHUN_MASUK'];
		}
		
		foreach ($this->mread->getChartData_Jurusan()->result_array() as $rows){
			$data2[] = (int) $rows['jumlah2'];
			$data_jurusan[] = (int) $rows['ID_PRODI'];
			
			//$id[] = (int) $rows['ID_PRODI'];
		}
		
		//for($i=0; $i<=$rows['ID_ALUMNI']; $i++){
			//$prodi['show'] = $this->mread->getJurusan($id[$i]);
			//echo $id[$i]."<br>";
		//}
		
		$id = 15;
		$prodi['show'] = $this->mread->getJurusan($id);
		
		$this->load->view('welcome_message', $prodi);
		$this->load->view('home_view', array(
			'data'=>$data, 
			'data_kategori'=>$data_kategori, 
			'data2'=>$data2, 
			'data_jurusan'=>$data_jurusan)
		);
	}
}