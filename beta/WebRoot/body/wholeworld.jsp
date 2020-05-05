<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'wholeworld.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		var json = {};
		$(function(){
			json=${worldjson}
			console.log(json);
			
			$("#confirmedCount").text(json.data.confirmedCount);
			$("#deadCount").text(json.data.deadCount);
			$("#curedCount").text(json.data.curedCount);
			$("#updateTime").text(json.data.updateTime);
			
			for (var i=0;i<json.data.continent[0].country.length;i++){
				$("#tab").append("<tr><td>"+json.data.continent[0].country[i].countryName+"</td><td>"+json.data.continent[0].country[i].confirmedCount+"</td><td>"+json.data.continent[0].country[i].deadCount+"</td><td>"+json.data.continent[0].country[i].curedCount+"</td></tr>");
			}
		});
		function diqu(obj){
			for (var i=1;i<$("#tab").children().children().length;i++){
				var i=1;i<$("#tab").children().children()[i].remove();
			}
			for (var i=0,a = $(obj).prop("value");i<json.data.continent[a].country.length;i++){
				$("#tab").append("<tr><td>"+json.data.continent[a].country[i].countryName+"</td><td>"+json.data.continent[a].country[i].confirmedCount+"</td><td>"+json.data.continent[a].country[i].deadCount+"</td><td>"+json.data.continent[a].country[i].curedCount+"</td></tr>");
			}
		}
	</script>
	
  </head>
  
  <body>
  	
  	<p>全球确诊总数:<b id="confirmedCount"></b>,死亡总数:<b id="deadCount"></b>,治愈总数:<b id="curedCount"></b>,更新时间:<b id="updateTime"></b></p>
  	
  	亚洲<input type="radio" name="diqu" value="0" checked="checked" onclick="diqu(this)">
  	欧洲<input type="radio" name="diqu" value="1" onclick="diqu(this)">
  	北美洲<input type="radio" name="diqu" value="2" onclick="diqu(this)">
  	大洋洲<input type="radio" name="diqu" value="3" onclick="diqu(this)"><br><br>
  	
  	
  	<table id="tab">
  		<tr>
  			<td>国家</td><td>确诊总数</td><td>死亡总数</td><td>治愈总数</td>
  		</tr>
  	</table>
  </body>
</html>
