<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<head>
</head>
<body>
<div id="container">
    <h1>CodeIgniter with Highcharts</h1>
 
    <div id="body">
        <div id="chart"></div>
		<div id="chart_jurusan"></div>
    </div>
 
</div>
 
<script type="text/javascript" src="<?php echo base_url('/assets/jquery-1.7.2.min.js'); ?>"></script>
<script type="text/javascript" src="<?php echo base_url('/assets/highcharts/highcharts.js'); ?>"></script>
<script type="text/javascript" src="<?php echo base_url('/assets/highcharts/modules/exporting.js'); ?>"></script>
<script type="text/javascript" src="<?php echo base_url('/assets/highcharts/themes/grid.js'); ?>"></script>
<script type="text/javascript">
jQuery(function(){
    new Highcharts.Chart({
        chart: {
            renderTo: 'chart', //id di divnya --> <div id="chart">
            type: 'column', //jenis chart: spline or column or line or pie
        },
        title: {
            text: 'Jumlah Lulusan Setiap Angkatan',
            x: -20 //posisi tulisan
        },
        subtitle: {
            text: 'Jumlah lulusan setiap angkatan',
            x: -20 //posisi tulisan
        },
        xAxis: {
            categories: <?php echo json_encode($data_kategori); ?>
        },
        yAxis: {
            title: {
                text: 'Jumlah'
            }
        },
        series: [{
            name: 'Jumlah',
            data: <?php echo json_encode($data); ?>
        }]
    });
	
	new Highcharts.Chart({
        chart: {
            renderTo: 'chart_jurusan', //id di divnya --> <div id="chart">
            type: 'column', //jenis chart: spline or column or line or pie
        },
        title: {
            text: 'Jumlah Lulusan Setiap Jurusan',
            x: -20 //posisi tulisan
        },
        subtitle: {
            text: 'Jumlah lulusan setiap jurusan',
            x: -20 //posisi tulisan
        },
        xAxis: {
			categories: [
			<?php foreach($show as $p){ ?>
				'<?php echo $p->NAMA_PRODI; ?>',
			<?php } ?>]
        },
        yAxis: {
            title: {
                text: 'Jumlah'
            }
        },
        series: [{
            name: 'Jumlah',
            data: <?php echo json_encode($data2); ?>
        }]
    });
}); 
</script>
<?php /*foreach($show as $p){
	echo $p->NAMA_PRODI;
} */?>
</body>
</html>