<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Mia Cosmetics</title>
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles1.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
        <style>
            input {
                margin: 10px 0;
            }
            select {
                margin: 6px;
            }
            button {
                border-radius: 20px;
                border: 1px solid #0abbcb;
                background-color: #0abbcb;
                color: #FFFFFF;
                font-size: 12px;
                font-weight: bold;
                padding: 12px 45px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: transform 80ms ease-in;
            }

            button:active {
                transform: scale(0.95);
            }

            button:focus {
                outline: none;
            }

            button.ghost {
                background-color: transparent;
                border-color: #FFFFFF;
            }
            label, span {
                font-weight: bold;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="component/admin_header.jsp" %>
        <div id="layoutSidenav" style="display: flex; background-color: #eee;">
            <div class="col-sm-3">
                <%@include file="component/admin_sidebar.jsp" %>
            </div>
            <%-- Product --%>
            <div style=" margin: 110px 0 50px; background-color: white; padding: 56px 72px 0;border-radius: 30px; width: 63%" >
                <form action="admin-edit-product" id="add-form" method="POST">
                    <input type="hidden" name="id" value="${product.id}" />
                    <div>
                        <label for="product-name">Product name: </label> <br/>
                        <input style="width:100%" required name="product-name" value="${product.name}" type="text" id="product-name">
                    </div>
                    <div>
                        <span>Description: </span> <br/>
                        <textarea name="product-desc" id="summernote" cols="100" rows="5">${product.description}</textarea>
                    </div>
                    <div style="margin-top: 10px; position: relative">
                        <section id="brands-wrapper">
                            <span>Brand: </span>
                            <%-- Brand Forms --%>
                            <select name="brand" id="brands" style="margin-left: 92px; width: 165px;">
                                <c:forEach items="${brands}" var="brand">
                                    <option value="${brand.id}"
                                            ${product.brand.id == brand.id? "selected" : ""}>
                                        ${brand.brand_name}
                                    </option>
                                </c:forEach>
                            </select>
                        </section>
                        <img style="position: absolute; top :8px; right: 40px" src="${product.thumbnail}" width="140px"/>
                    </div>
                    <div>
                        <section id="categories-wrapper">
                            <span>Category: </span>
                            <select name="category" id="categories" onchange="changeCategory(this.value)" style="margin-left: 70px; width: 165px;">
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.id}"
                                            ${product.subcategory.category.id == category.id? "selected" : ""}>
                                        ${category.category_name}
                                    </option>
                                </c:forEach>
                            </select>
                        </section>
                    </div>
                    <div>
                        <section id="subcategories-wrapper" >
                            <span>Sub Category: </span>
                            <%-- Sub Category Forms --%>
                            <select name="subcategory" id="subcategories" style="margin-left: 38px">
                                <c:forEach items="${subcategories}" var="subcategory">
                                    <option value="${subcategory.id}"
                                            class="category-${subcategory.getCategory().getId()}"
                                            ${product.subcategory.category.id == subcategory.getCategory().getId()? "" : "style='display:none'"}
                                            ${product.subcategory.id == subcategory.id? "selected" : ""}>
                                        ${subcategory.subcategory_name}
                                    </option>
                                </c:forEach>
                            </select>
                        </section>
                    </div>
                    
                    <div>
                        <label for="thumbnail">Image URL:</label>
                        <input style="margin-left:8px; width: 388px" value="${product.thumbnail}" name="thumbnail" type="text" id="thumbnail">
                    </div>
                    <button style="background-color: #0abbcb; margin:16px 360px 8px;  padding: 12px 20px; border: none">Save</button>
                    </form>
                    <hr style="color: #000 !important" style="width: 40px !important">

                    <%-- Product Models --%>
                    <div class="cart-view-area" >
                        <div class="cart-view-table">
                            <div class="table-responsive">
                                <button style="background-color: #b2edf1; margin:4px 0 4px; padding: 12px 20px; float: right; color: black" onclick="window.location.href ='admin-add-productmodel?product-id='+${product.id}" >Add New</button>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Image</th>
                                            <th>Variant</th>                                   
                                            <th>Origin Price</th>
                                            <th>Sale Price</th>
                                            <th>Quantity</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${product.getProductModel()}" var="pm">
                                            <tr>
                                                <td>${pm.id}</td>
                                                <c:if test="${product.getProductModel().size()==1}">
                                                    <td><img width="60px" src="${product.thumbnail}"/></td>
                                                    <td>-</td>
                                                </c:if>
                                                <c:if test="${product.getProductModel().size()>1}">
                                                    <td><img width="60px" src="${pm.image}"/></td>
                                                    <td>${pm.variant}</td>
                                                </c:if>
                                                <td>${pm.origin_price}</td>
                                                <td>${pm.sale_price}</td>
                                                <td>${pm.quantity}</td>
                                                <td>
                                                    <button type="button" onclick="window.location.href = 'admin-edit-productmodel?id='+${pm.id}" class="btn" style="background-color: #0abbcb; color: white;">Edit</button>
                                                    <button type="button" onclick="doDelete('${pm.id}')" class="btn" style="background-color: #0abbcbcb; color: white;">Delete</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>                    
            </div>
        </div>     
        <!--<script src="js/jquery.js"></script>-->
        <script>
            function doDelete(id) {
                if(confirm('Co that su muon xoa khong?')){
                    window.location.href='admin-delete-productmodel?id='+id;
                }
            }
        </script>
        <script>
            $('#summernote').summernote();
            function changeCategory(categoryId) {
                // jquery to hide all option of select element with id subcategories and remove all selected attribute
                $("#subcategories option").hide().removeAttr("selected");
                // jquery to find all element with class category- and category id then show it
                $(".category-" + categoryId).show();
                // jquery to find #subcategory and select the first option of element with class category- and category id
                $("#subcategories").val($(".category-" + categoryId + ":first").val());
            }
        </script>
    </body>
</html>