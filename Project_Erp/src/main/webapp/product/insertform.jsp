<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<h1>상품 등록</h1>
	<form action="/Project_Erp/upload" method="post" enctype="multipart/form-data">
		<div>
			<label>상품명:</label>
			<input type="text" name="name">
		</div>
		<div>
			<label>설명:</label>
			<input type="text" name="description">
		</div>
		<div>
			<label>가격:</label>
			<input type="text" name="price">
		</div>
		<div>
			<label>상태:</label>
			<select name="status">
				<option value="일반">일반</option>
				<option value="기간 한정">기간 한정</option>
				<option value="이벤트">이벤트</option>
			</select>
		</div>
		<div>
			<label>상품 이미지:</label>
			<input type="file" name="image">
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>
