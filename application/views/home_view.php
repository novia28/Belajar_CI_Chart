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
            renderTo: 'chart',
            type: 'column', //jenis chart: spline or column or line or pie
        },
        title: {
            text: 'Judul Chart',
            x: -20
        },
        subtitle: {
            text: 'Sub-judul',
            x: -20
        },
        xAxis: {
            categories: ['deskripsi']
        },
        yAxis: {
            title: {
                text: 'Jumlah Pendapatan (Juta)'
            }
        },
        series: [{
            name: 'Bulan',
            data: <?php echo json_encode($data); ?>
        }]
    });
}); 
</script>
</body>
</html>