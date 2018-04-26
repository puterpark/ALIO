<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav id="toolbar" class="bg-white">

                    <div class="row no-gutters align-items-center flex-nowrap">
                        <div class="col">
                        </div>

                        <div class="col-auto">

                            <div class="row no-gutters align-items-center justify-content-end">
                                <div class="user-menu-button dropdown">
                                

                                   	<!-- 나중에 jstl -->
                                    <div class="dropdown-toggle ripple row align-items-center no-gutters px-2 px-sm-4" role="button" id="dropdownUserMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               
               							<c:choose>
	               						 	<c:when test="${LVL_SESS_CNAME == null}">
	               								<span class="username mx-3 d-none d-md-block">
	               								<i class="icon-login"></i>
	               									 로그인
	               								</span>	
	               							</c:when>
	               							<c:when test="${LVL_SESS_CNAME != null}">
               									 <span class="username mx-3 d-none d-md-block">
               									 	<c:choose>
               									 		<c:when test="${LVL_SESS_CID == 'puter'}">
               									 			<i class="icon-language-javascript"></i>&emsp;${LVL_SESS_CID}
               									 		</c:when>
               									 		<c:when test="${LVL_SESS_CTYPE == 'a'}">
               									 			<i class="icon-account-settings-variant"></i>&emsp;${LVL_SESS_CID}
               									 		</c:when>
               									 		<c:when test="${LVL_SESS_CTYPE == 'e'}">
               									 			<i class="icon-account-edit"></i>&emsp;${LVL_SESS_CID}
               									 		</c:when>
               									 		<c:otherwise>
               									 			<i class="icon-account-outline"></i>&emsp;${LVL_SESS_CID}
               									 		</c:otherwise>
               									 	</c:choose>
	               								</span>	
	               							</c:when>
                  						</c:choose>
                                    </div>

									<c:choose>
	                                    <c:when test="${LVL_SESS_CTYPE=='a'}">
                                    		<div class="dropdown-menu" aria-labelledby="dropdownUserMenu">
                                    			
							
                                        		<a class="dropdown-item" href="/crewservlet?action=detail&cseq=${LVL_SESS_CSEQ}">
                                            		<div class="row no-gutters align-items-center flex-nowrap">
	                                               		<c:choose>
	               									 		<c:when test="${LVL_SESS_CID == 'puter'}">
	               									 			<i class="icon-language-javascript"></i>
	               									 		</c:when>
	               									 		<c:when test="${LVL_SESS_CTYPE == 'a'}">
	               									 			<i class="icon-account-settings-variant"></i>
	               									 		</c:when>
	               									 		<c:when test="${LVL_SESS_CTYPE == 'e'}">
	               									 			<i class="icon-account-edit"></i>
	               									 		</c:when>
	               									 	</c:choose>
                                                		<span class="px-3">프로필</span>
                                            		</div>
                                        		</a>

                                        		<div class="dropdown-divider"></div>

												<a class="dropdown-item" href="/crewservlet?action=list">
                                            		<div class="row no-gutters align-items-center flex-nowrap">
                                                		<i class="icon-account-multiple"></i>
                                                		<span class="px-3">회원관리</span>
                                            		</div>
                                        		</a>
                                        		
                                       			<div class="dropdown-divider"></div>
                                       			
                                        		<a class="dropdown-item" href="/ga">
                                            		<div class="row no-gutters align-items-center flex-nowrap">
                                                		<i class="icon-gamepad-variant"></i>
                                                		<span class="px-3">게임관리</span>
                                            		</div>
                                        		</a>

                                        		<div class="dropdown-divider"></div>

		                                       	<a class="dropdown-item" href="/login">
		                                           <div class="row no-gutters align-items-center flex-nowrap">
		                                               <i class="icon-logout"></i>
		                                               <span class="px-3">로그아웃</span>
		                                           </div>
		                                       	</a>
                                    		</div>
	                                    </c:when>
	                                    <c:when test="${LVL_SESS_CTYPE=='e'}">
                                    		<div class="dropdown-menu" aria-labelledby="dropdownUserMenu">

                                        		<a class="dropdown-item" href="/crewservlet?action=detail&cseq=${LVL_SESS_CSEQ}">
                                            		<div class="row no-gutters align-items-center flex-nowrap">
                                                		<i class="icon-account-edit"></i>
                                                		<span class="px-3">프로필</span>
                                            		</div>
                                        		</a>

                                        		<div class="dropdown-divider"></div>

		                                       	<a class="dropdown-item" href="/login">
		                                           <div class="row no-gutters align-items-center flex-nowrap">
		                                               <i class="icon-logout"></i>
		                                               <span class="px-3">로그아웃</span>
		                                           </div>
		                                       	</a>
                                    		</div>
	                                    </c:when>
	                                    <c:when test="${LVL_SESS_CTYPE=='u'}">
                                    		<div class="dropdown-menu" aria-labelledby="dropdownUserMenu">

                                        		<a class="dropdown-item" href="/crewservlet?action=detail&cseq=${LVL_SESS_CSEQ}">
                                            		<div class="row no-gutters align-items-center flex-nowrap">
                                                		<i class="icon-account-outline"></i>
                                                		<span class="px-3">프로필</span>
                                            		</div>
                                        		</a>

                                        		<div class="dropdown-divider"></div>

		                                       	<a class="dropdown-item" href="/login">
		                                           <div class="row no-gutters align-items-center flex-nowrap">
		                                               <i class="icon-logout"></i>
		                                               <span class="px-3">로그아웃</span>
		                                           </div>
		                                       	</a>
                                    		</div>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	 <div class="dropdown-menu" aria-labelledby="dropdownUserMenu">
		
		                                        <a class="dropdown-item" href="/alio/fuse/alio_login.jsp">
		                                            <div class="row no-gutters align-items-center flex-nowrap">
		                                                <i class="icon-login"></i>
		                                                <span class="px-3">로그인</span>
		                                            </div>
		                                        </a>
		
		                                        <div class="dropdown-divider"></div>
		
												<a class="dropdown-item" href="/alio/fuse/alio_register.jsp">
		                                            <div class="row no-gutters align-items-center flex-nowrap">
		                                                <i class="icon-account-box"></i>
		                                                <span class="px-3">회원가입</span>
		                                            </div>
		                                        </a>
	                                   		</div>
	                                    </c:otherwise>
                                    </c:choose>
                                    
                                    
                                    
                                </div>

                                <div class="toolbar-separator"></div>

                                <button type="button" class="search-button btn btn-icon">
                                    <i class="icon icon-magnify"></i>
                                </button>

                                <div class="toolbar-separator"></div>

                                <div class="toolbar-separator"></div>
                            </div>
                        </div>
                    </div>
                </nav>