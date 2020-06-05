/*订单统计本月*/
var chart = Highcharts.chart('container', {
	chart: {
		type: 'bar'
	},
	title: {
		text: '',

	},
	colors:[
		'#00abf1'
	],
	xAxis: {
		categories: ['订单量', '生产量', '库存量', '使用量'],
		title: {
			text: null
		}
	},
	yAxis: {
		min: 0,
		title: {
			text: '数量 ( 吨 )',
			align: 'high'
		},
		labels: {
			overflow: 'justify'
		}
	},
	tooltip: {
		valueSuffix: ' 吨'
	},
	plotOptions: {
		bar: {
			dataLabels: {
				enabled: true,
				 style: {
			  	 "fontSize": "16px",   //字体大小
			  	 fontWeight: 'bold',
			  }
			}
		}
	},
	series: [{
		name: '数量',
		data: [
			[5000],
			[1000],
			[3000],
			[1000],
		]
	}],
});



/*订单进度*/
Highcharts.chart('contaiprog', {
	chart: {
		styledMode: true
	},
	title: {
		text: ''
	},
	tooltip: {
		pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	},
	plotOptions: {
		pie: {
			allowPointSelect: true,
			cursor: 'pointer',
			dataLabels: {
				enabled: true,
				format: '<b>{point.name}</b>: {point.percentage:.1f} %',
				style: {
					color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				}
			},
			showInLegend: true
		}
	},
	series: [{
		name: '订单进度',
		type: 'pie',
		allowPointSelect: true,
		colorByPoint: true,
		data: [{
			name: '铸坯',
			y: 61.41,
			color:"#00abf1",
		}, {
			name: '轧管',
			y: 11.84,
			color:"#e989a6",

		}, {
			name: '热处理',
			y: 10.85,
			color:"#a0cee2",


		}, {
			name: '管加工',
			y: 4.67,
			color:"#d0cb87",

		}, {
			name: '智能库',
			y: 4.18,
			color:"#ffcd6f",
		}],
		showInLegend: true

	}]
});	



/*代储代销库存分析*/
var chart = Highcharts.chart('contaicons', {
	title: {
		text: ''
	},
	subtitle: {
		text: ''
	},
	yAxis: {
		title: {
			text: '单位 ( 吨 )'
		}
	},

	xAxis: {
		categories: ['一月', '二月', '三月', '四月', '五月', '六月',
					 '七月', '八月', '九月', '十月', '十一月', '十二月']
	},

	series: [{
		name: '数量',
		data: [200, 213, 226, 330, 360, 400, 424, 500,600,670,750,880],
		color:"#01aef0",
	}, {
		name: '金额',
		data: [50, 120, 160,180, 220, 270, 340, 360,460, 480, 510, 560],
		color:"#3ec1cf",
	},],
	responsive: {
		rules: [{
			condition: {
				maxWidth: 500
			},
			chartOptions: {
				legend: {
					layout: 'horizontal',
					align: 'center',
					verticalAlign: 'bottom'
				}
			}
		}]
	}
});



/*结算提醒*/
Highcharts.chart('contaiment', {
	chart: {
		styledMode: true
	},
	title: {
		text: ''
	},
	tooltip: {
		pointFormat: '{series.name} : <b>{point.y}</b>'
	},
	plotOptions: {
		pie: {
			allowPointSelect: true,
			cursor: 'pointer',
			dataLabels: {
				enabled: true,
				format: '<b>{point.name}</b> : {point.y}',
				style: {
					color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				}
			},
			showInLegend: true
		}
	},
	series: [{
		name: '金额',
		type: 'pie',
		allowPointSelect: true,
		colorByPoint: true,
		data: [{
			name: '未付',
			y: 1000000,
			color:"#00abf1",
		}, {
			name: '已付',
			y:1200000,
			color:"#ffcd6f",
		}],
		showInLegend: true

	}]
});	
