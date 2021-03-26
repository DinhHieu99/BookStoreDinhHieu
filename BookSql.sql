use bookstore;
drop table bookstore.tbl_taikhoan;
drop table bookstore.tbl_nhanvien;
select *from tbl_sanpham s inner join tbl_danhmuc d on s.idDM = d.id Where d.status = true;
select sum(totalMoney)from tbl_hoadon where date(created)= "2021-03-11";
select *from tbl_hoadon;
select *from tbl_danhgia;
SELECT SUM(rating)/COUNT(id) FROM tbl_danhgia WHERE idProduct = 1;
select *from tbl_hoadon h inner join tbl_giohang g on h.id = g.idOrder Where h.idUser = 1;
select *from tbl_giohang;
select *from tbl_phieunhap;
select *from tbl_post ORDER BY view DESC limit 4;
SELECT * FROM tbl_sanpham where id = 2 and SoLuongTon<0;
SELECT id, DAYOFMONTH(createDate) as ngày, (300- SoLuongTon)  from tbl_sanpham;
select *from tbl_khachhang;
select *from tbl_nhacc;
select *from tbl_phieunhap;
select  * from tbl_phieunhap where MONTH (created )= 3;
select create_date from tbl_lienhe;
SELECT DATEDIFF( CURRENT_TIMESTAMP, (select create_date from tbl_lienhe where id =1)) from tbl_lienhe;
insert into tbl_nhacc(nameSupplier, address, email, mobile,status) values('Kim đồng', 'Hà Nội', 'kimdong@email.com', '051648984', true);
select count(id)as dem, sum(ThanhTien) as tongtien from tbl_giohang;
select *from tbl_sanpham where TenSP like '%Bí mật cookies%';
DELETE FROM tbl_giohang WHERE id =2;
select DISTINCT Min(idDM) from tbl_sanpham;
select DISTINCT * from tbl_sanpham Where idDM between (select Min(idDM) from tbl_sanpham) and 
(select Max(idDM) from tbl_sanpham) limit 4;
select count(id) from tbl_giohang where idKhachHang =null;
Insert into tbl_khachhang(created,address,mobile,email,name,password, status,user_status ) values('2021-1-1',
'Bắc Ninh', 0975968806, 'hieu@gmail.com', 'Nguyễn Đình Hiếu','hieu123', 0, 1);
SELECT COUNT(nv.id) FROM tbl_nhanvien nv;
select*from tbl_nhanvien;
select*from tbl_lienhe;
select*from tbl_taikhoan;
Insert into tbl_nhanvien(address,mobile,email,name,position, status,username, password,status_login ) values('Bắc Ninh', '0975968806',
'hieu@gmail.com','Nguyễn Đình Hiếu',1,0,'hieu@gmail.com', 'hieu123', 1);
select max(id)-1 from tbl_sanpham;
insert into tbl_danhmuc(id, name, describes, status) values(1, 'Sách kỹ năng', '', 1);
insert into tbl_danhmuc(id, name, describes, status) values(2, 'Sách thiếu nhi', '', 1);
insert into tbl_danhmuc(id, name, describes, status) values(3, 'Sách tâm lý', '', 1);
select *from tbl_danhmuc;
insert into tbl_sanpham(id, nameProduct, describes, status, quantity, discount, price, view, idDM,imgProduct) values (1,'Bí mật cookies',
'<p style="text-align: justify;">“Chúng ta chỉ có một cuộc đời, một cơ hội để làm tất cả những gì mình thích. Hãy suy nghĩ thật - kĩ trước khi làm một điều gì đó, và hãy làm những gì mà bản thân mình thấy vui, đừng bao giờ hối hận về bất cứđiều gì.”</p>
<p style="text-align: justify;">Tôi tự nói với chính mình như thế trước khi đặt bút - cầm máy ảnh lên và viết cuốn sách đầu tay của mình. Đây là cuốn sách mà tôi đã ấp ủ trong suốt hai năm, tính từ cái ngày đầu tiên tôi bắt đầu bước chân vào con đường đầy ngọt ngào tôi đang đi. Tôi không dám tự nhận mình là một kẻ giỏi làm bánh hay đủ nhiều kiến thức về ngành bánh ngọt rộng lớn này. Bạn biết đấy, khi bạn giỏi về một lĩnh vực gì đó, chắc chắn sẽ có một người khác giỏi hơn, và người đó chính là mục tiêu mà bạn cần phải phấn đấu để đạt được. Đơn giản, vì tôi chỉ là một kẻ mê bánh, yêu bánh, “say” bánh và làm bánh vì đam mê."</p>
<p style="text-align: justify;">(Tác giả Minh Đức)</p>
<p style="text-align: center;"><img src="https://vbooks.exdomain.net/image/catalog/products/ready-to-cook-bi-mat-cookies--1-.jpg" /></p>
<p style="text-align: justify;">Cuốn sách do tác giả trẻ Minh Đức - chủ nhân blog Bếp nhà Sói - chuyên về bánh ngọt thực hiện. Theo chia sẻ của chính tác giả: “Chúng ta chỉ có một cuộc đời, một cơ hội để làm tất cả những gì mình thích. Hãy suy nghĩ thật kĩ trước khi làm một điều gì đó, và hãy làm những gì mà bản thân mình thấy vui, đừng bao giờ hối hận về bất cứ điều gì.” Đó có lẽ cũng là lí do mà chàng trai ấy tìm đến và gắn bó với bánh trái trong suốt chặng đường 3 năm.</p>
<p style="text-align: justify;">3 năm để học hỏi, trau dồi, tích luỹ, chàng trai ấy dần dần trở thành một cái tên có chỗ đứng riêng mỗi khi nhắc đến các home-cooks chuyên về mảng bánh ngọt. Đam mê con người đến từ đâu, đó là câu hỏi khó để giải thích, chỉ biết rằng Minh Đức đã được là-chính-mình trong căn bếp nhỏ, nơi cậu có thể đùa vui với với bơ-bột-sữa-trứng-đường, nơi cậu thoả sức sáng tạo và hồi hộp chờ những miếng nhỏ xinh toả hương từ lò nướng.</p>
<p style="text-align: justify;">Bí mật cookies tái hiện lại không gian bếp nhà, với những cảm nhận, ghi chép chân thực của tác giả về những thành bại đã trải qua. Gần 40 công thức đa dạng về các loại cookies hứa hẹn trở thành cẩm nang gối đầu giường cho những ai bắt đầu nảy sinh đam mê với bánh trái.</p>
<p style="text-align: justify;">Hãy cùng chờ đón Bí mật cookies để xem chúng ta sẽ tìm được những thú vị!</p>
<p style="text-align: center;"><img src="https://vbooks.exdomain.net/image/catalog/products/ready-to-cook-bi-mat-cookies--2-.jpg" /></p>
',1,12,97000,129000,1, 1,'readytocookbimatcookies1-255x370.jpg');

insert into tbl_sanpham(id, nameProduct, describes, status, quantity, discount, price, view, idDM,imgProduct) values (6,'LĂN VÀO BẾP',
'<p style="text-align: justify;">Nấu ăn với người này là một góc yêu thương, là thư giãn, là tài năng hay sở thích. Nhưng đối với nhiều người thì nấu ăn là cả một Thử Thách Khó Khăn hay Nỗi Kinh Hoàng Khó Nói. Làm thế nào để công việc nấu ăn trở nên dễ thở hơn với những người không có năng khiếu hay lười biếng, hoặc vừa lười vừa thường gây thảm họa (như cánh họa sĩ chẳng hạn)? Đừng lo, câu hỏi đó không còn là câu hỏi tu từ nữa mà đã có lời giải đáp cho bạn ngay ở đây.</p>
<p style="text-align: justify;">Mọi thứ liên quan đến bếp núc đều có bí quyết riêng để xử lý, nếu bạn nắm được những bí quyết nho nhỏ này thì hãy an tâm là bạn đã thành công một phần rồi đó. Phần còn lại phụ thuộc vào quyết tâm (hay lý do!?) lăn vào bếp của bạn. Dù bạn học nấu ăn vì bị ép buộc, bị cưỡng chế, bị dụ dỗ, hay rảnh quá nên nghía chơi chút, hay bất cứ lý do nào, hãy cùng biến công cuộc vào bếp thành những khám phá thú vị và mới lạ.</p>
<p style="text-align: justify;">Cùng trải nghiệm những mẹo vặt nấu nướng, những công thức nấu ăn đơn giản và những loại thực phẩm cải thiện tính cách có trong Bí kíp nấu ăn: Lăn vào bếp của hai họa sĩ siêu lười, siêu đoảng của Cloud Pillow Studio. Một cuốn sách dễ thương, đầy màu sắc, vui nhộn, thú vị, bổ ích và cần có trên giá sách, bên kệ bếp và trên bàn ăn của bạn.</p>
',1,12,75000,56000,1,1,'bikipnauanlanvaobep1-468x500.jpg');

insert into tbl_sanpham(id, nameProduct, describes, status, quantity, discount, price, view, idDM,imgProduct) values (3,'THAI GIÁO THEO CHUYÊN GIA',
'<p style="text-align: justify;">Thai giáo theo nghĩa rộng chính là thông qua chế độ dinh dưỡng, môi trường và tinh thần để thúc đẩy sự phát triển toàn diện của trẻ. Theo nghĩa hẹp thai giáo là căn cứ vào thời điểm cụ thể để áp dụng các biện pháp như: nghe nhạc, chiếu sáng, tắm nắng, nói chuyện... để giúp bé chào đời khỏe, đẹp, thông minh.</p>
<p style="text-align: justify;">- Hiện nay dòng sách về thai giáo đã quá nhiều rồi, nhưng cuốn sách này lại khiến tôi có cách nhìn nhận mới, không ngờ thai giáo đơn giản mà lại hiệu quả thế.<br />
(Mẹ Tôm)</p>
<p style="text-align: center;"><img src="https://vbooks.exdomain.net/image/catalog/products/thai-giao-theo-chuyen-gia-280-ngay-moi-ngay-doc-mot-trang-kem-dia--1-.jpg" /></p>
<p style="text-align: justify;">- Tôi cho rằng kiến thức thai giáo hầu hết đều "giáo điều" khô cứng, cho tới khi đọc cuốn sách này, có nó trong tay, tôi chỉ cần cùng bé yêu nghe một bản nhạc, cắm một lọ hoa, đi dạo một vòng... thế là hoàn thành bài thai giáo của một ngày. Không vất vả cũng không khó hình dung.<br />(Mẹ bé Bi)</p>
<p style="text-align: justify;">- Nếu nói thai giáo tạo ra kỳ tích, tôi không tin. Cuốn sách này nói với tôi thai giáo không phải lúc nào cũng tạo ra kỳ tích, nhưng chắc chắn thai giáo có thể khiến con tôi khỏe, đẹp, thông minh nhất trong khả năng của cháu. Và tôi đã chọn nó.<br />(Mẹ bé Mèo)</p>
<p style="text-align: center;"><img src="https://vbooks.exdomain.net/image/catalog/products/thai-giao-theo-chuyen-gia-280-ngay-moi-ngay-doc-mot-trang-kem-dia--2-.jpg" /></p>',1,12,69000,98000,1, 3,
'thaigiaotheochuyengia280ngaymo-255x370.jpg');
insert into tbl_sanpham(id, nameProduct, describes, status, quantity, discount, price, view, idDM,imgProduct) values (4,'108 BÍ QUYẾT GIÁO DỤC CON',
'<p style="text-align: justify;">Làm cha mẹ là một sự kiện trọng đại và vui vẻ trong cuộc đời.</p>
<p style="text-align: justify;">Bắt đầu từ khoảnh khắc con trai bạn chào đời, bạn đã có niềm vui vô cùng tận. Cùng với niềm vui ấy, khi làm cha mẹ cũng có nghĩa là bạn đang gánh trên vai trách nhiệm quan trọng nhất của cuộc đời. Bạn phải dạy con nói chuyện, dạy con học đọc, dạy con học cách làm một số việc nhà hợp với sức mình, dạy con học cách chung sống hòa bình với các bạn, dạy con học cách suy nghĩ độc lập… Ngoài ra, bạn còn phải gánh vác trách nhiệm bồi dưỡng phẩm chất và đạo đức cho con, bồi dưỡng con trở thành nam tử hán, có tính cách kiên cường, phẩm chất vượt trội, tự tin, lạc quan…</p>
<p style="text-align: justify;">Là nhà thiết kế đầu tiên trong cuộc đời trẻ, bạn phải cung cấp cho trẻ những phẩm chất cần thiết, và phải bồi dưỡng cho trẻ khả năng giao tiếp, khả năng thích ứng xã hội… So với những kiến thức, kỹ năng mà nhà trường cung cấp cho trẻ, thì những điều này càng có quyết định tới sự thành công của trẻ trong tương lai.</p>
<p style="text-align: center;"><img src="https://vbooks.exdomain.net/image/catalog/products/108-bi-quyet-giao-duc-con-cua-cha-me-thong-thai--1-.jpg" /></p>
<p style="text-align: justify;">Bạn đã chuẩn bị sẵn sàng chưa?</p>
<p style="text-align: justify;">Bạn có biết làm thế nào để rèn luyện ý thức tự lập cho trẻ không?</p>
<p style="text-align: justify;">Bạn có biết làm thế nào để bồi dưỡng khả năng học tập ưu tú cho trẻ không?</p>
<p style="text-align: justify;">Làm thế nào để bồi dưỡng cá tính lành mạnh cho trẻ?</p>
<p style="text-align: justify;">Bạn có biết làm thế nào để nâng cao EQ cho con không?</p>
<p style="text-align: justify;">Bạn có biết làm thế nào để bồi dưỡng thói quen sinh hoạt lành mạnh cho trẻ không?</p>
<p style="text-align: justify;">Có lẽ bạn vẫn chưa hiểu rõ hoặc thiếu lý luận và hướng dẫn thực hiện chi tiết. Hãy bắt đầu từ cuốn sách này để tìm ra những điểm mấu chốt cần phải bồi dưỡng để con trai trở thành người ưu tú.</p>
<p style="text-align: justify;">Bồi dưỡng phẩm chất và thói quen cho trẻ là một quá trình lâu dài, cần sự giáo dục và dẫn dắt không ngừng, hơn nữa còn cần phải bắt đầu từ nhỏ. Bạn càng sớm nắm được phương pháp giáo dục đúng đắn, dựa vào đặc điểm của từng độ tuổi để áp dụng phương thức giáo dục phù hợp thì sự trưởng thành của trẻ cũng sẽ càng thuận lợi.</p>
<p style="text-align: justify;">Kết hợp quan niệm giáo dục trong và ngoài nước để bồi dưỡng 10 khía cạnh quan trọng nhất của trẻ; cung cấp 108 chi tiết quan trọng, đưa ra những phương pháp nổi bật và tính ứng dụng cao, hi vọng, cuốn sách có thể giúp ích cho các bậc phụ huynh, giúp bạn lựa chọn phương thức giáo dục thích hợp hơn cho con trai của mình.</p>
<p style="text-align: center;"><img src="https://vbooks.exdomain.net/image/catalog/products/108-bi-quyet-giao-duc-con-cua-cha-me-thong-thai--2-.jpg" /></p>',
1,12,129000,90000,1,3,'108biquyetgiaoducconcuachameth-255x370.jpg');
