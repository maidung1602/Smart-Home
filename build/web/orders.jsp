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
        <!--<link href="css/style.css" rel="stylesheet">-->
        <style>
            hr {
                border-top: 1px solid #696763 !important;
            }
            img {
                border-radius: 60px;
            }
            table,th,td {
                padding: 4px;
            }
            a {
                color: black
            }
        </style>
    </head>
    <body>
        <%@include file="component/header.jsp" %>
        <c:set var="account" value="${sessionScope.account}" />
        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="row" style="display: flex; justify-content: center">
                    <div class="col-lg-10 profile-part"style="padding: 20px; ">
                        <h2 style="text-align: center; margin-top: 20px"> Ðơn hàng của bạn </h2>
                        <c:forEach items="${orders}" var="o">
                        <div>
                            <div class="card-body" style="display: flex; justify-content: center; margin-top: 40px;">
                                <table style="width: 90%; background-color: #eee; border-radius: 12px ">
                                    <thead>
                                        <tr>
                                            <th style="width: 18%; padding-left: 20px;">Tên người nhận</th>
                                            <th style="width: 12%">Điện thoại</th>
                                            <th style="width: 26%">Địa chỉ</th>
                                            <th style="width: 20%">Ngày đặt hàng</th>
                                            <th style="width: 10%">Tổng tiền</th>
                                            <th>Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td style="padding-left: 20px">${o.name}</td>
                                            <td>${o.phone}</td>
                                            <td>${o.address}</td>
                                            <td>${o.orderDate}</td>
                                            <td>${o.total}.000d</td>
                                            <td style="color: red">
                                                <c:if test="${o.status==1}">Chờ xác nhận</c:if>
                                                <c:if test="${o.status==2}">Chờ lấy hàng</c:if> 
                                                <c:if test="${o.status==3}">Đang giao hàng</c:if>    
                                                <c:if test="${o.status==4}">Đã nhận hàng</c:if>    
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div style="display: flex; justify-content: center; margin-top: 20px;">
                                <table class="table" style="width: 84%">
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
                                    <c:forEach items="${o.getOrderDetails()}" var="orderDetail">
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
                            <c:if test="${o.status!=4}">
                                <form action="admin-processing-order" method="post">
                                    <input name="order-id" value="${o.id}" type="hidden"/>
                                    <input name="status" value="4" type="hidden"/>
                                    <div style="position: relative"><button ${o.status!=3?'disabled':''} type="submit" class="btn" 
                                    style="background-color: #0abbcb; color: white; position: absolute; right: 120px; top :-32px">Đã nhận được hàng</button></div>
                                </form>
                            </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="component/footer.jsp" %>
    </body>
</html>
