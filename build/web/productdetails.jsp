<%-- 
    Document   : productDetails
    Created on : Jun 29, 2023, 7:50:36 PM
    Author     : maidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="component/common_import.jsp" %>
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="component/header.jsp" %>
        <section id="aa-product-details">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-product-details-area">
                            <div class="aa-product-details-content">
                                <div class="row">
                                    <!-- Modal view slider -->
                                    <div class="col-md-5 col-sm-5 col-xs-12">  
                                        <div id="variant-carousel" class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <c:if test="${product.getProductModel().size()==1}">
                                                    <img src="${product.thumbnail}" alt="${product.name}" width="400px"/>
                                                </c:if>
                                                <c:if test="${product.getProductModel().size()>1}">
                                                    <div class="item active">
                                                        <img src="${product.thumbnail}" alt="${product.name}" width="400px"/>
                                                    </div>
                                                </c:if>

                                                <c:forEach items="${product.getProductModel()}" var="p">
                                                    <div class="item">
                                                        <img src="${p.image}" alt="${p.variant}" width="400px"/>
                                                    </div>
                                                </c:forEach> 
                                            </div>
                                            <c:if test="${product.getProductModel().size()>1}">
                                                <a href="#variant-carousel" class="left control-carousel" data-slide="prev">
                                                    <i class="fa fa-angle-left"></i>
                                                </a>
                                                <a href="#variant-carousel" class="right control-carousel" data-slide="next">
                                                    <i class="fa fa-angle-right"></i>
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>
                                    <!-- Modal view content -->
                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                        <form action="cart" method="post">
                                           <input type="hidden" name="action" value="add"/>
                                           <input type="hidden" name="product-id" value="${product.id}" />
                                        <div class="aa-product-view-content">
                                            <h3>${product.name}</h3>
                                            <p>${product.description}</p>
                                            <div class="aa-prod-view-bottom">
                                                <div class="aa-price-block">
                                                    <c:set var="originPriceTag" value="${product.getOriginPriceTag()}"/>
                                                    <c:set var="salePriceTag" value="${product.getSalePriceTag()}"/>
                                                    <h4 id="origin-price-tag" style="color: #828282"><del>${originPriceTag}</del></h4>
                                                    <h3 id="sale-price-tag" style="color: #db0416; font-weight: 700;margin-top: 10px">${salePriceTag}</h3>
                                                </div>
                                                <c:set var="productModels" value="${product.getProductModel()}"/>
                                                <c:if test="${productModels.size()==1}">
                                                    <input name="model_id" id="model_id" type="hidden" value="${productModels.get(0).getId()}"/>
                                                </c:if>
                                                <c:if test="${productModels.size()>1}">
                                                    <div class="aa-prod-quantity">
                                                        Phân loại:  <select name="model_id" id="model_id"
                                                                            style="width: 180px"
                                                                            onchange="changePriceTags(this.value)">
                                                            <option value="0">Tùy chọn</option>
                                                            <c:forEach items="${productModels}" var="s">
                                                                <option value="${s.id}">${s.variant}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <input type="hidden" id="origin-price-0" value="${originPriceTag}"/>
                                                        <input type="hidden" id="sale-price-0" value="${salePriceTag}"/>
                                                        <c:forEach items="${productModels}" var="s">
                                                            <input type="hidden" id="origin-price-${s.id}" value="${s.origin_price}"/>
                                                            <input type="hidden" id="sale-price-${s.id}" value="${s.sale_price}"/>
                                                        </c:forEach>
                                                            <p style="display: none; color: red; margin: 8px 0 0" id="noti">Chưa chọn phân loại</p>
                                                    </div>
                                                </c:if>
                                                <div class="">
                                                    Số lượng: <input type="number" value="1" min="1" name="quantity" style="width:40px">
                                                </div>
                                                    <button type="button" id="sb" class="aa-add-to-cart-btn" style="background-color: #0abbcb" onclick="submitForm()">Add To Cart</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Related product -->
                            <div class="aa-product-related-item">
                                <h2 style="margin-top: 32px; text-align: center; border-top: 1px solid #ddd; padding: 28px 0 40px";>Related Products</h2>
                                <c:forEach items="${product.getRelated()}" var="s">
                                    <div class="col-sm-3 shadow">
                                        <div class="product-image-wrapper" onclick="window.location.href = 'detail?id=${s.id}'">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="${s.thumbnail}" height="256px" alt="${s.name}" />
                                                    <p style="padding: 0 12px">${s.name}</p>
                                                    <h3 style="color: #db0416; font-weight: 700;">${s.getSalePriceTag()}</h3>
                                                    <h4 style="color: #828282"><del>${s.getOriginPriceTag()}</del></h4> 
                                                    <a  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="component/footer.jsp" %>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>
                function changePriceTags(index) {
                    index = +index;

                    let originPrice = document.getElementById('origin-price-' + index).value + (index === 0? '':'.000');
                    let salePrice = document.getElementById('sale-price-' + index).value + (index === 0? '':'.000');
                    document.getElementById('origin-price-tag').innerHTML = '<del>' + originPrice + '</del>';
                    document.getElementById('sale-price-tag').innerHTML = salePrice;
                }
                function submitForm() {
                    let model = document.getElementById('model_id').value;
                    if(model === '0'){
                        document.getElementById('noti').style.display="block";
                    } else{
                        document.getElementById('sb').type="submit";
                    }    
                }
                 
        </script>
    </body>
</html>
