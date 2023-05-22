<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>켈린더</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
.head{
	display: flex;
}
.header{
	display: flex;
}
.days{
	display: flex;
}
.C_header {
    width: 100px;
    height: 80px;
    border: 1px solid black;
}
.C_days {
    width: 100px;
    height: 80px;
    border: 1px solid black;
}
</style>
<body>
 	<div>
 		<h2>캘린더 생성하기</h2>
 		
 		<h3>옆의 버튼을 누르면 캘린더가 생성됩니다.</h3>
 		<div class="head">
 		<button id="calandar_prev"> < </button>
 		<h3 id="thismonth"></h3>
 		<button id="calandar_next"> > </button>
 		</div>
 	</div>
 	
 	<div>
 		<div id="Calandar">
 			<div class="header" id="Calandar_header">
	 			<div class="C_header">일</div>
	 			<div class="C_header">월</div>
	 			<div class="C_header">화</div>
	 			<div class="C_header">수</div>
	 			<div class="C_header">목</div>
	 			<div class="C_header">금</div>
	 			<div class="C_header">토</div>
 			</div>
 			<div class="days" id="Calandar_days_first">
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
 			</div>
 			<div class="days" id="Calandar_days_second">
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
 			</div>
 			<div class="days" id="Calandar_days_third">
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
 			</div>
 			<div class="days" id="Calandar_days_fourth">
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
 			</div>
 			<div class="days" id="Calandar_days_fiveth">
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
 			</div>
 			<div class="days" id="Calandar_days_sixth">
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
	 			<div class="C_days"></div>
 			</div>
 		</div>
 	</div>
</body>
<script>
	var current = new Date();
	$(document).ready(function(){

		Calandar(current)
	})
	
	function Calandar(thisdate) {
		clear()
		var current = new Date(thisdate);
		var currentYear = current.getFullYear()
		var currentMonth = current.getMonth()
		
		$("#thismonth").text(currentYear + "년 " + (currentMonth+1) + "월 ")
		var startDay = new Date(currentYear, currentMonth, 1);
		var endDay = new Date(currentYear, currentMonth+1, 0);
		var prevDate = endDay.getDate();
		var prevDay = startDay.getDay();
		var daycount = 1;
		var count = ["first","second","third","fourth","fiveth","sixth"]

		for(let i=0; i < count.length; i++){
			console.log(count[i]);
			console.log(prevDay);
			$('#Calandar_days_'+count[i]+' .C_days').each(function (index, item){
				if(prevDay == 7){
					prevDay = 0;
				}
				
				if(prevDay < 7 && daycount <= prevDate){
					if(index == prevDay){
						$(item).text(daycount);
						daycount++;
						prevDay++
					}
				}
			})
		}
	}
	function clear(){
		var count = ["first","second","third","fourth","fiveth","sixth"]

		for(let i=0; i < count.length; i++){
			$('#Calandar_days_'+count[i]+' .C_days').each(function (index, item){
				
				$(item).text("");

				
			})
		}
	}
	$("#calandar_next").click(function(){
		var currentYear = current.getFullYear()
		var currentMonth = current.getMonth()
		current = new Date(currentYear, currentMonth+1, 1);
		Calandar(current)
	})
	
	$("#calandar_prev").click(function(){
		var currentYear = current.getFullYear()
		var currentMonth = current.getMonth()
		current = new Date(currentYear, currentMonth-1, 1);
		Calandar(current)
	})
</script>
</html>