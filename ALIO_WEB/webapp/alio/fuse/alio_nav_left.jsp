<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<aside id="aside" class="aside aside-left" data-fuse-bar="aside" data-fuse-bar-media-step="md" data-fuse-bar-position="left">
                <div class="aside-content-wrapper">

                    <div class="aside-content bg-primary-700 text-auto">

                        <div class="aside-toolbar">

                            <div class="logo" onclick="location.href='/category'" style="cursor: pointer;">
                                <span><img src="/alio/images/logo/alio_logo_s.png"></span>
                                <span class="logo-text"><img src="/alio/images/logo/alio_logo.png" style="width:70px"></span>
                            </div>

                            <button id="toggle-fold-aside-button" type="button" class="btn btn-icon d-none d-lg-block" data-fuse-aside-toggle-fold>
                                <i class="icon icon-backburger"></i>
                            </button>

                        </div>

                        <ul class="nav flex-column custom-scrollbar" id="sidenav" data-children=".nav-item">

                            <li class="subheader" onclick="location.href='/category'" style="cursor: pointer;">
                                <span><img src="/alio/images/logo/alio_logo.png" style="width:40px"></span>
                            </li>


                                
                            <c:forEach items="${LVL_GLIST}" var="gvo" varStatus="aa">
                            <li class="nav-item" id="heading-maple">
								<a class="nav-link ripple with-arrow collapsed" data-toggle="collapse" data-target="#collapse-${gvo.gseq}" href="#" aria-expanded="false" aria-controls="collapse-maple">
                                    <i class="icon s-4 icon-gamepad"></i>
                                    <span>${gvo.gtitle}</span>
                                </a>  
								<ul id="collapse-${gvo.gseq}" class='collapse' role="tabpanel" aria-labelledby="heading-${gvo.gseq}" data-children=".nav-item">
                                <c:forEach items="${gvo.btlist}" var="btvo" varStatus="stbt">
                                    <li class="nav-item">
                                       <c:choose>
										  <c:when test="${btvo.btseq == 0}">
										    <a class="nav-link ripple " href="/infotype?gseq=${gvo.gseq}" data-url="index.jsp">
                                            	<span>	${btvo.btname}</span>
                                      		</a>
										  </c:when>
										  <c:otherwise>
										     <a class="nav-link ripple " href="/bod?action=list&gseq=${gvo.gseq}&btseq=${btvo.btseq}" data-url="index.jsp">
	                                            <span>	${btvo.btname}</span>
	                                        </a>
										  </c:otherwise>
										</c:choose> 
									</li>
                                </c:forEach>
                                </ul>
                            </li>
                            </c:forEach>
                                                       
                            

                        </ul>
                    </div>
                </div>
            </aside>    