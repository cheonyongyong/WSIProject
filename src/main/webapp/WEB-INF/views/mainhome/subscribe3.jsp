<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="site-blocks-cover overlay" style="background-image: url(${pageContext.request.contextPath }/resources/images/cloud.jpg); height: 30px;" data-aos="fade" id="home-section">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-6 mt-lg-5 text-center">
				<h1>결제하기</h1>
			</div>
		</div>
	</div>
</div>

<br>

<div class="container pb-5">
    <div class="row">
        <div class="col-lg-12 p-5" align="center">
        	<h2>원시인</h2>
        	<hr>
        	<h6>결제하기</h6>
        	<br>
        	<p>인사시스템의 관리자 계정을 최초 생성하기 위해 구매자의 사번이 필요합니다.<br>
        	   입력하신 사번으로 아이디를 생성하여 계정 정보로 등록된 이메일로 보내드립니다.</p>
        	<br>
        	<form action="">
        		<div class="form-group row">
					<label class="col-lg-4 col-form-label" style="text-align: end;">사번</label>
					<div class="col-lg-5">
						<input type="text" class="form-control" id="" name="" placeholder="사번을 입력해주세요.">
					</div>
				</div>
        		<div class="form-group row">
					<label class="col-lg-4 col-form-label" style="text-align: end;">이메일</label>
					<div class="col-lg-5">
						<input type="text" class="form-control" id="cusEmail" name="cusEmail" value="">
					</div>
				</div>
        	<br>
        	<div align="center" style="margin-bottom: 50px;">
			    <button type="button" class="btn btn-primary" style="width: 500px;">결제하기</button>
		    </div>
        	<sec:csrfInput/>
        	</form>
        </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>  
<script type="text/javascript">

</script>