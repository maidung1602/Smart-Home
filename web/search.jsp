<%-- 
    Document   : search
    Created on : Jun 29, 2023, 3:02:09 AM
    Author     : maidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="component/common_import.jsp" %>
        
        <script type="text/javascript">
            function setCheck(obj) {
                var fries = document.getElementsByName('brand');
                if ((obj.id == 'b0') && (fries[0].checked == true)) {
                    for (var i = 1; i < fries.length; i++)
                        fries[i].checked = false;
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                document.getElementById('f').submit();
            }
            

        </script>
    </head>
    <body>
        <%@include file="component/header.jsp" %>
        <section>
            <div class="container" style="padding-top: 100px">
                <h3 style="text-align: center">Có ${num} sản phẩm cho tìm kiếm</h3>
                <div class="row">
                    <form action="search" id="f">
                        <input type="hidden" value="${key}" name="key"/>
                        <div class="pull-right" style="width: 160px;padding-right: 40px; padding-bottom: 20px">
                            <select name="order" onchange="this.form.submit()"> 
                                <option value="0" >Sắp xếp</option>
                                <option value="name asc" <c:if test="${order eq 'name asc'}">selected</c:if>>Tên A-Z</option>
                                <option value="name desc" <c:if test="${order eq 'name desc'}">selected</c:if>>Tên Z-A</option>
                                <option value="id desc" <c:if test="${order eq 'id asc'}">selected</c:if>>Mới nhất</option>
                                <option value="id asc"<c:if test="${order eq 'id desc'}">selected</c:if>>Cũ nhất</option>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <div class="left-sidebar">
                                    <div class="price-range"><!--price-range-->
                                        <h2>Price Range</h2>
                                        <div class="well">
                                            From: <input type="text" style="width: 40px" value="${from_raw}" name="from_raw">.000₫   
                                        To: <input type="text" style="width: 40px" value="${to_raw}" name="to_raw">.000₫<br />
                                        <input style="margin-top: 12px; margin-left: 16px;" type="submit" value="Lọc"/>
                                    </div>
                                </div><!--/price-range-->


                                <div class="brands_products"><!--brands_products-->
                                    <h2>Brands</h2>
                                    <c:set var="check" value="${check}"></c:set>
                                        <div class="brands-name">
                                            <ul class="nav nav-pills nav-stacked">
                                                <li> 
                                                    <input type="checkbox" name="brand" 
                                                    ${brandOptions.size() == 0? "checked" : brandOptions.indexOf(Integer.valueOf(0)) >= 0?"checked" : ""} 
                                                    value="${0}" id="b0" onclick="setCheck(this)"/> All <br/></li>
                                                <c:forEach items="${brands}" var="brand">
                                                <li><input type="checkbox" name="brand" 
                                                           ${brandOptions != null && brandOptions.indexOf(brand.id) >= 0?"checked":""} value="${brand.id}" 
                                                           id="bm" onclick="setCheck(this)"/> ${brand.brand_name}<span class="pull-right">(${brand.quantity})</span><br/></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                </div><!--/brands_products-->

                            </div>
                        </div>


                        <div class="col-sm-9 padding-right">
                            <div class="features_items"><!--features_items-->

                                <c:forEach begin="0" end="${productsList.size() - 1}" var="i">
                                    <c:forEach items="${productsList.get(i)}" var="s">
                                            <div class="col-sm-4 shadow page${i}">
                                                <div class="product-image-wrapper" onclick="window.location.href='detail?id=${s.id}'">
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
                    </form>
                </div>
            </div>
        </section>
        <%@include file="component/footer.jsp" %>
    </body>
    
</html>
