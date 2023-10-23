<%-- 
    Document   : brands
    Created on : Jul 3, 2023, 2:42:29 AM
    Author     : maidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="component/common_import.jsp" %>
        <style>
            table,th,td {
                border-collapse: collapse;
                border: 1px solid;
            }
        </style>
    </head>
    <body>
        <%@include file="component/header.jsp" %>
        <div class="container" style="text-align: center; padding: 80px 0 20px">
            <c:forEach begin="0" end="${brandsList.size() - 1}" var="i">
                <div class="d-flex flex-column col-sm-3" style="padding-bottom: 60px"> 
                    <c:forEach items="${brandsList.get(i)}" var="s">
                        <div class="p-2" style="margin-bottom: 16px;">
                            <a href="brands?bid=${s.id}" style="color: black; font-size: 18px;">
                                ${s.brand_name}<span>${s.quantity}</span></a></div>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>  
        <%@include file="component/footer.jsp" %>
    </body>
</html>
