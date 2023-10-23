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
            
            th:last-child .datatable-sorter::before  {
                display: none;
              }

            th:last-child .datatable-sorter::after {
                display: none;
              }
            th:first-child {
                  width: 8%;
              }
              th:last-child {
                  width:6%;
              }
              td:last-child {
                  text-align: center;
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
                        <h1 style="padding-bottom: 20px" class="mt-4">Processing Order</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                List of orders
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Username</th>
                                            <th>Tên người nhận</th>
                                            <th>Điện thoại</th>
                                            <th>Địa chỉ</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${orders}" var="o">
                                            <c:if test="${o.status<4}">
                                                <tr>
                                                    <td>${o.id}</td>
                                                    <td>${o.username}</td>
                                                    <td>${o.name}</td>
                                                    <td>${o.phone}</td>
                                                    <td>${o.address}</td>
                                                    <td>${o.orderDate}</td>
                                                    <td>${o.total}.000d</td>
                                                    <td>
                                                        <form action="admin-processing-order" method="post">
                                                            <input type="hidden" name="order-id" value="${o.id}">
                                                            <select name="status" onchange="this.form.submit()">
                                                                <option ${o.status==1?'selected':''} value="1">Chờ xác nhận</option>
                                                                <option ${o.status==2?'selected':''} value="2">Chờ lấy hàng</option>
                                                                <option ${o.status==3?'selected':''} value="3">Đang giao hàng</option>
                                                            </select>
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <button type="button" onclick="window.location.href='admin-order-detail?order-id='+${o.id}" class="btn" style="background-color: #0abbcb; color: white;">Detail</button>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
