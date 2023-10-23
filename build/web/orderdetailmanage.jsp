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
            th:first-child {
                  width: 8%;
              }
              th:last-child {
                  width:14%;
              }
              a {
                   color: black;
                   text-decoration: none;
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
                        <h1 style="padding-bottom: 20px" class="mt-4">Order Details</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                List of order details
                            </div>
                            <div class="card-body">
                                <table class="table" id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Ảnh</th>
                                            <th>Sản phẩm</th>
                                            <th>Phân loại</th>
                                            <th>Đơn giản</th>
                                            <th>Số lượng</th>
                                            <th>Số tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orderdetails}" var="orderDetail">
                                        <tr>    
                                            <td style="width:7%"> 
                                                <c:if test="${orderDetail.image!=null}">
                                                    <a href="detail?id=${orderDetail.productId}"><img width="60px" src="${orderDetail.image}" ></a>
                                                    </c:if>
                                                    <c:if test="${orderDetail.image==null}">
                                                    <a href="detail?id=${orderDetail.productId}"><img width="60px" src="${orderDetail.thumbnail}" ></a>
                                                    </c:if>
                                            </td>
                                            <td style="width: 30%"><a href="detail?id=${orderDetail.productId}" class="aa-cart-title" >${orderDetail.productName}</a></td>
                                            <td>
                                                <c:if test="${orderDetail.variantName!=null}">
                                                    <a class="aa-cart-title" >${orderDetail.variantName}</a>
                                                </c:if>
                                                <c:if test="${orderDetail.variantName==null}">
                                                    <a class="aa-cart-title">-</a>
                                                </c:if>
                                            </td>
                                            <td>${orderDetail.salePrice}.000d</td>
                                            <td>${orderDetail.quantity}</td>
                                            <td>${orderDetail.detailTotal}.000d</td>
                                        </tr>
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
