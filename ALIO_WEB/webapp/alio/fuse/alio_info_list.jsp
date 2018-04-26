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
                                	<!-- 인포타입 서브메뉴 -->
						            	<%@ include file="/alio/fuse/alio_nav_sub.jsp" %>
						            <!-- / 인포타입 서브메뉴 -->
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade show active p-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab">

                                        <!-- WIDGET GROUP -->
                                        <div class="widget-group row no-gutters">

                                            <!-- WIDGET 1 -->
											<c:forEach items="${LVL_ITVO_LIST}" var="itvo">
                                            <div class="col-12 col-sm-12 col-xl-12 p-1" >

                                                <div class="widget widget1 card" style="background-image: url('/alio/images/ittype/it${itvo.itseq}.jpg'); background-color: #4d4d4d; background-repeat: no-repeat; background-size: cover; background-position: center center; cursor: pointer;">

                                                    <div class="widget-header pl-4 pr-2 row no-gutters align-items-center justify-content-between" style="visibility: hidden;">

                                                        <div class="col">

                                                        </div>

                                                    </div>
                                                    
                                                    <div class="widget-content pt-2 pb-8 d-flex flex-column align-items-start justify-content-center" onclick="location.href='/info?action=list&itseq=${itvo.itseq}&gseq=${LVL_GVO.gseq}'">

                                                        <div class="title text-light"> &emsp; ${itvo.itname} </div>

                                                        <div class="sub-title h6 text-light" style="visibility: hidden">스킬트리의 모든 것</div>
                                                    </div>
                                               </div>
                                            </div>
                                            </c:forEach>
                                         </div>
                                            <!-- / WIDGET 1 -->
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