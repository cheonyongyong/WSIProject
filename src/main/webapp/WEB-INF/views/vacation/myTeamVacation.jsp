<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row">
<!-- <h2>사원이 보는 페이지!!!</h2> -->
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                	<div class="d-flex">
	                	<div class="p-2 flex-fill">
							<div class="gridjs-search">
								<input type="text" id="search" placeholder="사원명 검색" aria-label="Type a keyword..." class="gridjs-input gridjs-search-input">
								<button type="button" style="margin-bottom: 4px;" class="btn btn-primary" id="searchBtn">검색</button>
							</div>
						</div>
						<div class="p-2 flex-fill"></div>
						<div class="p-2 flex-fill"></div>
						<div class="p-2 flex-fill"></div>
	                	<div class="p-2 flex-fill">
	                		<select class="form-select" id="selectDept" aria-label="Default select example" disabled>
			                	<c:forEach items="${comList}" var="comList">
			                		<c:set value="${deptCode }" var="deptCode"/>
				                	<c:if test="${fn:startsWith(comList.comCode, 'a') }">
										<option value="${comList.comCode}" <c:if test="${comList.comCode eq deptCode}">selected</c:if>>${comList.comName}</option>
				                	</c:if>
							    </c:forEach>
							</select>
	                	</div>
				    </div>
					 <div class="row">
						 <div class="col-12">
						    <div class="card">
							    <div class="card-body">
							    	<div class="table-responsive">
					                    <table class="table table-bordered align-middle table-nowrap table-check">
					                        <thead class="table-light">
					                            <tr>
					                                <th scope="col">이름</th>
					                                <th scope="col">사번</th>
					                                <th scope="col">부서</th>
					                                <th scope="col">최초 부여 일수</th>
					                                <th scope="col">잔여 휴가 일수</th>
					                            </tr>
					                        </thead>
					                        <tbody>
					                        	<c:choose>
					                        		<c:when test="${empty haveVacList }">
					                        			<tr>
					                        				<td colspan="5">사원 휴가 내역이 존재하지 않습니다.</td>
					                        			</tr>
					                        		</c:when>
					                        		<c:otherwise>
					                        			<c:forEach items="${haveVacList }" var="haveVacList">
							                            <tr>
							                                <td>${haveVacList.empName }</td>
							                                <td>${haveVacList.empNo }</td>
							                                <td>
							                                	<c:forEach items="${comList}" var="comList">
															        <c:if test="${haveVacList.empDept eq comList.comCode}">
															            ${comList.comName}
															        </c:if>
															    </c:forEach>
							                                </td>
							                                <td>${haveVacList.oldestVpDays }일</td>
							                                <td>${haveVacList.latestVpDays }일</td>
							                            </tr>
							                            </c:forEach>
					                        		</c:otherwise>
				                        		</c:choose>
					                        </tbody>
					                    </table>
							    	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

