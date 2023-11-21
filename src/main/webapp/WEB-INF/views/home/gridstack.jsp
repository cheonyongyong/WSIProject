<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 포틀릿 api -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/gridstack.js/9.1.1/gridstack.min.css" />
<!-- column 갯수 제한 할 땐 아래 것도 필요-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/gridstack.js/9.1.1/gridstack-extra.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/gridstack.js/9.1.1/gridstack-all.min.js"></script>

<!-- 풀캘린더 -->
<script src='${pageContext.request.contextPath }/resources/assets/js/index.global.js'></script>
<script src='${pageContext.request.contextPath }/resources/assets/js/index.global.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/assets/js/ko.js'></script>

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

/* #dright { */
/*     width: 25%; */
/* } */
</style>

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

<div id="body" class="row">
    <div class="col-lg-12">
        <div class="row">
        	<div class="">
                <div class="card card-h-100" style="height: 1000px; background-color: #F7F8FA; border: none;">
                    <div class="">
                    
	                    <div id="wrapper">
						    <div class="grid-stack" id="dleft"></div>
						</div>
						    
                    </div>
                </div>
            </div> <!-- end col -->
        </div>
	</div> 
</div>

<script>
    // using serialize data instead of .addWidget()
    let items = [
        { x: 0, y: 0, w: 12, h: 1, noMove: true, id: "gridtitle", content: `
        	<div style="padding: 1.5rem;">
	            <div class="row">
	                <div class="col-sm-6">
	                    <div class="d-flex">
	                        <div class="avatar flex-shrink-0 me-3">
	                            <div style="background-color: white;" class="avatar-title rounded-circle">
	                            	<img style="margin-top:20px; height: 50px;" src="${pageContext.request.contextPath }/resources/assets/images/wsi.png" alt="">
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
	                        	<button type="button" id="gridstackk" class="btn btn-soft-primary btn-rounded">메뉴 설정</button>
	                        	<button type="button" style="display: none;" id="gridstacksave" class="btn btn-soft-success btn-rounded"><i class="uil uil-check me-2"></i>저장</button>
	                        	<button type="button" style="display: none;" id="gridstackload" class="btn btn-soft-purple btn-rounded"><i class="uil uil-bag-alt"></i> 불러오기</button>
	                        	<button type="button" style="display: none;" id="gridstackcancle" class="btn btn-soft-danger btn-rounded"><i class="uil uil-location-arrow-alt"></i> 돌아가기</button>
	                        </div><!-- end avatar-group -->
	                    </div>
	                </div><!-- end col -->
	                
	            </div><!-- end row -->
	        </div>
                            
        `},
        { x: 0, y: 1, w: 4, h: 1, content: `
        	<button style="margin: 35px 90px;" type="button" class="btn btn-outline-primary btn-rounded btn-lg">출근</button>
            <button style="margin: 35px 90px;" type="button" class="btn btn-outline-secondary btn-rounded btn-lg">퇴근</button>
        	` },
        { x: 4, y: 1, w: 4, h: 3, content: `
        	<div class="card-header justify-content-between d-flex align-items-center">
            
				<!-- 드랍다운 메뉴 -->
				<div style="margin: 5px 0px 0px 10px;" class="btn-group" role="group">                                
					<h3>TodoList</h3>
	            </div>
	
				<div class="col-md-9">
					<div class="d-flex justify-content-end">
						<div class="">
							<a href="/home/schedule">모두보기 ></a>
						</div>
					</div>
				</div>
			</div><!-- end card header -->	
			
			<div style="margin: 0 20px;" class="table-responsive" >
				<table class="table table-hover mb-0" style="text-align: center;">
					<tbody>
						<tr class="text-center">
							<td class="checkbox-wrapper-mail">
			                    <input type="checkbox" id="chk19">
			                    <label for="chk19" class="toggle"></label>
			                </td>
							<td class="text-dark" style="text-align: left;">
								<a>결재 처리하기</a>
							</td>
						</tr>
						<tr class="text-center">
							<td class="checkbox-wrapper-mail">
			                    <input type="checkbox" id="chk19">
			                    <label for="chk19" class="toggle"></label>
			                </td>
							<td class="text-dark" style="text-align: left;">
								<a>제안서 작성</a>
							</td>
						</tr>
						<tr class="text-center">
							<td class="checkbox-wrapper-mail">
			                    <input type="checkbox" id="chk19">
			                    <label for="chk19" class="toggle"></label>
			                </td>
							<td class="text-dark" style="text-align: left;">
								<a>인사 1팀 회의록 작성</a>
							</td>
						</tr>
						<tr class="text-center">
							<td class="checkbox-wrapper-mail">
			                    <input type="checkbox" id="chk19">
			                    <label for="chk19" class="toggle"></label>
			                </td>
							<td class="text-dark" style="text-align: left;">
								<a>입사지원서 검토</a>
							</td>
						</tr>
						<tr class="text-center">
							<td class="checkbox-wrapper-mail">
			                    <input type="checkbox" id="chk19">
			                    <label for="chk19" class="toggle"></label>
			                </td>
							<td class="text-dark" style="text-align: left;">
								<a>신입직원 면접보기</a>
							</td>
						</tr>
						<tr class="text-center">
							<td class="checkbox-wrapper-mail">
			                    <input type="checkbox" id="chk19">
			                    <label for="chk19" class="toggle"></label>
			                </td>
							<td class="text-dark" style="text-align: left;">
								<a>컨퍼런스 참여</a>
							</td>
						</tr>
					</tbody><!-- end tbody -->
				</table><!-- end table -->
			</div>

        	` },
        { x: 8, y: 1, w: 4, h: 3, id: "gridcalendar", content: 
//         	"<div></div>"
        	`<div id="vac-calendar"></div>`
        	 },
        { x: 0, y: 6, w: 4, h: 2, content: `
        <div style="margin-top: 20px;" class="card">
            <div class="card-body">
                <div class="float-end">
                    <div class="dropdown">
                        <a class="dropdown-toggle text-reset" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fw-semibold">Report By:</span> 
                            <span class="text-muted">Monthly<i class="mdi mdi-chevron-down ms-1"></i></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <a class="dropdown-item" href="#">Yearly</a>
                            <a class="dropdown-item" href="#">Monthly</a>
                            <a class="dropdown-item" href="#">Weekly</a>
                            <a class="dropdown-item" href="#">Today</a>
                        </div>
                    </div>
                </div>

                <h4 class="card-title mb-4">출퇴근 기록</h4>

                <div class="row align-items-center">
                    <div class="col-sm-7">
                        <div class="row mb-3">
                            <div class="col-6">
                                <p class="text-muted mb-2">이번달</p>
                                <h5>200시간<small class="badge badge-soft-success font-13 ms-2">+15%</small></h5>
                            </div>
                            <div class="col-6">
                                <p class="text-muted mb-2">지난달</p>
                                <h5>240시간</h5>
                            </div>
                        </div>

                    </div> <!-- end col-->
                    <div class="col-sm-5">
                        <div class="my-2">

                        <div id="chart-donut-reports" class="apex-charts" dir="ltr" style="min-height: 108.7px;"><div id="apexchartsiktmylk3" class="apexcharts-canvas apexchartsiktmylk3 apexcharts-theme-light" style="width: 189px; height: 108.7px;"><svg id="SvgjsSvg1381" width="189" height="108.7" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1383" class="apexcharts-inner apexcharts-graphical" transform="translate(42.5, 0)"><defs id="SvgjsDefs1382"><clipPath id="gridRectMaskiktmylk3"><rect id="SvgjsRect1385" width="112" height="130" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskiktmylk3"></clipPath><clipPath id="nonForecastMaskiktmylk3"></clipPath><clipPath id="gridRectMarkerMaskiktmylk3"><rect id="SvgjsRect1386" width="110" height="132" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1387" class="apexcharts-pie"><g id="SvgjsG1388" transform="translate(0, 0) scale(1)"><circle id="SvgjsCircle1389" r="29.709756097560977" cx="53" cy="53" fill="transparent"></circle><g id="SvgjsG1390" class="apexcharts-slices"><g id="SvgjsG1391" class="apexcharts-series apexcharts-pie-series" seriesName="Revenue" rel="1" data:realIndex="0"><path id="SvgjsPath1392" d="M 53 7.292682926829265 A 45.707317073170735 45.707317073170735 0 0 1 53 98.70731707317074 L 53 82.70975609756098 A 29.709756097560977 29.709756097560977 0 0 0 53 23.290243902439023 L 53 7.292682926829265 z" fill="rgba(3,142,220,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-0" index="0" j="0" data:angle="180" data:startAngle="0" data:strokeWidth="2" data:value="44" data:pathOrig="M 53 7.292682926829265 A 45.707317073170735 45.707317073170735 0 0 1 53 98.70731707317074 L 53 82.70975609756098 A 29.709756097560977 29.709756097560977 0 0 0 53 23.290243902439023 L 53 7.292682926829265 z" stroke="#ffffff"></path></g><g id="SvgjsG1393" class="apexcharts-series apexcharts-pie-series" seriesName="Expenses" rel="2" data:realIndex="1"><path id="SvgjsPath1394" d="M 53 98.70731707317074 A 45.707317073170735 45.707317073170735 0 0 1 8.337238370001138 43.28421091165176 L 23.96920494050074 46.68473709257364 A 29.709756097560977 29.709756097560977 0 0 0 53 82.70975609756098 L 53 98.70731707317074 z" fill="rgba(223,226,230,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-1" index="0" j="1" data:angle="102.27272727272725" data:startAngle="180" data:strokeWidth="2" data:value="25" data:pathOrig="M 53 98.70731707317074 A 45.707317073170735 45.707317073170735 0 0 1 8.337238370001138 43.28421091165176 L 23.96920494050074 46.68473709257364 A 29.709756097560977 29.709756097560977 0 0 0 53 82.70975609756098 L 53 98.70731707317074 z" stroke="#ffffff"></path></g><g id="SvgjsG1395" class="apexcharts-series apexcharts-pie-series" seriesName="Profit" rel="3" data:realIndex="2"><path id="SvgjsPath1396" d="M 8.337238370001138 43.28421091165176 A 45.707317073170735 45.707317073170735 0 0 1 52.9920225682887 7.292683622991511 L 52.99481466938765 23.290244354944484 A 29.709756097560977 29.709756097560977 0 0 0 23.96920494050074 46.68473709257364 L 8.337238370001138 43.28421091165176 z" fill="rgba(95,208,243,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-2" index="0" j="2" data:angle="77.72727272727275" data:startAngle="282.27272727272725" data:strokeWidth="2" data:value="19" data:pathOrig="M 8.337238370001138 43.28421091165176 A 45.707317073170735 45.707317073170735 0 0 1 52.9920225682887 7.292683622991511 L 52.99481466938765 23.290244354944484 A 29.709756097560977 29.709756097560977 0 0 0 23.96920494050074 46.68473709257364 L 8.337238370001138 43.28421091165176 z" stroke="#ffffff"></path></g></g></g></g><line id="SvgjsLine1397" x1="0" y1="0" x2="106" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1398" x1="0" y1="0" x2="106" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1384" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 65px;"></div><div class="apexcharts-tooltip apexcharts-theme-dark" style="left: 21.4844px; top: 49.7812px;"><div class="apexcharts-tooltip-series-group apexcharts-active" style="order: 1; display: flex; background-color: rgb(223, 226, 230);"><span class="apexcharts-tooltip-marker" style="background-color: rgb(223, 226, 230); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">Expenses: </span><span class="apexcharts-tooltip-text-y-value">25</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2; display: none; background-color: rgb(223, 226, 230);"><span class="apexcharts-tooltip-marker" style="background-color: rgb(223, 226, 230); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">Expenses: </span><span class="apexcharts-tooltip-text-y-value">25</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 3; display: none; background-color: rgb(223, 226, 230);"><span class="apexcharts-tooltip-marker" style="background-color: rgb(223, 226, 230); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">Expenses: </span><span class="apexcharts-tooltip-text-y-value">25</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div></div></div>
                        
                        
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- end card -->
        	` },
        { x: 0, y: 7, w: 4, h: 2, content: `
        	<div class="card-header justify-content-between d-flex align-items-center">
            
				<!-- 드랍다운 메뉴 -->
				<div style="margin: 5px 0px 0px 10px;" class="btn-group" role="group">                                
					<h3>결재함</h3>
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
							<div style="opacity: 1;" class="badge badge-soft-primary">승인</div>
		                </td>
						<td class="text-dark" style="text-align: center;">
							<a href="/document/alldoclist">마케팅 1팀 결재처리 바랍니다.</a>
						</td>
					</tr>
				</tbody><!-- end tbody -->
			</table><!-- end table -->
		</div>
		
        	` },
        { x: 4, y: 7, w: 6, h: 2, content: `
        	<div class="card-header justify-content-between d-flex align-items-center">
            
				<!-- 드랍다운 메뉴 -->
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
        	` },
        { x: 10, y: 7, w: 2, h: 2, content: `
        	<div class="wrapper">
	          	<div class="container1">
	            	<div id="result1"></div>
	          	</div>
	        </div>
        	
        	`}
    ];
	
    //확장 (jQuery Plugin 느낌!)
    GridStack.prototype.yongMethod = function () {
        console.log("GridStack", this);
    }

    // const grid = GridStack.init(); // 옵션 없이 생성

    let gridOption = {
        oneColumnSize: 150,          			// (default 768)
        disableOneColumnMode: true,
        column: 12,                   			// 총 몇칸 (default 12)
        minRow: 1,
        margin: 3,								// 빈 공간
//         horizontalMargin: 3,					// 가로 빈 공간
//         verticalMargin:5,						// 세로 빈 공간
        placeholderText: '이동중입니다.',			// 이동할 때 원래 자리에 텍스트 표시
        //float: true,							// 정렬느낌 true시 외딴섬처럼 배치가능
        removable: '.trash',					// 제거 클래스 지정
        //cellHeight: 50,
        //cellWidth: 50,
        // 한줄 혼자 꽉 채우는 거 금지!,default value of oneColumnSize is 768px
        disableResize: true,					// 사이즈 조절 가능여부
        resizable: { handles: 'e,se,s,sw,w' }	// 방향으로 조절방향 설정 가능 e,w,s,n
    }

    //    const grid = GridStack.init(); // 옵션 없이 생성(Default)
    let grid = GridStack.init(gridOption);		// 설정한 옵션값으로 초기화
    grid.load(items);
//     grid.addWidget({ w: 2, content: "새로 추가" });

    grid.yongMethod();

    // 컴팩트
    function fcompact() {
        grid.compact();
    }
    
</script>

<!-- 날씨 api -->
<script>
$(function(){
	// 풀캘린더
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
	
	let key = "59711f7ca4c18930d18e07d3896036d1";		// 날씨 api 시리얼키
	
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
				        <h6 style="text-align: center;" class="temp">\${Math.round(data.main.temp_min)}&#176;</h6>
				    </div>
				    <div>
				        <h6 class="title">최고기온</h6>
				        <h6 style="text-align: center;" class="temp">\${Math.round(data.main.temp_max)}&#176;</h6>
				    </div>
				</div>
			`;
			result1.innerHTML = weather;
		}
	});
	
	// 	포틀릿
	var gridstackk = document.getElementById("gridstackk");
	var gridstacksave = document.getElementById("gridstacksave");
	var gridstackload = document.getElementById("gridstackload");
	var gridstackcancle = document.getElementById("gridstackcancle");

	gridstackk.addEventListener("click", function(){
		gridstackk.style.display= "none";
		gridstacksave.style.display= "block";
		gridstackload.style.display= "block";
		gridstackcancle.style.display= "block";
	});

	gridstacksave.addEventListener("click", function(){
		
	});

	gridstackload.addEventListener("click", function(){
		
	});

	gridstackcancle.addEventListener("click", function(){
		gridstackk.style.display= "block";
		gridstacksave.style.display= "none";
		gridstackload.style.display= "none";
		gridstackcancle.style.display= "none";
	});

});
</script>




