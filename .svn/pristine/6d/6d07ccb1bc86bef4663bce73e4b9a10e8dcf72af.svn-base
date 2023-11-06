<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div>
	<div class="card">
		<div class="card-body">
			<div id="table-search" class="table">
				<div role="complementary" class="gridjs gridjs-container"
					style="width: 100%;">
					<div class="d-flex justify-content-end">
						<div class="gridjs-search">
							<form method="post" id="searchForm">
								<ul class="nav nav-pills">
									<li class="nav-item">
										<input type="hidden" name="page" id="page" />
										<select class="form-select" name="searchType">
											<option value="title"
												<c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
											<option value="empName"
												<c:if test="${searchType eq 'empName' }">selected</c:if>>기안자</option>
											<option value="docClfName"
												<c:if test="${searchType eq 'docClfName' }">selected</c:if>>문서분류</option>
									</select></li>
									<li class="nav-item">
									<input type="text" name="searchWord" id="searchWord" value="${searchWord }" class="form-control float-right" placeholder="문서제목을 입력하세요">
									</li>
									<li class="nav-item">
										<div class="input-group-append">
											<button type="submit" class="btn btn-primary">
												<i class="fas fa-search"></i>검색
											</button>
										</div>
									</li>
									<sec:csrfInput />
								</ul>
							</form>
						</div>
					</div>
					<div id="table-pagination" class="table">
						<div role="complementary" class="gridjs gridjs-container" style="width: 100%;">
							<div class="gridjs-wrapper" style="height: auto;">
								<table role="grid" class="gridjs-table text-center" id="gridjstable2"
									style="height: auto;">
									<thead class="gridjs-thead">
										<tr class="gridjs-tr">
											<th data-column-id="title" class="gridjs-th">
												<div class="gridjs-th-content">제목</div>
											</th>
											<th data-column-id="gname" class="gridjs-th">
												<div class="gridjs-th-content">기안자</div>
											</th>
											<th data-column-id="mname" class="gridjs-th">
												<div class="gridjs-th-content">문서분류</div>
											</th>
											<th data-column-id="wdate" class="gridjs-th">
												<div class="gridjs-th-content">기안일자</div>
											</th>
											<th data-column-id="status" class="gridjs-th">
												<div class="gridjs-th-content">승인상태</div>
											</th>
											<th data-column-id="reason" class="gridjs-th">
												<div class="gridjs-th-content">반려사유</div>
											</th>
											<th data-column-id="reason" class="gridjs-th">
												<div class="gridjs-th-content">처리일자</div>
											</th>
											<th data-column-id="reason" class="gridjs-th">
												<div class="gridjs-th-content">내용</div>
											</th>
										</tr>
									</thead>
									<!-- foreach 시작 -->
									<tbody class="gridjs-tbody" id="tbody2">
									<c:set value="${pagingVO.dataList }" var="docListAll"/>
										<c:forEach items="${docListAll }" var="listAll">
		
											<tr class="gridjs-tr" id="tr${listAll.docNo }">
												<td data-column-id="title" class="gridjs-td">${listAll.docTitle }</td>
												<td data-column-id="gname" class="gridjs-td">${listAll.empName }</td>
												<td data-column-id="mname" class="gridjs-td">${listAll.docClfName }</td>
												<td data-column-id="wdate" class="gridjs-td"><fmt:formatDate value="${listAll.docDate }" pattern="yyyy-MM-dd(E)"/></td>
												<td data-column-id="status" class="gridjs-td ">
													<c:if test="${listAll.docStat eq '승인'}">
														<div class="d-flex flex-wrap align-items-center justify-content-md-center">
															<div class="badge badge-soft-primary">${listAll.docStat }</div>
														</div>
													</c:if>
													<c:if test="${listAll.docStat eq '대기중'}">
														<div class="d-flex flex-wrap align-items-center justify-content-md-center">
															<div class="badge badge-soft-warning">${listAll.docStat }</div>
														</div>
													</c:if>
													<c:if test="${listAll.docStat eq '반려'}">
														<div class="d-flex flex-wrap align-items-center justify-content-md-center">
															<div class="badge badge-soft-danger">${listAll.docStat }</div>
														</div>
													</c:if>
													<c:if test="${listAll.docStat eq '승인대기'}">
														<div class="d-flex flex-wrap align-items-center justify-content-md-center">
															<div class="badge badge-soft-danger">${listAll.docStat }</div>
														</div>
													</c:if>
												</td>
												<td data-column-id="reason" class="gridjs-td">
													<c:if test="${empty listAll.aprRejRsn }">
														<div class="d-flex flex-wrap align-items-center justify-content-md-center">
															<div class="badge badge-soft-purple">없음</div>
														</div>
													</c:if>
													<c:if test="${listAll.aprRejRsn }">
														<td data-column-id="mname" class="gridjs-td">${listAll.aprRejRsn }</td>
													</c:if>
												</td>
												<td data-column-id="reason" class="gridjs-td">
													<c:if test="${empty listAll.aprRejRsn }">
														<div class="d-flex flex-wrap align-items-center justify-content-md-center">
															<div class="badge badge-soft-purple">처리중</div>
														</div>
													</c:if>
													<c:if test="${listAll.aprRejRsn }">
														<td data-column-id="mname" class="gridjs-td"><fmt:formatDate value="${listAll.docConfDate }" pattern="yyyy-MM-dd(E)"/></td>
													</c:if>
												</td>
												<td data-column-id="status" class="gridjs-td ">
													<div class="icon-demo-content align-item-center">
														<i class="uil-file-alt" data-bs-toggle="modal"
																	data-bs-target="#info${listAll.docNo }"></i>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
									<!-- foreach 끝-->
								</table>
							</div>
							<div class="gridjs-footer">
								<nav aria-label="Page navigation example" id="pagingArea">
									${pagingVO.pagingHTML }
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:forEach items="${docListAll }" var="listAll">
				<div class="modal fade bs-example-modal-lg"
					id="info${listAll.docNo }" tabindex="-1"
					aria-labelledby="myLargeModalLabel" style="display: none;"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="myLargeModalLabel">기안 내용</h5>
								<button type="button" class="btn-close"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div
									class="d-flex flex-wrap align-items-center align-content-center text-center">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">${listAll.docCont }</div>
										<div class="col-md-2"></div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-success" data-bs-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<!-- gridjs js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/gridjs/gridjs.umd.js"></script>
<!-- Sweet Alerts js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script type="text/javascript">
$(function(){

	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");

	pagingArea.on("click", "a", function(event) {
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
});
</script>














