<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header"><!--header-->
    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row" >
                <div class="col-sm-9">
                    <div class="logo pull-left">
                        <a href="home"><img height="120px" style="width: 120px!important" src="images/home/logo.png" alt="" /></a>
                    </div>
                    <form action="search">
                        <div class="search_box pull-right">
                            <input type="text" name="key" value="${key}" placeholder="Search"/>
                            <button class="search_icon" onclick="this.form.submit()"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                </div>
                <div class="col-sm-3 head-control">
                    <c:set var="cookie" value="${pageContext.request.cookies}" />
                    <div class="pull-right">
                        <ul class="nav navbar-nav">
                            <!--<li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>-->
                            <li class="head-menu"><a style="color: #000!important" href="cart"><i class="fa fa-shopping-cart"></i><span class="cart-size">${cookie.csize.value}</span></a></li>
                            <li class="head-menu">
                                <c:if test="${sessionScope.account==null}">
                                    <a style="color: #000!important" href="login"><i class="fa fa-user"></i> </a>
                                </c:if>
                                <c:if test="${sessionScope.account!=null}">
                                    <!--avatar-->
                                    <c:if test="${sessionScope.account.avatar!=null}">
                                        <a href="home" style="padding-top: 10px">
                                            <img src="${account.avatar}" width="32px" style="border-radius: 60px;"  alt="alt"/>
                                        </a>
                                    </c:if>
                                    <c:if test="${sessionScope.account.avatar==null}">
                                        <a style="color: #000!important" href="">
                                            <i class="fa fa-user"></i> 
                                        </a>
                                    </c:if>
                                    <ul style="margin-top: 36px; font-size: 14px; width: 80px; background: #f1f1f1;" role="menu" class="sub-menu">  
                                        <c:if test="${sessionScope.account.is_admin==2}">
                                            <li><a style="color: #000!important" href="admin">Admin</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.account.is_admin==3}">
                                            <li><a style="color: #000!important" href="admin-user">User Admin</a></li>
                                        </c:if>
                                        <li><a style="color: #000!important" href="profile">Profile</a></li>
                                        <li><a style="color: #000!important" href="changepassword">Change password</a></li>
                                        <c:if test="${sessionScope.account.is_admin==1}">
                                            <li><a style="color: #000!important" href="order">Orders</a></li>
                                        </c:if>
                                        
                                        <li><a style="color: #000!important" href="logout">Logout</a></li>
                                    </ul>
                                </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->


    <div class="navbar navbar-default" role="navigation">
        <ul class="nav navbar-nav">
            <li><a href="products?cid=-1">Khuyến mãi</a></li>
            <li><a href="products?cid=-2">Bán chạy</a></li>
            <li><a href="products?cid=-3">Mới về</a></li>
                <c:forEach items="${categories}" var="c">
                <li><a href="products?cid=${c.id}">${c.category_name}<span class="caret"></span></a>
                    <ul role="menu" class="sub-menu" style="margin-left: 30px">  
                        <c:set var="a" value="${c.id}"></c:set>
                        <c:forEach items="${c.getSubByCid(a)}" var="s">
                            <li><a style="color: #000!important" href="product?sid=${s.id}">${s.subcategory_name}</a></li>
                            </c:forEach>
                    </ul>
                </li>
            </c:forEach>
            <li><a href="brand">Thương hiệu</a></li>
        </ul>
    </div>
</header><!--/header-->
