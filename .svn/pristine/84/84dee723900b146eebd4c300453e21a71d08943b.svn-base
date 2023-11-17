<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">
tr:hover{
    background: #F1F1F2;    
}
</style>
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
<!--                 	<h2>근무 기록</h2> -->
                	<div class="row">
                		<div class="col-9">
                			<div class="p-2"><h5>이번 주 총 근무시간 : <span id="sum"></span></h5></div>
                		</div>
                		<div class="col-3 text-end">
							<div class="p-2 gridjs-search">
								<input type="date" id="datePick" placeholder="날짜 선택" aria-label="Type a keyword..." class="gridjs-input gridjs-search-input">
								<button style="margin-bottom: 4px;" type="button" class="btn btn-primary" id="dateBtn">검색</button>
							</div>
                		</div>
                	</div>
                    <table class="table table-bordered align-middle table-nowrap table-check">
                        <thead class="table-light">
                            <tr>
                                <th scope="col" style="width:25%;">날짜</th>
                                <th scope="col" style="width:25%;">근무한 시간</th>
                                <th scope="col" style="width:25%;">총근무시간</th>
                                <th scope="col" style="width:25%;">승인여부</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                        	<!-- 
                        		id="date${i.index }"
                        		<div id="workBadge"></div>
									<div class="d-flex gap-2">
                                       <h5>
										<div class="badge bg-info">근무</div>
										<span class="fs-6">
											<a href="/document/documentwrite?docClfFile=3" class="text-muted"><span id="work${i.index }"></span></a>
										</span>
									</h5>
                                </div>
                        		id="total${i.index }"
                        	 -->
<%-- 							<c:forEach var="work" varStatus="i" begin="0" end="6" step="1"> --%>
<!-- 								<tr> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
								
<!---------------------------------------------------------------------------------------------------------------------------------------------->                            
<!--                             <tr> -->
<!--                                 <td></td> -->
<!--                                 <td> -->
<!--                                 	 <div class="d-flex gap-2"> -->
<!--                                         <h5><a href="#" class="badge bg-purple">출장기안 종류로 구분??</a></h5>09:00~18:00 -->
<!--                                     </div> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!-- 									<h5> -->
<!-- 										<div class="badge bg-info">근무</div> -->
<!-- 										<span class="fs-6"> -->
<!-- 											<a href="/document/documentwrite?docClfFile=3" class="text-muted"></a> -->
<!-- 										</span> -->
<!-- 									</h5> -->
<!-- 								</td> -->
<!--                                 <td> -->
<!--                                     <div class="d-flex gap-2"> -->
<!--                                     </div> -->
<!--                                 </td> -->
<!--                             </tr> -->
                            
<!--                             <tr> -->
<!--                                 <td> -->
<!--                                     <div class="d-flex gap-2"> -->
<!--                                         <h5><div class="badge bg-success">승인</div></h5> -->
<!--                                     </div> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	 <div class="d-flex gap-2"> -->
<!--                                         <h5><a href="#" class="badge bg-warning">외근</a></h5>09:00~18:00 -->
<!--                                     </div> -->
<!--                                 </td> -->
<!--                                 <td></td> -->
<!--                                 <td> -->
<!--                                     <div class="d-flex gap-2"> -->
<!--                                         <h5><a href="#" class="badge bg-secondary">대기</a></h5> -->
<!--                                     </div> -->
<!--                                 </td> -->
<!--                             </tr> -->
<!---------------------------------------------------------------------------------------------------------------------------------------------->                            
                        </tbody>
                        <!-- end tbody -->
                    </table>
                    <!-- end table -->
                </div>
                <!-- end table responsive -->
            </div>
            <!-- end card body -->
        </div>
        <!-- end card -->
    </div>
    <!-- end col -->
</div>
<!-- end row -->
<script type="text/javascript">
$(document).ready(function() {
    var dateBtn = $("#dateBtn");
    var datePick = $("#datePick");
    var holidayArr = [];
    
    // 현재 날짜를 가져와서 날짜 선택에 설정
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();
    var formattedDate = yyyy + '-' + mm + '-' + dd;
    datePick.val(formattedDate);

    // 공휴일을 받아오는 함수
    getHolidayData();
    
    dateBtn.on("click", function() {
        var selectedDate = datePick.val();
        // 선택한 날짜
//         console.log(selectedDate);
        var currentDay = new Date(selectedDate);
        var theYear = currentDay.getFullYear();
        var theMonth = currentDay.getMonth();
        var theDate = currentDay.getDate();
        var theDayOfWeek = currentDay.getDay();
 
//         console.log(theDayOfWeek);
        var thisWeek = [];
        for (var i = 0; i < 7; i++) {
            var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek + 1));
            var yyyy = resultDay.getFullYear();
            var mm = String(resultDay.getMonth() + 1).padStart(2, '0');
            var dd = String(resultDay.getDate()).padStart(2, '0');
            thisWeek[i] = yyyy + '-' + mm + '-' + dd;
        }
            
        var data = {
                firstDate : thisWeek[0],
                lastDate : thisWeek[6]
        };
        
        var day = ["(월)", "(화)", "(수)", "(목)", "(금)", "(토)", "(일)"];
          
		$.ajax({
		    type: "POST",
		    url: "/work/myworklist",
		    beforeSend : function(xhr){
		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		   }, // post방식으로 ajax통신 할 때 csrf토큰을 보내주지 않으면 302 redirect에러가 뜬다. 꼭 같이 보내주기
		    data: JSON.stringify(data), // 날짜
		    contentType : "application/json; charset=utf-8",
		    dataType : "json",
		    success: function(res) {
// 		        console.log(res[0].workStime); 
// 		        console.log(res[0].workEtime); 
		        console.log(holidayArr);
// 	        	var sum = 0;
// 		        for(var i = 0; i < res.length; i++){
// 		        	$("#work" + i).text(res[i].workStime.substr(11,5) + '~'+ res[i].workEtime.substr(11,5));
// 		        	$("#total" + i).text(res[i].workTotal + '시간');
// 		        	sum += res[i].workTotal;
// 		        }
// 	        	$("#sum").text(sum + '시간');
				var sum = 0;
		    	var html = "";
		    	var flag = false;
		    	for(var i = 0; i < 7; i++){
		    		// 기본근무 + 외근 + 출장
		    		for(var j = 0; j < res.length; j++){
		    			// datepicker로 골라낸 날짜로 받은 주의 날짜가 DB에 저장된 근무기록의 날짜와 같을 때 
			    		if(thisWeek[i] == res[j].workStime.substr(0,10)){
				    		html += `<tr onclick="location.href='/document/documentwrite?docClfCode=2'">`;
					    	html += "	<td>"+settingDate(thisWeek[i],day[i])+"</td>";
					    	html += "	<td>";
					    	html += "		<div id='workBadge'></div>";
					    	html += "		<div class='d-flex gap-2'>";
				    		html += "			<h5>";
					    	html += "				<div class='badge bg-info'>근무</div>";
					    	html += "				<span class='fs-6'>";
					    	html += 					res[j].workStime.substr(11,5) + '~'+ res[j].workEtime.substr(11,5);
					    	html += "				</span>";
					    	html += "			</h5>";
					    	html += "		</div>";
					    	html += "	</td>";
					    	html += "	<td>"+res[j].workTotal + '시간'+"</td>";
					    	html += "	<td></td>";
					    	html += "</tr>";
					    	flag = true;
				    		sum += res[j].workTotal;
					    	break;
			    		}
		    		}
		    		
		    		// datepicker로 골라낸 날짜가 DB에 저장된 근무기록의 날짜가 아닐 때 그냥 출력
		    		if(flag == false){
		    			html += `<tr onclick="location.href='/document/documentwrite?docClfCode=2'">`;
		    			html += "	<td>"+settingDate(thisWeek[i],day[i])+"</td>";
		    			html += "	<td></td>";
		    			html += "	<td></td>";
		    			html += "	<td></td>";
		    			html += "</tr>";
		    		}
// -----------------------------------------------------------------------------------------------------------------------------
		    		// 주말에 해당하는 날짜 처리는 여기서
		    		// 토요일
		    		if(i == 5){
		    			html += `<tr onclick="location.href='/document/documentwrite?docClfCode=2'">`;
		    			html += "	<td>" + "<font class='text-primary fw-bold'>" + settingDate(thisWeek[i],day[i]) + "</font></td>";
		    			html += "	<td></td>";
		    			html += "	<td></td>";
		    			html += "	<td></td>";
		    			html += "</tr>";
		    		}
		    		// 일요일
		    		if(i == 6){
		    			html += `<tr onclick="location.href='/document/documentwrite?docClfCode=2'">`;
		    			html += "	<td>" + "<font class='text-danger fw-bold'>" + settingDate(thisWeek[i],day[i]) + "</font></td>";
		    			html += "	<td></td>";
		    			html += "	<td></td>";
		    			html += "	<td></td>";
		    			html += "</tr>";
		    		}
		    	}
		    	$("#sum").text(sum + '시간');
		        $("#tbody").html(html);
		    }
		});    
            
//         for (var i = 0; i < thisWeek.length; i++) {
//             $("#date" + i).text(thisWeek[i] + day[i]);
//         }
        
    });

    // 날짜 표시해주는 함수
    function settingDate(week, day){
    	var result = "";
    	var flag = false;
    	var datetime = week.replaceAll("-","");
	    for(var i = 0; i < holidayArr.length; i++){
    		if(datetime == holidayArr[i].holidayDate){
	    		result = week + day + "<font class='text-danger fw-bold'> ["+holidayArr[i].holidayName+"] </font>";
	    		flag = true;
	    	}
	    }
	    
	    if(flag == false){
	    	result = week + day;
	    }
	    return result;
    }
    
    // 공휴일을 받아오는 함수
    function getHolidayData(){
    	$.ajax({
    		url : "/holiday",
    		type : "get",
    		success : function(res){
    			res.map(function(e, i){
	    			holidayArr.push({"holidayDate" : e.holidayDate, "holidayName" : e.holidayName});
    			});
    		}
    	});
    }
    
    // 페이지 로딩 시 자동으로 dateBtn 클릭 이벤트 발생
    setTimeout(() => {
	    dateBtn.trigger("click");
	}, 100);
    
    
});
</script>