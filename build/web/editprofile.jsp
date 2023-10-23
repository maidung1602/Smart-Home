<%-- 
    Document   : profile
    Created on : Jul 5, 2023, 5:41:02 PM
    Author     : maidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="component/common_import.jsp" %>
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">-->
        <style>
            hr {
                border-top: 1px solid #696763 !important;
            }
            input {
                color: black !important;
                padding: 10px;
            }
            img {
                border-radius: 60px;
            }
        </style>
    </head>
    <body>
        <%@include file="component/header.jsp" %>
        <c:set var="account" value="${sessionScope.account}" />
        <section style="background-color: #eee;">
            <div class="container py-5">

                <div class="row" style="display: flex; justify-content: center">
                    
                    <div class="col-lg-3 profile-part" style="padding: 80px 28px;; width: 212px;">
                        <div class="card mb-4">
                            <div class="card-body text-center" >
                                <img src="${account.avatar}" alt="avatar"
                                     class="rounded-circle img-fluid" style="width: 110px;">
                                <h5 class="my-3" style="padding-top: 8px;">${account.name}</h5>
                            </div>
                        </div>
                    </div>
                                
                    <div class="col-lg-6 profile-part"style="padding: 20px;">
                        <div class="card mb-4">
                            <div class="card-body" style="padding: 22px 22px 0;">
                                <form action="editprofile" method="post">
                                    <input type="hidden" name="id" value="${account.id}" />
                                    <div class="row">
                                        <div class="col-sm-4" style="padding-top: 12px;">
                                            <p class="mb-0">Full Name</p>
                                        </div>
                                        <div class="col-sm-8">
                                            <input required class="text-muted mb-0" name="name" value="${account.name}" />
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-4" style="padding-top: 12px;">
                                            <p class="mb-0">Phone</p>
                                        </div>
                                        <div class="col-sm-8">
                                            <input required class="text-muted mb-0" name="phone" value="${account.phone}" />
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-4" style="padding-top: 12px;">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-8">
                                            <input required class="text-muted mb-0" name="email" value="${account.email}" />
                                        </div>
                                    </div>
                                <div class="d-flex justify-content-center mb-2 text-center">
                                    <button onclick="this.form.submit()" class="btn btn-primary" style="margin-top:16px; color: #383838;">Save</button>
                                </div>
                                </form>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="component/footer.jsp" %>
    </body>
</html>
