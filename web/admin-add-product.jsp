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
                border: 1px solid #FF4B2B;
                background-color: #FF4B2B;
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
            <div class="col-sm-4">
                <%@include file="component/admin_sidebar.jsp" %>
            </div>
            <%-- Product Form --%>
            <div style=" margin: 110px 0 50px; background-color: white; padding: 56px 100px 0;border-radius: 30px;" class="col-sm-5">
                <form action="admin-add-product" id="add-form" method="POST">
                    <div>
                        <label for="product-name">Product name: </label> <br/>
                        <input style="width:100%" required name="product-name" type="text" id="product-name">
                    </div>
                    <div>
                        <span>Description: </span> <br/>
                        <textarea style="margin-top: 8px" name="product-desc" id="summernote" cols="56" rows="4"></textarea>
                    </div>
                    <div style="margin-top: 10px;">
                        <section id="brands-wrapper">
                            <span>Brand: </span>
                            <%-- Brand Forms --%>
                            <select name="brand" id="brands" style="margin-left: 92px; width: 165px;">
                                <c:forEach items="${brands}" var="brand">
                                    <option value="${brand.id}"
                                            ${selectedBrand == brand.id? "selected" : ""}>
                                        ${brand.brand_name}
                                    </option>
                                </c:forEach>
                            </select>
                        </section>
                    </div>
                    <div>
                        <section id="categories-wrapper">
                            <span>Category: </span>
                            <select name="category" id="categories" onchange="changeCategory(this.value)" style="margin-left: 70px; width: 165px;">
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.id}"
                                            ${selectedCategory == category.id? "selected" : ""}>
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
                                            ${selectedCategory == subcategory.getCategory().getId()? "" : "style='display:none'"}
                                            ${selectedSubcategory == subcategory.id? "selected" : ""}>
                                        ${subcategory.subcategory_name}
                                    </option>
                                </c:forEach>
                            </select>
                        </section>
                    </div>
                    <div>
                        <label for="thumbnail">Image URL:</label>
                        <input style="margin-left:8px; width: 334px" name="thumbnail" type="text" id="thumbnail">
                    </div>
                            
                    <hr style="color: #000 !important" style="width: 40px !important">

                    <%-- Product Model Forms --%>
                    <section id="product-models-wrapper">
                        <section class="product-models">
                            <div style="display: none">
                                <label for="variant">Model name: </label>
                                <input name="variant" type="text" id="variant">
                            </div>
                            <section style="display: flex">
                                <div style="text-align: center;">
                                    <label for="origin-price">Origin Price: </label>
                                    <input style="width: 80px; " name="origin-price" type="number" id="origin-price">
                                </div>
                                <div style="text-align: center;">
                                    <label for="sale-price">Sale price: </label>
                                    <input style="width: 80px; " name="sale-price" type="number" id="sale-price">
                                </div>
                                <div style="text-align: center;">
                                    <label for="quantity">Quantity: </label>
                                    <input style="width: 80px; " name="quantity" type="number" id="quantity">
                                </div>
                            </section>
                            <div style="display: none">
                                <label for="image">Image URL: </label>
                                <input style="margin-left:8px; width: 334px" name="image" type="text" id="image">
                            </div>
                            <div style="display: none">
                                <hr style="color: #000">
                            </div>
                        </section>
                    </section>
                    <button id="add-model" style="background-color: #0abbcb; margin:12px 150px; border: none; padding: 12px 20px" type="button" onclick="addModel()">Add Model</button>
                    <hr style="color: #000 !important" style="width: 40px !important">
                    <div>
                        <button id="add-product" style="background-color: #16818b; margin:16px 120px 16px" value="Add product" onclick="filterEmpty()">Add Product</button>
                    </div>
                </form>
            </div>
        </div>     
        <!--<script src="js/jquery.js"></script>-->
        <script>
                $('#summernote').summernote();
                    function filterEmpty() {
                        // jquery to find all element with class product-models then loop through it
                        $(".product-models").each(function () {
                            // jquery to find all input element of current element with class product-models
                            // then loop through it
                            $(this).find("input").each(function () {
                                // jquery to check if current input value is empty then change it to "0"
                                if ($(this).val() === "") {
                                    $(this).val("0");
                                }
                            });
                            // jquery find form with id 'add-form' then submit it
                            $("#add-form").submit();
                        });
                    }
                    function addModel() {
                        //jquery check if there is only one element with class product-models
                        // then remove the style display none of every div of that element and
                        // remove every input value
                        if ($(".product-models").length === 1) {
                            $(".product-models div").removeAttr("style");
                            $(".product-models input").val("");
                        }
                        // jquery to find first element with class product-models then copy it
                        // then append it to the end of element with id product-models-wrapper
                        $(".product-models:first").clone().appendTo("#product-models-wrapper");
                    }
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