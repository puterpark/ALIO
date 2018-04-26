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
		
		$("#delete").click(function() {
			$(".viewform").attr("action","/bod");
			$("#action").attr("value","delete");
			$(".viewform").submit();
		});
		
	});
	
	
	
	</script>
		
	<script>
	$(function(){
		//$(".message").on("click", function(){
		$(document).on("click",".btnz",function(){  
			var jbSplit = $(this).attr("id").split('-');
			var rseq = jbSplit[1];
	   		
	   		if($("#"+"edit-"+rseq).text() == "EDIT") {
		   		var vv =  "editable"+rseq;
		   		console.log(vv +"," + $("#"+vv).text());
	   		
		   	  	$("#"+"editable"+rseq).attr("contenteditable", "true").focus();
				$("#"+"edit-"+rseq).empty();
				$("#"+"edit-"+rseq).append("SAVE");
				//$("#"+rseq).attr("id", "replysave"+rseq);
	   		} else {
	   			var rseqVal = rseq;
	   			var rbodyVal = $("#"+"editable"+rseq).text();
	   			var jsonObjectData =   {"rseq": rseqVal, "rbody": rbodyVal};
	   			$.ajax({
	   					url:"/bod?action=editForAjax&gseq=${LVL_WVO.bvo.gseq}&btseq=${LVL_WVO.bvo.btseq}&bseq=${LVL_WVO.bvo.bseq}",
	   					//dataType:"json",
	   					data:{"MYKEY": JSON.stringify(jsonObjectData) },
	   					type:"post",
	   					dataType:"json",
	   					success:function(result) {
	   						console.log(result);
	
	   						if(result == 1) {
	   							$("#"+"editable"+rseq).text(rbodyVal);
	   						} 
	   						
	   						$("#"+"editable"+rseq).attr("contenteditable", "false");
	   						$("#"+"edit-"+rseq).empty();
	   						$("#"+"edit-"+rseq).append("EDIT");
	   						
	
	   						//[{…}, {…}, {…}, {…}, {…}, {…}]
	   						/* var htmlStr="";
	   						$.each(result, function(i,vo) {
	   							htmlStr += "<tr><td>"+vo.rseq+"</td><td>"+vo.rbody+"</td></tr>"
	   							//console.log(vo.rseq + "," + vo.rbody);
	   						});
	   						$("#div").html(htmlStr); */
	   					}
	   				});
	   		}
		
		});

	
	$(document).on("click",".btnd",function(){  
		var jbSplit = $(this).attr("id").split('-');
		var rseq = jbSplit[1];
   		
   		if($("#"+"del-"+rseq).text() == "DELETE") {
			//delSend(rseq);
			var rseqVal = rseq;
   			//alert(rseqVal + "ajax del call")
   			var jsonObjectData = {"rseq": rseqVal};
   			$.ajax({
   					url:"/bod?action=deleteForAjax&gseq=${LVL_WVO.bvo.gseq}&btseq=${LVL_WVO.bvo.btseq}&bseq=${LVL_WVO.bvo.bseq}&rseq=${LVL_WVO.rvo.rseq}",
   					data:{"MYKEY": JSON.stringify(jsonObjectData)},
   					type:"post",
   					dataType:"json",
   					success:function(result) {
   							//[{…}, {…}, {…}, {…}, {…}, {…}]
   							
   							var htmlStr="";
   							$.each(result, function(i,wvo) {
   								htmlStr+="<div class=\"row no-gutters align-items-center\">";
   								htmlStr+="<span class=\"username font-weight-bold mr-1\">"+wvo.cvo.cid+"</span>";
   								htmlStr+="<span class=\"time text-muted\">"+wvo.rvo.rregdate+"</span>";
   								htmlStr+="</div>";
   								htmlStr+="<form>";
   								htmlStr+="<div class=\"message\" style=\"disply: inline-block;\" >";
   								htmlStr+="<div id=\"editable"+wvo.rvo.rseq+"\" value=\"editable"+wvo.rvo.rseq+"\">"+wvo.rvo.rbody+"</div>";
   								if(("${LVL_SESS_CID}"==wvo.cvo.cid && ("${LVL_SESS_CTYPE}"=="u" || "${LVL_SESS_CTYPE}" == "e"))|| "${LVL_SESS_CTYPE}"=="a" ) {
	   								htmlStr+="<button type=\"button\" class=\"btn btn-primary btn-sm btnd\" id=\"del-"+wvo.rvo.rseq+"\" style=\"disply: inline-block; float:right;\">DELETE</button>";
	   								htmlStr+="&nbsp;";
	   								htmlStr+="<button type=\"button\" class=\"btn btn-light btn-sm btnz\" id=\"edit-"+wvo.rvo.rseq+"\" style=\"disply: inline-block; float:right;\">EDIT</button>";
   								}
   								htmlStr+="</div>";
   								htmlStr+="</form>";
   	                            htmlStr+="<div align=\"right\">";
   								htmlStr+="</div>";
   								htmlStr+="<hr>";
   							});
   						
   							$("#reply").html(htmlStr); 
   					}
   				});
   			
   		}
	});


	//댓글 추가 ajax
	$("#insertbtn").click(function(){  
		var data = new Object();
		data.rbody = $("#rbody").val();
		data.cseq = "${LVL_SESS_CSEQ}";
		data.bseq = "${LVL_WVO.bvo.bseq}";
		data.gseq = "${LVL_WVO.gvo.gseq}";
		data.btseq = "${LVL_WVO.btvo.btseq}";
	
		var jsonData = JSON.stringify(data);
		$.ajax({
			url:"/bod?action=insertForAjax&gseq=${LVL_WVO.gvo.gseq}&btseq=${LVL_WVO.btvo.btseq}",
			data:{"MYKEY": jsonData},
			type:"post",
			dataType:"json",
			success:function(result){
				var htmlStr="";
				$.each(result, function(i,wvo) {
					htmlStr+="<div class=\"row no-gutters align-items-center\">";
					htmlStr+="<span class=\"username font-weight-bold mr-1\">"+wvo.cvo.cid+"</span>";
					htmlStr+="<span class=\"time text-muted\">"+wvo.rvo.rregdate+"</span>";
					htmlStr+="</div>";
					htmlStr+="<form>";
					htmlStr+="<div class=\"message\" style=\"disply: inline-block;\" >";
					htmlStr+="<div id=\"editable"+wvo.rvo.rseq+"\" value=\"editable"+wvo.rvo.rseq+"\">"+wvo.rvo.rbody+"</div>";
					
					if(("${LVL_SESS_CID}"==wvo.cvo.cid && ("${LVL_SESS_CTYPE}"=="u" || "${LVL_SESS_CTYPE}" == "e"))|| "${LVL_SESS_CTYPE}"=="a" ) {
							htmlStr+="<button type=\"button\" class=\"btn btn-primary btn-sm btnd\" id=\"del-"+wvo.rvo.rseq+"\" style=\"disply: inline-block; float:right;\">DELETE</button>";
							htmlStr+="&nbsp;";
							htmlStr+="<button type=\"button\" class=\"btn btn-light btn-sm btnz\" id=\"edit-"+wvo.rvo.rseq+"\" style=\"disply: inline-block; float:right;\">EDIT</button>";
						}
					
					htmlStr+="</div>";
					htmlStr+="</form>";
	                htmlStr+="<div align=\"right\">";
					htmlStr+="</div>";
					htmlStr+="<hr>";
				});
				$("#reply").html(htmlStr); 
				$("#rbody").val("");
			}
		});
	});	

	//좋아요 ajax
	$("#likebtn").click(function(){
		
		var data = new Object();
		data.cseq = "${LVL_SESS_CSEQ}";
		data.bseq = "${LVL_WVO.bvo.bseq}";
		data.gseq = "${LVL_WVO.gvo.gseq}";
		data.btseq = "${LVL_WVO.btvo.btseq}";
		
		/* var data = new Object()l;
		data.bvo.action = "like";
		data.likeCnt = 1;
		data.cseq = ;//로그인에서 세션값으로 받아올 cseq
		data.bseq = ${list.bvo.bseq};
		 */
		var jsonData = JSON.stringify(data); //json 으로 변환해줌
		$.ajax({
			url: "/bod?action=likeForAjax&gseq=${LVL_WVO.gvo.gseq}&btseq=${LVL_WVO.btvo.btseq}",
			data: {"MYKEY": jsonData},
			type: "post",
			dataType:"json",
			success:function(result){
				console.log(result);

						var htmlStr="";
						htmlStr+="<button type=\"button\" class=\"like-button btn btn-primary\" id=\"likebtn\">";
						htmlStr+="<i class=\"icon-heart-outline s-4\"></i>";
						htmlStr+="<span id=\"lcnt\"> "+result+"</span></button>";
						
						$("#like").html(htmlStr);
			}
			
		});
	});
	
	//댓글 갯수 변경

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
						            <!-- / 보드타입 서브메뉴 -->
                                </ul>
								
								<form class="viewform" method="post">
								<input type="hidden" id="action" name="action">
								<input type="hidden" name="bseq" value="${LVL_WVO.bvo.bseq}">
								<input type="hidden" name="gseq" value="${LVL_WVO.gvo.gseq}">
								<input type="hidden" name="btseq" value="${LVL_BTSEQ}">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active p-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab">

										<div class="timeline-item card mb-6">

	                                    	<header class="row no-gutters align-items-center justify-content-between p-4">
	
	                                            <div class="user col">
	
	                                                <div class="row no-gutters align-items-center justify-content-start">
	
	                                                    <div class="col">
	
	                                                        <div class="title font-weight-bold">
	
	                                                            <span class="username"><h3 class="font-weight-bold">${LVL_WVO.bvo.btitle}</h3></span>
	                                                            <span class="time text">${LVL_WVO.cvo.cid}
	                                                            <span class="time text-muted">${LVL_WVO.bvo.bregdate}</span>
	
	                                                        </div>
	
	                                                    </div>
	                                                </div>
	                                            </div>
	
	                                    	</header>
	
                                            <div class="content">

                                                <div class="message py-2 px-4">
                                                </div>

                                                <div class="post-media py-2 px-4">

                                                    ${LVL_WVO.bvo.bbody}
												<div><br><div><br></div></div>
                                                </div>

                                                <div class="row no-gutters align-items-center py-2 px-4" id="like" style="width: 100px; float: left;">
                                                		
														<c:forEach items="${LVL_LCLIST}" var="lcvo">
                                               				<c:set var = "cq" value = "${lcvo.cseq}" />
                                                		</c:forEach>
														<c:choose>
															<c:when test="${LVL_SESS_CSEQ == null}">
																<button type="button" class="like-button btn btn-light">
			                                                    	<i class="icon-heart-outline s-4"></i>
			                                                     	<span id="lcnt">${LVL_WVO.lvo.lcnt}</span>
			                                                 	</button>
															</c:when>
															<c:when test="${cq == LVL_SESS_CSEQ}">
																<button type="button" class="like-button btn btn-primary">
			                                                    	<i class="icon-heart-outline s-4"></i>
			                                                     	<span id="lcnt">${LVL_WVO.lvo.lcnt}</span>
			                                                 	</button>
															</c:when>
															<c:otherwise>
																	<button type="button" class="like-button btn btn-light" id="likebtn">
				                                                    	<i class="icon-heart-outline s-4"></i>
				                                                     	<span id="lcnt">${LVL_WVO.lvo.lcnt}</span>
				                                                     	
				                                                 	</button>
															</c:otherwise>
														</c:choose>
														&nbsp;&nbsp;
                                           		</div>
                                           		<div class="row no-gutters align-items-center py-2 px-4" style="width: 100px; float: left;">
	                                           		
	                                           		<c:choose>
														<c:when test="${LVL_SESS_CTYPE == 'a' && (LVL_BTSEQ%6) != 1}">
			                                           		<button type="button" class="like-button btn btn-secondary" id="good" onClick="location.href='/bod?action=good&gseq=${LVL_WVO.gvo.gseq}&btseq=${LVL_BTSEQ}&bseq=${LVL_WVO.bvo.bseq}'">
			                                           			<i class="icon-thumb-up s-4"></i>
			                                           		</button>
                                           				</c:when>
                                           				<c:otherwise>
                                           				
                                           				</c:otherwise>
	                                           		</c:choose>
	                                           		
                                           		</div>
                                            </div>
	
                                            <footer class="bg-light p-4">
											<div>
												<br><br>
												<!-- 여기에 권한 부여 해야함 -->
												<div style="text-align: center;">
													
													<c:choose>
													<c:when test="${LVL_WVO.cvo.cid == LVL_SESS_CID || LVL_SESS_CTYPE == 'a'}">
													<button type="button" class="btn btn-light" id="edit" abled onClick="location.href='/bod?action=edit&gseq=${LVL_WVO.gvo.gseq}&btseq=${LVL_BTSEQ}&bseq=${LVL_WVO.bvo.bseq}'">
		                           						EDIT
		                       						</button>		                       						
													&nbsp;&nbsp;
													<button type="button" class="btn btn-primary" id="delete">
		                           						DELETE
		                       						</button>
		                       						</c:when>
		                       				
		                       						</c:choose>
                                			</form>
	                       						</div>
											<!-- / 여기까지 권한 부여 해야함 -->
												<br><br>
	                                    	</div>
	                                    	<div class="comment-count mb-4" id="rcnt">
                                            	${LVL_WVO.rvo.rcnt} comments
                                            </div>

                                                    <div class="comment row no-gutters mb-6">

                                                        <div class="col" id="reply">
														<c:forEach items="${LVL_RLIST}" var="rvo">

                                                            <div class="row no-gutters align-items-center">

                                                                <span class="username font-weight-bold mr-1">${rvo.cvo.cid}</span>

                                                                <span class="time text-muted">${rvo.rvo.rregdate}</span>

                                                            </div>
                                                            
                                                            <form>
	                                                            <div class="message" style="disply: inline-block;" >
	                                                               	<div id="editable${rvo.rvo.rseq}" value="editable${rvo.rvo.rseq}">${rvo.rvo.rbody}</div>
	                                                               	<c:choose>
																		<c:when test="${(LVL_SESS_CID==rvo.cvo.cid && (LVL_SESS_CTYPE=='u' || LVL_SESS_CTYPE=='e'))||LVL_SESS_CTYPE=='a'}">
			                                                               	<button type="button" class="btn btn-primary btn-sm btnd" id="del-${rvo.rvo.rseq}" style="disply: inline-block; float:right;">DELETE</button>
			                                                               	&nbsp;
			                                                               	<button type="button" class="btn btn-light btn-sm btnz" id="edit-${rvo.rvo.rseq}" style="disply: inline-block; float:right;">EDIT</button>
	                                                               		</c:when>
	                                                               		<c:otherwise>
	                                                               		
	                                                               		</c:otherwise>
	                                                               			
	                                                               	</c:choose>
	                                                            </div>
                                                            </form>
                                                            
                                                            <div align="right"></div>
                                                            
                                                            <hr>
                                                        </c:forEach>
                                                        </div>
                                                    </div>

                                                    <div class="reply row no-gutters">
                                                        <form class="col" class="replyfrom" action="/bod" method="post">
															<input type="hidden" name="action">
															<input type="hidden" name="cseq" id="cseq" value="${LVL_SESS_CSEQ}">													
                                                            <textarea class="p-2 mb-2 w-100" placeholder="Add a comment..." id="rbody" required></textarea>															
                                                            <button type="button" class="post-comment-button btn btn-sm btn-secondary" aria-label="Post Comment" name="insertbtn" id="insertbtn">Post Comment</button>

                                                        </form>

                                                    </div>
	                                        </footer>
	                                       	<!-- WIDGET GROUP -->
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