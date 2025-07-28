<%@page import="dto.ProductDto"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    int num = Integer.parseInt(request.getParameter("num"));
    ProductDto dto = new ProductDao().getByNum(num);

    if(dto == null){
%>
    <h2>해당 상품이 존재하지 않습니다.</h2>
<%
    return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기</title>
<style>
    .product-img {
        max-width: 300px;
        max-height: 300px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>상품 상세 정보</h1>
        <table border="1" cellpadding="10">
            <tr>
                <th>번호</th>
                <td><%=dto.getNum()%></td>
            </tr>
            <tr>
                <th>상품명</th>
                <td><%=dto.getName()%></td>
            </tr>
            <tr>
                <th>설명</th>
                <td><%=dto.getDescription()%></td>
            </tr>
            <tr>
                <th>가격</th>
                <td><%=dto.getPrice()%></td>
            </tr>
            <tr>
                <th>상태</th>
                <td><%=dto.getStatus()%></td>
            </tr>
            
            <tr>
   			    <th>이미지</th>
  				<td>
   			 	    <% if(dto.getImagePath() != null && !dto.getImagePath().isEmpty()) { %>
          			   <img src="${pageContext.request.contextPath}<%=dto.getImagePath()%>" alt="상품 이미지" class="product-img">


  				    <% } else { %>
           		       <span>이미지가 없습니다.</span>
        			<% } %>
    			</td>
		   </tr>
        </table>
        <br>
        <a href="list.jsp">← 상품 목록으로</a>
    </div>
</body>
</html>
