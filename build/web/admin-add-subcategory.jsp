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
        <!--<link rel="stylesheet" href="css/login_2.css"/>-->
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
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="component/admin_header.jsp" %>
        <div id="layoutSidenav" style="display: flex; background-color: #eee;">
            <div style="width: 45%">
                <%@include file="component/admin_sidebar.jsp" %>
            </div>
            <%-- Product Form --%>
            <div style=" margin: 296px 0 296px; background-color: white; padding: 30px 50px 6px;border-radius: 30px; width: 15%; text-align: center" >
                <form action="admin-add-subcategory" id="add-form" method="POST">
                    <div>
                        <input type="hidden" name="category_id" value="${category_id}"/>                                      
                        <label style="font-weight: bold">Sub Category Name: </label> <br/>
                        <input style="width:100%; margin: 20px 0 20px; padding: 3px " required  name="subcategory_name" type="text" id="product-name">
                        <a href=""><button type="submit" class="btn" style="background-color: #0abbcb; color: white;">Add</button></a>
                    </div>
                </form>
            </div>
        </div>     
    </body>
</html>