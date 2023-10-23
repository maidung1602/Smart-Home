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
        <div id="layoutSidenav" style="display: flex; background-color: #eee; height: 736px">
            <div class="col-sm-4">
                <%@include file="component/admin_sidebar.jsp" %>
            </div>
            <%-- Product Form --%>
            <div style=" margin: 178px 0 50px; background-color: white; padding: 56px 100px 0;border-radius: 30px;height: 354px;" class="col-sm-5">
                <form action="admin-add-productmodel" id="add-form" method="POST">
                    <%-- Product Model Forms --%>
                    <section id="product-models-wrapper">
                        <section class="product-models">
                            <input type="hidden" name="product-id" value="${product_id}" />
                            <div>
                                <label for="variant">Model name: </label>
                                <input style="margin-left: 6px; width: 240px" name="variant" type="text" id="variant">
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
                            <div>
                                <label for="image">Image URL: </label>
                                <input style="margin-left:8px; width: 334px" name="image" type="text" id="image">
                            </div>
                            <div style="display: none">
                                <hr style="color: #000">
                            </div>
                        </section>
                    </section>
                    <hr style="color: #000 !important" style="width: 40px !important">
                    <div>
                        <button id="add-product" style="background-color: #0abbcb; margin:4px 160px 16px" value="Add product" onclick="filterEmpty()">Add</button>
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
        </script>
        
    </body>
</html>