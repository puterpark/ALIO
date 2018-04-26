<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-us">

<!-- head 부분 -->
<head>
	<%@ include file="/alio/fuse/alio_head.jsp" %>
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
			
			$("#insert").click(function() {
				$(".infoForm").attr("action","/info");
				$("#action").attr("value","insert");
				$(".infoForm").submit();
			});
			
			$("#update").click(function() {
				$(".infoForm").attr("action","/info");
				$("#action").attr("value","update");
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
                                    <!-- 인포타입 서브메뉴 -->
						            	<%@ include file="/alio/fuse/alio_nav_sub.jsp" %>
						            <!-- / 인포타입 서브메뉴 -->
                                </ul>

                                <div class="tab-content">

                               		<div class="tab-pane fade show active" id="basic-info-tab-pane" role="tabpanel" aria-labelledby="basic-info-tab">

                                    	<div class="card p-6">
											
											<!-- form 정의 -->
                                        	<form class="infoForm" name="infoForm" method="post">
												
												<input type="hidden" name="action" id="action">
												<input type="hidden" name="iseq" value="${LVL_IVO.iseq}">
												<input type="hidden" name="gseq" value="${LVL_GVO.gseq}">
												<input type="hidden" name="itseq" value="${LVL_ITSEQ}">
	                                            <c:choose>
	                                            	<c:when test="${LVL_IVO == null}">
			                                            <div class="form-group">
		                                                	<input type="text" class="form-control" name="ititle" aria-describedby="btitle" value="/alio/images/게임파일명/인포타입파일명/파일명.확장자"/>
		                                                	<label>제목</label>
		                                                	
		                                            	</div>
														
		                                            	<div class="form-group">
			                                                <textarea class="form-control" name="ibody" aria-describedby="bbody" rows="10">
<span class="username"><h3 class="font-weight-bold">TITLE</h3></span>
</div></div></div></div></header><div class="content">
<div class="message py-2 px-4"></div><div class="post-media py-2 px-4">
<img class="media-img" src="
/alio/images/게임파일명/인포타입파일명/파일명.확장자
" style="max-width:100%;"></textarea>
		                                                	<label>내용</label>
		                                            	</div>
													</c:when>
													<c:otherwise>
													<div class="form-group">
		                                                	<input type="text" class="form-control" name="ititle" aria-describedby="btitle" value="${LVL_IVO.ititle}"/>
		                                                	<label>제목</label>
		                                                	
		                                            	</div>
														
		                                            	<div class="form-group">
			                                                <textarea class="form-control" name="ibody" aria-describedby="bbody" rows="10">${LVL_IVO.ibody}</textarea>
		                                                	<label>내용</label>
		                                            	</div>
													</c:otherwise>
												</c:choose>
                                            	
                                            	<div style="text-align: center; padding: 15px">
                                            	<c:choose>
	                                            	<c:when test="${LVL_IVO == null}">
													<!-- <button type="button" class="btn btn-light" abled onClick="goInfo('insert')"> -->
													<button type="button" class="btn btn-light" id="insert">
	                              						SAVE
	                           						</button>
	                           						</c:when>
	                           						<c:otherwise>
	                           						<!-- <button type="button" class="btn btn-light" abled onClick="goInfo('update')"> -->
	                           						<button type="button" class="btn btn-light" id="update">
	                              						SAVE
	                           						</button>
	                           						</c:otherwise>
	                           					</c:choose>
	                           						&nbsp;
	                           						<button type="button" class="btn btn-light" abled onClick="javascript:history.back()" >
		                              					BACK
	                           						</button>
                           						</div>
                                        	</form>
                                    	</div>
                                	</div>
                           		</div>
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