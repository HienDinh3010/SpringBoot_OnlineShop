<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
	<h1>PRODUCT DETAILS</h1>
	<img src="/static/images/products/${prod.image}">
	<ul>
		<li>Name: ${prod.name}</li>
		<li>Unit Price: $<f:formatNumber value="${prod.unitPrice}" pattern="#,###.00"/></li>
		<li>Product Date: <f:formatDate value="${prod.productDate}" pattern="dd-MM-yyyy"/></li>
		<li>Special: ${prod.special?'Yes':'No'}</li>
		<li>Category: ${prod.category.nameVN}</li>
	</ul>
	<hr>
	
	<h3>HÀNG CÙNG LOẠI</h3>
	<div class="same-category">
		<c:forEach var="p" items="${prod.category.products}">
			<a href="/prod/detail/${p.id}">
			   <img alt="" src="/static/images/products/${p.image}">
			</a>
		</c:forEach>
	</div>

</body>
</html>