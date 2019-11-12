function initChart01() {
  $('#chart-01').highcharts({
    chart: {
      zoomType: 'xy'
    },
    // title: {
    //     text: 'Average Monthly Temperature and Rainfall in Tokyo'
    // },
    // subtitle: {
    //     text: 'Source: WorldClimate.com'
    // },
    xAxis: [{
        categories: ['月', '火', '水', '木', '金', '土', '日'],
        crosshair: true
    }],
    yAxis: [{ // Primary yAxis
        labels: {
            format: '{value}＄',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        },
        title: {
            text: '収入',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        }
    }, { // Secondary yAxis
        title: {
            text: '売上',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        labels: {
            format: '{value}＄',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        opposite: true
    }],
    tooltip: {
        shared: true
    },
    legend: {
        layout: 'vertical',
        align: 'left',
        x: 120,
        verticalAlign: 'top',
        y: 100,
        floating: true,
        backgroundColor:
            Highcharts.defaultOptions.legend.backgroundColor || // theme
            'rgba(255,255,255,0.25)'
    },
    series: [{
        name: '売上',
        type: 'column',
        yAxis: 1,
        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6],
        tooltip: {
            valueSuffix: '＄'
        }

    }, {
        name: '収入',
        type: 'spline',
        data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2],
        tooltip: {
            valueSuffix: '＄'
        }
    }]
  });
}

function initChart02() {
  $('#chart-02').highcharts({
		chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false,
				type: 'pie'
		},
		// title: {
		// 		text: 'Browser market shares in January, 2018'
		// },
		tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		plotOptions: {
				pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						dataLabels: {
								enabled: false
						},
						showInLegend: true
				}
		},
		series: [{
				name: 'Brands',
				innerSize: '40%',
				colorByPoint: true,
				data: [{
						name: '市場',
						y: 60,
				}, {
						name: '客',
						y: 40
				}]
		}]
  });
}

$(document).ready(function(){
	initChart01();
	initChart02();
});