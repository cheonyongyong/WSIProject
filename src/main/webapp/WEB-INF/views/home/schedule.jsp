<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<script src='${pageContext.request.contextPath }/resources/assets/js/index.global.js'></script>
<script src='${pageContext.request.contextPath }/resources/assets/js/index.global.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/assets/js/ko.js'></script>
<script>

$(document).ready(function(){
	const eventmodal = document.querySelector("#event-modal");
// 	const eventmodal = document.getElementById('event-modal');	// 위랑 같음
// 	const modalbackdrop = document.querySelector("#modal-backdrop");
	
	$.ajax({
		url : "/full-calendar/calendar-admin-update", // 값 불러오기
		method : "GET",
		dataType : "json",
		success: function(data) {
			calendarEvent(data);
		}
	});
	
	function calendarEvent(data){
		console.log(data); // log로 데이터 찍어주기
		var calendarEl = document.getElementById('calendar');
		calendar = new FullCalendar.Calendar(calendarEl,{
			
			height : '750px',
			slotMinTime : '08:00', // Day 캘린더에서 시작 시간
			slotMaxTime : '20:00',  // Day 캘린더에서 종료 시간
			// 헤더에 표시할 툴바
			headerToolbar :{
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			buttonText: {
				today : "오늘",
			   	month : "월",
			  	 week : "주",
			  	 day : "일",
			  	 list : "목록",
		   	},
		   
			initialView : 'dayGridMonth', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
			navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
			editable : true, // 수정 가능?
			selectable : true, // 달력 일자 드래그 설정 가능
			droppable : true, // 드래그 앤 드롭 
			events : data,
			locale : 'ko', // 한국어 설정
            dayCellContent: function (e) {
                e.dayNumberText = e.dayNumberText.replace('일', '');
            },
			// 드래그로 이벤트 수정하기
			eventDrop : function(info){
				if(confirm("'"+info.event.title+"'을 수정하시겠습니까?")){
					var events = new Array(); // Json 데이터를 받기 위한 배열 선언
					var obj = new Object();
					
					obj.title = info.event._def.title;
					obj.start = info.event._instance.range.start;
					obj.end = info.event._instance.range.end;
					
					obj.oldTitle = info.oldEvent._def.title;
					obj.oldStart = info.oldEvent._instance.range.start;
					obj.oldEnd = info.oldEvent._instance.range.end;
					
					events.push(obj);
					
					console.log(events);
				}else{
					location.reload(); // 새로 고침
				}
				
				$(function modifyData(){
					$.ajax({
						url : "/full-calendar/calendar-admin-update",
						method : "PATCH",
						dataType : "json",
						beforeSend: function(xhr){	// 토큰csrf
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
				        },
						data : JSON.stringify(events),
						contentType : 'application/json;charset:utf-8',
					})
				})
			},
	
	
			eventResize: function(info){
				console.log(info);
				if(confirm("'"+info.event.title+"'을 변경하시겠습니까?'")){
				
				var events = new Array(); // JSON 데이터를 받기 위한 배열
				var obj = new Object();
				
				obj.title = info.event._def.title;
				obj.start = info.event._instance.range.start;
				obj.end = info.event._instance.range.end;
				
				obj.oldTitle = info.oldEvent._def.title;
				obj.oldStart = info.oldEvent._instance.range.start;
				obj.oldEnd = info.oldEvent._instance.range.end;
				
				events.push(obj);
				
				console.log(events);
				}else{
					location.reload(); // 새로고침  
				}
				$(function modifyData(){
					$.ajax({
					url : "/full-calendar/calendar-admin-update",
					method : "PATCH",
					dataType : "json",
					beforeSend: function(xhr){	// 토큰csrf
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			        },
					data : JSON.stringify(events),
					contentType : 'application/json;charset:utf-8',
					})
				})
			},
	
			
			
			select: function(arg){ // 캘린더에서 드래그로 이벤트를 생성할 수 있다
// 				var eventModal = new bootstrap.Modal(document.getElementById('event-modal'));
// 			    eventModal.show();
				var schStart = $("#schStart");
				var schEnd = $("#schEnd");
				var schStartT = $("#schStartT");
				var schEndT = $("#schEndT");
				
			    schStart.val(arg.startStr);
			    schEnd.val(arg.endStr);
			    schStartT.val(arg.start);
			    schEndT.val(arg.end);
// 			    schStartstr.val(arg.startStr);
// 			    schEndstr.val(arg.endStr);
			    $("#event-modal").modal("show");
			    
				console.log(arg);
				
				
// 				var title = prompt('일정을 입력해주세요.');
// 			    if(title){
// 		    	calendar.addEvent({
// 		    		title : title,
// 		    		start : arg.start,
// 		    		end : arg.end,
// 		    		allDay : arg.allDay
// 		    	})
		    	
// 			    }else{
// 			    	 location.reload(); // 새로고침  
// 			    	 return;
// 			    }
			},
			
			// 이벤트 선택해서 삭제하기
			eventClick : function(info){
				if(confirm("'"+info.event.title+"'을 삭제하시겠습니까?")){
					// 확인 클릭 시
					info.event.remove();
				}else{
					return;
				}
				
				console.log(info.event);
				var events = new Array(); // JSON 데이터를 받기 위한 배열 선언
				var obj = new Object();
				    obj.title = info.event._def.title;
				    obj.start = info.event._instance.range.start;
				    events.push(obj);
				    
			    console.log(events);
			    $(function deleteData(){
			    	$.ajax({
			    		url : "/full-calendar/calendar-admin-update",
			    		method : "DELETE",
			    		dataType : "json",
			    		beforeSend: function(xhr){	// 토큰csrf
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
				        },
			    		data : JSON.stringify(events),
			    		contentType : 'application/json;charset=utf-8',
			    	});
			    });
			}	
		});	
		calendar.render();
   	}
	
	// 캘린더 일정 추가 이벤트 시작
	var btnsaveevent = $("#btn-save-event");
	var btndeleteevent = $("#btn-delete-event");
	
	btnsaveevent.on("click", function(){
		var schTitle = $("#schTitle");
		var schStart = $("#schStart");
		var schEnd = $("#schEnd");
		var schStartT = $("#schStartT");
		var schEndT = $("#schEndT");
		var schBColor = $("#schBColor");
		
		 if (!schTitle.val()) {
             alert("제목을 작성해주세요");
             schTitle.focus();
             return;
         }
		 
		calendar.addEvent({
    		title : schTitle.val(),
    		start : schStart.val(),
    		end : schEnd.val(),
    		classNames : schBColor.val(),
    		allDay : true
    	});
    	
	    var events = new Array(); // Json 데이터를 받기 위한 배열 선언
	    var obj = new Object(); // Json을 담기 위해 Object 선언
	    
	    obj.title = schTitle.val();
	    obj.start = schStartT.val(); // 시작
	    obj.end = schEndT.val(); // 끝
	    obj.classNames = schBColor.val();
	    events.push(obj);
	    
	    var jsondata = JSON.stringify(events);
	    
	    $(function saveData(jsonData){
	    	$.ajax({
	    		url : "/full-calendar/calendar-admin-update",
	    		method : "POST",
	    		dataType : "json",
	    		beforeSend: function(xhr){	// 토큰csrf
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
		        },
	    		data : JSON.stringify(events),
	    		contentType : 'application/json;charset:utf-8',
	    	});
	    	$("#event-modal").modal("hide");
	    	schTitle.val("");
// 	    	location.reload();
	    	calendar.unselect();
	    });
	});
	// 캘린더 일정 추가 이벤트 종료
});

</script>
<style>
	
#body {
/* 	margin: 40px 10px; */
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
  
#calendar {
	max-width: 1100px;
}

/* 일요일 날짜 빨간색 */
.fc-day-sun[role="gridcell"] div {
/*   background-color: #FFEFEF; */
/*   text-decoration: none; */
}
.fc-day-sun a {
    color: red;
}

/* #event-modal { */
/*             position: fixed; */
/*             width: 100%; */
/*             height: 100%; */
/*             display: none; */
/*             z-index: 10000; */
/*         } */
</style>

<div id="body" class="row">
    <div class="col-lg-12">
        <div class="row">
        	<div class="">
                <div class="card card-h-100">
                    <div class="card-body">
                        <div id="calendar"></div>
                    </div>
                </div>
            </div> <!-- end col -->
        </div> 

		<!-- Add New Event MODAL -->
		<div class="modal fade" id="event-modal" tabindex="-1" style="display: none;" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content">
		            <div class="modal-header py-3 px-4 border-bottom-0">
		                <h5 class="modal-title" id="modal-title">일정 추가</h5>
		
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
		
		            </div>
		            <div class="modal-body p-4">
		                <form class="needs-validation" name="event-form" id="form-event" novalidate="">
		                	<input type="hidden" id="schStartT" value="">
		                	<input type="hidden" id="schEndT" value="">
		                    <div class="row">
		                        <div class="col-12">
		                            <div class="mb-3">
		                                <label class="form-label">일정내용</label>
		                                <input class="form-control" placeholder="내용을 입력해주세요." type="text" name="schTitle" id="schTitle" required="" value="">
		                                <div class="invalid-feedback">일정 내용을 입력해주세요!</div>
		                            </div>
		                        </div>
		                        <div class="col-12">
		                            <div class="justify-content-between d-flex" >
		                                <label class="form-label">시작일시</label>
		                               
		                                <label class="form-label" style="margin-right: 150px;">종료일시</label>
		                            </div>
		                        </div>
		                        <div class="col-12">
		                            <div class="mb-3 justify-content-between d-flex" >
		                                <input style="width: 47%;" class="form-control"  type="date" name="schStart" id="schStart" value="">
		                                <div class="invalid-feedback">일정 내용을 입력해주세요!</div>
		                               
		                                <input style="width: 47%;" class="form-control"  type="date" name="schEnd" id="schEnd" value="">
		                                <div class="invalid-feedback">일정 내용을 입력해주세요!</div>
		                            </div>
		                        </div>
		                        <div class="col-12">
		                            <div class="mb-3">
		                                <label class="form-label">색상</label>
		                                <select class="form-select shadow-none" name="category" id="schBColor" required="">
		                                    <option value="bg-danger" selected="selected">빨강색</option>
		                                    <option value="bg-success">연두색</option>
		                                    <option value="bg-primary">파랑색</option>
		                                    <option value="bg-info">하늘색</option>
		                                    <option value="bg-dark">검은색</option>
		                                    <option value="bg-warning">노란색</option>
		                                </select>
		                                <div class="invalid-feedback">카테고리를 선택해주세요!</div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="row mt-2">
		                        <div class="col-6">
		                            <button type="button" class="btn btn-danger" id="btn-delete-event">삭제</button>
		                        </div>
		                        <div class="col-6 text-end">
		                            <button type="button" class="btn btn-light me-1" data-bs-dismiss="modal">나가기</button>
		                            <button type="button" class="btn btn-success" id="btn-save-event">저장</button>
		                        </div>
		                    </div>
		                    <sec:csrfInput/>
		                </form>
		            </div>
		        </div> <!-- end modal-content-->
		    </div> <!-- end modal dialog-->
		</div>
		<!-- end modal-->
    </div>
</div>
