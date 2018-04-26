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
function goPage(prm){
	if(typeform.cpw.value == "") {
		typeform.cpw.focus();
	} else if(typeform.cphone.value == "") {
		typeform.cphone.focus();
	} else {
		typeform.action.value = prm; //파라미터로 들어오는 구분 값
		typeform.submit();
	}
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
                            <h2 class="doc-title" id="content">프로필</h2>
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
                                                    <h5>프로필 수정</h5>
                                                </div>
                                                <div style="margin-left:auto; padding-left:24px;">
                                                    <div style="display: inline-block;">
                                                		<button type="button" class="btn btn-light" abled onClick="javascript:history.back()" >BACK</button>
                                               		</div>
                                               	</div>
                                            </div>

                                            <div class="source-preview-wrapper">
                                                <div class="preview">
                                                    <div class="preview-elements">
                                                        <form class="typeform" name="typeform" action="/crewservlet" method="post">
                                                        <input type="hidden" name="action">
                                                        	<div class="form-group">
                                                        		<small id="emailHelp" class="form-text text-muted">아이디</small>
                                                                ${LVL_CVO.cid}
                                                            </div>
                                                            <div class="form-group">
                                                        		<small id="emailHelp" class="form-text text-muted" >이름</small>
                                                                ${LVL_CVO.cname}
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="password" class="form-control" id="cpw" name="cpw" placeholder="Password" required/>
                                                                <label for="exampleInputPassword1">비밀번호</label>
                                                            </div>
                                                        	<div class="form-group">
                                                                <input type="text" class="form-control" id="cphone" name="cphone" aria-describedby="emailHelp" placeholder="Phone(000-0000-0000)" value="${LVL_CVO.cphone}" required/>
                                                                <label for="exampleInputEmail1">Phone</label>
                                                            </div>
                                                            
                                                            
                                                            <div align="center">
                                                            	<input type="hidden" name="cseq" value="${LVL_CVO.cseq}">
                                                            	<div style="display: inline-block; margin: 0 auto;">
		                                                            <button type="submit" class="btn btn-light" onClick="goPage('userupdate')">SAVE</button>
																	<!-- <button type="submit" class="btn btn-primary" onClick="goPage('leave')">LEAVE</button> -->
																	<button type="button" id="modelOpenBtn" class="btn btn-primary" data-toggle="modal">
																	    LEAVE
																	</button>
																	
																	
                                                            	</div>
	                                                        </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                  
									
									<!-- 회원탈퇴 확인 모달 -->	
									<div style="display: none;"  id="modalLeaveBefore" class="modal fade" tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
										    <div class="modal-dialog" role="document">
										        <div class="modal-content">
										            <div class="modal-header">
										                <h5 class="modal-title" id="exampleModalLiveLabel">탈퇴 확인</h5>
										                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										                    <span aria-hidden="true">×</span>
										                </button>
										            </div>
										           
										            		<div class="modal-body">
										               		<p>정말 탈퇴하시겠습니까?</p>
										            		</div>
										           			<div class="modal-footer"> 
										                		<button type="button" id="ok" class="btn btn-primary">Yes</button>
										               		 	<button type="button" id="cancel" class="btn btn-secondary" data-dismiss="modal">No</button>
										            		</div>
										            
										        </div>
										    </div>
										</div>
										
										<!-- 비밀번호 과련 에러 모달 -->
										<div style="display: none;"  id="modalError" class="modal fade" tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
										    <div class="modal-dialog" role="document">
										        <div class="modal-content">
										            <div class="modal-header">
										                <h5 class="modal-title" id="exampleModalLiveLabel">탈퇴 확인</h5>
										                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										                    <span aria-hidden="true">×</span>
										                </button>
										            </div>
										            		<div class="modal-body">
										               		<font style="color:red;"><b>비밀번호를 확인해주세요.</b></font>
										            		</div>
										           			<div class="modal-footer">
										               		 	<button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
										            		</div>
										        </div>
										    </div>
										</div>
									
											<script>
											//-----------------------------
											//LEAVE 버튼 클릭 시
											//-----------------------------
											$("#modelOpenBtn").click(function() {
												if($("#cpw").val() == "") {
													$("#modalError").modal();	//비번에러 모달
													//$("#cpw").focus();
													 $('input:visible:enabled:first', this).focus();
													 
												} else {
													$("#modalLeaveBefore").modal();	//탈퇴확인 모달
												}
											});
											
											
											//-----------------------------
											//모달에서 탈퇴(ok)버튼 클릭 시
											//-----------------------------
											$("#ok").click(function() {
												//기존에 오픈된 모달 닫기
												$("#modalLeaveBefore").modal('hide');
												
												//회원탈퇴처리
												$.ajax({
														url:"/crewservlet?action=leaveForAjax",
														type:"post",
														data : "cseq=${LVL_CVO.cseq}&cpw="+$("#cpw").val(), 
														success:function(result){
															console.log(result);
															if(result <=0) {	
																$("#modalError").modal();	//탈퇴시  DB 정상 삭제가 안 된 경우: 비번에러 모달
																//$("#cpw").focus();
															} else {
																location.href="/login";		//정상삭제: 로그인으로 이동
															}
														},
														error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
															console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
															$("#modalError").modal();
														}
													});
											});
										</script>
                                    <!-- / FORM CONTROLS -->
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