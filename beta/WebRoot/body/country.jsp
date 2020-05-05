<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'country.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://gallerybox.echartsjs.com/dep/echarts/map/js/china.js"></script>
	<style>
		*{
			margin: 0;
			padding: 0;
		}
		#tab{
			text-align: center;
			font-weight: bold;
		}
		#tab>tbody>tr>td{
			width:3.95rem;
			padding: 15px;
		}
		.cityname{
			width:100px !important;
		}
		.cities>td{
			border-bottom:1px solid #EBEBEB;
			padding:5px!important;
			font-weight: normal!important;
		}
		.ltitle{
			font-weight: bolder;
			font-size: 21px;
		}
		.bbackground{
			background:#F4F4F4;
			width: 500px;
   		 	padding: 15px;
   		 	margin-left: 30px
		}
		#dssbb{
			margin-left: 30px;
		}
		#ssbb{
			list-style: none;
		}
		.fk{
			width: 15px;
		    height: 15px;
		    background: red;
		    display: block;
		    float: left;
		    margin-top: 4px;
    		margin-right: 12px;
		}
		.xx{
			width: 7px;
		    display: block;
		    float: left;
		    margin-top: 4px;
		    margin-right: 12px;
		    border-right: 2px dashed #626262;
		}
		.wen{
			display: inline-block;
		    line-height: 20px;
		    padding: 0 5px;
		    margin-right:10px;
		    background-color: #fde7da;
		    border-radius: 2px;
		    color: #fe8c5f;
		    font-size: 13px;
		    left: 0;
		}
		.jia{
			display: inline-block;
		    line-height: 20px;
		    padding: 0 5px;
		    margin-right:10px;
		    background-color: #fde7da;
		    border-radius: 2px;
		    color: #0070dd;
		    font-size: 13px;
		    left: 0;
		}
		#yaoyan>hr{
			margin-top: 10px;
			margin-bottom: 10px;
		}
		#yaoyan{
			width:700px;
			border:1px solid black;
		}
		#yaoyan>p{
			margin-top: 5px;
		}
		.more{
			margin: 20px;
		    font-size: 13px;
		    color: #999;
		    text-align: center;
		}
		.yaoyanbody{
			margin-left: 2em;
		}
	</style>
  </head>
  
  <body>
  	<h3>全国新冠肺炎实时数据</h3><br>
  	现存确诊:<b id="currentConfirmedCount"></b><br>
  	今日新增确诊:<b id="currentConfirmedAdd"></b><br>
  	确诊总数:<b id="confirmedCount"></b><br>
  	今日新增确诊数：<b id="confirmedAdd"></b><br>
  	境外输入:<b id="suspectedCount"></b><br>
  	重症总数:<b id="severecasesCount"></b><br>
  	今日新增重症数:<b id="severecasesAdd"></b><br>
  	死亡总数:<b id="deadCount"></b><br>
  	今日新增死亡数:<b id="deathAdd"></b><br>
  	治愈总数:<b id="curedCount"></b><br>
  	今日新增治愈病例:<b id="curedAdd"></b><br>
  	截止更新时间:<b id="updateTime"></b><br>
    
     <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 1300px;height:600px;"></div>
    <div id="main2" style="width: 780px;height:650px;background:#F7F7F7"></div>
    <table id="tab">
    	<tr style="font-size:.96rem">
    		<td style="background:#E3E7F3">地区</td><td style="background:#F3BAB0">现存确诊</td><td style="background:#A24F33">积累确诊</td><td style="background:#575A98">死亡</td><td style="background:#95DB9A">治愈</td>
    	</tr>
    </table>
	
	<div id="dssbb">
		<ul id="ssbb">
			
		</ul>
	</div>
	<div id="more1" class="more">查看更多</div>
	<div id="yaoyan"></div>
	<div id="more2" class="more">查看更多</div>
    <script type="text/javascript">
    	var identifyRumor = ${identifyRumor};
    	console.log(identifyRumor)
    	var tripQuery = ${tripQuery};
    	console.log(tripQuery)
		var json = ${countryjson};
		console.log(json)
		var json2 = ${spreadQuery};
		console.log(json2)
    	$(function(){
			$("#currentConfirmedCount").text(json.data.currentConfirmedCount);
			$("#currentConfirmedAdd").text(json.data.currentConfirmedAdd);
			$("#confirmedCount").text(json.data.confirmedCount);
			$("#confirmedAdd").text(json.data.confirmedAdd);
			$("#suspectedCount").text(json.data.suspectedCount);
			$("#severecasesCount").text(json.data.severecasesCount);
			$("#severecasesAdd").text(json.data.severecasesAdd);
			$("#deadCount").text(json.data.deadCount);
			$("#deathAdd").text(json.data.deathAdd);
			$("#curedCount").text(json.data.curedCount);
			$("#curedAdd").text(json.data.curedAdd);
			$("#updateTime").text(json.data.updateTime);
			
			for(var i = 0;i<json2.newslist.length;i++){
				$("#tab").append("<tr class='newslist' name='newslist"+i+"'><td class='cityname'>"+json2.newslist[i].provinceShortName+"</td><td>"+json2.newslist[i].currentConfirmedCount+"</td><td>"+json2.newslist[i].confirmedCount+"</td><td>"+json2.newslist[i].deadCount+"</td><td>"+json2.newslist[i].curedCount+"</td></tr>")
				for(var j = 0;j<json2.newslist[i].cities.length;j++){
					$("#tab").append("<tr class='cities' name='cities"+i+"''><td class='cityname'>"+json2.newslist[i].cities[j].cityName+"</td><td>"+json2.newslist[i].cities[j].currentConfirmedCount+"</td><td>"+json2.newslist[i].cities[j].confirmedCount+"</td><td>"+json2.newslist[i].cities[j].deadCount+"</td><td>"+json2.newslist[i].cities[j].curedCount+"</td></tr>")
				}
			}
			$(".newslist").css({"background":"#F7F7F7"})
			$(".cities").css({"display":"none"});
			$(".newslist").click(function(e){
				var newslistName = e.currentTarget.attributes[1].value;
				var number = newslistName.substring(8)
				$("*[name=cities"+number+"]").fadeToggle();
			})
			
			//实时播报
			var z=5;
			for(var i=0;i<5;i++){
				$("#ssbb").append("<span class='fk'></span><li>"+tripQuery.data.items[i].ptime+"</li>")
				$("#ssbb").append("<li><span class='xx'></span><div class='bbackground'><p class='ltitle'>"+tripQuery.data.items[i].ltitle+"</p><p>　　"+tripQuery.data.items[i].digest+"</p><a href="+tripQuery.data.items[i].url_3w+">查看详情》</a></div></li>")
			}
			$("#more1").click(function(){
				z+=5;
				$("#ssbb").innerHTML="";
				for(var i=0;i<5;i++){
					$("#ssbb").append("<span class='fk'></span><li>"+tripQuery.data.items[i].ptime+"</li>")
					$("#ssbb").append("<li><span class='xx'></span><div class='bbackground'><p class='ltitle'>"+tripQuery.data.items[i].ltitle+"</p><p>　　"+tripQuery.data.items[i].digest+"</p><a href="+tripQuery.data.items[i].url_3w+">查看详情》</a></div></li>")
				}
				for(var i=0;i<$(".xx").length;i++){
				var obj=$(".xx").parent()[i]
				var style=window.getComputedStyle(obj,null);
				var a = parseInt(style.height.substr(0,style.height.length-2))-4;
				var b = a+"px";
				$(".xx")[i].style.height=b
			}
			})
			for(var i=0;i<$(".xx").length;i++){
				var obj=$(".xx").parent()[i]
				var style=window.getComputedStyle(obj,null);
				var a = parseInt(style.height.substr(0,style.height.length-2))-4;
				var b = a+"px";
				$(".xx")[i].style.height=b
			}
			
			$("#more1").css("width","535px");
		})
		
		
        
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
 
        // 指定图表的配置项和数据
        var option = {
    title: {
        text: '全国新冠肺炎患者统计',
        left: 'center',
        align: 'right'
    },
    color: ['#77a8ae', '#2f4554'],
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            animation: false,
            crossStyle: {
                color: '#505765'
            }
        }
    },
    toolbox: {
        feature: {
            dataView: {
                show: true,
                title: '数据视图',
                optionToContent: function (opt) {
                    var axisData = opt.xAxis[0].data;
                    var series = opt.series;
                    var tdHeads = '<td  style="padding:0 10px">名称</td>';
                    series.forEach(function (item) {
                        tdHeads += '<td style="padding: 0 10px">'+item.name+'</td>';
                    });
                    var table = '<table width="1000" height="600" border="1" style="margin-left:20px;border-collapse:collapse;font-size:14px;text-align:center"><tbody><tr>'+tdHeads+'</tr>';
                    var tdBodys = '';
                    for (var i = 0, l = axisData.length; i < l; i++) {
                        for (var j = 0; j < series.length; j++) {
                            if(typeof(series[j].data[i]) == 'object'){
                                tdBodys += '<td>'+series[j].data[i].value+'</td>';
                            }else{
                                tdBodys += '<td>'+ series[j].data[i]+'</td>';
                            }
                        }
                        table += '<tr><td style="padding: 0 10px">'+axisData[i]+'</td>'+ tdBodys +'</tr>';
                        tdBodys = '';
                    }
                    table += '</tbody></table>';
                    return table;
                }
            },
            magicType: {
                show: true,
                type: ['line', 'bar']
            },
            restore: {
                show: true
            },
            saveAsImage: {
                show: true
            }
        }
    },
    legend: {

        data: ["昨天", "今天"],
        left: 'center',
        top: 50
    },
    grid: {
        left: '3%',
        right: '5%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: [{
        name: '患病人群',
        type: 'category',
        axisLine: {
            onZero: false
        },
        //动态获取，看某年最多客户数有没有10个客户，如果没有，多少就按多少，有大于10，就按10个
        data: ["现存确诊", "确诊总数", "重症人数", "死亡人数", "治愈人数"],
        axisLabel: {
            rotate: 0,
            interval: 0
        },
        nameLocation: 'end',
        axisPointer: {
            type: 'shadow'
        }
    }],
    yAxis: [{
        name: '总人数/人',
        type: 'value',
        splitLine: {
            show: false
        },



    }],
    series: [

        //动态数据
        {
            name: "昨天",
            type: "bar",
            data: [{
                value: json.data.currentConfirmedCount-json.data.currentConfirmedAdd,
                name: ""
            }, {
                value: json.data.confirmedCount-json.data.confirmedAdd,
                name: ""
            }, {
                value: json.data.severecasesCount-json.data.severecasesAdd,
                name: ""
            }, {
                value: json.data.deadCount-json.data.deathAdd,
                name: ""
            }, {
                value: json.data.curedCount-json.data.curedAdd,
                name: ""
            }],
            itemStyle: {
                normal: {
                    label: {
                        //formatter:"A公司",   //这个是可以的，每个柱状图显示A公司
                        formatter: function(params) {
                            //params指的是 data 里面字典的参数，现在字典里用了name（装了公司名）、value（每个公司的销售）两个参数，
                            return params.value;
                        },
                        show: true,
                        //position:"bottom",
                        position: "inside",
                        //position:"top",
                        rotate: 90,
                        interval: 0,
                        textStyle: {
                            fontSize: "10",
                            //textBorderColor:"black",

                        },

                    },
                }
            },



        }, {
            name: "今天",
            type: "bar",
            data: [{
                value: json.data.currentConfirmedCount,
                name: ""
            }, {
                value: json.data.confirmedCount,
                name: ""
            }, {
                value: json.data.severecasesCount,
                name: ""
            }, {
                value: json.data.deadCount,
                name: ""
            }, {
                value: json.data.curedCount,
                name: ""
            }],
            itemStyle: {
                normal: {
                    label: {
                        //formatter:"A公司",   //这个是可以的，每个柱状图显示A公司
                        formatter: function(params) {
                            //params指的是 data 里面字典的参数，现在字典里用了name（装了公司名）、value（每个公司的销售）两个参数，
                            return params.value;
                        },
                        show: true,
                        //position:"bottom",
                        position: "inside",
                        //position:"top",
                        rotate: 90,
                        interval: 0,
                        textStyle: {
                            fontSize: "10",
                            //textBorderColor:"black",

                        },

                    },
                }
            },



        }
    ]
};
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        
		 var myChart2 = echarts.init(document.getElementById('main2'));
		 window.dataList = [{
        name: "南海诸岛",
        value: 0
    },
    {
        name: '北京',
        value: json2.newslist[1].currentConfirmedCount
    },
    {
        name: '天津',
        value: json2.newslist[24].currentConfirmedCount
    },
    {
        name: '上海',
        value: json2.newslist[7].currentConfirmedCount
    },
    {
        name: '重庆',
        value: json2.newslist[14].currentConfirmedCount
    },
    {
        name: '河北',
        value: json2.newslist[19].currentConfirmedCount
    },
    {
        name: '河南',
        value: json2.newslist[21].currentConfirmedCount
    },
    {
        name: '云南',
        value: json2.newslist[20].currentConfirmedCount
    },
    {
        name: '辽宁',
        value: json2.newslist[12].currentConfirmedCount
    },
    {
        name: '黑龙江',
        value: json2.newslist[8].currentConfirmedCount
    },
    {
        name: '湖南',
        value: json2.newslist[18].currentConfirmedCount
    },
    {
        name: '安徽',
        value: json2.newslist[26].currentConfirmedCount
    },
    {
        name: '山东',
        value: json2.newslist[10].currentConfirmedCount
    },
    {
        name: '新疆',
        value: json2.newslist[30].currentConfirmedCount
    },
    {
        name: '江苏',
        value: json2.newslist[22].currentConfirmedCount
    },
    {
        name: '浙江',
        value: json2.newslist[9].currentConfirmedCount
    },
    {
        name: '江西',
        value: json2.newslist[27].currentConfirmedCount
    },
    {
        name: '湖北',
        value: json2.newslist[0].currentConfirmedCount
    },
    {
        name: '广西',
        value: json2.newslist[13].currentConfirmedCount
    },
    {
        name: '甘肃',
        value: json2.newslist[4].currentConfirmedCount
    },
    {
        name: '山西',
        value: json2.newslist[29].currentConfirmedCount
    },
    {
        name: '内蒙古',
        value: json2.newslist[16].currentConfirmedCount
    },
    {
        name: '陕西',
        value: json2.newslist[11].currentConfirmedCount
    },
    {
        name: '吉林',
        value: json2.newslist[25].currentConfirmedCount
    },
    {
        name: '福建',
        value: json2.newslist[28].currentConfirmedCount
    },
    {
        name: '贵州',
        value: json2.newslist[23].currentConfirmedCount
    },
    {
        name: '广东',
        value: json2.newslist[3].currentConfirmedCount
    },
    {
        name: '青海',
        value: json2.newslist[31].currentConfirmedCount
    },
    {
        name: '西藏',
        value: json2.newslist[33].currentConfirmedCount
    },
    {
        name: '四川',
        value: json2.newslist[6].currentConfirmedCount
    },
    {
        name: '宁夏',
        value: json2.newslist[15].currentConfirmedCount
    },
    {
        name: '海南',
        value: json2.newslist[21].currentConfirmedCount
    },
    {
        name: '台湾',
        value: json2.newslist[5].currentConfirmedCount
    },
    {
        name: '香港',
        value: json2.newslist[2].currentConfirmedCount
    },
    {
        name: '澳门',
        value: json2.newslist[32].currentConfirmedCount
    }
];
option2 = {
	 title: {
        text: '各地区肺炎患者人数',
        left: 'center',
        align: 'right'
    },
    tooltip: {
        triggerOn: "mousemove",
        formatter: function(e, t, n) {
            return .5 == e.value ? e.name + "：有疑似病例" : e.seriesName + "<br />" + e.name + "：" + e.value
        }
    },
    visualMap: {
        min: 0,
        max: 1000,
        bottom: 35,
        left: 26,
        showLabel: !0,
        text: ["高", "低"],
        pieces: [{
            gt: 100,
            label: "> 100 人",
            color: "#7f1100"
        }, {
            gte: 10,
            lte: 100,
            label: "10 - 100 人",
            color: "#ff5428"
        }, {
            gte: 1,
            lt: 10,
            label: "1 - 9 人",
            color: "#ff8c71"
        }, {
            gt: 0,
            lt: 1,
            label: "疑似",
            color: "#ffd768"
        }, {
            value: 0,
            color: "#ffffff"
        }],
        show: !0
    },
    geo: {
        map: "china",
        roam: !1,
        scaleLimit: {
            min: 1,
            max: 2
        },
        zoom: 1.23,
        top: 70,
        label: {
            normal: {
                show: !0,
                fontSize: "14",
                color: "rgba(0,0,0,0.7)"
            }
        },
        itemStyle: {
            normal: {
                //shadowBlur: 50,
                //shadowColor: 'rgba(0, 0, 0, 0.2)',
                borderColor: "rgba(0, 0, 0, 0.2)"
            },
            emphasis: {
                areaColor: "#f2d5ad",
                shadowOffsetX: 0,
                shadowOffsetY: 0,
                borderWidth: 0
            }
        }
    },
    series: [{
        name: "确诊病例",
        type: "map",
        geoIndex: 0,
        data: window.dataList
    }]
};
     myChart2.on("click",function(params){
        window.location.href="xiangqing?province="+params.name
     })
	 myChart2.setOption(option2);
	 var t = 5;
	 for(var i=0;i<t;i++){
	 	$("#yaoyan").append("<p><span class='wen'>问</span>"+identifyRumor.results[i].title+"</p>")
	 	$("#yaoyan").append("<p><span class='jia'>假</span>"+identifyRumor.results[i].mainSummary+"</p>")
	 	$("#yaoyan").append("<p class='yaoyanbody'>　"+identifyRumor.results[i].body+"</p>")
	 	$("#yaoyan").append("<hr>")
	 }
	 $("#more2").click(function(){
	 	t+=5;
	 	$("#yaoyan").innerHTML="";
	 	for(var i=0;i<t;i++){
	 	$("#yaoyan").append("<p><span class='wen'>问</span>"+identifyRumor.results[i].title+"</p>")
	 	$("#yaoyan").append("<p><span class='jia'>假</span>"+identifyRumor.results[i].mainSummary+"</p>")
	 	$("#yaoyan").append("<p class='yaoyanbody'>　　"+identifyRumor.results[i].body+"</p>")
	 	$("#yaoyan").append("<hr>")
	 }
	 })
	 $("#more2").css("width","535px");
    </script>
  </body>
</html>
