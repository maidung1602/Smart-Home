<%-- 
    Document   : home
    Created on : Jun 20, 2023, 5:06:03 AM
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
        <section id="slider"><!--slider-->
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="1"></li>
                            <li data-target="#slider-carousel" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <img style="height: 640px !important" src="https://file.hstatic.net/200000147577/file/smart_2289b72e6f414df5a530226a9a07e34c.png" alt="">
                            </div>
                            <div class="item">
                                <img style="height: 640px !important" src="https://easytech.com.vn/wp-content/uploads/2019/10/Smarthome.jpg" alt="">
                            </div>
                            <div class="item">
                                <img style="height: 640px !important" src="https://dientusangtaovn.com/wp-content/uploads/2020/01/Smart_home_2.jpg" alt="">
                            </div>
                        </div>

                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>

                </div>
            </div>
        </section><!--/slider-->

        <section>
            <div class="container">
                <div class="row">
                    <div class="padding-right">
                        <div class="hot_subcategory "><!--danh muc hot-->
                            <h2 class="title text-center" style="margin-bottom: 40px;">DANH MỤC HOT</h2>
                            <div class="row">
                                <c:forEach items="${subhot}" var="s">
                                    <div class="col-sm-2 text-center" style="margin-bottom: 24px;">
                                        <a href="product?sid=${s.id}">
                                            <img  alt="${s.subcategory_name}" style="width: 115px; border-radius: 32px;" src="${s.image}" >
                                            <h5>${s.subcategory_name}</h5>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>	
                        </div>

                        <div class="recommended_items"><!--khuyen mai hot-->
                            <h2 class="title text-center" style="margin-top: 20px; margin-bottom: 10px">Khuyến mãi HOT</h2>
                            <p class="title text-center" style="padding-bottom: 8px"><a href="products?cid=-1" style="color: #0abbcb">See all</a></p>
                            <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <c:forEach items="${hotSaleProducts1}" var="s">
                                                <div class="col-sm-3 shadow">
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
                                    </div>

                                    <div class="item">	
                                        <c:forEach items="${hotSaleProducts2}" var="s">
                                                <div class="col-sm-3 shadow">
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
                                    </div>

                                    <div class="item">	
                                        <c:forEach items="${hotSaleProducts3}" var="s">
                                                <div class="col-sm-3 shadow">
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
                                    </div>
                                </div>
                                <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                                <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                    <i class="fa fa-angle-right"></i>
                                </a>			
                            </div>
                        </div><!--/khuyen mai hot-->

                        <div class="features_items"><!--san pham noi bat-->
                            <h2 class="title text-center" style="margin-bottom: 10px">SẢN PHẨM NỔI BẬT</h2>
                            <p class="title text-center" style="padding-bottom: 8px; margin-bottom: 10px"><a href="products?cid=-2" style="color: #0abbcb">See all</a></p>
                            <c:forEach items="${hotProducts}" var="s">
                                <div class="col-sm-3 shadow">
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
                        </div><!--san pham noi bat-->
                        
                        <div class="category-tab"><!--category-tab-->
                            <div class="tab-content">
                                <c:forEach items="${categories}" var="c">
                                    <h3 style="padding-bottom: 20px;"><a href="products?cid=${c.id}" style="color: #0abbcb">${c.category_name}</a></h3>
                                    <div class="row">
                                        <c:set var="b" value="${c.id}"></c:set>
                                        <c:forEach items="${c.getCateHotProduct(b)}" var="s">
                                                <div class="col-sm-3 shadow">
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
                                    </div>
                                </c:forEach>
                            </div>
                        </div><!--/category-tab-->

                        <div class="recommended_items"><!--hang moi ve-->
                            <h2 class="title text-center" style="margin-bottom: 10px">Hàng mới về</h2>
                            <p class="title text-center" style="padding-bottom: 8px; margin-bottom: 10px"><a  href="products?cid=-3" style="color: #0abbcb">See all</a></p>
                            <div id="new-item-carousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <c:forEach items="${newProducts1}" var="s">
                                                <div class="col-sm-3 shadow">
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
                                    </div>

                                    <div class="item">	
                                        <c:forEach items="${newProducts2}" var="s">
                                                <div class="col-sm-3 shadow">
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
                                    </div>

                                    <div class="item">	
                                        <c:forEach items="${newProducts3}" var="s">
                                                <div class="col-sm-3 shadow">
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
                                    </div>
                                </div>
                                <a class="left recommended-item-control" href="#new-item-carousel" data-slide="prev">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                                <a class="right recommended-item-control" href="#new-item-carousel" data-slide="next">
                                    <i class="fa fa-angle-right"></i>
                                </a>			
                            </div>
                        </div><!--/hang moi ve-->

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
    </body>
</html>

