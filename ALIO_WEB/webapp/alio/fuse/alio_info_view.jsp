<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-us">

<!-- head 부분 -->
<head>
	<%@ include file="/alio/fuse/alio_head.jsp" %>
	<!-- <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script> -->
	<script type="text/javascript">
	
	
	$(function(){
		
		$("#edit").click(function() {
			$(".infoForm").attr("action","/info");
			$("#action").attr("value","edit");
			$(".infoForm").submit();
		});
		
		$("#delete").click(function() {
			$(".infoForm").attr("action","/info");
			$("#action").attr("value","delete");
			$(".infoForm").submit();
		});
		
	});
	
	</script>
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
                                    <c:forEach items="${LVL_ITVO_LIST}" var="itvo">
										<li class="nav-item">
	    									<a class="nav-link btn" id="home-tab" href="/info?action=list&itseq=${itvo.itseq}&gseq=${LVL_GVO.gseq}" role="tab" aria-controls="home-tab-pane" aria-expanded="true">${itvo.itname}</a>
										</li>
									</c:forEach>
                                </ul>
								
								<form name="infoForm" class="infoForm" method="post">
								
									<input type="hidden" name="action" id="action">
									<input type="hidden" name="gseq" value="${LVL_GVO.gseq}">
									<input type="hidden" name="itseq" value="${LVL_ITSEQ}">
									<input type="hidden" name="iseq" value="${LVL_IVO.iseq}">
									
                                <div class="tab-content">
                                    <div class="tab-pane fade show active p-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab">

										<div class="timeline-item card mb-6">

	                                    	<header class="row no-gutters align-items-center justify-content-between p-4">
	
	                                            <div class="user col">
	
	                                                <div class="row no-gutters align-items-center justify-content-start">
	
	                                                    <div class="col">
	
	                                                        <div class="title font-weight-bold">
	
	                                                            
                                                    ${LVL_IVO.ibody}

                                                </div>

                                                <!-- <div class="row no-gutters align-items-center py-2 px-4">

                                                    <button type="button" class="like-button btn btn-link">
                                                        <i class="icon-heart-outline s-4"></i>
                                                        <span>Like (5)</span>
                                                    </button>

                                                    <button type="button" class="share-button btn btn-link">
                                                        <i class="icon-share s-4"></i>
                                                        <span>Share (21)</span>
                                                    </button>
                                                </div> -->
                                            </div>
	
                                            <footer class="bg-light p-4">
											<div>
												<br><br>
												<!-- 여기에 권한 부여 해야함 -->
												 <c:choose>
	                                 				<c:when test="${LVL_SESS_CTYPE == 'e' || LVL_SESS_CTYPE == 'a'}">
												<div style="text-align: center;">
													<!-- <button type="button" class="btn btn-light" id="edit" abled onClick="goPage('edit')"> -->
													<button type="button" class="btn btn-light" id="edit">
		                           						EDIT
		                       						</button>
													&nbsp;&nbsp;
													<!-- <button type="button" class="btn btn-light" id="delete" abled onClick="goPage('delete')"> -->
													<button type="button" class="btn btn-primary" id="delete">
		                           						DELETE
		                       						</button>
	                       						</div>
	                       							</c:when>
	                       						</c:choose>
	                       						
											<!-- / 여기까지 권한 부여 해야함 -->
												<br><br>
	                                    	</div>
	                                        </footer>
	                                       	<!-- WIDGET GROUP -->
                                    </div>
                                </div>
                                </form>
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