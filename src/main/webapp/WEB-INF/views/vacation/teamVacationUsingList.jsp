<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
<<<<<<< HEAD
	                <div class="row d-flex justify-content-between">
	                	<div class="col-9"></div>
	                	<div class="col-3 d-flex justify-content-end" style="margin-bottom: 5px; ">
							<div class="gridjs-search">
								<input type="date" id="datePick" placeholder="날짜 선택" aria-label="Type a keyword..." class="gridjs-input gridjs-search-input">
								<button style="margin-bottom: 4px;" type="button" class="btn btn-primary" id="dateBtn">검색</button>
							</div>
	                	</div>
				    </div>
                    <table class="table table-bordered align-middle table-nowrap table-check">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">이름</th>
                                <th scope="col">사번</th>
                                <th scope="col">기간</th>
                                <th scope="col">항목</th>
                                <th scope="col">사용시간</th>
                                <th scope="col">승인 여부</th>
                            </tr>
                        </thead>
                        <tbody id="tbody"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    var dateBtn = $("#dateBtn");
    var datePick = $("#datePick");
    
    // 현재 날짜를 가져와서 날짜 선택에 설정
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();
    var formattedDate = yyyy + '-' + mm + '-' + dd;
    datePick.val(formattedDate);

    // dateBtn 클릭 이벤트 핸들러
    dateBtn.on("click", function() {
        var selectedDate = datePick.val();

        // 선택한 날짜
//         console.log(selectedDate);

        var currentDay = new Date(selectedDate);
        var theYear = currentDay.getFullYear();
        var theMonth = currentDay.getMonth();
        var theDate = currentDay.getDate();
        var theDayOfWeek = currentDay.getDay();

        var data = {
                firstDate : selectedDate,
        };
        
        var html = "";
        
        $.ajax({
		    type: "POST",
		    url: "/vacation/teamvacationusinglist",
		    beforeSend : function(xhr){
		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		   }, 
		    data: JSON.stringify(data), 
		    contentType : "application/json; charset=utf-8",
		    dataType : "json",
		    success: function(res) {
		    	console.log(res);
		    	if(res.length == 0){
		    		html += `<tr>
		    		        	<td colspan='6' align=center>선택된 날짜에 휴가 신청 내역이 없습니다.</td>
		    		         </tr>`;
		    	}else{
			    	for(var i = 0; i < res.length; i++){
			    		html += "<tr>";
			    		html += "	<td>" + res[i].empName + "</td>";
			    		html += "	<td>" + res[i].empNo + "</td>";
			    		html += "	<td>" + res[i].vaapStrtDate.substr(0,10) +"~"+ res[i].vaapEndDate.substr(0,10) + "</td>";
			    		html += "	<td>" + res[i].vacName + "</td>";
			    		html += "	<td>" + res[i].vaapAmt + "일</td>";
			    		html += "	<td>";
			    		if(res[i].docStat == '승인'){
			    			html += "<h5><span class='badge bg-success'>승인</span></h5>";
			    		}else if(res[i].docStat == '대기중'){
			    			html += "<h5><button type='button' class='btn btn-secondary' onclick=\"location.href='/document/updatedoc' \">승인대기</button></h5>";
			    		}else if(res[i].docStat == '반려'){
			    			html += "<h5><button type='button' class='btn btn-danger' onclick=\"location.href='/document/updatedoc' \>반려</button></h5>";
			    		}
			    		html += "	</td>";
			    		html += "</tr>";
			    	}
		    	}
		    	$("#tbody").html(html);
		    }
        });
    });

    // 페이지 로딩 시 자동으로 dateBtn 클릭 이벤트 발생
    dateBtn.trigger("click");
});
=======
	                <div class="d-flex">
	                	<div class="p-2 flex-fill">
							<div class="gridjs-search">
								<input type="date" id="datePick" placeholder="날짜 선택" aria-label="Type a keyword..." class="gridjs-input gridjs-search-input">
								<button style="margin-bottom: 4px;" type="button" class="btn btn-primary" id="dateBtn">검색</button>
							</div>
						</div>
	                	<div class="p-2"></div>
				    </div>
                    <table class="table table-bordered align-middle table-nowrap table-check">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">이름</th>
                                <th scope="col">사번</th>
                                <th scope="col">기간</th>
                                <th scope="col">항목</th>
                                <th scope="col">사용시간</th>
                                <th scope="col">승인 여부</th>
<!--                                 <th scope="col">증명 자료</th> -->  <!-- 증명자료 나타낼 수 있는 컬럼이 없ㅇ는데 -->
                            </tr>
                        </thead>
                        <tbody id="tbody">
<!--                             <tr> -->
<!--                                 <td>사원 프로필 이미지 김사과</td> -->
<!--                                 <td> -->
<!--                               		202310101234사번 받아오기 -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	2023.10.10(화)~2023.10.11(수) -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	군소집훈련 -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	2일 -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	<h5><a href="#" class="badge bg-secondary">승인 대기</a></h5> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	<h5><a href="#" class="badge bg-danger">제출 필요</a></h5> -->
<!--                                 </td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>사원 프로필 이미지 박망고</td> -->
<!--                                 <td> -->
<!--                               		202310101234사번 받아오기 -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	2023.10.10(화) -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	연차 -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	1일 -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	<h5><a href="#" class="badge bg-success">승인</a></h5> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                 	<h5><a href="#" class="badge bg-danger"></a></h5> -->
<!--                                 </td> -->
<!--                             </tr> -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    var dateBtn = $("#dateBtn");
    var datePick = $("#datePick");
    
    // 현재 날짜를 가져와서 날짜 선택에 설정
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();
    var formattedDate = yyyy + '-' + mm + '-' + dd;
    datePick.val(formattedDate);

    // dateBtn 클릭 이벤트 핸들러
    dateBtn.on("click", function() {
        var selectedDate = datePick.val();

        // 선택한 날짜
//         console.log(selectedDate);

        var currentDay = new Date(selectedDate);
        var theYear = currentDay.getFullYear();
        var theMonth = currentDay.getMonth();
        var theDate = currentDay.getDate();
        var theDayOfWeek = currentDay.getDay();

        var data = {
                firstDate : selectedDate,
        };
        
        var html = "";
        
        $.ajax({
		    type: "POST",
		    url: "/vacation/teamvacationusinglist",
		    beforeSend : function(xhr){
		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		   }, 
		    data: JSON.stringify(data), 
		    contentType : "application/json; charset=utf-8",
		    dataType : "json",
		    success: function(res) {
		    	console.log(res);
		    	if(res.length == 0){
		    		html += `<tr>
		    		        	<td colspan='6' align=center>선택된 날짜에 휴가 신청 내역이 없습니다.</td>
		    		         </tr>`;
		    	}else{
			    	for(var i = 0; i < res.length; i++){
			    		html += "<tr>";
			    		html += "	<td>" + res[i].empName + "</td>";
			    		html += "	<td>" + res[i].empNo + "</td>";
			    		html += "	<td>" + res[i].vaapStrtDate.substr(0,10) +"~"+ res[i].vaapEndDate.substr(0,10) + "</td>";
			    		html += "	<td>" + res[i].vacName + "</td>";
			    		html += "	<td>" + res[i].vaapAmt + "일</td>";
			    		html += "	<td>";
			    		if(res[i].docStat == '승인'){
			    			html += "<h5><span class='badge bg-success'>승인</span></h5>";
			    		}else if(res[i].docStat == '대기중'){
			    			html += "<h5><button type='button' class='btn btn-secondary' onclick=\"location.href='/document/updatedoc' \">승인대기</button></h5>";
			    		}else if(res[i].docStat == '반려'){
			    			html += "<h5><button type='button' class='btn btn-danger' onclick=\"location.href='/document/updatedoc' \>반려</button></h5>";
			    		}
			    		html += "	</td>";
			    		html += "</tr>";
			    	}
		    	}
		    	$("#tbody").html(html);
		    }
        });
    });

    // 페이지 로딩 시 자동으로 dateBtn 클릭 이벤트 발생
    dateBtn.trigger("click");
});


>>>>>>> branch 'master' of https://github.com/cheonyongyong/finalProject
</script>