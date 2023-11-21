<<<<<<< HEAD
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="kr.or.ddit.vo.CustomUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 포틀릿 api -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/gridstack.js/9.1.1/gridstack.min.css" />
<!-- column 갯수 제한 할 땐 아래 것도 필요-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/gridstack.js/9.1.1/gridstack-extra.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/gridstack.js/9.1.1/gridstack-all.min.js"></script>

<!-- 풀캘린더 -->
<script src='${pageContext.request.contextPath }/resources/assets/js/index.global.js'></script>
<script src='${pageContext.request.contextPath }/resources/assets/js/index.global.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/assets/js/ko.js'></script>

<!-- 차트  -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- 그리드  -->
<style>
#wrapper {
    width: 70vw;
    height: 60vh;
}

.grid-stack {
/* 	border: 1px solid black; */
    background-color: #F7F8FA;
}

.grid-stack-item-content {
/* 	border: 1px solid black; */
	border-radius: 20px;
    background-color: #ffffff;
/*     text-align: center; */
}

div[gs-id="gridtitle"]>.grid-stack-item-content {
	background-color: #ffffff;
}

.trash {
    height: 100%;
    border: 1px solid black;
    background: rgba(255, 0, 0, 0.1) center center url(data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjY0cHgiIGhlaWdodD0iNjRweCIgdmlld0JveD0iMCAwIDQzOC41MjkgNDM4LjUyOSIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNDM4LjUyOSA0MzguNTI5OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+CjxnPgoJPGc+CgkJPHBhdGggZD0iTTQxNy42ODksNzUuNjU0Yy0xLjcxMS0xLjcwOS0zLjkwMS0yLjU2OC02LjU2My0yLjU2OGgtODguMjI0TDMwMi45MTcsMjUuNDFjLTIuODU0LTcuMDQ0LTcuOTk0LTEzLjA0LTE1LjQxMy0xNy45ODkgICAgQzI4MC4wNzgsMi40NzMsMjcyLjU1NiwwLDI2NC45NDUsMGgtOTEuMzYzYy03LjYxMSwwLTE1LjEzMSwyLjQ3My0yMi41NTQsNy40MjFjLTcuNDI0LDQuOTQ5LTEyLjU2MywxMC45NDQtMTUuNDE5LDE3Ljk4OSAgICBsLTE5Ljk4NSw0Ny42NzZoLTg4LjIyYy0yLjY2NywwLTQuODUzLDAuODU5LTYuNTY3LDIuNTY4Yy0xLjcwOSwxLjcxMy0yLjU2OCwzLjkwMy0yLjU2OCw2LjU2N3YxOC4yNzQgICAgYzAsMi42NjQsMC44NTUsNC44NTQsMi41NjgsNi41NjRjMS43MTQsMS43MTIsMy45MDQsMi41NjgsNi41NjcsMi41NjhoMjcuNDA2djI3MS44YzAsMTUuODAzLDQuNDczLDI5LjI2NiwxMy40MTgsNDAuMzk4ICAgIGM4Ljk0NywxMS4xMzksMTkuNzAxLDE2LjcwMywzMi4yNjQsMTYuNzAzaDIzNy41NDJjMTIuNTY2LDAsMjMuMzE5LTUuNzU2LDMyLjI2NS0xNy4yNjhjOC45NDUtMTEuNTIsMTMuNDE1LTI1LjE3NCwxMy40MTUtNDAuOTcxICAgIFYxMDkuNjI3aDI3LjQxMWMyLjY2MiwwLDQuODUzLTAuODU2LDYuNTYzLTIuNTY4YzEuNzA4LTEuNzA5LDIuNTctMy45LDIuNTctNi41NjRWODIuMjIxICAgIEM0MjAuMjYsNzkuNTU3LDQxOS4zOTcsNzcuMzY3LDQxNy42ODksNzUuNjU0eiBNMTY5LjMwMSwzOS42NzhjMS4zMzEtMS43MTIsMi45NS0yLjc2Miw0Ljg1My0zLjE0aDkwLjUwNCAgICBjMS45MDMsMC4zODEsMy41MjUsMS40Myw0Ljg1NCwzLjE0bDEzLjcwOSwzMy40MDRIMTU1LjMxMUwxNjkuMzAxLDM5LjY3OHogTTM0Ny4xNzMsMzgwLjI5MWMwLDQuMTg2LTAuNjY0LDguMDQyLTEuOTk5LDExLjU2MSAgICBjLTEuMzM0LDMuNTE4LTIuNzE3LDYuMDg4LTQuMTQxLDcuNzA2Yy0xLjQzMSwxLjYyMi0yLjQyMywyLjQyNy0yLjk5OCwyLjQyN0gxMDAuNDkzYy0wLjU3MSwwLTEuNTY1LTAuODA1LTIuOTk2LTIuNDI3ICAgIGMtMS40MjktMS42MTgtMi44MS00LjE4OC00LjE0My03LjcwNmMtMS4zMzEtMy41MTktMS45OTctNy4zNzktMS45OTctMTEuNTYxVjEwOS42MjdoMjU1LjgxNVYzODAuMjkxeiIgZmlsbD0iI2ZmOWNhZSIvPgoJCTxwYXRoIGQ9Ik0xMzcuMDQsMzQ3LjE3MmgxOC4yNzFjMi42NjcsMCw0Ljg1OC0wLjg1NSw2LjU2Ny0yLjU2N2MxLjcwOS0xLjcxOCwyLjU2OC0zLjkwMSwyLjU2OC02LjU3VjE3My41ODEgICAgYzAtMi42NjMtMC44NTktNC44NTMtMi41NjgtNi41NjdjLTEuNzE0LTEuNzA5LTMuODk5LTIuNTY1LTYuNTY3LTIuNTY1SDEzNy4wNGMtMi42NjcsMC00Ljg1NCwwLjg1NS02LjU2NywyLjU2NSAgICBjLTEuNzExLDEuNzE0LTIuNTY4LDMuOTA0LTIuNTY4LDYuNTY3djE2NC40NTRjMCwyLjY2OSwwLjg1NCw0Ljg1MywyLjU2OCw2LjU3QzEzMi4xODYsMzQ2LjMxNiwxMzQuMzczLDM0Ny4xNzIsMTM3LjA0LDM0Ny4xNzJ6IiBmaWxsPSIjZmY5Y2FlIi8+CgkJPHBhdGggZD0iTTIxMC4xMjksMzQ3LjE3MmgxOC4yNzFjMi42NjYsMCw0Ljg1Ni0wLjg1NSw2LjU2NC0yLjU2N2MxLjcxOC0xLjcxOCwyLjU2OS0zLjkwMSwyLjU2OS02LjU3VjE3My41ODEgICAgYzAtMi42NjMtMC44NTItNC44NTMtMi41NjktNi41NjdjLTEuNzA4LTEuNzA5LTMuODk4LTIuNTY1LTYuNTY0LTIuNTY1aC0xOC4yNzFjLTIuNjY0LDAtNC44NTQsMC44NTUtNi41NjcsMi41NjUgICAgYy0xLjcxNCwxLjcxNC0yLjU2OCwzLjkwNC0yLjU2OCw2LjU2N3YxNjQuNDU0YzAsMi42NjksMC44NTQsNC44NTMsMi41NjgsNi41N0MyMDUuMjc0LDM0Ni4zMTYsMjA3LjQ2NSwzNDcuMTcyLDIxMC4xMjksMzQ3LjE3MnogICAgIiBmaWxsPSIjZmY5Y2FlIi8+CgkJPHBhdGggZD0iTTI4My4yMiwzNDcuMTcyaDE4LjI2OGMyLjY2OSwwLDQuODU5LTAuODU1LDYuNTctMi41NjdjMS43MTEtMS43MTgsMi41NjItMy45MDEsMi41NjItNi41N1YxNzMuNTgxICAgIGMwLTIuNjYzLTAuODUyLTQuODUzLTIuNTYyLTYuNTY3Yy0xLjcxMS0xLjcwOS0zLjkwMS0yLjU2NS02LjU3LTIuNTY1SDI4My4yMmMtMi42NywwLTQuODUzLDAuODU1LTYuNTcxLDIuNTY1ICAgIGMtMS43MTEsMS43MTQtMi41NjYsMy45MDQtMi41NjYsNi41Njd2MTY0LjQ1NGMwLDIuNjY5LDAuODU1LDQuODUzLDIuNTY2LDYuNTdDMjc4LjM2NywzNDYuMzE2LDI4MC41NSwzNDcuMTcyLDI4My4yMiwzNDcuMTcyeiIgZmlsbD0iI2ZmOWNhZSIvPgoJPC9nPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=) no-repeat;
}

#dleft,
#dright {
    display: inline-block;
    vertical-align: top;
}

#dleft {
    width: 1600px;
    height: 900px;
}
</style>

<!-- 날씨  -->
<style>
#result1 img {
/*   margin: 0.6em 0 0 0; */
  width: 6.2em;
  filter: drop-shadow(0 1.8em 3.7em var(--shadow));
}
.temp-container { 
	display: flex; 
	justify-content: center;
} 
.temp-container div {
  padding: 0.3em 1em;
}
.temp-container div:first-child {
/*   border-right: 1px solid var(--transp-white-1); */
}
.temp-container .title {
  font-weight: 600;
/*   color: var(--white); */
}
.temp-container .temp {
  font-weight: 300;
/*   color: var(--off-white); */
}
</style>

<!-- 캘린더 -->
<style>
/* 일요일 날짜 빨간색 */
.fc-day-sun[role="gridcell"] div {
/*   background-color: #FFEFEF; */
/*   text-decoration: none; */
}
.fc-day-sun a {
    color: red;
}
</style>
<%
	CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
%>
<div id="body" class="row">
    <div class="col-lg-12">
        <div class="row">
        	<div class="">
                <div class="card card-h-100" style="height: 1000px; background-color: #F7F8FA; border: none;">
                    <div class="">
                    
	                    <div style="" id="wrapper">
						    <div class="grid-stack" id="dleft"></div>
						</div>
						
                    </div>
                </div>
            </div> <!-- end col -->
        </div>
	</div> 
</div>

<script>
$(function(){
	$.ajax({
		url : "/home/gridstack", // 값 불러오기
		method : "GET",
		dataType : "json",
		success: function(items) {
			gridStack(items);
		}
	});
	
	// 포틀릿 생성부분
	function gridStack(items){
	
		//확장 (jQuery Plugin 느낌!)
	    GridStack.prototype.yongMethod = function () {
			console.log("GridStack", this);
	    }
	
	    let gridOption = {
			oneColumnSize: 150,          			// (default 768)
	        disableOneColumnMode: true,
	        column: 12,                   			// 총 몇칸 (default 12)
	        minRow: 1,
	        margin: 3,								// 빈 공간
//         	horizontalMargin: 3,					// 가로 빈 공간
//         	verticalMargin:5,						// 세로 빈 공간
	        placeholderText: '이동중입니다.',			// 이동할 때 원래 자리에 텍스트 표시
//			float: true,							// 정렬느낌 true시 외딴섬처럼 배치가능
	        removable: '.trash',					// 제거 클래스 지정
//			cellHeight: 50,
//			cellWidth: 50,
			// 한줄 혼자 꽉 채우는 거 금지!,default value of oneColumnSize is 768px
	        disableResize: true,					// 사이즈 조절 가능여부
	        disableDrag: true,						// 드래그 여부
	        resizable: { handles: 'e,se,s,sw,w' }	// 방향으로 조절방향 설정 가능 e,w,s,n
	    }
	
	    // const grid = GridStack.init(); // 옵션 없이 생성(Default)
	    let grid = GridStack.init(gridOption);		// 설정한 옵션값으로 초기화
	    grid.load(items);
		// grid.addWidget({ w: 2, content: "새로 추가" });
	
	    grid.yongMethod();
	    
		// 메인 타이틀
	 	$("#gridtitle").html(`
	 			<div class="row">
	                <div class="col-sm-6">
	                    <div class="d-flex">
	                        <div class="avatar flex-shrink-0 me-3">
	                            <div style="background-color: white;" class="avatar-title rounded-circle">
	                            	<img style="margin-top:20px; height: 50px;" src="${pageContext.request.contextPath }/resources/assets/images/wsiii.png" alt="">
	                            </div>
	                        </div>
	                        <div class="flex-grow-1">
	                        	<c:set var="empName" value="<%=user.getEmp().getEmpName() %>" />
	    						<c:choose>
	    							<c:when test="${empName eq '테스트' }">
	    								<h3>본 화면은 실제 화면처럼 구현된 가상의 테스트 화면입니다.</h3>
	    								<h3>실제 화면과는 약간의 차이가 있을 수 있습니다.</h3>
	    							</c:when>
	    							<c:otherwise>
	    								<sec:authorize access="isAuthenticated()">
	    								   <h3>안녕하세요, <span style="color: #038edc;"><sec:authentication property="principal.emp.empName"/></span>님</h3> 
	    								   <h3>오늘 업무도 힘차게 파이팅! 🙌</h3> 
	    								</sec:authorize>
	    							</c:otherwise>
	    						</c:choose>
	                        </div>
	                    </div>
	                </div><!-- end col -->
	                <div class="col-sm-6">
	                    <div class="mt-4 mt-sm-0">
	                        <div class="avatar-group justify-content-sm-end">   
	                        	<button type="button" id="gridstackk" class="btn btn-soft-primary btn-rounded">메뉴 설정</button>
	                        	<button type="button" style="display: none;" id="gridstacksave" class="btn btn-soft-success btn-rounded"><i class="uil uil-check me-2"></i>저장</button>
	                        	<button type="button" style="display: none;" id="gridstackcancle" class="btn btn-soft-danger btn-rounded"><i class="uil uil-location-arrow-alt"></i> 돌아가기</button>
	                        </div><!-- end avatar-group -->
	                    </div>
	                </div><!-- end col -->
	                
	            </div><!-- end row -->
	 	`);
	 	
	 	// 출퇴근 버튼 세팅
	 	$("#commute").html(`
	 			<div class="d-flex p-2 flex-fill" id="sdateBtn" type="button" style="border-radius: 20px; background-color: #5fd0f32c; margin-right: 5px;">
					<div class="p-2 flex-fill">
						<h2>출근하기</h2>
						<h6 id="sdate"></h6>
					</div>
					<div class="p-2 flex-fill d-flex justify-content-end" style="width: 90px;">
						<img style="height: 110px;" src="${pageContext.request.contextPath }/resources/images/start.png"/>
					</div>
				</div>
				<div class="d-flex p-2 flex-fill" id="edateBtn" type="button" style="border-radius: 20px; background-color: #5fd0f32c;">
					<div class="p-2 flex-fill align-items-end">
						<h6 style="margin-top: 35px;" id="edate"></h6>
						<h2>퇴근하기</h2>
					</div>
					<div class="p-2 flex-fill d-flex justify-content-end" style="width: 90px;">
						<img style="height: 110px;" src="${pageContext.request.contextPath }/resources/images/end.png"/>
					</div>
				</div>
		`);
	 	// todoList
	 	$("#todoList").html(`
	 			<div class="card-header justify-content-between d-flex align-items-center">
					<div style="margin: 5px 0px 0px 10px;" class="btn-group" role="group">                                
						<h3>TodoList</h3>
		            </div>
					<div class="col-md-9">
						<div class="d-flex justify-content-end">
							<div class="">
								<a href="/full-calendar/schedule">모두보기 ></a>
							</div>
						</div>
					</div>
				</div><!-- end card header -->	
				
				<div style="margin: 0 20px;" class="table-responsive" >
					<table class="table table-hover mb-0" style="text-align: center;">
						<tbody id="selecttodoList">
						
						</tbody><!-- end tbody -->
					</table><!-- end table -->
				</div>
	 	`);
	 	
	 	// 출퇴근 기록 
	 	$("#recordcommute").html(`
	 			<div class="d-flex flex-fill w-50 justify-content-center" style="">
		 			<div class="d-flex flex-column mb-3 p-4">
		 				<div class="p-2 mt-3"><h6>이번주　<span class="badge badge-soft-success">8%</span></h6></div>
		 				<div class="p-2"><h4>45시간</h4></div>
		 			</div>
		 			<div class="d-flex flex-column mb-3 p-4">
		 				<div class="p-2 mt-3"><h6>지난주</h6></div>
		 				<div class="p-2"><h4>40시간</h4></div>
		 			</div>
	 			</div>
				<div class="d-flex flex-fill justify-content-center" style="width: 200px; height: 200px;">
					<canvas id="workChart"></canvas>
				</div>
	 	`);
	 	
	 	// 결재함
	 	$("#approval").html(`
	 			<div class="card-header justify-content-between d-flex align-items-center">
					<div style="margin-bottom: 0px;" class="btn-group" role="group">                                
						<h3 style="margin: 5px 0px 0px 10px;">결재함</h3>
		            </div>
					<div class="col-md-9">
						<div class="d-flex justify-content-end">
							<div class="">
								<a href="/document/alldoclist">모두보기 ></a>
							</div>
						</div>
					</div>
				</div><!-- end card header -->
				
				<div style="margin: 0 20px;" class="table-responsive" >
					<table class="table table-hover mb-0" style="text-align: center;">
						<tbody>
							<tr class="text-center">
								<td class="checkbox-wrapper-mail">
									<div style="opacity: 1;" class="badge badge-soft-warning">대기중</div>
				                </td>
								<td class="text-dark" style="text-align: center;">
									<a href="/document/alldoclist">개발 1팀 결재처리 바랍니다.</a>
								</td>
							</tr>
							<tr class="text-center">
								<td class="checkbox-wrapper-mail">
									<div style="opacity: 1;" class="badge badge-soft-warning">대기중</div>
				                </td>
								<td class="text-dark" style="text-align: center;">
									<a href="/document/alldoclist">경영 2팀 결재처리 바랍니다.</a>
								</td>
							</tr>
							<tr class="text-center">
								<td class="checkbox-wrapper-mail">
									<div style="opacity: 1;" class="badge badge-soft-warning">대기중</div>
				                </td>
								<td class="text-dark" style="text-align: center;">
									<a href="/document/alldoclist">마케팅 1팀 결재처리 바랍니다.</a>
								</td>
							</tr>
						</tbody><!-- end tbody -->
					</table><!-- end table -->
				</div>
	 	`);
	 	
	 	// 공지사항 메인
	 	$("#noticegrid").html(`
	 			<div class="card-header justify-content-between d-flex align-items-center">
					<div style="margin-bottom: 0px;" class="btn-group" role="group">                                
						<h3 style="margin: 5px 0px 0px 10px;">공지사항</h3>
		            </div>
					<div class="col-md-9">
						<div class="d-flex justify-content-end">
							<div class="">
								<a href="/notice/list">모두보기 ></a>
							</div>
						</div>
					</div>
				</div><!-- end card header -->
				
				<div style="margin: 0 20px;" class="table-responsive" >
					<table class="table table-hover mb-0" style="text-align: center;">
						<tbody>
							<tr class="text-center">
								<td class="text-dark" style="text-align: left;">
									<a href="/notice/detail?boardNo=79">대체 휴가 부여 안내</a>
								</td>
								<td style="text-align: right;">2023-11-03 02:52</td>
							</tr>
							<tr class="text-center">
								<td class="text-dark" style="text-align: left;">
									<a href="/notice/detail?boardNo=78">1층 로비 공사 안내</a>
								</td>
								<td style="text-align: right;">2023-11-03 02:48</td>
							</tr>
							<tr class="text-center">
								<td class="text-dark" style="text-align: left;">
									<a href="/notice/detail?boardNo=77">[전체공지] 11월 주요 소식입니다.</a>
								</td>
								<td style="text-align: right;">2023-11-03 02:46</td>
							</tr>
						</tbody><!-- end tbody -->
					</table><!-- end table -->
				</div>
	 	`);
	 	
	 	// 날씨 api 세팅
	 	$("#weather7").html(`
	 			<div class="container1">
	 				<div id="result1"></div>
	 			</div>
	 	`);
	 	
	 	//////////////////////////////////출퇴근시간 //////////////////////////////////
	 	var sdate = $("#sdate");
		var edate = $("#edate");
		var sdateBtn = $("#sdateBtn");
		var edateBtn = $("#edateBtn");
		
		// 메인 접속시 출퇴근기록 확인
		$.ajax({
			url: "/home/work",
			type: "get",
			success: function(res){
				console.log(res);
				if(res.workNo == "null"){
					$("#sdate").html("00:00");
					$("#edate").html("00:00");
				}else{
					var stime = res.workStime.substr(res.workStime.indexOf(" ")+1,5);
					sdate.html(stime);
					$("#sdateBtn").prop("disabled", true);
					$("#edateBtn").prop("disabled", false);
					if(res.workEtime == null){
						$("#edate").html("00:00");
					}else{
						var etime = res.workEtime.substr(res.workEtime.indexOf(" ")+1,5);
						$("#edate").html(etime);
						$("#edateBtn").prop("disabled", true);
					}
				}
			}
		});
		 
		// 출근버튼 메소드
		sdateBtn.on("click", function(){
			if(sdate.html() == "00:00"){
				$.ajax({
					url: "/home/workStart",
					type: "get",
					success: function(res){
						var stime = res.workStime.substr(res.workStime.indexOf(" ")+1,5);
						sdate.html(stime);
						alertify.success("출근처리되었습니다!");
					}
				});
			}else{
				alertify.error("이미 출근처리되었습니다.");
				return;
			}
		});
		
		// 퇴근버튼 메소드
		edateBtn.on("click", function(){
			if(edate.html() == "00:00"){
				$.ajax({
					url: "/home/workEnd",
					type: "get",
					success: function(res){
						var etime = res.workEtime.substr(res.workEtime.indexOf(" ")+1,5);
						edate.html(etime);
						alertify.success("퇴근처리되었습니다!");
					}
				});
			}else{
				alertify.error("이미 퇴근처리되었습니다.");
				return;
			}
		});
		
		
		/////////////////////////////////// 풀캘린더 //////////////////////////////////////////////////////
		var request = $.ajax({
			url : "/full-calendar/vac", // 값 불러오기
			method : "GET",
			dataType : "json"
		});
		
		request.done(function(data){
			console.log(data); // log로 데이터 찍어주기
			var calendarEl = document.getElementById('vac-calendar');
			calendar = new FullCalendar.Calendar(calendarEl,{
				height : 'auto',
				slotMinTime : '08:00', // Day 캘린더에서 시작 시간
				slotMaxTime : '20:00',  // Day 캘린더에서 종료 시간
				// 헤더에 표시할 툴바
				headerToolbar :{
					left : 'prev',
					center : 'title',
					right : 'next'
				},
				contentHeight:"auto",		// 스크롤바 제거
				fixedWeekCount: false,
				initialView : 'dayGridMonth', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
				navLinks : false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				editable : false, // 수정 가능?
				selectable : false, // 달력 일자 드래그 설정 가능
				droppable : false, // 드래그 앤 드롭 
				events : data,
				locale : 'ko', // 한국어 설정
	            dayCellContent: function (e) {
	                e.dayNumberText = e.dayNumberText.replace('일', '');
	            },
			});
				calendar.render();
				// 시간제거
				$('.fc-event-time').each(function() {
					$('.fc-event-time').remove();
				});
				// 점 제거
				$('.fc-daygrid-event-dot').each(function() {
					$('.fc-daygrid-event-dot').remove();
				});
		});
		
		//////////////////////////// 날씨 api ///////////////////////////////////////////
		let key = "key";		// 날씨 api 시리얼키
		
		let result1 = document.getElementById("result1");
		
		$.ajax({
			url: `https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=\${key}&units=metric&lang=kr`,
			type: "get",
			success: function(data){
				console.log(data);
				var weather = "";
				weather = `
					<h3 style="text-align: center; margin: 25px 0 15px 0;">오늘의 날씨</h3>
					<div class="temp-container">
					    <div>
							<img src="https://openweathermap.org/img/w/\${data.weather[0].icon}.png">
					    </div>
					    <div>
							<h4 style="text-align: center; margin: 10px 0 0 0; padding: 10px;">\${Math.round(data.main.temp)}&#176;C</h4>
							<h6 style="text-align: center; color: #495057;" class="desc">\${data.weather[0].description}</h6>
					    </div>
					</div>
					
					<div class="temp-container">
					    <div>
					        <h6 class="title">최저기온</h6>
					        <h6 style="text-align: center;" class="temp">\${Math.round(data.main.temp_min)-5}&#176;</h6>
					    </div>
					    <div>
					        <h6 class="title">최고기온</h6>
					        <h6 style="text-align: center;" class="temp">\${Math.round(data.main.temp_max)+5}&#176;</h6>
					    </div>
					</div>
				`;
				result1.innerHTML = weather;
			}
		});
		
		//////////////////////////////포틀릿 //////////////////////////////////////////
		var gridstackk = document.getElementById("gridstackk");
		var gridstacksave = document.getElementById("gridstacksave");
		var gridstackcancle = document.getElementById("gridstackcancle");
		
		let serializedFull;
		
		gridstackk.addEventListener("click", function(){
			grid.enableMove(true);
			gridstackk.style.display= "none";
			gridstacksave.style.display= "block";
			gridstackcancle.style.display= "block";
		});
		
		gridstacksave.addEventListener("click", function(){
			delete serializedFull;
			serializedData = grid.save(false, false);
			
			console.log("serializedData : " + serializedData);
			console.log("JSON.stringify(serializedData, null, '  ') : " + JSON.stringify(serializedData, null, '  '));
// 			document.querySelector('#saved-data').value = JSON.stringify(serializedData, null, '  ');

			$.ajax({
				url: "/home/gridstack/update",
				type: "post",
				beforeSend: function(xhr) {
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            data: JSON.stringify(serializedData),
				dataType: "json",
	            contentType: "application/json; charset=utf-8",
				success: function(res){
					console.log("res : " + res);
					if(res == "OK"){
						alertify.success("메뉴설정이 저장되었습니다!");
					}else{
						alertify.error("메뉴설정 저장에 실패하였습니다.");
					}
					grid.enableMove(false);
					gridstackk.style.display= "block";
					gridstacksave.style.display= "none";
					gridstackcancle.style.display= "none";
				}
			});
		});

		gridstackcancle.addEventListener("click", function(){
			location.reload();
		});
		
		// 출퇴근차트
	    new Chart(document.getElementById("workChart"), {
	        type: 'doughnut',
	        data: {
		        datasets: [
		        	{
		              	label: "근무",
		             	backgroundColor: ["#54D4FF", "#54A7FF", "#9D9D9D"],
		              	data: [40, 4, 8]
		            }
		        ],
	    		labels: ["일반 근무", "추가 근무", "남은 시간"]
	        },
	        options: {
	        	legend: {
	        		display: true, // 범례를 표시할 것인지 여부
	                position: 'bottom'
	            }
	        }
	    });
		
	 	// todoList 가져오는 메소드
	    function selectTodolist(){
	    	var selecttodoList =$("#selecttodoList");
	    	
	    	$.ajax({
	    		type: "get",
	    		url: "/full-calendar/todolist",
	    		success: function(res){
	    			console.log(res);
	    			if(res == null || res == ""){
	    				return;
	    			}
	    			$(res).each(function (i, tod) {
	    				var todoHtml = "";
	    				todoHtml = `
	    						<tr class="text-center">
	    							<td class="checkbox-wrapper-mail">
	    								<input type="checkbox" name="checkList" value="\${tod.todoContent}">
	    							</td>
	    							<td class="text-dark" style="text-align: left;">
	    								<a>\${tod.todoContent}</a>
	    							</td>
	    						</tr>`;
	    				selecttodoList.append(todoHtml);
	    			});
	    		}
	    	});
	    }
	    selectTodolist();
	}

	// 풀캘린더 스크롤바 제거
	setTimeout(() => {
		var styleElement = document.createElement("style");
		styleElement.appendChild(document.createTextNode("div:has(> #vac-calendar)::-webkit-scrollbar{display: none;})"));
		document.getElementsByTagName("head")[0].appendChild(styleElement);
	}, 500);
	
	// todo 스크롤바 제거
	setTimeout(() => {
		var styleElement = document.createElement("style");
		styleElement.appendChild(document.createTextNode("div:has(> #todoList)::-webkit-scrollbar{display: none;})"));
		document.getElementsByTagName("head")[0].appendChild(styleElement);
	}, 500);
	
    // 컴팩트
    function fcompact() {
        grid.compact();
    }
});
</script>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    

<!-- ============================================================== -->
<!-- Start right Content here -->
<!-- ============================================================== -->
<!--         <div class="container-fluid"> -->

<!--             start page title -->
<!--             <div class="row"> -->
<!--                 <div class="col-12"> -->
<!--                     <div class="page-title-box d-flex align-items-center justify-content-between"> -->
<!--                         <h4 class="mb-0">Kanban Board</h4> -->

<!--                         <div class="page-title-right"> -->
<!--                             <ol class="breadcrumb m-0"> -->
<!--                                 <li class="breadcrumb-item"><a href="javascript: void(0);">Apps</a></li> -->
<!--                                 <li class="breadcrumb-item active">Kanban Board</li> -->
<!--                             </ol> -->
<!--                         </div> -->

<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             end page title -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body p-4">
                            <div class="border-bottom pb-4 mb-4">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="d-flex">
                                            <div class="avatar flex-shrink-0 me-3">
                                                <div class="avatar-title bg-light rounded-circle">
                                                    <img src="${pageContext.request.contextPath }/resources/assets/images/logo-sm.png" alt="" height="28">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <sec:authorize access="isAuthenticated()">
												   <h3>안녕하세요, <span style="color: #038edc;"><sec:authentication property="principal.emp.empName"/></span>님</h3> 
												   <h3>오늘 업무도 힘차게 파이팅! 🙌</h3> 
												</sec:authorize>
                                            </div>
                                        </div>
                                    </div><!-- end col -->
                                    <div class="col-sm-6">
                                        <div class="mt-4 mt-sm-0">
                                            <div class="avatar-group justify-content-sm-end">          
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-block" data-bs-toggle="tooltip" data-placement="top">
                                                        <div class="avatar-sm">
                                                            <div class="avatar-title rounded-circle bg-primary">
                                                                E
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div><!-- end avatar group item -->
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-block" data-bs-toggle="tooltip" data-placement="top">
                                                        <div class="avatar-sm">
                                                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg" alt="" class="img-fluid rounded-circle">
                                                        </div>
                                                    </a>
                                                </div><!-- end avatar group item -->
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-block" data-bs-toggle="tooltip" data-placement="top">
                                                        <div class="avatar-sm">
                                                            <div class="avatar-title rounded-circle bg-info">
                                                                L
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div><!-- end avatar group item -->
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-block" data-bs-toggle="tooltip" data-placement="top">
                                                        <div class="avatar-sm">
                                                            <div class="avatar-title rounded-circle bg-light text-primary">
                                                                <i class="mdi mdi-plus fs-5"></i>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div><!-- end avatar group item -->
                                            </div><!-- end avatar-group -->
                                        </div>
                                    </div><!-- end col -->
                                </div><!-- end row -->
                            </div>
                            <div class="task-board">
                                <div class="task-list">
                                    <div class="card bg-light shadow-none h-100">
                                        <div class="card-header bg-transparent border-bottom d-flex align-items-start">
                                            <div class="flex-grow-1">
                                                <h4 class="card-title mb-0">Todo <span class="ml-1 text-muted">(03)</span></h4>
                                            </div>
                                            <div class="flex-shrink-0">
                                                <div class="dropdown">
                                                    <a href="#" class="dropdown-toggle arrow-none font-size-16" data-bs-toggle="dropdown" aria-expanded="false">
                                                        <i class="uil uil-ellipsis-h text-muted"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-end">
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item" href="#">Delete</a>
                                                    </div>
                                                </div> <!-- end dropdown -->
                                            </div>
                                        </div><!-- end card-header -->
        
                                        <div>
                                            <div class="text-center p-3">
                                                <a href="javascript: void(0);" class="btn btn-primary btn-soft w-100"><i class="mdi mdi-plus mr-1"></i> Add New</a>
                                            </div>
    
                                            <div data-simplebar="init" class="tasklist-content p-3"><div class="simplebar-wrapper" style="margin: -16px;"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset" style="right: -17px; bottom: 0px;"><div class="simplebar-content-wrapper" style="height: auto; overflow: hidden scroll;"><div class="simplebar-content" style="padding: 16px;">
                                                <div id="todo-task" class="tasks">
                                                    <div class="card task-box">
                                                        <div class="card-body">
                                                            <div class="d-flex align-items-start mb-2">
                                                                <div class="flex-grow-1">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox" value="" id="task-todoCheck1">
                                                                        <label class="form-check-label text-primary" for="task-todoCheck1">DS-045</label>
                                                                    </div>
                                                                </div>
            
                                                                <div class="flex-shrink-0 ms-2">
                                                                    <div class="dropdown">
                                                                        <a href="#" class="dropdown-toggle font-size-16 text-muted" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <i class="mdi mdi-dots-horizontal"></i>
                                                                        </a>
                            
                                                                        <div class="dropdown-menu dropdown-menu-end" style="">
                                                                            <a class="dropdown-item" href="#">View</a>
                                                                            <a class="dropdown-item" href="#">Edit</a>
                                                                            <a class="dropdown-item" href="#">Remove</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <h5 class="font-size-14 mb-1">Dashboard UI</h5>
            
                                                            <p class="text-muted text-truncate">Sed ut perspiciatis unde omnis iste</p>
            
                                                            <div class="avatar-group">
                                                                <div class="avatar-group-item">
                                                                    <a href="javascript: void(0);" class="d-block" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <div class="avatar-sm">
                                                                            <div class="avatar-title rounded-circle bg-primary">
                                                                                E
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer bg-transparent border-top d-flex">
                                                            <div class="flex-grow-1">
                                                                <div class="font-size-13 text-muted">09 Mar, 2020</div>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <span class="badge badge-soft-primary font-size-12">Open</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end task card -->
                
                                                    <div class="card task-box">
                                                        <div class="card-body">
                                                            <div class="d-flex mb-2 align-items-start">
                                                                <div class="flex-grow-1">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox" value="" id="task-todoCheck2">
                                                                        <label class="form-check-label text-primary" for="task-todoCheck2">DS-046</label>
                                                                    </div>
                                                                </div>
            
                                                                <div class="flex-shrink-0 ms-2">
                                                                    <div class="dropdown">
                                                                        <a href="#" class="dropdown-toggle font-size-16 text-muted" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <i class="mdi mdi-dots-horizontal"></i>
                                                                        </a>
                            
                                                                        <div class="dropdown-menu dropdown-menu-end">
                                                                            <a class="dropdown-item" href="#">View</a>
                                                                            <a class="dropdown-item" href="#">Edit</a>
                                                                            <a class="dropdown-item" href="#">Remove</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <h5 class="font-size-14 mb-1">Calendar App Page</h5>
            
                                                            <p class="text-muted text-truncate">Neque porro quisquam est</p>
            
                                                            <div class="avatar-group">
                                                                <div class="avatar-group-item">
                                                                    <a href="javascript: void(0);" class="d-block" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <div class="avatar-sm">
                                                                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg" alt="" class="img-fluid rounded-circle">
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                                <div class="avatar-group-item">
                                                                    <a href="javascript: void(0);" class="d-block" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <div class="avatar-sm">
                                                                            <div class="avatar-title rounded-circle bg-info">
                                                                                E
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div><!-- end cardbody -->
                                                        <div class="card-footer bg-transparent border-top d-flex">
                                                            <div class="flex-grow-1">
                                                                <div class="font-size-13 text-muted">08 Mar, 2020</div>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <span class="badge badge-soft-primary font-size-12">Open</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end task card -->
                
                                                    <div class="card task-box">
                                                        <div class="card-body">
                                                            <div class="d-flex align-items-start mb-2">
                                                                <div class="flex-grow-1">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox" value="" id="task-todoCheck3">
                                                                        <label class="form-check-label text-primary" for="task-todoCheck3">DS-047</label>
                                                                    </div>
                                                                </div>
            
                                                                <div class="flex-shrink-0 ms-2">
                                                                    <div class="dropdown">
                                                                        <a href="#" class="dropdown-toggle font-size-16 text-muted" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <i class="mdi mdi-dots-horizontal"></i>
                                                                        </a>
                            
                                                                        <div class="dropdown-menu dropdown-menu-end">
                                                                            <a class="dropdown-item" href="#">View</a>
                                                                            <a class="dropdown-item" href="#">Edit</a>
                                                                            <a class="dropdown-item" href="#">Remove</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <h5 class="font-size-14 mb-1">Authentication Page Design</h5>
            
                                                            <p class="text-muted text-truncate">In enim justo rhoncus ut</p>
            
                                                            <div class="avatar-group">
                                                                <div class="avatar-group-item">
                                                                    <a href="javascript: void(0);" class="d-block" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <div class="avatar-sm">
                                                                            <div class="avatar-title rounded-circle bg-danger">
                                                                                E
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer bg-transparent border-top d-flex">
                                                            <div class="flex-grow-1">
                                                                <div class="font-size-13 text-muted">08 Mar, 2020</div>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <span class="badge badge-soft-primary font-size-12">Open</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end task card -->
                                                </div>
                                            </div></div></div></div><div class="simplebar-placeholder" style="width: auto; height: 741px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div></div><div class="simplebar-track simplebar-vertical" style="visibility: visible;"><div class="simplebar-scrollbar" style="height: 369px; transform: translate3d(0px, 154px, 0px); display: block;"></div></div></div>
        
                                        </div>
                                    </div>
                                </div>
                                <!-- end tasklist -->

                                <div class="task-list">
                                    <div class="card bg-light shadow-none h-100">
                                        <div class="card-header bg-transparent border-bottom d-flex align-items-start">
                                            <div class="flex-grow-1">
                                                <h4 class="card-title mb-0">In Progress <span class="ml-1 text-muted">(01)</span></h4>
                                            </div>
                                            <div class="flex-shrink-0 ms-2">
                                                <div class="dropdown">
                                                    <a href="#" class="dropdown-toggle arrow-none font-size-16" data-bs-toggle="dropdown" aria-expanded="false">
                                                        <i class="uil uil-ellipsis-h text-muted"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-end">
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item" href="#">Delete</a>
                                                    </div>
                                                </div> <!-- end dropdown -->
                                            </div>
                                        </div>
        
                                        <div>
                                            <div class="text-center p-3">
                                                <a href="javascript: void(0);" class="btn btn-primary btn-soft w-100"><i class="mdi mdi-plus mr-1"></i> 출근 버튼</a>
                                            </div>
                                            <div class="text-center p-3">
                                                <a href="javascript: void(0);" class="btn btn-primary btn-soft w-100"><i class="mdi mdi-plus mr-1"></i> 퇴근 버튼</a>
                                            </div>
    
    
    										<div class="commute">
				                                <div class="commute-area commute-work card-df card">
				                                    <button type="button" id="work" data-io="0" class="btn-commute btn-3d icon-area pd-32">
				                                        <h3 class="content-title font-b">출근</h3>
				                                        <p id="workTime">12:17</p>
				                                    </button>
				                                </div>
				                                <div class="commute-area commute-leave card-df card">
				                                    <button type="button" id="leave" data-io="1" class="btn-commute btn-3d icon-area pd-32" >
				                                        <h3 class="content-title font-b">퇴근</h3>
				                                        <p id="leaveTime"></p>
				                                    </button>
				
				                                </div>
				                            </div>
    
    
                                            <div data-simplebar="init" class="tasklist-content p-3"><div class="simplebar-wrapper" style="margin: -16px;"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset" style="right: 0px; bottom: 0px;"><div class="simplebar-content-wrapper" style="height: auto; overflow: hidden;"><div class="simplebar-content" style="padding: 16px;">
                                                <div id="inprogress-task" class="tasks">
                                                    <div class="card task-box">
                                                        <div class="card-body">
                                                            <div class="d-flex align-items-start mb-2">
                                                                <div class="flex-grow-1">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox" value="" id="task-inprogressCheck1">
                                                                        <label class="form-check-label text-primary" for="task-inprogressCheck1">DS-044</label>
                                                                    </div>
                                                                </div>
            
                                                                <div class="flex-shrink-0 ms-2">
                                                                    <div class="dropdown">
                                                                        <a href="#" class="dropdown-toggle font-size-16 text-muted" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <i class="mdi mdi-dots-horizontal"></i>
                                                                        </a>
                            
                                                                        <div class="dropdown-menu dropdown-menu-end">
                                                                            <a class="dropdown-item" href="#">View</a>
                                                                            <a class="dropdown-item" href="#">Edit</a>
                                                                            <a class="dropdown-item" href="#">Remove</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <h5 class="font-size-14 mb-1">Component Pages</h5>
            
                                                            <p class="text-muted text-truncate">Donec quam felis ultricies nec</p>
            
                                                            <div class="avatar-group">
                                                                <div class="avatar-group-item">
                                                                    <a href="javascript: void(0);" class="d-block" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <div class="avatar-sm">
                                                                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg" alt="" class="img-fluid rounded-circle">
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer bg-transparent border-top d-flex">
                                                            <div class="flex-grow-1">
                                                                <div class="font-size-13 text-muted">08 Mar, 2020</div>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <span class="badge badge-soft-warning font-size-12">Inprogress</span>
                                                            </div>
                                                        </div><!-- end card-footer -->
                                                    </div><!-- end task card -->
                                                </div>
                                            </div></div></div></div><div class="simplebar-placeholder" style="width: auto; height: 332px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div></div><div class="simplebar-track simplebar-vertical" style="visibility: hidden;"><div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div></div></div><!-- end data - simplebar -->
                                        </div>
                                    </div><!-- end card -->
                                </div><!-- end tasklist -->

                                <div class="task-list">
                                    <div class="card bg-light shadow-none h-100" style="width: 800px;">
                                        <jsp:include page="weather.jsp"></jsp:include>
                                    </div>
                                </div><!-- end tasklist -->
                            </div>
                        </div><!-- end card body -->
                    </div><!-- end  -->
                </div><!-- end col -->
            </div><!-- end row -->
<!--         </div> container-fluid -->
    
<!-- end main content-->

<script>
let dclzEmplId = "202309008";

//-----------------------------------------------------------날짜 포맷팅
let before = new Date();

let year = before.getFullYear();
let month = String(before.getMonth() + 1).padStart(2, '0');
let day = String(before.getDate()).padStart(2, '0');

const today = year + '-' + month + '-' + day;
// --------------------------------------------------------------------

const btnWork = document.querySelector("#work");
const btnLeave = document.querySelector("#leave");
const workTime = document.querySelector("#workTime");
const leaveTime = document.querySelector("#leaveTime");

function formatTime(currentTime) {
    const hours = currentTime.getHours().toString().padStart(2, "0");
    const minutes = currentTime.getMinutes().toString().padStart(2, "0");
    const time = hours + ":" + minutes;
    return time;
}

function formatDate(date) {
    const options = {
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        weekday: "short",
    };
    return date.toLocaleString("ko-KR", options).replace(/[()]/g, '');
}

let recordDate = function(date) {
    const currentDate = formatDate(date);
    const regex = /(\d{4})\. (\d{2})\. (\d{2})\. (\S+)/;
    const matches = currentDate.match(regex);
    if (matches) {
        return dayOfWeek = matches[4];
    }
}
refreshCommute();

//  출근버튼을 눌렀을 때
btnWork.addEventListener("click", function() {
    $.ajax({
        type: 'get',
        url: `/commute/getAttend/${dclzEmplId}`,
        dataType: 'json',
        success: function (commuteVO) {
            $.ajax({
                type: 'post',
                url: `/commute/insertAttend`,
                data: commuteVO,
                dataType: 'text',
                success: function (rslt) {
                    refreshCommute();
                },
                error: function (xhr) {
                    console.log(xhr.status);
                }
            });

        },
        error: function (xhr) {
            console.log(xhr.status);
        }
    });
})

/* 퇴근 버튼을 눌렀을 때 */
btnLeave.addEventListener("click", function() {
    $.ajax({
        type: 'put',
        url: `/commute/updateCommute/${dclzEmplId}`,
        dataType: 'text',
        success: function (rslt) {
            refreshCommute();
        },
        error: function (xhr) {
            console.log(xhr.status);
        }
    });
});

// 출근 시간을 Date 객체로 변환하는 함수
function parseDate(dateString) {
    const [year, month, day, hours, minutes] = dateString.split(/[- :]/);
    return new Date(year, month - 1, day, hours, minutes);
}

function refreshCommute() {
    $.ajax({
        type: 'get',
        url: `/commute/getCommute/${dclzEmplId}`,
        dataType: 'json',
        success: function (rslt) {
            if (rslt.dclzAttendTm != null) {
                btnWork.setAttribute("disabled", "true");
                attendDate = parseDate(rslt.dclzAttendTm);
                leaveDate = parseDate(rslt.dclzLvffcTm);
                let attendTime = formatTime(attendDate);
                let leaveT = formatTime(leaveDate);
                workTime.innerText = attendTime;
                leaveTime.innerHTML = leaveT;
                if (rslt.dclzLvffcTm != "2000-01-01 00:00:00") { //출 퇴근 다 찍혀있을 때
                    leave.setAttribute("disabled", "true");
                }
            }
        },
        error: function (xhr) {
            console.log("CODE: ", xhr.status);
        }
    });
}
</script>
>>>>>>> branch 'master' of https://github.com/cheonyongyong/finalProject
