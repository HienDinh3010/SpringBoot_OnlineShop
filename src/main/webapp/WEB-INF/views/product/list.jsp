<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
	<h1>Product list</h1>
	<c:choose>
		<c:when test="${f:length(products) == 0 }">
			<h1>Không có sản phẩm nào</h1>
		</c:when>
		<c:otherwise>
			<c:forEach var="p" items="${products}">
				<div class="col-sm-4">
					<div class="panel panel-default nn-prod">
					  <div class="panel-heading">${p.name}</div>
					  <div class="panel-body">
					  	<a href="/prod/detail/${p.id}">
					  		<img src="/static/images/products/${p.image}" >
					  	</a>
					  </div>
					  <div class="panel-footer">
					  	<div class="row">
					  		<div class="col-sm-3">
					  			${p.unitPrice}
					  		</div>
					  		<div class="col-sm-9 text-right">
					  			<button type="button" class="btn btn-primary">
					  				<span class="glyphicon glyphicon-shopping-cart"></span>
					  			</button>
					  			<button class="btn btn-danger" data-favorite="${p.id}">
					  				<span class="glyphicon glyphicon-heart"></span>
					  			</button>
					  			<button type="button" class="btn btn-info" data-item-send-to-friend="${p.id}">
					  				<span class="glyphicon glyphicon-envelope"></span>
					  			</button>
					  		</div>
					  	</div>
					  </div>
					</div>
				
				</div>
			</c:forEach>			
		</c:otherwise>
	</c:choose>
</body>
</html>