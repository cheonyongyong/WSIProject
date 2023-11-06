<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="site-blocks-cover overlay" style="background-image: url(${pageContext.request.contextPath }/resources/images/cloud.jpg); height: 30px;" data-aos="fade" id="home-section">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-6 mt-lg-5 text-center">
				<h1>애널리틱스</h1>
			</div>
		</div>
	</div>
</div>

<div class="container" style="max-width: 80%; height: 500px;">
    <div class="row" style="margin: 0; padding: 0;">
        <div class="col-lg-2 pt-5 pb-5" style="padding-left: 20px; padding-right: 20px;">
<%--         	<input type="text" id="cusRnum1" name="cusRnum1" value="${SessionInfo.cusRnum }"> --%>
            <!-- 사이드 메뉴 -->
            <%@ include file="sidemenuUser.jsp" %>
        </div>

		<div class="col-lg-10 pt-5" style="padding-left: 20px; padding-right: 20px;">
			<!--차트가 그려질 부분-->
			
			<canvas id="myChart"></canvas>
		</div>

    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">

</script>
