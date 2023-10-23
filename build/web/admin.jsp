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
      
    </head>
    <body class="sb-nav-fixed">
        <%@include file="component/admin_header.jsp" %>
        <div id="layoutSidenav">
            <%@include file="component/admin_sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <form action="admin" method="post">
                            <div style="margin-left: 20px; margin-bottom: 20px">
                            <span>
                                <select name="year" onchange="this.form.submit()">
                                    <c:set var="i" value="2022"/>
                                    <c:forEach begin="2022" end="2023" step="1">
                                        <option ${year==i?'selected':'' } value="${i}">${i}</option>
                                        <c:set var="i" value="${i+1}"/>
                                    </c:forEach>
                                </select>
                            </span>
                                                
                            <span>
                                <select name="month" onchange="this.form.submit()">
                                    <c:set var="i" value="1"/>
                                    <c:forEach begin="1" end="12" step="1">
                                        <option ${month==i?'selected':'' } value="${i}">Tháng ${i}</option>
                                        <c:set var="i" value="${i+1}"/>
                                    </c:forEach>
                                </select>
                            </span>
                            </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Biểu đồ doanh thu theo từng ngày trong tháng
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                    <span style="margin-left: 20px; margin-top: -30px; font-size: 12px;padding-bottom: 12px;">(.000 vnd)</span>
                                </div>
                            </div>
                            
                            
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Số lượng sản phẩm bán ra theo category theo tháng
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                            Top 5 người dùng chi tiền nhiều nhất tháng
                                    </div>
                                    <div class="card-body">
                                        <table class="table">
                                        <thead>
                                            <tr>
                                                <th style="width: 30%;"></th>
                                                <th style="width: 40%">Tên người dùng</th>
                                                <th style="width: 30%; text-align: center";>Số tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${hotusers}" var="u">
                                            <tr>    
                                                <td><img style="border-radius: 50px" width="90px" src="${u.avatar}" alt="alt"/></td>
                                                <td>${u.name}</td>
                                                <td style="text-align: center">${u.total}.000d</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                </div>
                            </div>
                            
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Top 5 sản phẩm bán chạy nhất tháng
                                    </div>
                                    <div class="card-body">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th style="width: 25%;">Ảnh</th>
                                                    <th style="width: 50%">Tên sản phẩm</th>
                                                    <th style="width: 25%; text-align: center">Số lượng</th>
                                                </tr>
                                             </thead>
                                            <tbody>
                                            <c:forEach items="${hotpro}" var="p">
                                                <tr>    
                                                    <td><img style="border-radius: 50px" width="90px" src="${p.thumbnail}" alt="alt"/></td>
                                                    <td>${p.name}</td>
                                                    <td style="text-align: center">${p.quantity}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </main>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script>
            // Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';

            // Area Chart Example
            var ctx = document.getElementById("myAreaChart");
            var myLineChart = new Chart(ctx, {
              type: 'line',
              data: {
                labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" ],
                datasets: [{
                  label: "Money",
                  lineTension: 0.3,
                  backgroundColor: "rgba(2,117,216,0.2)",
                  borderColor: "rgba(2,117,216,1)",
                  pointRadius: 5,
                  pointBackgroundColor: "rgba(2,117,216,1)",
                  pointBorderColor: "rgba(255,255,255,0.8)",
                  pointHoverRadius: 5,
                  pointHoverBackgroundColor: "rgba(2,117,216,1)",
                  pointHitRadius: 50,
                  pointBorderWidth: 2,
                  data: [<c:forEach items="${money}" var="m">
                                "<c:out value="${m}"/>",
                            </c:forEach>],
                }],
              },
              options: {
                scales: {
                  xAxes: [{
                    time: {
                      unit: 'date'
                    },
                    gridLines: {
                      display: false
                    },
                    ticks: {
                      maxTicksLimit: 10
                    }
                  }],
                  yAxes: [{
                    ticks: {
                      min: 0,
                      max: 50000,
                      maxTicksLimit: 5
                    },
                    gridLines: {
                      color: "rgba(0, 0, 0, .125)",
                    }
                  }],
                },
                legend: {
                  display: false
                }
              }
            });
        </script>
        <script>
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';

            // Pie Chart Example
            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
              type: 'pie',
              data: {
                labels: [<c:forEach items="${cates}" var="ca">
                                "<c:out value="${ca.category_name}"/>",
                            </c:forEach> ],
                datasets: [{
                  data: [<c:forEach items="${cate}" var="cate">
                                "<c:out value="${cate}"/>",
                            </c:forEach>],
                      
                  backgroundColor: ['rgb(255, 99, 132)',
                                      'rgb(54, 162, 235)',
                                    'rgb(255, 205, 86)',
                                  ],
                }],
              },
            });
    </script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
