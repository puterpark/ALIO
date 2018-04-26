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
                                        <!-- <span class="h2">alio</span> -->
                                        <span class="logo-text"><img src="/alio/images/logo/alio_logo.png" style="width:115px"></span>
                                    </div>

                                </div>
                            </div>
                            <!-- / HEADER -->

                            <!-- CONTENT -->
                            <div class="page-content">

                                <div class="tab-content">
                                    <div class="tab-pane fade show active p-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab">

                                        <!-- WIDGET GROUP -->
                                        <div class="widget-group row no-gutters">

                                            <!-- WIDGET 1 -->
                                            <!-- <div class="col-12 col-sm-4 col-xl-4 p-3" >

                                                <div class="widget widget1 card" style="background-image: url('/alio/images/maple.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">

                                                    <div class="widget-header pl-4 pr-2 row no-gutters align-items-center justify-content-between" style="visibility: hidden;">

                                                        <div class="col">

                                                        </div>

                                                    </div>

                                                    <div class="widget-content pt-2 pb-8 d-flex flex-column align-items-center justify-content-center">

                                                        <div class="title text-secondary" style="visibility: hidden;">test</div>

                                                        <div class="sub-title h6 text-muted" style="visibility: hidden;">test</div>

                                                    </div>

                                                    <div class="widget-footer p-4 bg-dark row no-gutters align-items-center justify-content-center" style="opacity: 0.8;">

                                                        <span class="text-mute" style="color: #FFFFFF; font-size:1.5em;"><b>메이플스토리</b></span>

                                                    </div>
                                                </div>
                                            </div>
                                            / WIDGET 1

                                           WIDGET 1
                                            <div class="col-12 col-sm-4 col-xl-4 p-3" >

                                                <div class="widget widget1 card" style="background-image: url('/alio/images/pubg.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">

                                                    <div class="widget-header pl-4 pr-2 row no-gutters align-items-center justify-content-between" style="visibility: hidden;">

                                                        <div class="col">

                                                        </div>

                                                    </div>

                                                    <div class="widget-content pt-2 pb-8 d-flex flex-column align-items-center justify-content-center">

                                                        <div class="title text-secondary" style="visibility: hidden;">test</div>

                                                        <div class="sub-title h6 text-muted" style="visibility: hidden;">test</div>

                                                    </div>

                                                    <div class="widget-footer p-4 bg-dark row no-gutters align-items-center justify-content-center" style="opacity: 0.8;">

                                                        <span class="text-mute" style="color: #FFFFFF; font-size:1.5em;"><b>모르는 자들의 싸움터</b></span>

                                                    </div>
                                                </div>
                                            </div>
                                            / WIDGET 1

                                            WIDGET 1
                                            <div class="col-12 col-sm-4 col-xl-4 p-3" >

                                                <div class="widget widget1 card" style="background-image: url('/alio/images/hs.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">

                                                    <div class="widget-header pl-4 pr-2 row no-gutters align-items-center justify-content-between" style="visibility: hidden;">

                                                        <div class="col">

                                                        </div>

                                                    </div>

                                                    <div class="widget-content pt-2 pb-8 d-flex flex-column align-items-center justify-content-center">

                                                        <div class="title text-secondary" style="visibility: hidden;">test</div>

                                                        <div class="sub-title h6 text-muted" style="visibility: hidden;">test</div>

                                                    </div>

                                                    <div class="widget-footer p-4 bg-dark row no-gutters align-items-center justify-content-center" style="opacity: 0.8;">

                                                        <span class="text-mute" style="color: #FFFFFF; font-size:1.5em;"><b>귀환석</b></span>

                                                    </div>
                                                </div>
                                            </div>
                                            / WIDGET 1

                                            WIDGET 1
                                            <div class="col-12 col-sm-4 col-xl-4 p-3" >

                                                <div class="widget widget1 card" style="background-image: url('/alio/images/dbd.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">

                                                    <div class="widget-header pl-4 pr-2 row no-gutters align-items-center justify-content-between" style="visibility: hidden;">

                                                        <div class="col">

                                                        </div>

                                                    </div>

                                                    <div class="widget-content pt-2 pb-8 d-flex flex-column align-items-center justify-content-center">

                                                        <div class="title text-secondary" style="visibility: hidden;">test</div>

                                                        <div class="sub-title h6 text-muted" style="visibility: hidden;">test</div>

                                                    </div>

                                                    <div class="widget-footer p-4 bg-dark row no-gutters align-items-center justify-content-center" style="opacity: 0.8;">

                                                        <span class="text-mute" style="color: #FFFFFF; font-size:1.5em;"><b>죽으면 끝</b></span>

                                                    </div>
                                                </div>
                                            </div> -->
                                            <!-- / WIDGET 1 -->

                                            <!-- WIDGET 1 -->
												<c:forEach items="${LVL_GLIST}" var="gvo">
                                            <div class="col-12 col-sm-4 col-xl-4 p-3" >
                                                <div class="widget widget1 card" style="background-image: url('/alio/images/${gvo.gseq}.jpg'); background-repeat: no-repeat; cursor: pointer;
                                                 background-size: cover; background-position: center center;"
                                                 onclick="location.href='/infotype?gseq=${gvo.gseq}'">

                                                    <div class="widget-header pl-4 pr-2 row no-gutters align-items-center justify-content-between" style="visibility: hidden;">

                                                        <div class="col">

                                                        </div>

                                                    </div>

                                                    <div class="widget-content pt-2 pb-8 d-flex flex-column align-items-center justify-content-center">

                                                        <div class="title text-secondary" style="visibility: hidden;">test</div>

                                                        <div class="sub-title h6 text-muted" style="visibility: hidden;">test</div>

                                                    </div>

                                                    <div class="widget-footer p-4 bg-dark row no-gutters align-items-center justify-content-center" style="opacity: 0.8;">

                                                        <span class="text-mute" style="color: #FFFFFF; font-size:1.5em;"><b>${gvo.gtitle}</b></span>

                                                    </div>
                                                </div>
                                            </div>
                                                </c:forEach>
                                            <!-- / WIDGET 1 -->

                                        <!-- / WIDGET GROUP -->
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