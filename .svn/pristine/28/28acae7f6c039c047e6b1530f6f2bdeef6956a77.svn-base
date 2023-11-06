<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="site-blocks-cover overlay" style="background-image: url(${pageContext.request.contextPath }/resources/images/cloud.jpg); height: 30px;" data-aos="fade" id="home-section">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-6 mt-lg-5 text-center">
				<h1>통계내기</h1>
			</div>
		</div>
	</div>
</div>
<div class="container" style="max-width: 80%;">
    <div class="row" style="margin: 0; padding: 0;">
        <div class="col-lg-2 pt-5 pb-5" style="padding-left: 20px; padding-right: 20px;">
            <!-- 사이드 메뉴 -->
            <%@ include file="sidemenuAdmin.jsp" %>
        </div>

		<div class="col-lg-10 pt-5" style="padding-left: 20px; padding-right: 20px;">
			<!--차트가 그려질 부분-->
			<div class="row" style="display: flex;">
				<div class="col-lg-4 pb-5">
					<h5 style="text-align: center;"><b>가장 많이 선택된 Level</b></h5>
					<canvas id="levelChart" style="width: 250px; height: 250px;"></canvas>
				</div>
				<div class="col-lg-4 pb-5">
					<h5 style="text-align: center;"><b>가장 많이 선택된 기능</b></h5>
					<canvas id="funcChart" style="width: 250px; height: 250px;"></canvas>
				</div>
				<div class="col-lg-4 pb-5">
					<h5 style="text-align: center;"><b>월별 매출액</b></h5>
					<canvas id="salesChart" style="width: 380px; height: 380px;"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
<script type="text/javascript">




$(function(){
    $.ajax({
        url: "/levelchart",
        beforeSend: function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
        async: true,
//         data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function(data) {
            var levelNamelist = [];
            var countlist = [];
            var ratiolist = [];

            $.each(data, function(){
                levelNamelist.push(this["levelName"]);
                countlist.push(this["cnt"]);
                ratiolist.push(this["ratio"] );
            });

            console.log("levelName :", data);
            console.log("레벨 이름:", levelNamelist);
            console.log("레벨 선택 수:", countlist);
            console.log("레벨 선택 비율:", ratiolist);

            const ctx = document.getElementById('levelChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: levelNamelist,
                    datasets: [{
                        label: '레벨 선택',
                        data: ratiolist,
                        backgroundColor: [
                            'lightblue',
                            'pink',
                            '#fcf6bd'
                        ],
                        hoverOffset: 4
                    }]
                }
            });
        }, // 레벨 차트
        
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
            console.log(xhr.responseText);
        }
    });
    
    $.ajax({
        url: "/funcchart",
        beforeSend: function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
        async: true,
//         data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function(data) {
            var funcMemolist = [];
            var countlist = [];
            var ratiolist = [];

            $.each(data, function(){
                funcMemolist.push(this["funcMemo"]);
                countlist.push(this["cnt"]);
                ratiolist.push(this["ratio"]);
            });

            console.log("funcName :", data);
            console.log("기능 이름:", funcMemolist);
            console.log("기능 선택 수 :", countlist);
            console.log("기능 선택 비율:", ratiolist);

            const ctx = document.getElementById('funcChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: funcMemolist,
                    datasets: [{
                        label: '기능 선택',
                        data: ratiolist,
                        backgroundColor: [
                            'lightblue',
                            'pink',
                            '#fcf6bd',
                            '#cdb4db',
                        ],
                        hoverOffset: 4
                    }]
                }
            });
        }, // 기능 차트
        
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
            console.log(xhr.responseText);
        }
    });
    
    $.ajax({
        url: "/saleschart",
        beforeSend: function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
        async: true,
//         data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function(data) {
            var totalCntlist = [];
            var monthlist = [];

            $.each(data, function(){
            	totalCntlist.push(this["totalCnt"]);
            	monthlist.push(this["month"]);
            });

            console.log("Sales:", data);
            console.log("날짜:", monthlist);
            console.log("매출:", totalCntlist);

            const ctx = document.getElementById('salesChart').getContext('2d');
            const myChart1 = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: monthlist,
                    datasets: [{
                        label: '매출액',
                        data: totalCntlist,
                        backgroundColor: [
                            'lightblue',
                            'pink',
                        ],
                        hoverOffset: 4
                    }]
                },
                options: {
                	responsive: false,
                	scales: {
                		yAxes: [{
                			ticks: {
                				min: 0,
                				stepSize : 2000000,
                				fontSize : 14,
                			}
                		}]
                	}
                }
            });
        }, // 매출 차트
        
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
            console.log(xhr.responseText);
        }
    });
    
    
    
    
    
    
    
    
});


// function levelChart() {
// 	console.log("Data received:", data);
//     console.log("Level Names:", levelNamelist);
//     console.log("Counts:", countlist);

// }

// function funcChart() {
	
// }




</script>
