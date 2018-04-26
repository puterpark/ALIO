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
			
		$("#update").click(function() {
			$(".editform").attr("action","/bod");
			$("#action").attr("value","update");
			$(".editform").submit();
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
									<!-- 보드타입 서브메뉴 -->
						            	<%@ include file="/alio/fuse/alio_nav_sub.jsp" %>
						            <!-- /보드타입 서브메뉴 -->
                                </ul>
								
                                <div class="tab-content">
                                    <div class="tab-pane fade show active p-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab">
	
                                            <div class="content">
												<div class="card p-6">
											
		                                        	<form class="editform" method="post">
		                                        	<input type="hidden" name="action" value="edit">
                                        			<input type="hidden" name="gseq" value="${LVL_GVO.gseq}">
                                        			<input type="hidden" name="btseq" value="${LVL_BTSEQ}">
                                        			<input type="hidden" name="cseq" value="${LVL_SESS_CSEQ}">
                                        			<input type="hidden" name="bseq" value="${LVL_WVO.bvo.bseq}">
			                                            <div class="form-group">
		                                                	<input type="text" class="form-control" aria-describedby="btitle" name="btitle" value="${LVL_WVO.bvo.btitle}" required>
		                                                	<label>제목</label>
		                                            	</div>
		
		                                            	<div class="form-group">
			                                                <textarea class="form-control" aria-describedby="bbody" name="bbody" rows="10" required>${LVL_WVO.bvo.bbody}</textarea>
		                                                	<label>내용</label>
		                                            	</div>
		                                            	
		                                            	<div style="text-align: center; padding: 15px">
		                                           
															<button type="submit" class="btn btn-light" id="update">
			                              						SAVE
			                           						</button>
			                           						&nbsp;
			                           						<button type="button" class="btn btn-primary" abled onClick="javascript:history.back()" >
				                              					BACK
			                           						</button>
			                           		
		                           						</div>
		                                        	</form>
                                    			</div>
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