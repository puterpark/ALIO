<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>

	<%-- InfoType list로 가는경우 --%>
	<c:when test="${LVL_ITVO_LIST != null}">
		<c:forEach items="${LVL_ITVO_LIST}" var="itvo">
			<li class="nav-item">
				<a class="nav-link btn" id="home-tab" href="/info?action=list&itseq=${itvo.itseq}&gseq=${LVL_GVO.gseq}" role="tab" aria-controls="home-tab-pane" aria-expanded="true">${itvo.itname}</a>
			</li>
		</c:forEach>
	</c:when>
	
	<%-- BodType list로 가는경우 --%>
	<c:when test="${LVL_BTVO_LIST != null}">
		<c:forEach items="${LVL_BTVO_LIST}" var="btvo">
			
			<c:choose>
				<c:when test="${btvo.btseq == 0}">
					<li class="nav-item">
						<a class="nav-link btn" id="home-tab" href="/bod?action=list&btseq=${btvo.btseq}&gseq=${LVL_GVO.gseq}" role="tab" aria-controls="home-tab-pane" aria-expanded="true">전체 글</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<a class="nav-link btn" id="home-tab" href="/bod?action=list&btseq=${btvo.btseq}&gseq=${LVL_GVO.gseq}" role="tab" aria-controls="home-tab-pane" aria-expanded="true">${btvo.btname}</a>
					</li>
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
	</c:when>
</c:choose>