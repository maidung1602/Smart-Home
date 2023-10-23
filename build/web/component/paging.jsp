<%-- 
    Document   : paging
    Created on : Jun 29, 2023, 6:36:06 PM
    Author     : maidu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>
    function gotoPage(index, totalPage) {
                for (let i = 0 ; i < totalPage; i ++) {
            document.querySelectorAll('.features_items .page' + i).forEach(o => o.style.display = "none");
            document.querySelectorAll('.pagination .page' + i).forEach(o => o.classList.remove('active'));
        }
        document.querySelectorAll('.features_items .page' + index).forEach(o => o.style.display = null);
        document.querySelector('.pagination .page' + index).classList.add('active');
    }
</script>
<div style="text-align: center">    
    <ul class="pagination">
        <li class="page0 ${page == null || page == 1? "active" : "" }" style="cursor: pointer" onclick="gotoPage(0, ${totalPage})"><a>1</a></li>
        <c:forEach begin="2" end="${totalPage}" var="index"> 
            <li class="page${index - 1} ${page == index? "active": ""}" style="cursor: pointer" onclick="gotoPage(${index - 1}, ${totalPage})"><a>${index}</a></li>
        </c:forEach>
        <c:if test="${totalPage > 3}">
            <li><a href="">&raquo;</a></li>
        </c:if>
    </ul>
</div>

    <script>document.querySelector('.pagination .page0').click()</script>

    