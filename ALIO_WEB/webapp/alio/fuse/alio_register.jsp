<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 	import="com.kosmo.alio.CrewVO" import="com.kosmo.alio.CrewImp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en-us">

<!-- head 부분 -->
<%@ include file="/alio/fuse/alio_head.jsp" %>
<script>
function goPage(prm){
	if(loginForm.cid.value == "") {
		loginForm.cid.focus();
	} else if(loginForm.cpw.value == "") {
		loginForm.cpw.focus();
	} else {
		loginForm.action.value = prm; //파라미터로 들어오는 구분 값
		loginForm.submit();
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

                    <div id="register" class="p-8">

                        <div class="form-wrapper md-elevation-8 p-8">

                            <div class="logo">
                                <span><img src="/alio/images/logo/alio_logo_b.png" style="width:130px;"></span>
                            </div>

                            <div class="title mt-4 mb-8">Create an account</div>

                            <form name="registerForm" method="post" action="/crewservlet">

                                <div class="form-group mb-4">
                                    <input type="text" class="form-control" id="cid" name="cid" aria-describedby="nameHelp" required/>
                                    <label for="registerFormInputName">ID</label>
                                </div>

                                <div class="form-group mb-4">
                                    <input type="password" class="form-control" id="cpw" name="cpw" required/>
                                    <label for="registerFormInputPassword">Password</label>
                                </div>

								<div class="form-group mb-4">
                                    <input type="text" class="form-control" id="cname" name="cname" required/>
                                    <label for="registerFormInputEmail">Name</label>
                                </div>
                                
                                <div class="form-group mb-4">
                                    <input type="text" class="form-control" id="cphone" name="cphone" required />
                                    <label for="registerFormInputEmail">Phone</label>
                                </div>
								<div style="padding: 5px"></div>
                                <button type="submit" class="submit-button btn btn-block btn-secondary my-4 mx-auto" aria-label="LOG IN">
                                    CREATE MY ACCOUNT
                                </button>
								<input type="hidden" name="action" value="insert">
                            </form>

                            <div class="login d-flex flex-column flex-sm-row align-items-center justify-content-center mt-8 mb-6 mx-auto">
                                <span class="text mr-sm-2">Already have an account?</span>
                                <a class="link text-secondary" href="/alio/fuse/alio_login.jsp">Log in</a>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="quick-panel-sidebar custom-scrollbar" fuse-cloak data-fuse-bar="quick-panel-sidebar" data-fuse-bar-position="right">
                <div class="list-group" class="date">

                    <div class="list-group-item subheader">TODAY</div>

                    <div class="list-group-item two-line">

                        <div class="text-muted">

                            <div class="h1"> Saturday</div>

                            <div class="h2 row no-gutters align-items-start">
                                <span> 1</span>
                                <span class="h6">th</span>
                                <span> Jan</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="list-group">

                    <div class="list-group-item subheader">Events</div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Group Meeting</h3>
                            <p>In 32 Minutes, Room 1B</p>
                        </div>
                    </div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Public Beta Release</h3>
                            <p>11:00 PM</p>
                        </div>
                    </div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Dinner with David</h3>
                            <p>17:30 PM</p>
                        </div>
                    </div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Q&amp;A Session</h3>
                            <p>20:30 PM</p>
                        </div>
                    </div>

                </div>

                <div class="divider"></div>

                <div class="list-group">

                    <div class="list-group-item subheader">Notes</div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Best songs to listen while working</h3>
                            <p>Last edit: May 8th, 2015</p>
                        </div>
                    </div>

                    <div class="list-group-item two-line">

                        <div class="list-item-content">
                            <h3>Useful subreddits</h3>
                            <p>Last edit: January 12th, 2015</p>
                        </div>
                    </div>

                </div>

                <div class="divider"></div>

                <div class="list-group">

                    <div class="list-group-item subheader">Quick Settings</div>

                    <div class="list-group-item">

                        <div class="list-item-content">
                            <h3>Notifications</h3>
                        </div>

                        <div class="secondary-container">
                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" />
                                <span class="custom-control-indicator"></span>
                            </label>
                        </div>

                    </div>

                    <div class="list-group-item">

                        <div class="list-item-content">
                            <h3>Cloud Sync</h3>
                        </div>

                        <div class="secondary-container">
                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" />
                                <span class="custom-control-indicator"></span>
                            </label>
                        </div>

                    </div>

                    <div class="list-group-item">

                        <div class="list-item-content">
                            <h3>Retro Thrusters</h3>
                        </div>

                        <div class="secondary-container">

                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" />
                                <span class="custom-control-indicator"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>
</body>

</html>