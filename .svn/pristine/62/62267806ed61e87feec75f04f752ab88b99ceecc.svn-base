<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div>
   <div class="card">
       <div class="card-body">
           <div class="tab-content p-3 text-muted">
               <div class="tab-pane active" id="home1" role="tabpanel">
				<div id="table-search1" class="table">
					<div role="complementary" class="gridjs gridjs-container"
						style="width: 100%;">
						<div class="d-flex justify-content-end">
							<div class="gridjs-search">
								<input type="search" placeholder="검색어를 입력하세요..." aria-label="Type a keyword..." class="gridjs-input gridjs-search-input" id="searchWord">
								<button type="button" class="btn btn-info" id="searchBtn">검색</button>
							</div>
						</div>
						<div class="gridjs-wrapper" style="height: auto;">
						<table role="grid" class="gridjs-table text-center" style="height: auto;" id="gridjstable1">
								<thead class="gridjs-thead">
									<tr class="gridjs-tr">
										<th data-column-id="name" class="gridjs-th" style="min-width: 83px; width: 174px;">
											<div class="gridjs-th-content">문서종류</div>
										</th>
										<th data-column-id="email" class="gridjs-th"
											style="min-width: 181px; width: 380px;"><div
												class="gridjs-th-content"></div></th>
									</tr>
								</thead>
								<tbody class="gridjs-tbody" id="tbody1">
								<c:forEach items="${docTypeList }" var="doc">
									<tr class="gridjs-tr">
										<td data-column-id="name" class="gridjs-td">${doc.docClfName }</td>
										<td data-column-id="email" class="gridjs-td">
											<div class="d-flex justify-content-center">
												<a href="/document/documentwrite?docClfCode=${doc.docClfCode }"><button type="button" class="btn btn-info">작성</button></a>										
<%-- 												<a href="/document/documentwrite?docClfFile=${doc.docClfFile }"><button type="button" class="btn btn-info">수정</button></a>										 --%>
											</div>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="gridjs-footer">
							<div class="gridjs-pagination">
								<div role="status" aria-live="polite" class="gridjs-summary"
									title="Page 1 of 2">
									Showing <b>1</b> to <b id="countmax1">5</b> of <b id="count1">${docCount }</b> results
								</div>
								<div class="gridjs-pages">
									<button tabindex="0" role="button" disabled
										title="Previous" aria-label="Previous" class="">Previous</button>
									<button tabindex="0" role="button" class="gridjs-currentPage"
										title="Page 1" aria-label="Page 1">1</button>
									<button tabindex="0" role="button" class="" title="Page 2"
										aria-label="Page 2">2</button>
									<button tabindex="0" role="button" title="Next"
										aria-label="Next" class="">Next</button>
								</div>
							</div>
						</div>
						<div id="gridjs-temp" class="gridjs-temp"></div>
					</div>
				</div>
			</div>
		
			<div class="tab-pane" id="home2" role="tabpanel">
            	<div id="table-search" class="table">
					<div role="complementary" class="gridjs gridjs-container"
						style="width: 100%;">
						<div class="d-flex justify-content-end">
							<div class="gridjs-search">
								<input type="search" placeholder="검색어를 입력하세요..." aria-label="Type a keyword..." id="searchWord2" class="gridjs-input gridjs-search-input">
								<button type="button" class="btn btn-info" id="searchBtn2">검색</button>
							</div>
						</div>
						<div class="gridjs-wrapper" style="height: auto;">
							<table role="grid" class="gridjs-table" id="gridjstable2" style="height: auto;">
								<thead class="gridjs-thead">
									<tr class="gridjs-tr">
										<th data-column-id="title" class="gridjs-th">
											<div class="gridjs-th-content">제목</div>
										</th>
										<th data-column-id="gname" class="gridjs-th">
											<div class="gridjs-th-content">기안자</div>
										</th>
										<th data-column-id="mname" class="gridjs-th">
											<div class="gridjs-th-content">결재자</div>
										</th>
										<th data-column-id="wdate" class="gridjs-th">
											<div class="gridjs-th-content">기안일자</div>
										</th>
										<th data-column-id="mdate" class="gridjs-th">
											<div class="gridjs-th-content">수정일자</div>
										</th>
										<th data-column-id="status" class="gridjs-th">
											<div class="gridjs-th-content">승인상태</div>
										</th>
										<th data-column-id="reason" class="gridjs-th">
											<div class="gridjs-th-content">반려사유</div>
										</th>
									</tr>
								</thead>
								<!-- foreach 시작 -->
								<tbody class="gridjs-tbody" id="tbody2">
								<c:forEach items="${docListAll }" var="listAll">
								
									<tr class="gridjs-tr" id="tr${listAll.docNo }">
										<td data-column-id="title" class="gridjs-td">${listAll.docTitle }</td>
										<td data-column-id="gname" class="gridjs-td">${listAll.empName }</td>
										<td data-column-id="mname" class="gridjs-td">조현준</td>
										<td data-column-id="wdate" class="gridjs-td">2023.08.10(목) 13:11</td>
										<td data-column-id="mdate" class="gridjs-td">2023.08.14(일) 11:46</td>
										<td data-column-id="status" class="gridjs-td">
										<c:if test="${listAll.docStat eq '승인'}">
                                            <span class="badge badge-soft-success font-size-12">${listAll.docStat}</span>
										</c:if>
										<c:if test="${listAll.docStat eq '대기중'}">
                                            <span class="badge badge-soft-warning font-size-12">${listAll.docStat}</span>
										</c:if>
										<c:if test="${listAll.docStat eq '반려'}">
                                            <span class="badge badge-soft-danger font-size-12">${listAll.docStat}</span>
										</c:if>
                                        </td>
										<td data-column-id="reason" class="gridjs-td"></td>
									</tr>
								</c:forEach>
								</tbody>
								<!-- foreach 끝-->
							</table>
						</div>
						<div class="gridjs-footer">
							<div class="gridjs-pagination">
								<div role="status" aria-live="polite" class="gridjs-summary"
									title="Page 1 of 2">
									Showing <b>1</b> to <b id="countmax2">5</b> of <b id="count2">${allCount }건</b> results
								</div>
								<div class="gridjs-pages">
									<button tabindex="0" role="button" disabled
										title="Previous" aria-label="Previous" class="">Previous</button>
									<button tabindex="0" role="button" class="gridjs-currentPage"
										title="Page 1" aria-label="Page 1">1</button>
									<button tabindex="0" role="button" class="" title="Page 2"
										aria-label="Page 2">2</button>
									<button tabindex="0" role="button" title="Next"
										aria-label="Next" class="">Next</button>
								</div>
							</div>
						</div>
						<div id="gridjs-temp" class="gridjs-temp"></div>
					</div>
				</div>
			</div>       	
			<div class="tab-pane" id="profile1" role="tabpanel">
                   <div class="row">
                   		<div class="col-lg-12">
							<div class="card">
	                           <div class="card-body">
	                               <div class="row">
<%-- 	                                   <c:forEach items="${mydocList }" var="myDoc"> --%>
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
																				<!-- foreach 시작 -->
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
																									<fmt:formatDate value="${myDoc.docDate }" pattern="yyyy-MM-dd"/>
																								</div>
																							</div>
																						</div>
																						<div
																							class="card-footer bg-transparent border-top d-flex">
																							<div class="flex-grow-1">
																								<button class="btn btn-primary collapsed"
																									type="button" data-bs-toggle="collapse"
																									data-bs-target="#d${myDoc.docNo }"
																									aria-expanded="false"
																									aria-controls="multiCollapseExample2">조회</button>
																							</div>
																							<div class="flex-shrink-0 ms-2">
																								<c:if test="${myDoc.docStat eq '승인' }">
																									<span class="badge badge-soft-success font-size-12">${myDoc.docStat}</span>
																								</c:if>
																								<c:if test="${myDoc.docStat eq '대기중' }">
																									<span class="badge badge-soft-warning font-size-12">${myDoc.docStat}</span>
																								</c:if>
																								<c:if test="${myDoc.docStat eq '반려' }">
																									<span class="badge badge-soft-danger font-size-12">${myDoc.docStat}</span>
																								</c:if>
																							</div>
																						</div>
																					</div>
																				</c:forEach>
																				</c:otherwise>
																				</c:choose>
																				
																				<!-- foreach 끝 -->
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
<%-- 	                                   </c:forEach> --%>
	                                   <div class="col">
	                                   <c:forEach items="${mydocList }" var="myDoc">
	                                       <div class="multi-collapse collapse" id="d${myDoc.docNo }" style="">
	                                       <div class="card card-body mb-0">
	                                       		<h5 class="font-size-20 mb-1">식비신청</h5>
	                                       		<div class="flex-grow-1">
                                                  	<div class="font-size-14 text-muted">이름 : 호모하빌리스</div>
                                                  	<div class="font-size-14 text-muted">부서 : 개발팀</div>
                                                  	<div class="font-size-14 text-muted">청구내용 : 9월 점심값</div>
                                                  	<div class="font-size-14 text-muted">은행 : 원시은행</div>
                                                  	<div class="font-size-14 text-muted">계좌번호 : 110123456789</div>
                                                  	<div class="font-size-14 text-muted">예금주 : 호모하빌리스</div>
                                                  	<div class="font-size-14 text-muted">지출명 : 식비</div>
                                                  	<div class="font-size-14 text-muted">지출일자 : 2023-10-05</div>
                                                  	<div class="font-size-14 text-muted">지출금액 : 250000원</div>
                                                  	파일 : 
<%--                                                   	<img alt="" src="${pageContext.request.contextPath }/resources/assets/images/영수증.png"> --%>
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
				<div class="tab-pane" id="profile2" role="tabpanel">
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
																			<!-- foreach 시작 -->
																			<c:forEach items="${docListAll }" var="myDoc">
																				<div class="card task-box">
																					<div class="card-body">
																						<h5 class="font-size-20 mb-1">식비신청</h5>
																						<h5 class="font-size-14 mb-1">호모하빌리스</h5>
																						<h5 class="font-size-14 mb-1">개발팀</h5>
																						<div class="flex-grow-1">
																							<div class="font-size-13 text-muted">${myDoc.docDate }</div>
																						</div>
																					</div>
																					<div
																						class="card-footer bg-transparent border-top d-flex">
																						<div class="flex-grow-1">
																							<button class="btn btn-primary collapsed"
																								type="button" data-bs-toggle="collapse"
																								data-bs-target="#a${myDoc.docNo }"
																								aria-expanded="false"
																								aria-controls="multiCollapseExample2">조회</button>
																						</div>
																						<div class="flex-shrink-0 ms-2">
																								<c:if test="${myDoc.docStat eq '승인'}" >
																							<span
																								class="badge badge-soft-success font-size-12">${myDoc.docStat }</span>
																								</c:if>
																								<c:if test="${myDoc.docStat eq '대기중'}" >
																							<span
																								class="badge badge-soft-warning font-size-12">${myDoc.docStat }</span>
																								</c:if>
																						</div>
																					</div>
																				</div>
																				</c:forEach>
																				<!-- foreach 끝-->
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
										<!-- foreach 시작 -->
										<c:forEach items="${docListAll }" var="myDoc">
											<div class="multi-collapse collapse"
												id="a${myDoc.docNo }" style="">
												<div class="card card-body mb-0">
													<h5 class="font-size-20 mb-1">식비신청</h5>
													<div class="flex-grow-1">
														<div class="font-size-14 text-muted">이름 : ${myDoc.empName }</div>
														<div class="font-size-14 text-muted">부서 : ${myDoc.empDept}</div>
														<div class="font-size-14 text-muted">청구내용 : ${myDoc.docCont }</div>
														<div class="font-size-14 text-muted">은행 : 원시은행</div>
														<div class="font-size-14 text-muted">계좌번호 :
															110123456789</div>
														<div class="font-size-14 text-muted">예금주 : 호모하빌리스</div>
														<div class="font-size-14 text-muted">지출명 : 식비</div>
														<div class="font-size-14 text-muted">지출일자 :
															2023-10-05</div>
														<div class="font-size-14 text-muted">지출금액 : 250000원</div>
														파일 : 
<%-- 														<img alt="" src="${pageContext.request.contextPath }/resources/assets/images/영수증.png"> --%>
													</div>
													<div class="d-grid gap-2 d-md-flex justify-content-md-end">
														<button type="button" class="btn btn-danger btn-sm"
															id="ajax-alert">반려</button>
														<button type="button" class="btn btn-info btn-sm"
															id="sa-success">승인</button>
													</div>
												</div>
											</div>
											</c:forEach>
											<!-- foreach 끝 -->
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
	                                               <div data-simplebar="init" class="tasklist-content p-3"><div class="simplebar-wrapper" style="margin: -16px;"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset" style="right: -17px; bottom: 0px;"><div class="simplebar-content-wrapper" style="height: auto; overflow: hidden scroll;"><div class="simplebar-content" style="padding: 16px;">
	                                                   <div id="todo-task" class="tasks">
	                                                       <div class="card task-box">
	                                                           <div class="card-body">
	                                                               <h5 class="font-size-20 mb-1">식비신청</h5>
	                                                               <h5 class="font-size-14 mb-1">호모하빌리스</h5>
	                                                               <h5 class="font-size-14 mb-1">개발팀</h5>
	                                                               <div class="flex-grow-1">
	                                                                   <div class="font-size-13 text-muted">2023-10-05</div>
	                                                               </div>
	                                                           </div>
	                                                           <div class="card-footer bg-transparent border-top d-flex">
	                                                               <div class="flex-grow-1">
	                                   									<button class="btn btn-primary collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">조회</button>
	                                                               </div>
	                                                               <div class="flex-shrink-0 ms-2">
	                                                                   <span class="badge badge-soft-success font-size-12">승인</span>
	                                                               </div>
	                                                           </div>
	                                                       </div>
	                                                       <div class="card task-box">
	                                                           <div class="card-body">
	                                                               <h5 class="font-size-20 mb-1">식비신청</h5>
	                                                               <h5 class="font-size-14 mb-1">호모하빌리스</h5>
	                                                               <h5 class="font-size-14 mb-1">개발팀</h5>
	                                                               <div class="flex-grow-1">
	                                                                   <div class="font-size-13 text-muted">2023-09-05</div>
	                                                               </div>
	                                                           </div>
	                                                           <div class="card-footer bg-transparent border-top d-flex">
	                                                               <div class="flex-grow-1">
	                                   									<button class="btn btn-primary collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample3" aria-expanded="false" aria-controls="multiCollapseExample3">조회</button>
	                                                               </div>
	                                                               <div class="flex-shrink-0 ms-2">
	                                                                   <span class="badge badge-soft-success font-size-12">승인</span>
	                                                               </div>
	                                                           </div>
	                                                       </div>
	                                                   </div>
	                                               </div></div></div></div><div class="simplebar-placeholder" style="width: auto; height: 1470px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div></div><div class="simplebar-track simplebar-vertical" style="visibility: visible;"><div class="simplebar-scrollbar" style="height: 38px; transform: translate3d(0px, 201px, 0px); display: block;"></div></div></div>
	                                           </div>
	                                       </div>
	                                   </div>
	                                   <div class="col">
	                                       <div class="multi-collapse collapse" id="multiCollapseExample2" style="">
	                                       <div class="card card-body mb-0">
	                                       		<h5 class="font-size-20 mb-1">식비신청</h5>
	                                       		<div class="flex-grow-1">
                                                  	<div class="font-size-14 text-muted">이름 : 호모하빌리스</div>
                                                  	<div class="font-size-14 text-muted">부서 : 개발팀</div>
                                                  	<div class="font-size-14 text-muted">청구내용 : 9월 점심값</div>
                                                  	<div class="font-size-14 text-muted">은행 : 원시은행</div>
                                                  	<div class="font-size-14 text-muted">계좌번호 : 110123456789</div>
                                                  	<div class="font-size-14 text-muted">예금주 : 호모하빌리스</div>
                                                  	<div class="font-size-14 text-muted">지출명 : 식비</div>
                                                  	<div class="font-size-14 text-muted">지출일자 : 2023-10-05</div>
                                                  	<div class="font-size-14 text-muted">지출금액 : 250000원</div>
                                                  	파일 : 
<%--                                                   	<img alt="" src="${pageContext.request.contextPath }/resources/assets/images/영수증.png"> --%>
                                                </div>
	                                       </div>
	                                       </div>
	                                       <div class="multi-collapse collapse" id="multiCollapseExample3" style="">
	                                       <div class="card card-body mb-0">
	                                       		<h5 class="font-size-20 mb-1">식비신청</h5>
	                                       		<div class="flex-grow-1">
                                                  	<div class="font-size-14 text-muted">이름 : 호모하빌리스</div>
                                                  	<div class="font-size-14 text-muted">부서 : 개발팀</div>
                                                  	<div class="font-size-14 text-muted">청구내용 : 9월 점심값</div>
                                                  	<div class="font-size-14 text-muted">은행 : 원시은행</div>
                                                  	<div class="font-size-14 text-muted">계좌번호 : 110123456789</div>
                                                  	<div class="font-size-14 text-muted">예금주 : 호모하빌리스</div>
                                                  	<div class="font-size-14 text-muted">지출명 : 식비</div>
                                                  	<div class="font-size-14 text-muted">지출일자 : 2023-09-05</div>
                                                  	<div class="font-size-14 text-muted">지출금액 : 250000원</div>
                                                  	파일 : 
<%--                                                   	<img alt="" src="${pageContext.request.contextPath }/resources/assets/images/영수증.png"> --%>
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
       </div>
   </div>
</div>

<!-- gridjs js -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/gridjs/gridjs.umd.js"></script>
<!-- Sweet Alerts js -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script type="text/javascript">
$(function(){
	var searchBtn = $("#searchBtn");
	var tBody1 = $("#tbody1");
	var gridtr = $(".gridjs-tr");
	var count1 = $("#count1");
	
	gridtr.on("click", function(event){
// 		console.log(event.attr.id);
	});
	
	
	searchBtn.on("click", function(){
		var searchWord = $("#searchWord").val();
		var html = "";
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
				count1.text(result[0].count+"건");
				if(Object.keys(result).length <= 5){
					$("#countmax1").text(result[0].count);
				}
					$('#gridjstable1 > #tbody1').empty()
					if(result[0].count == 0){
						html += "<tr class='gridjs-tr'>";
						html += "<td data-column-id='title' colspan='7' class='gridjs-td text-center'>";
						html += "조회하신 정보가 존재하지 않습니다!";
						html += "</td>";
						html += "</tr>";
						$('#gridjstable1').append(html);
						count1.text(0+"건");
					}
					else{
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
					$('#gridjstable1').append(html);
					}
			},
			error : function(result){
				console.log(result);
			}
		});
	});
	
	var searchBtn2 = $("#searchBtn2");
	
	var count2 = $("#count2");
	
	searchBtn2.on("click", function(){
		var searchWord2 = $("#searchWord2").val();
		var data = {
			searchWord : searchWord2
		};
		var html = "";
		console.log("searchWord : " + searchWord2);
		$.ajax({
			method : "post",
			url : "/document/searchall?${_csrf.parameterName}=${_csrf.token}",
// 				?${_csrf.parameterName}=${_csrf.token}"
			dataType : "json",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(result){
				console.log(result[0].count);
// 				count2.text(result[0].count+"건");
					if(Object.keys(result).length <= 5){
						$("#countmax2").text(result[0].count);
					}
					$('#gridjstable2 > #tbody2').empty()
					if(result[0].count == 0){
						html += "<tr class='gridjs-tr'>";
						html += "<td data-column-id='title' colspan='7' class='gridjs-td text-center'>";
						html += "조회하신 정보가 존재하지 않습니다!";
						html += "</td>";
						html += "</tr>";
						$('#gridjstable2').append(html);
						count2.text(0+"건");
					}
					else{
						for(let i = 0; i < Object.keys(result).length; i++){
							
							html += "<tr class='gridjs-tr'>";
							html += "<td data-column-id='title' class='gridjs-td'>"+result[i].docTitle+"</td>";
							html += "<td data-column-id='gname' class='gridjs-td'>"+result[i].empName+"</td>";
							html += "<td data-column-id='mname' class='gridjs-td'>조현준</td>";
							html += "<td data-column-id='wdate' class='gridjs-td'>2023.08.10(목) 13:11</td>";
							html += "<td data-column-id='mdate' class='gridjs-td'>2023.08.14(일) 11:46</td>";
							html += "<td data-column-id='status' class='gridjs-td'>";
		                    html += "<span class='badge badge-soft-success font-size-12'>승인</span>";
		                    html += "</td>";
							html += "<td data-column-id='reason' class='gridjs-td'></td>";
							html += "</tr>";
						}
							$('#gridjstable2').append(html);
							count2.text(result[0].count+"건");
							}
					},
			error : function(result){
// 				$('#gridjstable2 > #tbody2').empty()
				console.log(result);
				html += "<tr class='gridjs-tr'>";
				html += "<td data-column-id='title' colspan='7' class='gridjs-td'>";
				html += "조회하신 정보가 존재하지 않습니다!";
				html += "</td>";
				html += "</tr>";
				$('#gridjstable2').append(html);
			}
		});
	});
});
document.getElementById("sa-success").addEventListener("click", function() {
    Swal.fire({
        title: "Good job!",
        text: "You clicked the button!",
        icon: "success",
        showCancelButton: !0,
        confirmButtonColor: "#038edc",
        cancelButtonColor: "#f34e4e"
    })
});

document.getElementById("ajax-alert").addEventListener("click", function() {
    Swal.fire({
        title: "Submit email to run ajax request",
        input: "email",
        showCancelButton: !0,
        confirmButtonText: "Submit",
        showLoaderOnConfirm: !0,
        confirmButtonColor: "#038edc",
        cancelButtonColor: "#f34e4e",
        preConfirm: function(n) {
            return new Promise(function(e, t) {
                setTimeout(function() {
                    "taken@example.com" === n ? t("This email is already taken.") : e()
                }, 2e3)
            }
            )
        },
        allowOutsideClick: !1
    }).then(function(e) {
        Swal.fire({
            icon: "success",
            title: "Ajax request finished!",
            confirmButtonColor: "#038edc",
            html: "Submitted email: " + e
        })
    })
});


</script>














