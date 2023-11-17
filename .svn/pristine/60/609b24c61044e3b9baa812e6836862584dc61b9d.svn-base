<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="site-blocks-cover overlay" style="background-image: url(${pageContext.request.contextPath }/resources/images/cloud.jpg); height: 30px;" data-aos="fade" id="home-section">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-6 mt-lg-5 text-center">
				<h1>레벨, 기능 선택</h1>
			</div>
		</div>
	</div>
</div>

<br>

<div class="container pt-5 pb-5">
    <div class="row">
        <div class="col-lg-12">
        	<input type="hidden" id="cusRnum" name="cusRnum" value="${SessionInfo.cusRnum }">
            <form action="/subscribe" method="post" id="subscribeForm">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="p-5">
                            <h2><b>1. Level 선택</b></h2>
                            <br>
                            <p>level에 따라 자료실의 용량이 달라집니다.<br> 원하는 용량에 따라 선택해보세요!</p>
                            <br>
                            <div>
<%--                             	<c:forEach items="${levelNames }" var="levelNames"> --%>
<%--                             		<input type="radio" id="level" name="levelName" value="${levelNames.levelName }"> --%>
<%--                             	</c:forEach> --%>
                                <label for="levelName1" style="cursor:pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="levelName1" name="levelName" value="LEVEL1" checked="checked"> &nbsp;&nbsp;&nbsp; Level 1 : 자료실 용량 1GB</label><br>
                                <label for="levelName2" style="cursor:pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="levelName2" name="levelName" value="LEVEL2"> &nbsp;&nbsp;&nbsp; Level 2 : 자료실 용량 5GB</label><br>
                                <label for="levelName3" style="cursor:pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="levelName3" name="levelName" value="LEVEL3"> &nbsp;&nbsp;&nbsp; Level 3 : 자료실 용량 10GB</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <h2><b>2. 기능 선택</b></h2>
                            <br>
                            <p>필요한 기능만 선택해보세요.<br>각 회사의 니즈에 따라 달라지는 맞춤형 인사시스템이 됩니다.</p>
                            <br>
                            <div>
                                <label for="funcName1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="funcName1" name="funcNames" checked="checked" disabled="disabled"> &nbsp;&nbsp;&nbsp; 기본 제공 : 인사관리, 채용관리, 경영관리, 자료실</label><br>
                                <label for="funcName2" style="cursor:pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="funcName2" name="funcNames" value="work"> &nbsp;&nbsp;&nbsp; 근태관리</label><br>
                                <label for="funcName3" style="cursor:pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="funcName3" name="funcNames" value="vacation"> &nbsp;&nbsp;&nbsp; 휴가관리</label><br>
                                <label for="funcName4" style="cursor:pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="funcName4" name="funcNames" value="pay"> &nbsp;&nbsp;&nbsp; 급여관리</label><br>
                                <label for="funcName5" style="cursor:pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="funcName5" name="funcNames" value="document"> &nbsp;&nbsp;&nbsp; 문서함</label><br>
                            </div>
                        </div>
                    </div>
                </div>
                <div align="center" style="margin-bottom: 50px;">
                    <button type="button" id="nextBtn" class="btn btn-primary" style="width: 500px;">다음 단계</button>
                </div>
                <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>  
<script type="text/javascript">

$(function() {
    var nextBtn = $("#nextBtn");
    var subscribeForm = $("#subscribeForm");

//     var selectedLevelName = ''; // 라디오 버튼 값 저장
//     var selectedFuncNames = []; // 체크박스 값 배열

//     // 라디오 버튼 클릭
//     $("input[type='radio']").on('click', function() {
//         selectedLevelName = $(this).val();
//         console.log("레벨 이름 : " + selectedLevelName);
//     });

//     // 체크박스 클릭
//     $("input[type='checkbox']").on('click', function() {
//         var selectFuncName = $(this).val();
//         if ($(this).is(':checked')) {
//             selectedFuncNames.push(selectFuncName);
//         } else {
//             var index = selectedFuncNames.indexOf(selectFuncName);
//             if (index !== -1) {
//                 selectedFuncNames.splice(index, 1);
//             }
//         }
//         console.log(selectedFuncNames);
//     });


    nextBtn.on("click", function() {
    	
//         // 선택된 값들을 다음 페이지로 전달
//         var formData = {
//             levelName: selectedLevelName,
//             funcName: selectedFuncNames
//         };

//         // JSON 형식으로 데이터를 전달
//         $.post(window.location.href = "/subscribe2", formData, function(response) {
//             // 서버에서의 응답을 처리하거나, 페이지를 이동하는 로직을 추가할 수 있습니다.
//             console.log("데이터 전송 완료");
//         });
    	subscribeForm.submit();
    });
});




</script>