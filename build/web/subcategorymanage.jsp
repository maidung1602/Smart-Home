<%-- 
    Document   : admin
    Created on : Jul 7, 2023, 4:50:10 PM
    Author     : maidu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Mia Cosmetics</title>
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles1.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            .datatable-pagination a {
                text-decoration: none;
                color: black !important;
            }

            th {
                display: none;
            }
            .cate {
                text-align: center;
                box-shadow: 1px 1px 6px #ccc;
                padding: 32px;
                margin: 12px;
                width: 18%;
                border-radius: 10px;
                line-height: 28px;
            }

        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="component/admin_header.jsp" %>
        <div id="layoutSidenav">
            <%@include file="component/admin_sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 style="padding-bottom: 20px" class="mt-4">Subcategories</h1>
                        <c:forEach items="${categories}" var="c">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <span style="font-size: 24px;"> ${c.category_name}</span>
                            </div>
                            <div class="card-body" style="padding: 12px 20px">
                                <div class="row" style="padding-top: 16px;">
                                    <c:set var="a" value="${c.id}"></c:set>
                                    <c:forEach items="${c.getSubByCid(a)}" var="s">
                                        <div class="cate" style="position: relative; height: 140px; text-align: center">
                                            <h5>${s.subcategory_name}</h5>
                                            <div style="position: absolute; bottom: 20px; left: 52px">
                                                <button onclick="window.location.href='admin-edit-subcategory?id='+${s.id}" type="button" class="btn" style="background-color: #0abbcb; color: white;">Edit</button>
                                                <button onclick="doDelete('${s.id}')" type="button" class="btn" style="background-color: #0abbcbcb; color: white;">Delete</button>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <a class="cate" onclick="window.location.href='admin-add-subcategory?category_id='+${a}" style="text-decoration: none; color: black; background-color: #eee; cursor: pointer;" ><div  style="padding-top: 26px; ">+ Add new</div></a>      
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </main>
            </div>
        </div>
        <script>
            function doDelete(id) {
                if(confirm('Có chắc chắn muốn xóa không ?')){
                    window.location.href='admin-delete-subcategory?id='+id;
                }
            }
        </script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
