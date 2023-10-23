<%-- 
    Document   : cart
    Created on : Jul 8, 2023, 6:30:43 PM
    Author     : maidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="component/common_import.jsp" %>
        <link href="css/style.css" rel="stylesheet">
        <style>
            .checkout {
                padding: 44px 34px;
                margin-left: 48px;
                background-color: #F5F5F5;
            }
            input {
                width:100%;
                padding: 4px;
            }
        </style>
    </head>
    <body>
        <%@include file="component/header.jsp" %>
        <c:if test="${cart.size()==0}">
            <div style="text-align: center; padding: 140px 0 180px; background-color: #eee">
                <h2 style=" padding: 0;">GIỎ HÀNG</h2>
                <h3 style="padding: 20px 0 0; color:red">Giỏ hàng của bạn trống</h3>
            </div>
        </c:if>
        <c:if test="${cart.size()>0}">
        <section style="background-color: white; padding-bottom: 50px;" id="cart-view">
            <div class="container-fluid" style="margin: 0 30px">
                <form action="checkout" method="post">
                    <div class="row" style="margin: 0 50px; display: flex">
                        <div class="" style="width:70%">
                            <div class="cart-view-area" >
                                <div class="cart-view-table">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Ảnh</th>
                                                    <th>Sản phẩm</th>
                                                    <th>Phân loại</th>
                                                    <th>Đơn giản</th>
                                                    <th>Số lượng</th>
                                                    <th>Số tiền</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <input type="hidden" name="sizeOfCart" value="${sizeOfCart}"/>
                                                <c:forEach items="${cart}" var="orderDetail">
                                                    <input type="hidden" name="productModelId" value="${orderDetail.productModelId}"/>
                                                    <tr>    
                                                        <td> 
                                                            <c:if test="${orderDetail.image!=null}">
                                                            <a href="detail?id=${orderDetail.productId}"><img src="${orderDetail.image}" alt="img"></a>
                                                            </c:if>
                                                            <c:if test="${orderDetail.image==null}">
                                                            <a href="detail?id=${orderDetail.productId}"><img src="${orderDetail.thumbnail}" alt="img"></a>
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
                                                        
                                                        <td><input class="aa-cart-quantity" 
                                                                   type="number" min="1" 
                                                                   value="${orderDetail.quantity}"
                                                                   name="quantity"
                                                                   onchange="changeQuantity(${orderDetail.productModelId}, ${orderDetail.salePrice}, this.value)">
                                                        </td>
                                                        
                                                        <td id="product-model-${orderDetail.productModelId}">
                                                            ${orderDetail.detailTotal}.000d
                                                        </td><input type="hidden" 
                                                                   id="product-${orderDetail.productModelId}"
                                                                   name="detailTotal"
                                                                   class="sum"
                                                                   value="${orderDetail.detailTotal}"/>
                                                            
                                                        <td style="width:5%"><input style="display: none" 
                                                                                    type="submit" name="model_id" 
                                                                                    id="remove-${orderDetail.productModelId}" 
                                                                                    value="${orderDetail.productModelId}" 
                                                                                    formaction="cart" formmethod="POST"/>
                                                            <label for="remove-${orderDetail.productModelId}">
                                                                <i class="fa fa-times"></i>
                                                            </label>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="cart-view-area" style="width:28%">
                            <div  class="checkout" >
                                <div>
                                    <h4 style="margin: 0; font-weight: bold">Tổng: </h4>
                                    <h5 style="line-height: 24px;">Tạm tính: <span style="float:right; font-weight: bold" id="total-price1">${total}.000d</span></h5>
                                    <h5 style="line-height: 24px;">Ship cod: <span style="float:right; font-weight: bold" >30.000d</span></h5>
                                    <h5 style="line-height: 24px;">Tổng tiền: <span style="float:right; font-weight: bold" id="total-price2">${total+30}.000d</span></h5>
                                    <input type="hidden" name="total" id="total" value="${total+30}"/>
                                </div>
                                <c:if test="${sessionScope.account.is_admin==1}">
                                    <c:set var="account" value="${sessionScope.account}" />
                                        <div style="margin-top: 20px">
                                            <h4 style="font-weight: bold; margin-bottom: 12px">Thông tin người nhận: </h4>
                                            <h5>Full Name: </h5><input value="${account.name}" type="text" name="name" /> <br/>
                                            <h5>Phone: </h5><input value="${account.phone}" type="number" name="phone" /> <br/>
                                            <h5>Address: </h5><input type="text" name="address" /> <br/>
                                        </div>
                                            <p style="color:red; margin-bottom: 0; margin-top: 10px">${err}</p>
                                    <button style=" background-color: pink; margin-top: 24px" class="aa-add-to-cart-btn" onclick="this.form.submit()">Checkout</button>
                               </c:if>
                               <c:if test="${sessionScope.account.is_admin!=1}">
                                    <a style=" background-color: #0abbcb; margin-top: 24px" class="aa-add-to-cart-btn" href="login">Checkout</a>
                               </c:if>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        </c:if>
        <!-- / Cart view section -->

    </section>
    <%@include file="component/footer.jsp" %>
    <script>
        function changeQuantity(pmId, salePrice, quantity) {
            document.getElementById('product-' + pmId).value = salePrice * quantity;
            document.getElementById('product-model-' + pmId).innerHTML
                    = (salePrice * quantity) + '.000d'
            changeSum();
        }

        function changeSum() {
            let sum = [...document.getElementsByClassName('sum')].map(o => o.value).reduce((a, b) => (+a) + (+b), 0);
            document.getElementById('total-price1').innerHTML = sum + '.000d';
            document.getElementById('total-price2').innerHTML = (sum+30) + '.000d';
            document.getElementById('total').value = (sum+30);
        }
        
    </script>
   
    
</body>
</html>
