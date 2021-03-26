<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>

<div class="footer ">
	<div class="footer-left col-md-6 ">
		<div class="logo-footer ">
			<a href="/"> <img src="${pageContext.request.contextPath}/img/logo.png " alt=" " width="100px "
				height="auto " />
			</a>
		</div>
		<div class="footer-content ">
			<ul class="navbar-nav ">
				<li>Trường đại học Công nghiệp Hà Nội</li>
				<li>Điện thoại: <a href="tel:0123456789 ">0123 456 789</a></li>
				<li>Website: <a href="# "></a>
				</li>

				<li>Email: <a href="# ">BookstoreDinhHieu@gmail.com</a>
				</li>
			</ul>
			<div class="navbar-brand ">
				<ul class="menu-icons ">
					<li class="facebook "><a
						href="https://www.facebook.com/FacebookVietnam/ " target="_blank "><i
							class="fa fa-facebook "></i></a></li>
					<li class="twitter "><a href="# " target="_blank "><i
							class="fa fa-twitter "></i></a></li>
					<li class="youtube "><a href="# " target="_blank "><i
							class="fa fa-youtube "></i></a></li>
					<li class="instagram "><a href="# " target="_blank "><i
							class="fa fa-instagram "></i></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="footer-right col-md-12">
		<h4 class="footer-title">
			<a>Thông tin</a>
		</h4>
		<div class="navbar-brand">
			<ul class="menu">
				<li class="li_menu"><a href="/gioi-thieu"> Giới thiệu </a></li>
				<li class="li_menu"><a href="/chinh-sach-bao-mat"> Chính sách bảo mật </a></li>
		
				<li class="li_menu"><a href="#"> Thông tin giao hàng </a></li>
				<li class="li_menu"><a href="/contact "> Liên hệ </a></li>
			</ul>
		</div>
	</div>
	<div class="footer-bottom col-md-12">
		<p></p>
		
	</div>	
</div>
<script>
	function hienThi(x, a) {
		document.getElementById(x).style.display = a;
	}
</script>