<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-us">

<!-- head 부분 -->
<head>
	<%@ include file="/alio/fuse/alio_head.jsp" %>
</head>
<!-- / head 부분 -->

<body class="layout layout-vertical layout-left-navigation layout-below-toolbar">
    <main>
        <div id="wrapper">
            <!-- 왼쪽 내비게이션 -->
            <%@ include file="/alio/fuse/alio_nav_left.jsp" %>
            <!-- / 왼쪽 내비게이션 -->
            <div class="content-wrapper">
                <!-- 위쪽 내비게이션 -->
                <%@ include file="/alio/fuse/alio_nav_top.jsp" %>
                <!-- / 위쪽 내비게이션 -->
                <div class="content custom-scrollbar">

                    <div id="project-dashboard" class="page-layout simple right-sidebar">

                        <div class="page-content-wrapper custom-scrollbar">

                            <!-- HEADER -->
                            <div class="page-header bg-secondary text-auto d-flex flex-column justify-content-between px-6 pt-4 pb-0">

                                <div class="row no-gutters align-items-start justify-content-between flex-nowrap">

                                    <div>
                                        <span class="h2">${LVL_GVO.gtitle}</span>
                                    </div>

                                </div>

                                <div class="row no-gutters align-items-center project-selection">



                                </div>

                            </div>
                            <!-- / HEADER -->

                            <!-- CONTENT -->
                            <div class="page-content">

                                <ul class="nav nav-tabs" id="myTab" role="tablist">
									<!-- 보드타입 서브메뉴 -->
						            	<%@ include file="/alio/fuse/alio_nav_sub.jsp" %>
						            <!-- /보드타입 서브메뉴 -->
                                </ul>
								
                                <div class="tab-content">
                                    <div class="tab-pane fade show active p-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab">

										<div class="timeline-item card mb-6">

	                                    	<header class="row no-gutters align-items-center justify-content-between p-4">
	
	                                            <div class="user col">
	
	                                                <div class="row no-gutters align-items-center justify-content-start">
	
	                                                    <div class="col">
										
	                                                        <div class="title font-weight-bold">
	                                                        
															<c:forEach items="${LVL_BTVO_LIST}" var="btvo">
															<c:choose>
																<c:when test="${btvo.btseq == LVL_BTSEQ}">
																<c:choose>
																	<c:when test="${btvo.btseq == 0}">
																		<h3 class="font-weight-bold">전체 글</h3>
																	</c:when>
																	<c:otherwise>
																		<h3 class="font-weight-bold">${btvo.btname}</h3>
																	</c:otherwise>
																</c:choose>
															</c:when>
															
															</c:choose>
															
															</c:forEach>

														</div>
	                                                    </div>
	                                                </div>
	                                            </div>
	
	                                    	</header>
	
                                            <div class="content">

                                                <div class="post-media py-2 px-4">
													
													<table id="sample-data-table" class="table">
				                                        <col style="width: 50%;"></col>
				                                        <col style="width: 20%;"></col>
				                                        <col style="width: 20%;"></col>
				                                        <col style="width: 10%;"></col>
				                                        <thead>
				                                            <tr>
				                                                <th class="secondary-text">
				                                                    <div class="table-header">
				                                                        <span class="column-title">제목</span>
				                                                    </div>
				                                                </th>
				                                                <th class="secondary-text">
				                                                    <div class="table-header">
				                                                        <span class="column-title">아이디</span>
				                                                    </div>
				                                                </th>
				                                                <th class="secondary-text">
				                                                    <div class="table-header">
				                                                        <span class="column-title">작성일</span>
				                                                    </div>
				                                                </th>
				                            
				                                                <th class="secondary-text">
				                                                    <div class="table-header">
				                                                        <span class="column-title">좋아요</span>
				                                                    </div>
				                                                </th>
				                                            </tr>
				                                        </thead>
				                                        <tbody>
				                                            <!-- forEach jstl -->
				                                            <!-- 제목를 누르면 bod_view.jsp로 가도록 해주세요 -->
				                                            <c:forEach items="${LVL_WVO_LIST}" var="wvo">
				                                            <tr>
				                                                <td><a href="/bod?action=view&gseq=${wvo.gvo.gseq}&btseq=${wvo.btvo.btseq}&bseq=${wvo.bvo.bseq}">${wvo.bvo.btitle}</a>&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon s-4 icon-comment-text-outline"></i> ${wvo.rvo.rcnt}</td>
				                                                <td>${wvo.cvo.cid}</td>
				                                                <td>${wvo.bvo.bregdate}</td>
				                                                <td><i class="icon s-4 icon-heart-outline"></i> ${wvo.lvo.lcnt}</td>
				                                            </tr>
				                                            </c:forEach>
				                                            <!-- / forEach jstl -->
				                                        </tbody>
				                                    </table>
                                    				<div align="right">${LVL_PAGING}</div>
                                                </div>
                                            </div>
	
                                            <footer class="bg-light p-4">
											<div>
												<c:choose>
													<c:when test="${LVL_SESS_CTYPE == 'a' && (LVL_BTSEQ % 6) != 0}">
														<div style="text-align: center; padding: 20px">
															<button type="button" class="btn btn-light" abled onClick="location.href='/bod?action=input&gseq=${LVL_GVO.gseq}&btseq=${LVL_BTSEQ}'"> 
					                       						POST
					                   						</button>
					               						</div>
													</c:when>
													<c:when test="${LVL_SESS_CTYPE != 'a' && (LVL_BTSEQ % 6) != 0 && (LVL_BTSEQ % 6) != 1}">
														<div style="text-align: center; padding: 20px">
															<button type="button" class="btn btn-light" abled onClick="location.href='/bod?action=input&gseq=${LVL_GVO.gseq}&btseq=${LVL_BTSEQ}'"> 
					                       						POST
					                   						</button>
					               						</div>
													</c:when>
													<c:otherwise>
													
													</c:otherwise>
												</c:choose>
	                                    	</div>
	                                        </footer>
                                    </div>
                                    
                                </div>
                                <div><br><br></div>
                            </div>
                            <!-- / CONTENT -->
                        </div>

                        
                    </div>

                    <script type="text/javascript" src="/alio/assets/js/apps/dashboard/project.js"></script>

                </div>
            </div>
        </div>
    </main>
</body>

</html>