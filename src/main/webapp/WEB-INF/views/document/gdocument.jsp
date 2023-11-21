<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>
	<div class="card">
		<!--        <div class="card-header justify-content-between d-flex align-items-center"> -->
		<!--            <h4 class="card-title">문서함</h4> -->
		<!--        </div> -->
		<div class="card-body">
			<!--            <ul class="nav nav-tabs nav-tabs-custom" role="tablist"> -->
			<!--                <li class="nav-item"> -->
			<!--                    <a class="nav-link active" data-bs-toggle="tab" href="#home1" role="tab"> -->
			<!--                        <span class="d-block d-sm-none"><i class="fas fa-home"></i></span> -->
			<!--                        <span class="d-none d-sm-block">문서</span>  -->
			<!--                    </a> -->
			<!--                </li> -->
			<!--                <li class="nav-item"> -->
			<!--                    <a class="nav-link" data-bs-toggle="tab" href="#profile1" role="tab"> -->
			<!--                        <span class="d-block d-sm-none"><i class="far fa-user"></i></span> -->
			<!--                        <span class="d-none d-sm-block">신청 내역</span>  -->
			<!--                    </a> -->
			<!--                </li> -->
			<!--                <li class="nav-item"> -->
			<!--                    <a class="nav-link" data-bs-toggle="tab" href="#messages1" role="tab"> -->
			<!--                        <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span> -->
			<!--                        <span class="d-none d-sm-block">임시저장</span>    -->
			<!--                    </a> -->
			<!--                </li> -->
			<!--            </ul> -->
			<div class="tab-content p-3 text-muted">
				<div class="tab-pane active" id="home1" role="tabpanel">
					<div id="table-search" class="table">
						<div role="complementary" class="gridjs gridjs-container"
							style="width: 100%;">
							<div class="d-flex justify-content-end">
								<div class="gridjs-search">
									<input type="search" id="searchWord" placeholder="문서종류를 입력하세요"
										aria-label="Type a keyword..."
										class="gridjs-input gridjs-search-input">
									<button type="button" class="btn btn-info" id="searchBtn">검색</button>
								</div>
							</div>
							<div class="gridjs-wrapper" style="height: auto;">
								<table role="grid" class="gridjs-table text-center"
									style="height: auto;">
									<thead class="gridjs-thead">
										<tr class="gridjs-tr">
											<th data-column-id="name" class="gridjs-th"
												style="min-width: 83px; width: 174px;">
												<div class="gridjs-th-content">문서종류</div>
											</th>
											<th data-column-id="email" class="gridjs-th"
												style="min-width: 181px; width: 380px;">
												<div class="gridjs-th-content"></div>
											</th>
										</tr>
									</thead>
									<tbody class="gridjs-tbody">
										<c:forEach items="${docTypeList }" var="doc">
											<tr class="gridjs-tr">
												<td data-column-id="name" class="gridjs-td">${doc.docClfName }</td>
												<td data-column-id="email" class="gridjs-td">
													<div class="d-flex justify-content-center">
														<a
															href="/document/documentwrite?docClfCode=${doc.docClfCode }"><button
																type="button" class="btn btn-info">작성</button></a>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="gridjs-footer">
								<div class="gridjs-pagination">
									<div class="gridjs-pages">
										<button tabindex="0" role="button" title="Previous"
											aria-label="Previous" class="">Previous</button>
										<button tabindex="0" role="button" class="gridjs-currentPage"
											title="Page 1" aria-label="Page 1">1</button>
										<button tabindex="0" role="button" class="" title="Page 2"
											aria-label="Page 2">2</button>
										<button tabindex="0" role="button" title="Next"
											aria-label="Next" class="">Next</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="profile1" role="tabpanel">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<div class="card bg-light shadow-none h-100">
												<div>
													<div data-simplebar="init" class="tasklist-content p-3">
														<div class="simplebar-wrapper" style="margin: -16px;">
															<div class="simplebar-height-auto-observer-wrapper">
																<div class="simplebar-height-auto-observer"></div>
															</div>
															<div class="simplebar-mask">
																<div class="simplebar-offset"
																	style="right: -17px; bottom: 0px;">
																	<div class="simplebar-content-wrapper"
																		style="height: auto; overflow: hidden scroll;">
																		<div class="simplebar-content" style="padding: 16px;">

																			<div id="todo-task" class="tasks">
																				<!-- foreach문 시작 -->
																				<c:choose>
																					<c:when test="${empty mydocList }">
																						<div class="card task-box">
																							<div class="card-body">
																								<h5 class="font-size-40 mb-5">작성한 문서가 존재하지 않습니다</h5>
																							</div>
																						</div>

																					</c:when>
																					<c:otherwise>
																						<c:forEach items="${mydocList }" var="myDoc">

																							<div class="card task-box">
																								<div class="card-body">
																									<h5 class="font-size-20 mb-1">${myDoc.docTitle }</h5>
																									<h5 class="font-size-14 mb-1">${myDoc.empName }</h5>
																									<h5 class="font-size-14 mb-1">${myDoc.empDept }</h5>
																									<div class="flex-grow-1">
																										<div class="font-size-13 text-muted">
																											<fmt:formatDate value="${myDoc.docDate }"
																												pattern="yyyy-MM-dd" />
																										</div>
																									</div>
																								</div>
																								<div
																									class="card-footer bg-transparent border-top d-flex">
																									<div class="flex-grow-1">
																										<button class="btn btn-primary collapsed"
																											type="button" data-bs-toggle="collapse"
																											data-bs-target="#docList${myDoc.docNo }"
																											aria-expanded="false"
																											aria-controls="docList${myDoc.docNo }">조회</button>
																									</div>
																									<div class="flex-shrink-0 ms-2">
																										<span
																											class="badge badge-soft-success font-size-12">${myDoc.docStat }</span>
																									</div>
																								</div>
																							</div>
																						</c:forEach>
																					</c:otherwise>
																				</c:choose>
																				<!-- foreach문 끝 -->
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="simplebar-placeholder"
																style="width: auto; height: 1470px;"></div>
														</div>
														<div class="simplebar-track simplebar-horizontal"
															style="visibility: hidden;">
															<div class="simplebar-scrollbar"
																style="transform: translate3d(0px, 0px, 0px); display: none;">
															</div>
														</div>
														<div class="simplebar-track simplebar-vertical"
															style="visibility: visible;">
															<div class="simplebar-scrollbar"
																style="height: 38px; transform: translate3d(0px, 201px, 0px); display: block;">
															</div>
														</div>
													</div>

												</div>
											</div>
										</div>
<%-- 										<c:forEach items=""></c:forEach> --%>
										<div class="col">
											<c:forEach items="${mydocList }" var="myDoc">
												<div class="multi-collapse collapse"
													id="docList${myDoc.docNo }" style="">
													<div class="card card-body mb-0">
														<h5 class="font-size-20 mb-1">식비신청</h5>
														<div class="flex-grow-1">
															<div class="font-size-14 text-muted">이름 : ${myDoc.empName }</div>
															<div class="font-size-14 text-muted">부서 : ${myDoc.empDept }</div>
															<div class="font-size-14 text-muted">청구내용 : 9월 점심값</div>
															<div class="font-size-14 text-muted">은행 : 원시은행</div>
															<div class="font-size-14 text-muted">계좌번호 :
																110123456789</div>
															<div class="font-size-14 text-muted">예금주 : 호모하빌리스</div>
															<div class="font-size-14 text-muted">지출명 : 식비</div>
															<div class="font-size-14 text-muted">지출일자 :
																2023-10-05</div>
															<div class="font-size-14 text-muted">지출금액 : 250000원</div>
															파일 : <img alt=""
																src="${pageContext.request.contextPath }/resources/assets/images/영수증.png">
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="messages1" role="tabpanel">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<div class="card bg-light shadow-none h-100">
												<div>
													<div data-simplebar="init" class="tasklist-content p-3">
														<div class="simplebar-wrapper" style="margin: -16px;">
															<div class="simplebar-height-auto-observer-wrapper">
																<div class="simplebar-height-auto-observer"></div>
															</div>
															<div class="simplebar-mask">
																<div class="simplebar-offset"
																	style="right: -17px; bottom: 0px;">
																	<div class="simplebar-content-wrapper"
																		style="height: auto; overflow: hidden scroll;">
																		<div class="simplebar-content" style="padding: 16px;">
																			<div id="todo-task" class="tasks">
																			<c:forEach items="${myDocList }" var="myDoc">
																				<c:if test="${myDoc.docStat eq '수정중' }">
																				<div class="card task-box">
																					<div class="card-body">
																						<h5 class="font-size-20 mb-1">${myDoc.docTitle }</h5>
																						<h5 class="font-size-14 mb-1">${myDoc.empName }</h5>
																						<h5 class="font-size-14 mb-1">${myDoc.empDept }</h5>
																						<div class="flex-grow-1">
																							<div class="font-size-13 text-muted">
																								<fmt:formatDate value="${myDoc.docDate }"
																									pattern="yyyy-MM-dd" />
																							</div>
																						</div>
																					</div>
																					<div class="card-footer bg-transparent border-top d-flex">
																						<div class="flex-grow-1">
																							<button class="btn btn-primary collapsed"
																								type="button" data-bs-toggle="collapse"
																								data-bs-target="#docStorage${myDoc.docNo }"
																								aria-expanded="false"
																								aria-controls="docStorage${myDoc.docNo }">조회</button>
																						</div>
																						<div class="flex-shrink-0 ms-2">
																							<span
																								class="badge badge-soft-success font-size-12">승인</span>
																						</div>
																					</div>
																				</div>
																				</c:if>
																			</c:forEach>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="simplebar-placeholder"
																style="width: auto; height: 1470px;"></div>
														</div>
														<div class="simplebar-track simplebar-horizontal"
															style="visibility: hidden;">
															<div class="simplebar-scrollbar"
																style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
														</div>
														<div class="simplebar-track simplebar-vertical"
															style="visibility: visible;">
															<div class="simplebar-scrollbar"
																style="height: 38px; transform: translate3d(0px, 201px, 0px); display: block;"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col">
											<c:forEach items="${myDocList }" var="myDoc">
												<c:if test="${myDoc.docStat eq '수정중' }">
													<div class="multi-collapse collapse"
														id="docStorage${myDoc.docNo }" style="">
														<div class="card card-body mb-0">
															<h5 class="font-size-20 mb-1">식비신청</h5>
															<div class="flex-grow-1">
																<div class="font-size-14 text-muted">이름 : ${myDoc.empName }</div>
																<div class="font-size-14 text-muted">부서 : ${myDoc.empDept }</div>
																<div class="font-size-14 text-muted">청구내용 : 9월 점심값</div>
																<div class="font-size-14 text-muted">은행 : 원시은행</div>
																<div class="font-size-14 text-muted">계좌번호 :
																	110123456789</div>
																<div class="font-size-14 text-muted">예금주 : ${myDoc.empName }</div>
																<div class="font-size-14 text-muted">지출명 : 식비</div>
																<div class="font-size-14 text-muted">지출일자 :
																	2023-10-05</div>
																<div class="font-size-14 text-muted">지출금액 :
																	250000원</div>
																파일 : <img alt=""
																	src="${pageContext.request.contextPath }/resources/assets/images/영수증.png"><br />
																<button class="btn btn-primary mb-2" type="button">수정</button>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
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
</div>


<script type="text/javascript">
$(function(){
	var searchBtn = $("#searchBtn");
	var tBody = $(".gridjs-tbody");
	
	var count = $("#count");
	searchBtn.on("click", function(){
		var searchWord = $("#searchWord").val();
		var data = {
			searchWord : searchWord
		};
		console.log("searchWord : " + searchWord);
		$.ajax({
			method : "post",
			url : "/document/search?${_csrf.parameterName}=${_csrf.token}",
			dataType : "json",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(result){
				console.log(result[0].count);
				count.text(result[0].count);
				var html = "";
				if(result[0].count == 0){
					$('.gridjs-table > .gridjs-tbody').empty();
					html += "<tr class='gridjs-tr'>";
					html += "<td data-column-id='name' class='gridjs-td' colspan='2'>조회한 내용이 존재하지 않습니다.</td>";
					html += "</tr>";
					$('.gridjs-table').append(html);
				}else{
					
						$('.gridjs-table > .gridjs-tbody').empty();
					for(let i = 0; i < Object.keys(result).length; i++){
						html += "<tr class='gridjs-tr'>";
						html += "<td data-column-id='name' class='gridjs-td'>"+result[i].docClfName+"</td>";
						html += "<td data-column-id='email' class='gridjs-td'>";
						html += "<div class='d-flex justify-content-center'>";
						html += "<a href='/document/documentwrite?docClfFile="+result[i].docClfFile+"'><button type='button' class='btn btn-info'>작성</button></a>";										
						html += "</div>";
						html += "</td>";
						html += "</tr>";
					}
						$('.gridjs-table').append(html);
				}
			},
			error : function(result){
				console.log(result);
			}
		});
	});
});
</script>














