<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
											
											<%--<c:forEach items="${LVL_WVO_LIST}" var="wvo">--%>
											<%-- style="background-image: url('${wvo.ivo.ititle}'); --%>
											<!-- WIDGET 1 -->
											<c:forEach items="${LVL_WVO_LIST}" var="wvo">
											<div class="col-12 col-sm-3 col-xl-3 p-3" >
												
								
                                                 <!--  style="background-image: url('/alio/images/maple/nightlord.jpg');-->
                                                <div class="widget widget1 card" id="viewdiv"
                                                 style="background-image: url('${wvo.ivo.ititle}');
                                                 background-repeat: no-repeat; background-size: cover; background-position: center center; cursor: pointer;"
                                                 onclick="location.href='/info?action=view&iseq=${wvo.ivo.iseq}&gseq=${LVL_GVO.gseq}&itseq=${LVL_ITSEQ}'">

                                                    <div class="widget-header pl-4 pr-2 row no-gutters align-items-center justify-content-between" style="visibility: hidden;">

                                                        <div class="col">
                                                        
                                                        </div>

                                                    </div>

                                                    <div class="widget-content pt-2 pb-8 d-flex flex-column align-items-center justify-content-center">

                                                        <div class="title text-secondary" style="visibility: hidden;">히든</div>

                                                        <div class="sub-title h6 text-muted" style="visibility: hidden;">히든</div>

                                                    </div>

                                                    <div class="widget-footer p-4 bg-dark row no-gutters align-items-center justify-content-center" style="opacity: 0;">

                                                        <span class="text-mute" style="color: #FFFFFF; font-size:1.5em; visibility: hidden;"><b>히든</b></span>
														
                                                    </div>
                                                </div>
                                            </div>
												</c:forEach>
											<!-- / WIDGET 1 -->
											<%--</c:forEach>--%>
										<!-- / WIDGET GROUP -->
                                    </div>
                                    <!-- POST 부분 - 어드민/에디터 전용 -->
                                     <c:choose>
	                                 	<c:when test="${LVL_SESS_CTYPE == 'e' || LVL_SESS_CTYPE == 'a'}">
                                    <div style="text-align: center; padding: 20px">
										<button type="button" class="btn btn-light" abled onClick="location.href='/info?action=input&gseq=${LVL_GVO.gseq}&itseq=${LVL_ITSEQ}'">
                       						POST
                   						</button>
               						</div>
               							</c:when>
               						</c:choose>
                                    <!-- / POST 부분 -->
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