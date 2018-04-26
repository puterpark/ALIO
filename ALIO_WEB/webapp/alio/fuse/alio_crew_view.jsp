<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-us">

<!-- head 부분 -->
<head>
	<%@ include file="/alio/fuse/alio_head.jsp" %>
</head>
<script>
	$(function(){

	var ctype = "${LVL_CVO.ctype}";
	
	$("input:radio[name=optionsRadios]:input[value="+ctype+"]").attr("checked",true);
	});

	function goPage(prm) {
		typeform.action.value = prm;
		typeform.submit();
	}
</script>
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

                                    <!-- FORM CONTROLS -->
                                    <div class="col-12 col-md-6" style="display: inline-block; margin: 0 auto;">
                                        <div class="example">
                                            <div class="description">
                                                <div class="description-text">
                                                    <h5>회원 등급 수정</h5>
                                                </div>
                                                <div style="margin-left:auto; padding-left:24px;">
                                                    <div style="display: inline-block;">
                                                		<button type="button" class="btn btn-light" abled onClick="javascript:history.back()">BACK</button>
                                               		</div>
                                               	</div>
                                            </div>
                                            

                                            <div class="source-preview-wrapper">
                                                <div class="preview">
                                                    <div class="preview-elements">
                                                        <form name="typeform" action="/crewservlet" method="post">
                                                        <input type="hidden" name="action">
                                                            <div class="form-group">
                                                                <small id="emailHelp" class="form-text text-muted">아이디</small>
                                                                ${LVL_CVO.cid}
                                                            </div>
                                                            <div class="form-group">
                                                                <small id="emailHelp" class="form-text text-muted">이름</small>
                                                                ${LVL_CVO.cname}
                                                            </div>
                                                            <fieldset class="form-group">
                                                                <small id="emailHelp" class="form-text text-muted" style="padding-bottom: 5px;">등급</small>
                                                                <div class="form-check" style="display: inline-block;">
                                                                    <label class="form-check-label">
                                                                        <input type="radio" class="form-check-input" name="ctype" id='a' value='a' <c:if test="${LVL_CVO.ctype=='a'}">checked</c:if>/>
                                                                        <span class="radio-icon"></span>
                                                                        <span>admin</span>
                                                                    </label>
                                                                </div>
                                                                &nbsp;&nbsp;&nbsp;
                                                                <div class="form-check" style="display: inline-block;">
                                                                    <label class="form-check-label">
                                                                        <input type="radio" class="form-check-input" name="ctype" id='e' value='e' <c:if test="${LVL_CVO.ctype=='e'}">checked</c:if>/>
                                                                        <span class="radio-icon"></span>
                                                                        <span>editor</span>
                                                                    </label>
                                                                </div>
                                                                &nbsp;&nbsp;&nbsp;
                                                                <div class="form-check" style="display: inline-block;">
                                                                    <label class="form-check-label">
                                                                        <input type="radio" class="form-check-input" name="ctype" id='u' value='u' <c:if test="${LVL_CVO.ctype=='u'}">checked</c:if>/>
                                                                        <span class="radio-icon"></span>
                                                                        <span>user</span>
                                                                    </label>
                                                                </div>
                                                            </fieldset>
                                                            <div>
                                                            	<input type="hidden" name="cseq" value="${LVL_CVO.cseq}">
                                                            	<div align="center">
		                                                            <button type="submit" class="btn btn-light" onClick="goPage('adminupdate')">SAVE</button>
	                                                            	<button type="button" class="btn btn-primary" onClick="goPage('delete')">DELETE</button>
                                                            	</div>
	                                                        </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- / FORM CONTROLS -->
                                </div>
                            </div>
                        </div>
                        <!-- CONTENT -->

                    </div>

                </div>
            </div>
    </main>
</body>

</html>