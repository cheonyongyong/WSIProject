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