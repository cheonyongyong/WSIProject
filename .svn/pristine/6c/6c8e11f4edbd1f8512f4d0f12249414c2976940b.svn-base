<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
<style>
td {
	word-wrap: break-word;
	text-align: center;
}
</style>
</head>
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="row" style="display: flex;">
					<div class="col-lg-4 pb-5">
						<h5 style="text-align: center;"><b>사원 성별 비율</b></h5>
						<canvas id="genderChart" style="width: 250px; height: 250px;"></canvas>
					</div>
					<div class="col-lg-4 pb-5">
						<h5 style="text-align: center;"><b>연도별 채용된 사원 수</b></h5>
						<canvas id="recruitChart" style="width: 500px; height: 500px;"></canvas>
					</div>
					<div class="col-lg-4 pb-5">
						<h5 style="text-align: center;"><b>근무 차트</b></h5>
						<canvas id="workChart" style="width: 250px; height: 250px;"></canvas>
					</div>
<!-- 					<div class="col-lg-4"> -->
<!-- 						<h5 style="text-align: center;"><b>일주일 근무 total</b></h5> -->
<%-- 						<canvas id="workinfochart" style="width: 250px; height: 250px;"></canvas> --%>
<!-- 					</div> -->
<!-- 					<div class="col-lg-4"> -->
<!-- 						<h5 style="text-align: center;"><b>근무 차트</b></h5> -->
<%-- 						<canvas id="my" style="width: 250px; height: 250px;"></canvas> --%>
<!-- 					</div> -->
<!-- 					<div class="col-lg-4 pb-5"> -->
<!-- 						<h5 style="text-align: center;"><b>부서별 급여</b></h5> -->
<%-- 						<canvas id="departmentPayChart" style="width: 250px; height: 250px;"></canvas> --%>
<!-- 					</div> -->
<!-- 					<div class="col-lg-4 pb-5"> -->
<!-- 						<h5 style="text-align: center;"><b>매출</b></h5> -->
<%-- 						<canvas id="departmentPayChart" style="width: 250px; height: 250px;"></canvas> --%>
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
</div>








<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>
<script type="text/javascript">

$(function() {
	// 성별 차트
	$.ajax({
        url: "/stats/genderchart",
        beforeSend: function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
        async: true,
//         data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function(data) {
            var empGenlist = [];
            var countlist = [];
            var ratiolist = [];

            $.each(data, function(){
            	empGenlist.push(this["empGen"]);
                countlist.push(this["cnt"]);
                ratiolist.push(this["ratio"]);
            });

            console.log("Data received:", data);
            console.log("Gender Names:", empGenlist);
            console.log("Counts:", countlist);
            console.log("Ratios:", ratiolist);

            const ctx = document.getElementById('genderChart').getContext('2d');
            const myChart1 = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: empGenlist,
                    datasets: [{
                        label: '성별',
                        data: ratiolist,
                        backgroundColor: [
                            '#54D4FF',
                            '#FF5454',
                        ],
                        hoverOffset: 4
                    }]
                }
            });
        }, // 성별 차트
        
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
            console.log(xhr.responseText);
        }
    });
	
	// 채용차트
	
	$.ajax({
        url: "/stats/recruityearchart",
        beforeSend: function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
        async: true,
//         data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function(data) {
            var yearlist = [];
            var totalCntlist = [];

            $.each(data, function(){
            	yearlist.push(this["year"]);
            	totalCntlist.push(this["totalCnt"]);
            });

            console.log("Data received:", data);
            console.log("채용년도 :", yearlist);
            console.log("Counts:", totalCntlist);

            const ctx = document.getElementById('recruitChart').getContext('2d');
            const myChart1 = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: yearlist,
                    datasets: [{
                        label: '채용 인원 수',
                        data: totalCntlist,
                        backgroundColor: [
                            '#54D4FF',
                            '#54A7FF',
                            '#54D4FF',
                            '#54A7FF',
                            '#54D4FF',
                            '#54A7FF',
                            '#54D4FF',
                            '#54A7FF',
                            '#54D4FF',
                            '#54A7FF',
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
                				stepSize : 10,
                				fontSize : 14,
                			}
                		}]
                	}
                }
            });
        },	// 채용 차트
        
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
            console.log(xhr.responseText);
        }
    });
	
	
	$.ajax({
        url: "/stats/workinfochart",
        beforeSend: function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
        async: true,
//         data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        success: function(data) {
            var empNolist = [];
            var totalWorklist = [];
            var workStimelist = [];

            $.each(data, function(){
            	empNolist.push(this["empNo"]);
            	totalWorklist.push(this["totalWork"]);
            	workStimelist.push(this["workStime"]);
            });

            console.log("Data received:", data);
            console.log("empNolist:", empNolist);
            console.log("totalWorklist:", totalWorklist);
            console.log("workStimelisst:", workStimelist);

            const ctx = document.getElementById('workinfochart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: empNolist,
                    datasets: [{
                        label: '근무시간',
                        data: totalWorklist,
                        backgroundColor: [
                            'lightblue',
                        ],
                        hoverOffset: 4
                    }]
                }
            });
        }, // 근무 차트
        
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
            console.log(xhr.responseText);
        }
    });
	
	
	
});

	
new Chart(document.getElementById("workChart"), {
    type: 'doughnut',
    data: {
      labels: ["일반 근무", "추가 근무", "남은 시간"],
      datasets: [
        {
          label: "근무",
          backgroundColor: ["#54D4FF", "#54A7FF", "#9D9D9D"],
          data: [40, 4, 8]
        }
      ]
    },
});




</script>

