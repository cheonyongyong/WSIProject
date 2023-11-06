<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<div class="row">
	<div>
		<div class="card">
			<div class="card-body">
				<div class="tab-content p-3 text-muted">
					<div id="table-search" class="table">
						<div role="complementary" class="gridjs gridjs-container"
							style="width: 100%;">
							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-9">
									<div class="d-flex justify-content-end">
										<form method="post" id="searchForm">
											<ul class="nav nav-pills">
												<li class="nav-item"><input type="hidden" name="page"
													id="page" /> <select class="form-select" name="searchType">
														<option value="2"
															<c:if test="${searchType eq '2' }">selected</c:if>>근무</option>
														<option value="1"
															<c:if test="${searchType eq '1' }">selected</c:if>>출장</option>
														<option value="3"
															<c:if test="${searchType eq '3' }">selected</c:if>>휴가</option>
														<option value="4"
															<c:if test="${searchType eq '4' }">selected</c:if>>추가근무</option>
														<option value="5"
															<c:if test="${searchType eq '5' }">selected</c:if>>경비</option>
												</select></li>
												<li class="nav-item"><input type="text"
													name="searchWord" id="searchWord" value="${searchWord }"
													class="form-control float-right" placeholder="문서제목을 입력하세요">
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
							</div>
							<div class="gridjs-wrapper" style="height: auto;">
								<table role="grid" class="gridjs-table text-center"
									style="height: auto;">
									<thead class="gridjs-thead">
										<tr class="gridjs-tr">
											<th data-column-id="title" class="gridjs-th">
												<div class="gridjs-th-content">기안종류</div>
											</th>
											<th data-column-id="title" class="gridjs-th">
												<div class="gridjs-th-content">기안제목</div>
											</th>
											<th data-column-id="gname" class="gridjs-th">
												<div class="gridjs-th-content">작성자</div>
											</th>
											<th data-column-id="mname" class="gridjs-th">
												<div class="gridjs-th-content">작성일자</div>
											</th>
											<th data-column-id="wdate" class="gridjs-th">
												<div class="gridjs-th-content">처리상태</div>
											</th>
											<th data-column-id="mdate" class="gridjs-th">
												<div class="gridjs-th-content">기안내용</div>
											</th>
											<th data-column-id="mdate" class="gridjs-th">
												<div class="gridjs-th-content">처리일자</div>
											</th>
										</tr>
									</thead>
									<c:set value="${docPagingVO.dataList }" var="myDocList" />
									<c:choose>
										<c:when test="${empty myDocList }">
											<tbody class="gridjs-tbody" id="docList">
												<tr class="gridjs-tr text-center">
													<td data-column-id="title" class="gridjs-td" colspan="5">해당
														정보가 존재하지 않습니다</td>
												</tr>
											</tbody>
										</c:when>
										<c:otherwise>
											<tbody class="gridjs-tbody" id="docList">
												<c:forEach items="${myDocList }" var="myDoc">
													<tr class="gridjs-tr text-center align-items-center">
														<td data-column-id="title" class="gridjs-td">${myDoc.docClfName}</td>
														<td data-column-id="title" class="gridjs-td">${myDoc.docTitle }</td>
														<td data-column-id="gname" class="gridjs-td">${myDoc.empName }</td>
														<td data-column-id="wdate" class="gridjs-td"><fmt:formatDate
																value="${myDoc.docDate}" pattern="yyyy.MM.dd(E) HH:mm" /></td>
														<td data-column-id="mdate" class="gridjs-td"><c:if
																test="${myDoc.aprStat eq '대기중' }">
																<div
																	class="d-flex flex-wrap align-items-center justify-content-md-center">
																	<div class="badge badge-soft-warning">${myDoc.aprStat }</div>
																</div>
															</c:if> <c:if test="${myDoc.aprStat eq '승인' }">
																<div
																	class="d-flex flex-wrap align-items-center justify-content-md-center">
																	<div class="badge badge-soft-primary">${myDoc.aprStat }</div>
																</div>
															</c:if><c:if test="${myDoc.aprStat eq '반려' }">
																<div
																	class="d-flex flex-wrap align-items-center justify-content-md-center">
																	<div class="badge badge-soft-danger">${myDoc.aprStat }</div>
																</div>
															</c:if></td>
														<td data-column-id="mname" class="gridjs-td text-center">
															<div class="icon-demo-content align-item-center">
																<i class="uil-file-alt" data-bs-toggle="modal"
																	data-bs-target="#infoModify${myDoc.docNo }"></i>
															</div>
														</td>
														<td data-column-id="wdate" class="gridjs-td"><fmt:formatDate
																value="${myDoc.aprDate}" pattern="yyyy.MM.dd(E) HH:mm" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
							<div class="row g-0 text-center text-sm-start">
								<div class="col-sm">
									<nav aria-label="Page navigation example" id="pagingArea">
										${docPagingVO.pagingHTML }</nav>
								</div>
							</div>
						</div>
					</div>
					<c:forEach items="${myDocList }" var="myDoc">
						<div class="modal fade bs-example-modal-lg"
							id="infoModify${myDoc.docNo }" tabindex="-1"
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
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div>${myDoc.docCont }</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-light"
											data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-danger"
											data-bs-dismiss="modal"
											onclick="javascript:fn_diss('${myDoc.docNo}')">반려</button>
										<button type="button" class="btn btn-success"
											data-bs-dismiss="modal"
											onclick="javascript:fn_apr('${myDoc.docNo}')">승인</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		var searchForm = $("#searchForm");
		var pagingArea = $("#pagingArea");

		pagingArea.on("click", "a", function(event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});

	});

	// 반려 시 처리될 핸들러 함수
	function fn_apr(docNo) {
		console.log(docNo);
		// 반려 사유를 작성할 modal 필요
		var aprRejRsn = $("#aprRejRsn").val();

		var data = {
			docNo : docNo,
			aprRejRsn : aprRejRsn
		};

		$.ajax({
			type : "post",
			url : "/document/aprupdate",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : JSON.stringify(data),
			success : function(res) {
				console.log(res);
				location.reload();
			}
		});
	}

	function fn_diss(docNo) {
		console.log(docNo);
		Swal.fire({
			  title: '반려사유',
			  input: 'text',
			  inputAttributes: {
			    autocapitalize: 'off'
			  },
			  showCancelButton: true,
			  cancelButtonText: '취소',
			  confirmButtonText: '제출',
			  confirmButtonColor: '#038edc',
			  showLoaderOnConfirm: true,
			  allowOutsideClick: () => !Swal.isLoading()
		}).then((result) => {
		  if (result.isConfirmed) {
			  var data = {
				docNo : docNo,
				aprRejRsn : result.value
			  };
			  $.ajax({
					type : "post",
					url : "/document/aprupdate",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data : JSON.stringify(data),
					success : function(res) {
						console.log(res);
						
					}
				});
		    Swal.fire({
		      title: `반려처리 되었습니다!`,
		      imageUrl: result.value.avatar_url,
		      confirmButtonText: '제출',
			  confirmButtonColor: '#038edc'
		    });
		    setTimeout(() => location.reload(), 1000);
		  }
		});
// 		$.ajax({
// 			type : "post",
// 			url : "/document/aprupdate",
// 			beforeSend : function(xhr) {
// 				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 			},
// 			contentType : "application/json; charset=utf-8",
// 			dataType : "json",
// 			data : docNo,
// 			success : function(res) {
// 				console.log(res);
// 				location.reload();
// 			}
// 		});
	}
</script>


