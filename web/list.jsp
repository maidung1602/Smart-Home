<%-- 
    Document   : list
    Created on : Jun 22, 2023, 3:17:59 AM
    Author     : maidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="component/common_import.jsp" %>

    </head><!--/head-->

    <body>
        <%@include file="component/header.jsp" %>
        <section>
            <div class="container" style="padding-top: 50px">
                <c:if test="${num>0}">
                    <h3 style="text-align: center; padding-bottom: 40px">Có ${num} sản phẩm</h3>
                </c:if>
                <div class="features_items"><!--features_items-->
                    <c:forEach begin="0" end="${productsList.size()-1}" var="i">
                        <c:forEach items="${productsList.get(i)}" var="s">
                            <div class="col-sm-3 shadow page${i}">
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
                    </c:forEach>
                </div><!--features_items-->
            </div>
            <%@include file="component/paging.jsp" %>
        </div>
    </section>
    <%@include file="component/footer.jsp" %>
</body>
</html>
