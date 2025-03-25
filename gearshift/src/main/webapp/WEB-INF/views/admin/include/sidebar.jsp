<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<aside class="sidebar">
    <div class="sidebar-logo">
        <a href="#"><img src="${pageContext.request.contextPath}/img/trustride2.png"></a>
        <a href="#"><h3>Trust Ride</h3></a>
    </div>
    <ul>
         <li><a href="#">상품등록</a></li>
         <li><a href="#">상품관리</a></li>
         <li><a href="${pageContext.request.contextPath}/admin/orderList">주문관리</a></li>
         <li><a href="#">채팅관리</a></li>
	     <li><a href="${pageContext.request.contextPath}/admin/qna/list">문의관리</a></li>
         <li><a href="#">쿠폰관리</a></li>
         <li><a href="#">리뷰관리</a></li>
         <li><a href="${pageContext.request.contextPath}/admin/userList">회원관리</a></li>
    </ul>
</aside>