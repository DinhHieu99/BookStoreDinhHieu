<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8" />
<meta name="description" content="Demo su dung bootstrap" />
<meta name="keyword"
	content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery" />
<meta name="author" content="HieuNguyen">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/webbook.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cart.css">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">

<title>Chính sách bảo mật</title>
</head>

<body class="font">

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<div class="container-fluid col-md-12">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="/"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li>Chính sách bảo mật</li>
			</ul>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>Chính sách bảo mật</h3>
					<h5>1. CHÍNH SÁCH BẢO MẬT</h5>
					<p>Khi khách hàng sử dụng dịch vụ tại website
						BookstoreDinhHieu, chúng tôi sẽ đảm bảo quyền riêng tư của người
						dùng theo những điều khoản dưới đây.</p>
					<h5>2. SỬ DỤNG THÔNG TIN</h5>
					<p>BookstoreDinhHieu chỉ dùng thông tin của người dùng để phục
						vụ cho chính Người dùng khi bạn sử dụng dịch vụ tại
						BookstoreDinhHieu. Vì vậy chúng tôi sẽ dùng thông tin cá nhân của
						bạn để:</p>
					<ul>
						<li>Xác minh danh tính của người sử dụng dịch vụ</li>
						<li>Xác nhận thanh toán</li>
						<li>Những hình thức sử dụng để chia sẻ thông tin của bạn với
							các công ty khác bao gồm (nhưng không giới hạn) như công ty thẻ
							tín dụng hoặc tổ chức ngân hàng... nhằm mục đích phục vụ giao
							dịch của bạn</li>
						<li>Cung cấp các dịch vụ hỗ trợ & chăm sóc khách hàng. Nâng
							cấp dịch vụ của chúng tôi;</li>
						<li>Xử lý khiếu nại, thu phí & giải quyết sự cố;</li>
					</ul>
					<h5>3. HẠN CHẾ CÔNG BỐ THÔNG TIN</h5>
					<p>Chúng tôi sẽ không bán, tiết lộ hoặc cho thuê cho bên thứ ba
						nhận dạng cá nhân người sử dụng có thông tin thu thập tại trang
						web của chúng tôi, thông qua các máy chủ của chúng tôi, ngoài việc
						cung cấp dịch vụ của chúng tôi và như trong chính sách bảo mật.</p>
					<h5>4. VỀ VIỆC NHẬN HÀNG</h5>
					<p>Bạn có thể nhận đơn hàng nhanh chóng trong vòng 7 ngày nếu
						bạn ở miền Bắc và lâu hơn nếu ở xa</p>

					<p>Nếu bạn đặt hàng mà không nhận thì chúng tôi sẽ liên hệ với
						bạn trong 3 lần qua điện thoại và email. Nếu bạn không trả lời chúng tôi buộc phải hủy đơn hàng của bạn</p>
				</div>

			</div>
		</div>

	</div>

	<!--footer-->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(
				function() {
					$('button.items-count').on(
							'click',
							function() {
								var result = $(this).closest('.box-button')
										.find('input.input_pop');
								var qty = parseInt(result.val());
								if ($(this).hasClass('btn_minus'))
									if (!isNaN(qty) && qty > 1)
										result.val(--qty);
								if ($(this).hasClass('btn_plus'))
									if (!isNaN(qty))
										result.val(++qty);
							});
				});

		/* $("#update").click(function(e){
			e.preventDefault();
			var data = {
					"quantity": $("#quantity").val(),
				
			};
		//		data["email"] = $('#'+elementIdOfEmail).val();
			
			$.ajax({
				url: "/edit",
				type: "post",
				contentType: "application/json", // d? li?u g?i lên web-service có d?ng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // d? li?u t? web-service tr? v? là json.
				success: function(jsonResult) { // du?c g?i khi web-service tr? v? d? li?u.
					window.location.href = "http://127.0.0.1:8080/news/detail/${news.id}";
				}
			});
		}); */
	</script>
</body>

</html>