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
                  width: 6%;
              }
              th:last-child {
                  width:14%;
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
                        <h1 style="padding-bottom: 20px" class="mt-4">Products</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                List of products
                            </div>
                            <div class="card-body">
                                <button type="button" class="btn" onclick="window.location.href='admin-add-product'" style="float:right; background-color: #eee; margin-left: 20px;" 
                                        data-mdb-ripple-color="dark">Add new</button>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>ProductID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Quality</th>
                                            <th>Brand</th>
                                            <th>Subcategory</th>
                                            <th>Category</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${products}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.name}</td>
                                            <td>${p.getSalePriceTag()}</td>
                                            <td>${p.getQuantity()}</td>
                                            <td>${p.brand.brand_name}</td>
                                            <td>${p.subcategory.subcategory_name}</td>
                                            <td>${p.subcategory.category.category_name}</td>
                                            <td>
                                                <button type="button" onclick="window.location.href='admin-edit-product?id='+${p.id}" class="btn" style="background-color: #0abbcb; color: white;">Edit</button>
                                                <button type="button" onclick="doDelete('${p.id}')" class="btn" style="background-color: #0abbcbcb; color: white;">Delete</button>
                                            </td>
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
        <script>
            function doDelete(id) {
                if(confirm('Co that su muon xoa khong?')){
                    window.location.href='admin-delete-product?id='+id;
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
