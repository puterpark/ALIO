<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-us">

<!-- head 부분 -->
<head>
	<%@ include file="/alio/fuse/alio_head.jsp" %>

<script>
	$(function() {
		//er
		//$("#leftgamelist > div > div > div").on("click", function(event) {
		$(document).on("click",".customdiv",function(event){  
				var name = event.target.id;
				console.log(name);
				
				if((name != null) || (name != 0)) {
					var viewid = "chat-view" + name;
					console.log(viewid);
					 changeView("#chat-content-views", "#"+viewid); 
				}
		});
		
		//er
		//$(".back-to-chats-button${g.gseq}").on("click", function() {
		$(document).on("click",".back-to-chats-button${g.gseq}",function(){
			changeView("#chat-left-sidebar-views", "#chats-view");
		});
		
		function changeView(wrapper, view) {
			var wrapper = $(wrapper);
			wrapper.find(".view").removeClass("d-none d-flex");
			wrapper.find(".view").not(view).addClass("d-none");
			wrapper.find(view).addClass("d-flex");
		}
	

		//$(".message").on("click", function(){
		$(document).on("click",".btnz",function(){  
			var jbSplit = $(this).attr("id").split('-');
			var gseq = jbSplit[1];
	   		/* alert(gseq); */
	   		if($("#"+"gameedit-"+gseq).text() == "EDIT") {
		   		var vv =  "gameeditable"+gseq;
		   		console.log(vv +"," + $("#"+vv).text());
	   		
		   	  	$("#"+"gameeditable"+gseq).attr("contenteditable", "true").focus();
				$("#"+"gameedit-"+gseq).empty();
				$("#"+"gameedit-"+gseq).append("SAVE");
				//$("#"+rseq).attr("id", "replysave"+rseq);
	   		} else {
				editSend(gseq);
	   		}
			
		});
		
		function editSend(gseq) {
			
			var gseqVal = gseq;
			var gtitleVal = $("#"+"gameeditable"+gseq).text();
			
			var jsonObjectData = {"gseq": gseqVal, "gtitle": gtitleVal};
			$.ajax({
					url:"/ga?action=gameeditForAjax",
					//dataType:"json",
					data:{"MYKEY": JSON.stringify(jsonObjectData) },
					type:"post",
					dataType:"json",
					success:function(result) {
						console.log(result);
	
						if(result == 1) {
							$("#"+"gameeditable"+gseq).text(gtitleVal);
						} 
						
						$("#"+"gameeditable"+gseq).attr("contenteditable", "false");
						$("#"+"gameedit-"+gseq).empty();
						$("#"+"gameedit-"+gseq).append("EDIT");
						
	
						//[{…}, {…}, {…}, {…}, {…}, {…}]
						/*var htmlStr="";
						$.each(result, function(i, v){
							htmlStr+= "<div class=\"chat-list"+v.gseq+"\">";						
							htmlStr+= "<div class=\"contact"+v.gseq+" ripple flex-wrap flex-sm-nowrap row p-4 no-gutters align-items-center unread\"  id=\""+v.gseq+"\">";

							htmlStr+= "<div class=\"col-auto avatar-wrapper\" style=\"visibility: hidden;\" id=\""+v.gseq+"\">";
							htmlStr+= "<img src=\"/alio/assets/images/avatars/Barrera.jpg\" class=\"avatar\" alt=\"Barrera\" />";
							htmlStr+= "<i class=\"icon- status do-not-disturb s-4\"></i>";
							htmlStr+= "</div>";
							htmlStr+= "<div style=\"cursor:pointer\" class=\"col px-4 customdiv\" id=\""+v.gseq+"\">";
							htmlStr+= "<span class=\"name h5\" id=\""+v.gseq+"\">"+v.gtitle+"</span>";
							htmlStr+= "</div>";
							htmlStr+= "</div>";
							htmlStr+= "<div class=\"divider\"></div>";
							htmlStr+= "</div>"
						});*/
	
					}
			});
		}
		
		
		// 아C발작스 인서트

		$("#ins").on("click", function(){
			var gtitle = $("#gins").val();
			/* alert(gtitle); */
			
			$.ajax({
				url : "/ga?action=insert",
				//async: false,
				data : {"gtitle": gtitle},
				type : "post",
				success:function(res){
					var obj = JSON.parse(res);
					var htmlStr="";
					var htmlStr1="";
					//htmlStr+= "<div id=\"leftgamelist\" class=\"content col custom-scrollbar\">";
					htmlStr+= "<div class=\"content col custom-scrollbar\"  id=\"ggglist\">";
				
					$.each(obj, function(i, v){
						htmlStr+= "<div class=\"chat-list"+v.gseq+"\">";						
						htmlStr+= "<div class=\"contact"+v.gseq+" ripple flex-wrap flex-sm-nowrap row p-4 no-gutters align-items-center unread\"  id=\""+v.gseq+"\">";

						htmlStr+= "<div class=\"col-auto avatar-wrapper\" style=\"visibility: hidden;\" id=\""+v.gseq+"\">";
						htmlStr+= "<img src=\"/alio/assets/images/avatars/Barrera.jpg\" class=\"avatar\" alt=\"Barrera\" />";
						htmlStr+= "<i class=\"icon- status do-not-disturb s-4\"></i>";
						htmlStr+= "</div>";
						htmlStr+= "<div style=\"cursor:pointer\" class=\"col px-4 customdiv\" id=\""+v.gseq+"\">";
						htmlStr+= "<span class=\"name h5\" id=\""+v.gseq+"\">"+v.gtitle+"</span>";
						htmlStr+= "</div>";
						htmlStr+= "</div>";
						htmlStr+= "<div class=\"divider\"></div>";
						htmlStr+= "</div>"
					});
					htmlStr+= "</div>"
					
					//htmlStr+= "</div>"
					console.log(htmlStr);
					$("#leftgamelist").html(htmlStr);
				},
				complete:function(res){
					location.reload();
				}
			});
		});
		
		
		// itnmae 수정
		$(document).on("click",".infotype",function(){  
			var jbSplit = $(this).attr("id").split('-');
			var itseq = jbSplit[1];
	   		/* alert(itseq); */
	   		if($("#"+"edit-"+itseq).text() == "EDIT") {
		   		var vv =  "editable"+itseq;
		   		console.log(vv +"," + $("#"+vv).text());
	   		
		   	  	$("#"+"editable"+itseq).attr("contenteditable", "true").focus();
				$("#"+"edit-"+itseq).empty();
				$("#"+"edit-"+itseq).append("SAVE");
				//$("#"+rseq).attr("id", "replysave"+rseq);
	   		} else {
				editSender(itseq);
	   		}
			
		});
		
		function editSender(itseq) {
			
			var itseqVal = itseq;
			var itnameVal = $("#"+"editable"+itseq).text();
			
			var jsonObjectData = {"itseq": itseqVal, "itname": itnameVal};
			$.ajax({
					url:"/ga?action=infotypeeditForAjax",
					//dataType:"json",
					data:{"MYKEY": JSON.stringify(jsonObjectData) },
					type:"post",
					dataType:"json",
					success:function(result) {
						console.log(result);
	
						var htmlStr="";
						if(result == 1) {
							$("#"+"editable"+itseq).text(itnameVal);
						} 
						
						$("#"+"editable"+itseq).attr("contenteditable", "false");
						$("#"+"edit-"+itseq).empty();
						$("#"+"edit-"+itseq).append("EDIT");
						
	
						//[{…}, {…}, {…}, {…}, {…}, {…}]
						/*var htmlStr="";
						$.each(result, function(i, v){
							htmlStr+= "<div class=\"chat-list"+v.gseq+"\">";						
							htmlStr+= "<div class=\"contact"+v.gseq+" ripple flex-wrap flex-sm-nowrap row p-4 no-gutters align-items-center unread\"  id=\""+v.gseq+"\">";

							htmlStr+= "<div class=\"col-auto avatar-wrapper\" style=\"visibility: hidden;\" id=\""+v.gseq+"\">";
							htmlStr+= "<img src=\"/alio/assets/images/avatars/Barrera.jpg\" class=\"avatar\" alt=\"Barrera\" />";
							htmlStr+= "<i class=\"icon- status do-not-disturb s-4\"></i>";
							htmlStr+= "</div>";
							htmlStr+= "<div style=\"cursor:pointer\" class=\"col px-4 customdiv\" id=\""+v.gseq+"\">";
							htmlStr+= "<span class=\"name h5\" id=\""+v.gseq+"\">"+v.gtitle+"</span>";
							htmlStr+= "</div>";
							htmlStr+= "</div>";
							htmlStr+= "<div class=\"divider\"></div>";
							htmlStr+= "</div>"
						});*/
	
					}
			});
		}
		
	
		
		

		
		
});//레디 잡음


</script>

<script>
$(function() {
	   //$(document).on("click",".add-button-event",function(event){ 
	   $(".add-button-event").on("click", function(){
		   
			var btnId = $(this).attr("id"); 			//btn-${g.gseq}
			var tempArr = btnId.split("-");
			var gseqData = tempArr[1];					//${g.gseq}
			var inputData = $("#aa"+tempArr[1]).val();  //object --> #aa${g.gseq}
			/* alert(gseqData +"," + inputData); */
		   
			var data = new Object();
			data.itname = $("#aa"+tempArr[1]).val();
			data.gseq = tempArr[1];
			
			var jsonData = JSON.stringify(data); 
		
		$.ajax({
			url : "/ga?action=gameinsert",
			//async: false,
			data : {"CVAL": jsonData},
			type : "post",
			dataType:"json",
			success:function(rs){
				console.log("석세스");
				var htmlStr="";
						htmlStr+= "<div class=\"row no-gutters align-items-center\">";
				$.each(rs, function(i, itvo){
					if(gseqData == itvo.gseq) {
						htmlStr+= "<div style=\"visibility:hidden;\">히든</div>";
						htmlStr+= "<div class><h2 class=\"title font-weight-bold\">";
						htmlStr+= ""+itvo.itname+"";
						htmlStr+= "</h2></div>";
						htmlStr+= "<div style=\"visibility:hidden;\">히든</div>";
						htmlStr+= "<div><hr></div>";
					}						
				});
				htmlStr+= "</div>";
	
				console.log(htmlStr);
				$("#bodtype").html(htmlStr);
				
			},
			complete:function(rs){
			//location.reload();
			} 
		});
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
                
                <div class="content custom-scrollbar">

                    <div id="chat" class="page-layout carded full-width">

                        <div class="top-bg bg-secondary"></div>

                        <!-- CONTENT -->
                        <div class="page-content-wrapper w-100 mx-auto px-0 pt-0 pt-sm-4 px-sm-4 pt-sm-8">

                            <div class="page-content-card">

                                <aside class="left-sidebar" data-fuse-bar="chat-left-sidebar" data-fuse-bar-media-step="lg">

                                    <div id="chat-left-sidebar-views" class="views">

                                        <div id="chats-view" class="view d-flex flex-column no-gutters">
                                            <!-- CHATS TOOLBAR -->
                                            <div class="toolbar">

                                                <!-- TOOLBAR TOP -->
                                                <div class="toolbar-top row no-gutters align-items-center justify-content-between px-4">

                                                    <!-- USER AVATAR WRAPPER -->
                                                    <div><br>

                                                        <!-- USER AVATAR -->
                                                        <h4>게임 관리</h4>
                                                        <!-- / USER AVATAR -->

                                                    </div>
                                                    	<button type="button" class="btn btn-icon" onClick="location.href='/ga'">
	                                                        <span><i class="icon icon-autorenew s-8"></i></span>
                                                        </button>
                                                    <!-- / USER AVATAR -->
                                                </div>
                                                <!-- / TOOLBAR TOP -->

                                                <!-- TOOLBAR BOTTOM -->
												<form>
                                                <div class="toolbar-bottom row align-items-center no-gutters px-4">
                                                    <!-- 게임 추가 -->
                                                    <div class="md-elevation-1 row no-gutters align-items-center w-500 p-2" style="width:75%">
                                                        <input type="text" id="gins"placeholder="게임 추가" style="width:100%">
                                                    </div> 
                                                   	<!-- 게임 추가 --> 
                                                        &nbsp;<button type="button" class="btn btn-secondary" id="ins">추가</button>
                                                </div>
                                                </form>
                                                <!-- / TOOLBAR BOTTOM -->

                                            </div>
                                            <!-- / CHATS TOOLBAR -->

                                            <!-- CHATS CONTENT00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->
											<div id="leftgamelist" class="content col custom-scrollbar">
                                           		<div class="content col custom-scrollbar"  id="ggglist">
												
	                                                <!-- 게임 리스트-->
	                                                <c:forEach items="${LVL_GTLIST}" var="g">
													<div class="chat-list${g.gseq}">
															<div class="contact${g.gseq} ripple flex-wrap flex-sm-nowrap row p-4 no-gutters align-items-center unread" id="${g.gseq}">
																<div class="col-auto avatar-wrapper" style="visibility: hidden;" id="${g.gseq}">
																	<img src="/alio/assets/images/avatars/Barrera.jpg" class="avatar" alt="Barrera" /> 
																	<i class="icon- status do-not-disturb s-4"></i>
																</div>
	
																<div class="col px-4 customdiv" id="${g.gseq}">
																	<span class="name h5" id="${g.gseq}">${g.gtitle}</span>
																</div>
															</div>
															<div class="divider"></div>
													</div>
													</c:forEach>
                                               
                                            	</div>
											</div>
                                            <!-- / CHATS CONTENT -->
                                        </div>
                                    </div>
                                </aside>

                                <div class="page-content">

                                    <div id="chat-content-views" class="views">

                                        <!-- START -->
                                        <div id="start-view" class="view d-flex flex-column align-items-center justify-content-center">
                                            <span class="app-title h3 my-3">게임 관리</span>

                                            <span class="text-muted h6 d-none d-xl-block">왼쪽에서 게임 추가 후에, 오른쪽에서 공략 분류를 추가/수정해주세요.</span>
                                            
                                            <button type="button" class="btn btn-secondary d-block d-xl-none" data-fuse-bar-toggle="chat-left-sidebar">
                                                	왼쪽에서 게임 추가 후, 오른쪽에서 공략 분류를 추가/수정해주세요.
                                            </button>
                                        </div>
                                        <!-- / START -->
															
										<c:forEach items="${LVL_BTLIST}" var="bt">
											<c:set var = "btbtname" value = "${bt.btname}" />
											<c:set var = "btgseq" value = "${bt.gseq}" />
										</c:forEach>
															
										<c:forEach items="${LVL_GTLIST}" var="g">
                                        <!-- BodType -->
                                   <!-- 테스트용 -->
     
                                        <div id="chat-view${g.gseq}" class="view flex-column align-items-center justify-content-center d-none" id="r-toolbar">
                                            <!-- CHAT TOOLBAR -->
                                            <div class="toolbar row no-gutters align-items-center justify-content-between w-100 px-4">

                                                <div class="col">

                                                    <div class="row no-gutters align-items-center">

                                                        <!-- RESPONSIVE CHATS BUTTON-->
                                                        <button type="button" class="btn btn-icon" data-fuse-bar-toggle="chat-left-sidebar">
                                                            <i class="icon icon-gamepad s-8"></i>
                                                        </button>
                                                        <!-- / RESPONSIVE CHATS BUTTON-->

                                                        <!-- CHAT CONTACT-->
                                                        <div class="chat-contact row no-gutters align-items-center">
	
                                                            <div class="chat-contact-name" id="gameeditable${g.gseq}" value="gameeditable${g.gseq}" style="disply: inline-block; float:left;">
                                                              	${g.gtitle}
                                                            </div>
                                                            &nbsp;&nbsp;&nbsp;
                                                            <div class="message" style="disply: inline-block; float:right;">
                                                               	<button type="button" class="btn btn-light btn-sm btnz" id="gameedit-${g.gseq}" style="disply: inline-block; float:right;">EDIT</button>
                                                            </div>
                                                        </div>
                                                        <!-- / CHAT CONTACT-->
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- / CHAT TOOLBAR -->

                                            <!-- CHAT CONTENT -->
                                            <div class="content col custom-scrollbar">
                                            	<div> <br><br></div>
												<div class="row no-gutters align-items-center">
													<div class="col pl-4" id="bodtype">
														<!-- forEach돌릴 곳 -->
														<!-- c:forEach items="${LVL_ILIST}" var="i" -->
														
																<c:forEach items="${LVL_ILIST}" var="i">
																<c:choose>
																	<c:when test="${g.gseq == i.gseq}">
																		<div style="visibility:hidden;">히든</div>
					                                                    	<div><h2 class="title font-weight-bold" id="editable${i.itseq}" value="editable${i.itseq}">${i.itname}</h2></div>
																			<form>
					                                                            <div class="message" style="disply: inline-block;" >
						                                                               	&nbsp;
						                                                               	<button type="button" class="btn btn-light btn-sm infotype" id="edit-${i.itseq}" style="disply: inline-block; float:right;">EDIT</button>
					                                                            </div>
				                                                            </form>
																			<div><hr></div>
																	</c:when>
																	<c:otherwise>
																	</c:otherwise>
																</c:choose>
																</c:forEach>
															
														<!--  /c:forEach -->
														<!-- / forEach돌릴 곳 -->
                                                    </div>
	                                            </div>
                                            </div>
                                            <!-- / CHAT CONTENT -->

                                            <!-- CHAT FOOTER -->
                                            <div class="chat-footer row align-items-center justify-content-center w-100 p-2 pl-4">

                                                <!-- REPLY FORM -->
                                                <form class="reply-form row no-gutters align-items-center w-100">
													
                                                    <!-- <div class="form-group col mr-4">
                                                    	<input type="text" id="itname" placeholder="공략 분류 추가">
                                                    </div>

                                                    <button type="button" class="btn btn-secondary" aria-label="Send message">
                                                        	추가
                                                    </button> -->
                                                    <div style="padding-bottom: 25px">
	                                                    <button type="button" class="btn btn-secondary add-button-event" id="btn-${g.gseq}" aria-label="Send message">
	                                                        	추가
	                                                    </button>
													</div>
												    &nbsp;&nbsp;&nbsp;
                                                    <div class="form-group" style="width:50%">
												        <input type="text" class="form-control" id="aa${g.gseq}" placeholder="에디터 공략 분류">
												        <label class="form-control-label" for="formGroupExampleInput">에디터 공략 분류</label>
												    </div>
												    &nbsp;&nbsp;&nbsp;
												    <div style="padding-bottom: 25px">
                                                        <div style="float:right;">
															<c:choose>
																<c:when test="${btbtname == '첨부 게시판'}">
																	<button type="button" class="btn btn-secondary align-items-end" disabled>게시판 6종 추가</button>
																</c:when>
																<c:when test="${g.gseq == btgseq}">
                                                      		     	<button type="button" class="btn btn-secondary align-items-end" onClick="location.href='/ga?action=bodTypeInsert&gseq=${g.gseq}'" >게시판 6종 추가</button>
																</c:when>
																<c:otherwise>
																	<button type="button" class="btn btn-secondary align-items-end" disabled>게시판 6종 추가</button>
																</c:otherwise>
															</c:choose>
                                                        </div>
                                                   	</div>
                                                </form>
                                                <!-- / REPLY FORM -->
                                            </div>
                                            <!-- / CHAT FOOTER-->
                                        </div>
                                        <!-- / BodType -->
                                        </c:forEach>
                                        
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- / CONTENT -->
                    </div>

                    

                </div>
            </div>
        </div>
    </main>
</body>

</html>