<%@page import="dao.ProductDao"%>
<%@page import="dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String description=request.getParameter("description");
	int price=Integer.parseInt(request.getParameter("price"));
	String status=request.getParameter("status");
	
	ProductDto dto=new ProductDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setDescription(description);
	dto.setPrice(price);
	dto.setStatus(status);
	
	boolean isSuccess=new ProductDao().update(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/product/update.jsp</title>
</head>
<body>
	<!-- html 응답하면서 javascript 를 로딩시키기 -->
	<script>
		<%if(isSuccess){%>
			alert("<%=name%> 상품의 정보를 성공적으로 수정했습니다");
			// savascript 를 이용해서 페이지 이동 (redirect 효과를 낼수 있다)
			location.href="list.jsp";
		<%}else{%>
			alert("수정 실패!");
			// 다시 수정 폼으로 이동시키기
			location.href="updateform.jsp?num=<%=num%>";
		<%}%>
	</script>	
</body>
</html>