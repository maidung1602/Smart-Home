<%-- 
    Document   : login1
    Created on : Jul 3, 2023, 6:00:29 PM
    Author     : maidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="component/common_import.jsp" %>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="register" method="post">
                    <h2 style="font-weight: bold; padding-bottom: 10px;">Tạo tài khoản mới</h2>
                    <input required name="name" type="text" placeholder="Full Name" value="${name}"/>
                    <input required name="username" type="text" placeholder="Username" value="${username}"/>
                    <div style="display: flex; width: 85%;align-items: center;">
                        <input required name="password" type="password" placeholder="Password" id="myInput1" value="${password}"/>
                        <i style="background-color: #eee; padding: 15px;" onclick="myFunction1()" id="eye1" class="fa fa-eye-slash" aria-hidden="true"></i>
                    </div>
                    <div style="display: flex; width: 85%;align-items: center;">
                        <input required name="repassword" type="password" placeholder="Re-Password" id="myInput2"value="${repassword}" />
                        <i style="background-color: #eee; padding: 15px;" onclick="myFunction2()" id="eye2" class="fa fa-eye-slash" aria-hidden="true"></i>
                    </div>
                    <input required name="phone" type="text" placeholder="Phone Number" value="${phone}"/>
                    <input required name="email" type="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" placeholder="Email" value="${email}"/>
                    <p style="color: red; margin: 0">${err}</p>
                    <button onclick="this.form.submit()" style="margin-top: 28px">Đăng ký</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1 style="padding-bottom: 16px;">ĐĂNG NHẬP</h1>
                    <c:set var="cookie" value="${pageContext.request.cookies}" />
                    <p style="color: red; margin: 0">${error}</p>
                    <input required name="username" type="text" placeholder="Username" value="${cookie.cuser.value}"/>
                    <div style="display: flex; width: 100%;align-items: center;">
                        <input required name="password" type="password" placeholder="Password" id="myInput" value="${cookie.cpass.value}" />
                        <i style="background-color: #eee; padding: 15px;" onclick="myFunction()" id="eye" class="fa fa-eye-slash" aria-hidden="true"></i>
                    </div>
                    <div>
                        <span class="remember" style="font-size:14px">
                            <input type="checkbox" ${(cookie.crem!=null?'checked':'')} 
                                   style="width:16px" value="on" name="rem"/> Ghi nhớ đăng nhập</span>
                    </div>
                    <button style="margin-top:44px">Đăng nhập</button>
                    <p style="margin: 14px 0">Or login with</p>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/mia/login-google&response_type=code
    &client_id=570524258444-ridflrjec1qvuq3oidpn67cc1gm3t8i6.apps.googleusercontent.com&approval_prompt=force" style="margin:0; background-color: #f1f1f1; border-radius: 50%; padding: 8px"><img src="https://colorlib.com/etc/lf/Login_v9/images/icons/icon-google.png" alt="alt"/></a>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Xin chào</h1>
                        <p>Bạn đã có tài khoản ?</p>
                        <button class="ghost" id="signIn">Đăng nhập</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Xin chào</h1>
                        <p>Bạn chưa có tài khoản ?</p>
                        <button class="ghost" id="signUp">Đăng ký</button>
                    </div>
                </div>
            </div>
        </div>
        <script defer="">
            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const container = document.getElementById('container');

            <c:if test="${err != null && err.length() != 0}">
                container.classList.add("right-panel-active");
            </c:if>

            signUpButton.addEventListener('click', () => {
                container.classList.add("right-panel-active");
            });

            signInButton.addEventListener('click', () => {
                container.classList.remove("right-panel-active");
            });
        </script>
        <script>
            function myFunction() {
                var x = document.getElementById("myInput");
                var y = document.getElementById("eye");
                console.log(y.classList);
                if (x.type === "password") {
                    x.type = "text";
                    y.classList.replace('fa-eye-slash', 'fa-eye');
                } else {
                    x.type = "password";
                    y.classList.replace('fa-eye', 'fa-eye-slash');
                }
            }
            function myFunction1() {
                var x = document.getElementById("myInput1");
                var y = document.getElementById("eye1");
                console.log(y.classList);
                if (x.type === "password") {
                    x.type = "text";
                    y.classList.replace('fa-eye-slash', 'fa-eye');
                } else {
                    x.type = "password";
                    y.classList.replace('fa-eye', 'fa-eye-slash');
                }

            }
            function myFunction2() {
                var x = document.getElementById("myInput2");
                var y = document.getElementById("eye2");
                console.log(y.classList);
                if (x.type === "password") {
                    x.type = "text";
                    y.classList.replace('fa-eye-slash', 'fa-eye');
                } else {
                    x.type = "password";
                    y.classList.replace('fa-eye', 'fa-eye-slash');
                }

            }
        </script>
    </body>
</html>
