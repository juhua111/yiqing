<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/sj.css">
	<script src="js/echarts.min.js"></script>
	<script src="js/china.js"></script>
	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/shuju.js"></script>
    <script type="text/javascript" charset="utf-8">
    	$(function(){
    		var json =${countryjson}
    		var json2 =${spreadQuery}
    		var tripQuery = ${tripQuery}
    		var identifyRumor = ${identifyRumor}
    		console.log(json);
            $("#currentConfirmedCount").text(json.data.currentConfirmedCount);
			$("#currentConfirmedAdd").text(json.data.currentConfirmedAdd);
			$("#confirmedCount").text(json.data.confirmedCount);
			if(json.data.confirmedAdd>=0){
				$("#confirmedAdd").text("+"+json.data.confirmedAdd);
			}else{
				$("#confirmedAdd").text(json.data.confirmedAdd);
			}
			$("#severecasesCount").text(json.data.severecasesCount);
			$("#severecasesAdd").text(json.data.severecasesAdd);
			if(json.data.severecasesAdd>=0){
				$("#severecasesAdd").text("+"+json.data.severecasesAdd)
			}else{
				$("#severecasesAdd").text(json.data.severecasesAdd)
			}
			
			$("#deadCount").text(json.data.deadCount);
			if(json.data.deathAdd>=0){
				$("#deathAdd").text("+"+json.data.deathAdd);
			}else{
				$("#deathAdd").text(json.data.deathAdd);
			}
			$("#curedCount").text(json.data.curedCount);
			if(json.data.curedAdd>=0){
				$("#curedAdd").text("+"+json.data.curedAdd);
			}else{
				$("#curedAdd").text(json.data.curedAdd);
			}
			$("#updateTime").text("截至"+json.data.updateTime);
			
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
			        top: 90,
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
			     	console.log(params.name)
			        for(var i=0;i<$(".zongshu_tou_liebiaoer").children().length;i++){
			        	if($(".zongshu_tou_liebiaoer").children()[i].innerHTML==params.name){
			        		$(".zongshu_tou_liebiaoer").children()[i].click()
			        	}
			        }
			        
			     })
				 myChart2.setOption(option2);
				 
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
			
			var z=5;
			for(var i=0;i<5;i++){
				$("#ssbb").append("<span class='fk'></span><li>"+tripQuery.data.items[i].ptime+"</li>")
				$("#ssbb").append("<li><span class='xx'></span><div class='bbackground'><p class='ltitle'>"+tripQuery.data.items[i].ltitle+"</p><p>　　"+tripQuery.data.items[i].digest+"</p><a href="+tripQuery.data.items[i].url+">查看详情》</a></div></li>")
			}
			$("#more1").click(function(){
				z+=5;
				$("#ssbb").innerHTML="";
				for(var i=0;i<5;i++){
					$("#ssbb").append("<span class='fk'></span><li>"+tripQuery.data.items[i].ptime+"</li>")
					$("#ssbb").append("<li><span class='xx'></span><div class='bbackground'><p class='ltitle'>"+tripQuery.data.items[i].ltitle+"</p><p>　　"+tripQuery.data.items[i].digest+"</p><a href="+tripQuery.data.items[i].url+">查看详情》</a></div></li>")
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
			
			var xqjson={};
			$(".zongshu_tou_liebiaoer").children().click(function(e){
				if(e.currentTarget.innerHTML=="全国"){
					window.location.href=window.location
				}
				$.ajax({
					type:'post',
					url:'xiangqing',
					data: {
						"province":e.currentTarget.innerHTML
					},
					success:function(d){
						if(d<0){
							alert("数据错误请稍后重试")
							window.location.href=window.location
						}else{
							xqjson=JSON.parse(d)
							console.log(xqjson)
							
							$("#nowconfirm").text(xqjson.data[xqjson.data.length-1].confirm-xqjson.data[xqjson.data.length-1].heal-xqjson.data[xqjson.data.length-1].dead)
							if((xqjson.data[xqjson.data.length-1].confirm-xqjson.data[xqjson.data.length-1].heal-xqjson.data[xqjson.data.length-1].dead)-(xqjson.data[xqjson.data.length-2].confirm-xqjson.data[xqjson.data.length-2].heal-xqjson.data[xqjson.data.length-2].dead)>=0){
								$("#nowconfirmadd").text("+"+((xqjson.data[xqjson.data.length-1].confirm-xqjson.data[xqjson.data.length-1].heal-xqjson.data[xqjson.data.length-1].dead)-(xqjson.data[xqjson.data.length-2].confirm-xqjson.data[xqjson.data.length-2].heal-xqjson.data[xqjson.data.length-2].dead)))
							}else{
								$("#nowconfirmadd").text((xqjson.data[xqjson.data.length-1].confirm-xqjson.data[xqjson.data.length-1].heal-xqjson.data[xqjson.data.length-1].dead)-(xqjson.data[xqjson.data.length-2].confirm-xqjson.data[xqjson.data.length-2].heal-xqjson.data[xqjson.data.length-2].dead))
							}
							
							$("#confirm").text(xqjson.data[xqjson.data.length-1].confirm)
							if(xqjson.data[xqjson.data.length-1].confirm-xqjson.data[xqjson.data.length-2].confirm>=0){
								$("#confirmadd").text("+"+(xqjson.data[xqjson.data.length-1].confirm-xqjson.data[xqjson.data.length-2].confirm))
							}else{
								$("#confirmadd").text(xqjson.data[xqjson.data.length-1].confirm-xqjson.data[xqjson.data.length-2].confirm)
							}
							
							$("#heal").text(xqjson.data[xqjson.data.length-1].heal)
							if(xqjson.data[xqjson.data.length-1].heal-xqjson.data[xqjson.data.length-2].heal>=0){
								$("#healadd").text("+"+(xqjson.data[xqjson.data.length-1].heal-xqjson.data[xqjson.data.length-2].heal))
							}else{
								$("#healadd").text(xqjson.data[xqjson.data.length-1].heal-xqjson.data[xqjson.data.length-2].heal)
							}
							
							$("#dead").text(xqjson.data[xqjson.data.length-1].dead)
							if(xqjson.data[xqjson.data.length-1].dead-xqjson.data[xqjson.data.length-2].dead>=0){
								$("#deadadd").text("+"+(xqjson.data[xqjson.data.length-1].dead-xqjson.data[xqjson.data.length-2].dead))
							}else{
								$("#deadadd").text(xqjson.data[xqjson.data.length-1].dead-xqjson.data[xqjson.data.length-2].dead)
							}
							
							var timedate = [] //时间
					    	var confirm = [] //积累确诊
					    	var heal = [] //积累治愈
					    	var dead = [] //积累死亡
					    	var nowconfirm = [] //现有确诊
					    	for(var i=0;i<xqjson.data.length;i++){
					    		timedate.push(xqjson.data[i].date)
					    		confirm.push(xqjson.data[i].confirm)
					    		heal.push(xqjson.data[i].heal)
					   			dead.push(xqjson.data[i].dead)
					   			nowconfirm.push(xqjson.data[i].confirm-xqjson.data[i].heal-xqjson.data[i].dead)
					    	}
							var myChart3 = echarts.init(document.getElementById('main3'));
							option3 = {
								 title: {
							        text: xqjson.data[0].province+'省肺炎患者数据',
							        left: 'center',
							        align: 'right'
							    },
							    tooltip: {
							        triggerOn: "mousemove",
							        formatter: function(e, t, n) {
							            return .5 == e.value ? e.name + "：有疑似病例" : e.seriesName + "<br />" + e.name + "：" + e.value
							        }
							    },
							    color: ['#5b9bd5', '#ed7d31'],
							    backgroundColor: '#FFF',
							    grid: {
							        top: 40,
							        bottom: 100,
							        left: '12%',
							        right: '10%'
							    },
							    legend: {
							        bottom: '10',
							        itemWidth: 30,
							        itemHeight: 6,
							        data: ['现有确诊', '积累确诊']
							    },
							    xAxis: [{
							        name: '日期',
							        axisLine: {
							            show: true
							        },
							        axisTick: {
							            show: false
							        },
							        axisLabel: {
							            rotate: 50
							        },
							        splitLine: {
							            show: false,
							            lineStyle: {
							                color: '#CCC'
							            }
							        },
							        data: timedate,
							    }],
							    yAxis: [{
							
							        name: '人数',
							        nameTextStyle: {
							            color: '#000'
							        },
							        axisLine: {
							            lineStyle: {
							                color: '#CCC'
							            },
							        },
							        axisTick: {
							            show: false
							        },
							        splitLine: {
							            show: false,
							            lineStyle: {
							                color: '#CCC'
							            }
							        },
							        axisLabel: {
							            color: '#000'
							        }
							    }],
							    series: [{
							            name: '现有确诊',
							            type: 'line',
							            itemStyle: {
							                color: '#5b9bd5',
							                borderColor: '#5b9bd5',
							                borderWidth: 1
							            },
							            lineStyle: {
							                width: 4
							            },
							            data: nowconfirm
							        },
							        {
							            name: '积累确诊',
							            type: 'line',
							            itemStyle: {
							                color: '#ed7d31',
							                borderColor: '#ed7d31',
							                borderWidth: 1
							            },
							            lineStyle: {
							                width: 4
							            },
							            data: confirm
							        }
							    ]
							};
							myChart3.setOption(option3);
							
							var myChart4 = echarts.init(document.getElementById('main4'));
							option4 = {
								 title: {
							        text: xqjson.data[0].province+'省肺炎患者数据',
							        left: 'center',
							        align: 'right'
							    },
							    tooltip: {
							        triggerOn: "mousemove",
							        formatter: function(e, t, n) {
							            return .5 == e.value ? e.name + "：有疑似病例" : e.seriesName + "<br />" + e.name + "：" + e.value
							        }
							    },
							    color: ['#5b9bd5', '#ed7d31'],
							    backgroundColor: '#FFF',
							    grid: {
							        top: 40,
							        bottom: 100,
							        left: '12%',
							        right: '10%'
							    },
							    legend: {
							        bottom: '10',
							        itemWidth: 30,
							        itemHeight: 6,
							        data: ['积累治愈', '积累死亡']
							    },
							    xAxis: [{
							        name: '日期',
							        axisLine: {
							            show: true
							        },
							        axisTick: {
							            show: false
							        },
							        axisLabel: {
							            rotate: 50
							        },
							        splitLine: {
							            show: false,
							            lineStyle: {
							                color: '#CCC'
							            }
							        },
							        data: timedate,
							    }],
							    yAxis: [{
							
							        name: '人数',
							        nameTextStyle: {
							            color: '#000'
							        },
							        axisLine: {
							            lineStyle: {
							                color: '#CCC'
							            },
							        },
							        axisTick: {
							            show: false
							        },
							        splitLine: {
							            show: false,
							            lineStyle: {
							                color: '#CCC'
							            }
							        },
							        axisLabel: {
							            color: '#000'
							        }
							    }],
							    series: [{
							            name: '积累治愈',
							            type: 'line',
							            itemStyle: {
							                color: '#5b9bd5',
							                borderColor: '#5b9bd5',
							                borderWidth: 1
							            },
							            lineStyle: {
							                width: 4
							            },
							            data: heal
							        },
							        {
							            name: '积累死亡',
							            type: 'line',
							            itemStyle: {
							                color: '#ed7d31',
							                borderColor: '#ed7d31',
							                borderWidth: 1
							            },
							            lineStyle: {
							                width: 4
							            },
							            data: dead
							        }
							    ]
							};
							myChart4.setOption(option4);
							$("#tab tr").nextAll().remove()
							for(var i = 0;i<json2.newslist.length;i++){
								if(json2.newslist[i].provinceShortName==xqjson.data[0].province){
									$("#tab").append("<tr class='newslist' name='newslist"+i+"'><td class='cityname'>"+json2.newslist[i].provinceShortName+"</td><td>"+json2.newslist[i].currentConfirmedCount+"</td><td>"+json2.newslist[i].confirmedCount+"</td><td>"+json2.newslist[i].deadCount+"</td><td>"+json2.newslist[i].curedCount+"</td></tr>")
									for(var j = 0;j<json2.newslist[i].cities.length;j++){
										$("#tab").append("<tr class='cities' name='cities"+i+"''><td class='cityname'>"+json2.newslist[i].cities[j].cityName+"</td><td>"+json2.newslist[i].cities[j].currentConfirmedCount+"</td><td>"+json2.newslist[i].cities[j].confirmedCount+"</td><td>"+json2.newslist[i].cities[j].deadCount+"</td><td>"+json2.newslist[i].cities[j].curedCount+"</td></tr>")
									}
								}
							}
							$(".newslist").css({"background":"#F7F7F7"})
							$(".cities").css({"display":"display"});
							$(".newslist").click(function(e){
								var newslistName = e.currentTarget.attributes[1].value;
								var number = newslistName.substring(8)
								$("*[name=cities"+number+"]").fadeToggle();
							})
						}
					}
				});
			})
		})
			
    </script>
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
   		 	margin-left: 30px;
		}
		#dssbb{
			width:100%;
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
			width:100%;
		}
		#yaoyan>p{
			margin-top: 5px;
		}
		.more{
			margin-left: 25%;
		    font-size: 13px;
		    color: #999;
		    text-align: center;
		    width:100%;
		}
		.yaoyanbody{
			margin-left: 2em;
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
	</style>
  </head>
  <body>
    <div class="tou">
        <div class="tou_zi">
            <div class="tou_zi_yi">
                <p>新冠肺炎</p>
            </div>
            <div class="tou_zi_er">
                <p>疫情实时动态</p>
                <hr>
            </div>
            <div class="tou_zi_san">
                <p>疫情严重，请尽量不要聚会，避免出入公共场所</p>
            </div>
        </div>

        <div class="tou_img">
            <img src="img/TMGPfHE9GsH3dA5vQqRYRTXPSG4vuD9vfLcahtQL6KBD91530890850901compressflag.jpeg" height=100%/>
        </div>
    </div>
        <div class="zongshu">
            <div class="zongshu_tou" align="absmiddle">
                <b class="zongshu_tou_zi" >实时疫情</b>
                <ul class="zongshu_tou_liebiao">
                    <li class="zongshu_tou_liebiao_nei"><b>全国</b><p></p>
                        <ul class="zongshu_tou_liebiaoer">
                            <li>全国</li>
							<li>湖北</li>
							<li>北京</li>
							<li>香港</li>
							<li>台湾</li>
							<li>广东</li>
							<li>甘肃</li>
							<li>上海</li>
							<li>四川</li>
							<li>浙江</li>
							<li>黑龙江</li>
							<li>山东</li>
							<li>陕西</li>
							<li>辽宁</li>
							<li>广西</li>
							<li>河北</li>
							<li>云南</li>
							<li>澳门</li>
							<li>河南</li>
							<li>海南</li>
							<li>贵州</li>
							<li>内蒙古</li>
							<li>湖南</li>
							<li>安徽</li>
							<li>江西</li>
							<li>江苏</li>
							<li>重庆</li>
							<li>福建</li>
							<li>天津</li>
							<li>山西</li>
							<li>吉林</li>
							<li>新疆</li>
							<li>宁夏</li>
							<li>青海</li>
							<li>西藏</li>
                        </ul>
                    </li>
                </ul>
            </div>
        <div class="zongshu_neirong_box">
            <div class="zongshu_neirong">
                <div class="zongshu_neirong_dan">
                    <div class="zongshu_neirong_dan_nei">
                        <p class="zongshu_neirong_zi">较昨日<span class="zongshu_neirong_zi4" id="currentConfirmedAdd"></span></p>
                        <p class="zongshu_neirong_zi2" id="currentConfirmedCount"></p>
                        <p class="zongshu_neirong_zi3">现有确诊</p>
                    </div>
                </div>
                <div class="zongshu_neirong_dan">
                    <div class="zongshu_neirong_dan_nei">
                        <p class="zongshu_neirong_zi">较昨日<span class="zongshu_neirong_zi4" style="color: #ffab6d" id="confirmedAdd"></span></p>
                        <p class="zongshu_neirong_zi2" style="color: #ffab6d" id="confirmedCount"></p>
                        <p class="zongshu_neirong_zi3">确诊总数</p>
                    </div>
                </div>
                <div class="zongshu_neirong_dan">
                    <div class="zongshu_neirong_dan_nei">
                        <p class="zongshu_neirong_zi">较昨日<span class="zongshu_neirong_zi4" style="color: #6794af" id="severecasesAdd"></span></p>
                        <p class="zongshu_neirong_zi2" style="color: #6794af" id="severecasesCount"></p>
                        <p class="zongshu_neirong_zi3">重症总数</p>
                    </div>
                </div>
                <div class="zongshu_neirong_dan">
                    <div class="zongshu_neirong_dan_nei">
                        <p class="zongshu_neirong_zi">较昨日<span class="zongshu_neirong_zi4" style="color: #a1574d" id="deathAdd"></span></p>
                        <p class="zongshu_neirong_zi2" style="color: #a1574d" id="deadCount"></p>
                        <p class="zongshu_neirong_zi3">死亡总数</p>
                    </div>
                </div>
                <div class="zongshu_neirong_dan">
                    <div class="zongshu_neirong_dan_nei">
                        <p class="zongshu_neirong_zi">较昨日<span class="zongshu_neirong_zi4" style="color: #50658b" id="curedAdd"></span></p>
                        <p class="zongshu_neirong_zi2" style="color: #50658b" id="curedCount"></p>
                        <p class="zongshu_neirong_zi3">治愈总数</p>
                    </div>
                </div>
            </div>
            <div class="zongshu_neirong2">
                <div class="zongshu_neirong_dan2">
                    <div class="zongshu_neirong_dan_nei">
                        <p class="zongshu_neirong_zi">较昨日<span class="zongshu_neirong_zi4" style="color: #50658b" id="nowconfirmadd">-1332</span></p>
                        <p class="zongshu_neirong_zi2" style="color: #6794af" id="nowconfirm"></p>
                        <p class="zongshu_neirong_zi3">现有确诊</p>
                    </div>
                </div>
                <div class="zongshu_neirong_dan2">
                    <div class="zongshu_neirong_dan_nei">
                        <p class="zongshu_neirong_zi">较昨日<span class="zongshu_neirong_zi4" style="color: #50658b" id="confirmadd">-1332</span></p>
                        <p class="zongshu_neirong_zi2" style="color: #a1574d" id="confirm"></p>
                        <p class="zongshu_neirong_zi3">累计确诊</p>
                    </div>
                </div>
                <div class="zongshu_neirong_dan2">
                    <div class="zongshu_neirong_dan_nei">
                        <p class="zongshu_neirong_zi">较昨日<span class="zongshu_neirong_zi4" style="color: #50658b" id="healadd">-1332</span></p>
                        <p class="zongshu_neirong_zi2" style="color: #ffab6d" id="heal"></p>
                        <p class="zongshu_neirong_zi3">治愈总数</p>
                    </div>
                </div>
                <div class="zongshu_neirong_dan2">
                    <div class="zongshu_neirong_dan_nei">
                        <p class="zongshu_neirong_zi">较昨日<span class="zongshu_neirong_zi4" style="color: #50658b" id="deadadd">-1332</span></p>
                        <p class="zongshu_neirong_zi2" style="color: #50658b" id="dead"></p>
                        <p class="zongshu_neirong_zi3">死亡总数</p>
                    </div>
                </div>
            </div>
        </div>
            <div>
                <p id="updateTime"></p>
                <p class="shujushuoming">数据说明</p>
            </div>
            <div class="shuju_box">
                <div class="shuju_box2">
                    <div class="shuju_biaoti">数据说明</div>
                    <div class="chahao">×</div>
                    <div class="shujushuoming_neirong">
                        <p>1.数据来源:</p>
                        <p>全部数据均来源于国家卫健委、各省市区卫健委、各省市区政府、港澳台官方渠道等公开数据。</p>
                        <br><p>2.实时数据统计规则</p>
                        <p class="s">实时数据包括现存确诊、累计确诊、累计死亡、累计治愈；</p>
                        <p class="s">实时数据会取各省市累加(全国累加数)、国家卫健委公布数据的最大值；</p>
                        <p>各省市官方渠道每日会有当日新增病例报道，若各省市数据总和超过国家卫健委公布数据，则显示各省市数据总和。因各省市数据存在核减情况，故省新增与市新增累加会有不一致的情况；</p>
                        <p class="s">“较昨日”的数据使用当前全国累加数减去国家卫健委公布的前一日数据，此数值会根据实时数据发生变化；</p>
                        <p class="s">现存确诊 = 累计确诊 - 累计治愈 - 累计死亡，现存确诊及其较昨日数据会受确诊、死亡、治愈数据的变化而变化。</p>
                        <br><p>3.现存疑似，现存确诊重症数据说明</p>
                        <p class="s">现存疑似、现存确诊重症及其“较昨日”数据，由于各省市未发布明细数据，故只采用国家每日公布的数据，国家当日公布之后直到次日公布均为固定值。</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="xuanfuliebiao_box">
            <div class="xuanfuliebiao_box2">
                <a href="#yi">
                    <div class="xuanfu_liebiao" >
                        <p style="color: black">全国疫情</p>
                    </div>
                </a>
                <a href="https://2019ncov.nosugartech.com/">
                <div class="xuanfu_liebiao">
                    <p style="color: black">同程查询</p>
                </div>
                </a>
                <a href="#san">
                <div class="xuanfu_liebiao">
                    <p style="color: black">谣言粉碎</p>
                </div>
                </a>
                <a href="#si">
                <div class="xuanfu_liebiao">
                    <p style="color: black">动态播报</p>
                </div>
                </a>
            </div>
        </div>
        <div class="shuju_tou">
            <div class="tubiao_box">
                <a href="#yi">
                <div class="tubiao">
                    <div>
                        <img src="http://2019ncov.bioon.com/images/icon/b.svg" width="65px">
                    </div>
                    <p>全国疫情</p>
                </div>
                </a>
                <a href="https://2019ncov.nosugartech.com/" target="_blank">
                <div class="tubiao">
                    <div>
                        <img src="http://2019ncov.bioon.com/images/icon/c.svg" width="65px" >
                    </div>
                    <p>同程查询</p>
                </div>
                </a>
                <a href="#san">
                <div class="tubiao">
                    <div>
                        <img src="http://2019ncov.bioon.com/images/icon/k.svg" width="65px">
                    </div>
                    <p>谣言粉碎</p>
                </div>
                </a>
                <a href="#si">
                <div class="tubiao">
                    <div>
                        <img src="http://2019ncov.bioon.com/images/icon/a.svg" width="65px">
                    </div>
                    <p>动态播报</p>
                </div>
                </a>
            </div>
            <div class="shuju_neirong_box">
                <a id="yi"></a>
                <section>
                    <div class="quanguoyiqing">
                        <div class="quanguo_neirong" >
                            <div class="ditu">
                                <div id="main2" style="width:100%;height:800px;background:#F7F7F7"></div>
                            </div>
                            <div style="padding-top: 15px">
                                <div id="main" style="width: 100%;height:600px;"></div>
                            </div>
                        </div>
                        <div id="shengji_neirong" class="shengji_neirong2">
                            <div id="main3" style="width: 100%;height:300px;"></div>
                            <div id="main4" style="width: 100%;height:300px;"></div>
                        </div>

                       <table id="tab" width="100%">
					    	<tr style="font-size:.96rem">
					    		<td style="background:#E3E7F3">地区</td><td style="background:#F3BAB0">现存确诊</td><td style="background:#A24F33">积累确诊</td><td style="background:#575A98">死亡</td><td style="background:#95DB9A">治愈</td>
					    	</tr>
					    </table>
                </section>
                <a id="er"></a>
                <section>
                    <div class="tongchengchaxu">
                    </div>
                </section>
                <a id="san"></a>
                <section>
                    <div class="yaoyanfensui">
                        <div id="yaoyan"></div>
						<div id="more2" class="more">查看更多</div>
                    </div>
                </section>
                <a id="si"></a>
                <section>
                    <div class="dongtaibobao">
                        <div id="dssbb">
							<ul id="ssbb">
								
							</ul>
						</div>
						<div id="more1" class="more">查看更多</div>
                    </div>
                </section>
            </div>
        </div>
    <div class="di">
        <b>提高自我防护意识.守望相助.共抗疫情</b>
    </div>
</body>
</html>
