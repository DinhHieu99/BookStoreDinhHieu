<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach var="searchProduct" items="${searchProduct }">
	<a href="/product/${searchProduct.id }-${searchProduct.name }">
		<div class="autocomplete-list">
			<img class="search-image"
				src="${pageContext.request.contextPath}/img/${searchProduct.imgProduct}"
				width="40px" height="40px">
			<div class="product-details">
				<div class="search-name">${searchProduct.name }</div>
				<span class="search-price">${searchProduct.discount }đ</span>
				<del class="search-discount">${searchProduct.price }đ</del>
			</div>
		</div>
	</a>
</c:forEach>
