<%@page import="dao.ProductDao"%>
<%@page import="dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 수정할 상품의 번호
	int num = Integer.parseInt(request.getParameter("num"));
	// 수정할 상품의 정보를 DB 에서 불러온다.
	ProductDto dto = new ProductDao().getByNum(num);
	// 상품 수정 양식을 응답한다.
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/product/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>책 정보 수정 양식</h1>
		<form action="update.jsp" method="post">
			<div>
				<label for="num">상 번호</label>
				<input type="text" name="num" id="num" value="<%=dto.getNum() %>" readonly>
			</div>
			<div>
				<label for="name">상품명</label>
				<input type="text" name="name" id="name" value="<%=dto.getName() %>">
			</div>
			<div>
				<label for="description">설명</label>
				<input type="text" name="description" id="description" value="<%=dto.getDescription() %>">
			</div>
			<div>
				<label for="publisher">가격</label>
				<input type="text" name="price" id="price" value="<%=dto.getPrice() %>">
			</div>
			<div>
				 <label>상태:</label>
 				 <select name="status">
  				 	<option value="일반">일반</option>
   				    <option value="기간 한정">기간 한정</option>
  				    <option value="이벤트">이벤트</option>
  				 </select><br>
			</div>
			<button type="submit">수정 확인</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>