<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

                    <div id="login" class="p-8">

                        <div class="form-wrapper md-elevation-8 p-8">

                            <div class="logo">
                                <span><img src="/alio/images/logo/alio_logo_b.png" style="width:130px;"></span>
                            </div>

                            <div class="title mt-4 mb-8">Log in to your account</div>

                            <form name="loginForm" method="post" action="/login">
							<input type="hidden" name="action">
                                <div class="form-group mb-4">
                                    <input type="text" class="form-control" id="cid" name="cid" aria-describedby="emailHelp" placeholder=" " required />
                                    <label for="loginFormInputEmail">ID</label>
                                </div>

                                <div class="form-group mb-4">
                                    <input type="password" class="form-control" id="cpw" name="cpw"  placeholder="Password" required />
                                    <label for="loginFormInputPassword">Password</label>
                                </div>

                                <div class="remember-forgot-password row no-gutters align-items-center justify-content-between pt-4">

                                    <!-- <div class="form-check remember-me mb-4">
                                        <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-label="Remember Me" />
                                            <span class="checkbox-icon"></span>
                                            <span class="form-check-description">Remember Me</span>
                                        </label>
                                    </div>

                                    <a href="#" class="forgot-password text-secondary mb-4">Forgot Password?</a> -->
                                </div>

                                <button type="submit" class="submit-button btn btn-block btn-secondary my-4 mx-auto" aria-label="LOG IN"
                                        onClick="goPage('login')">
                                    LOG IN
                                </button>
                                
                            </form>

                            <div class="register d-flex flex-column flex-sm-row align-items-center justify-content-center mt-8 mb-6 mx-auto">
                                <span class="text mr-sm-2">Don't have an account?</span>
                                <a class="link text-secondary" href="/alio/fuse/alio_register.jsp">Create an account</a>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </main>
</body>

</html>