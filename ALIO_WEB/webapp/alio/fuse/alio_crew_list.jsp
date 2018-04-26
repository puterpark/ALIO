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

                    <div class="doc data-table-doc page-layout simple full-width">

                        <!-- HEADER -->
                        <div class="page-header bg-secondary text-auto p-6 pt-4 pb-0 align-items-center justify-content-between">
                            <h2 class="doc-title" id="content">회원 관리</h2>
                        </div>

                        <!-- / HEADER -->

                        <!-- CONTENT -->
                        <div class="page-content p-6">
                            <div class="content container">
                                <div class="row">

                                    <div class="col-12">
                                        <div class="example ">

                                            <div class="description">
                                                <div class="description-text">

                                                    <h3>회원 목록</h3>

                                                </div>
                                            </div>

                                            <div class="source-preview-wrapper">
                                                <div class="preview">
                                                    <div class="preview-elements">

                                                        <table id="sample-data-table" class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th class="secondary-text">
                                                                        <div class="table-header">
                                                                            <span class="column-title">회원 번호</span>
                                                                        </div>
                                                                    </th>
                                                                    <th class="secondary-text">
                                                                        <div class="table-header">
                                                                            <span class="column-title">아이디</span>
                                                                        </div>
                                                                    </th>
                                                                    <th class="secondary-text">
                                                                        <div class="table-header">
                                                                            <span class="column-title">이름</span>
                                                                        </div>
                                                                    </th>
                                                                    <th class="secondary-text">
                                                                        <div class="table-header">
                                                                            <span class="column-title">등급</span>
                                                                        </div>
                                                                    </th>
                                                                    <th class="secondary-text">
                                                                        <div class="table-header">
                                                                            <span class="column-title">가입날짜</span>
                                                                        </div>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
																<!-- 아이디를 누르면 crew_view.jsp로 가도록 해주세요 -->
                                                                
																<c:forEach items="${LVL_CLIST}" var="cvo">
																	<tr>
																		<td>${cvo.cseq}</td>
																		<td><a href="/crewservlet?action=edit&cseq=${cvo.cseq}">
																			${cvo.cid}</a></td>
																		<td>${cvo.cname}</td>
																		<td>
																			<c:choose>
																				<c:when test="${cvo.ctype=='a'}">
																					admin
																				</c:when>
																				
																				<c:when test="${cvo.ctype=='e'}">
																					editor
																				</c:when>
																				
																				<c:otherwise>
																					user
																				</c:otherwise>
																			</c:choose>
																		</td>
																		<td>${cvo.cregdate}</td>
																	</tr>
																	
																</c:forEach>
														</tbody>
													</table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- CONTENT -->
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>

</html>