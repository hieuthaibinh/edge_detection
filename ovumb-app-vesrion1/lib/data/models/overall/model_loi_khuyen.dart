class DataLoiKhuyen {
  int id;
  String title;
  String loikhuyen;
  DataLoiKhuyen(this.id, this.title, this.loikhuyen);
}

List<DataLoiKhuyen> dataLoiKhuyen = [
  DataLoiKhuyen(
    0,
    'Tiếp xúc thường xuyên với ánh nắng mặt trời (trước 8h sáng và sau 4h chiều).',
    'Vitamin D trong ánh nắng mặt trời là một trong những rất quan trọng cho sự phát triển hệ thống thần kinh trung ương của thai nhi. Góp phần quan trọng trong việc hấp thu magiê, nguyên tố cần thiết cho thai nhi phát triển các mô, canxi và phốt pho sẽ giúp thai nhi hình thành và ổn định xương.',
  ),
  DataLoiKhuyen(
    1,
    'Trong suốt quá trình mang thai bà bầu nên ngủ nghiêng về bên trái.',
    'Khi nằm ngủ người mẹ nên quay về bên trái. Điều đó sẽ tăng cường lưu lượng máu cho thai nhi Nó khiến cho máu chuyển về thai nhi ở mức lớn nhất. Nằm ngửa c có thể làm giảm huyết áp gây ra triệu chứng chóng mặt cho bà bầu, gây ra tình trạng ngáy ngủ, tăng cân và thậm chí ngừng thở khi ngủ. Mẹ bầu có thề dùng những loại gối chữ U thiết kế đặc thù cho phụ nữ mang thai để có giấc ngủ ngon hơn.',
  ),
  DataLoiKhuyen(
    2,
    'Bà bầu không nên nhịn tiểu và nên đi tiểu ngay khi có nhu cầu.',
    'Nhịn tiểu cũng tăng nguy cơ viêm đường tiết niệu – một nguyên nhân dẫn đến các cơn co thắt dấn đến nguy cơ sinh non. Việc chờ tới khi buồn tiểu mới đi tiểu sẽ khiến cho bạn dễ bị nhiễm khuẩn đường tiểu.',
  ),
  DataLoiKhuyen(
    3,
    'Không nên ăn nhiều kem.',
    'Ăn quá nhiều kem sẽ làm các mạch máu bị co thắt đột ngột Trong kem có chứa vi khuẩn Listeria gây sẩy thai, thai chết lưu, sinh non và nhiễm trùng ở trẻ sơ sinh. Ngoài ra kem có chứa hàm lượng đường khác cao nên ăn nhiều sẽ có nguy cơ tăng cân nhanh và dẫn tới việc đẻ mổ..',
  ),
  DataLoiKhuyen(
    4,
    'Chú ý đến cử động của thai.',
    'Thời gian hoạt động rõ nhất là từ cuối tuần thứ 27-32. Khi thai ngủ thường không có cử động thai, chính vì thế các mẹ phải học cách để nhận biết biểu hiện thai như : những tiếng gõ nhịp vào thành bụng lệch hay méo một bên. Các mẹ nên theo dõi vì nếu bé cử động ít hơn bình thường hoặc ngừng hẳn, hãy gọi ngay cho bác sĩ để được thăm khám kịp thời.',
  ),
  DataLoiKhuyen(
    5,
    'Bệnh răng miệng.',
    'Là vấn đề hay gặp khi mang thai bởi vì thời kỳ thai nghén cũng làm cho phụ nữ ăn uống thất thường, nhiều người ăn đồ ngọt nhiều hơn bình thường nên rất dễ bị sâu răng. Vì thế các mẹ nên hạn chế thực phẩm chứa nhiều hàm lượng đường thay vào đó nên ăn vị ngọt từ trái cây, uống nhiều sừa và hạn chế chát béo.',
  ),
  DataLoiKhuyen(
    6,
    'Khi mang thai bà bầu cần tránh xa vật nuôi & bùn đất',
    'Vì chúng có chứa vi khuẩn Toxoplasmosis sẽ dẫn đến dị tật thai nhi như : gây mù và phá hủy não bộ của thai nhi.',
  ),
  DataLoiKhuyen(
    7,
    'Cho thai nhi nghe nhạc ngay từ trong bụng mẹ.',
    'Âm thanh bên ngoài có tác động rất nhiều đến thai nhi vì thế các mẹ nên nói chuyện với bé thường xuyên để có thể giúp kích thích thị giác ,thính giác và cử động của bé yêu. Đây chính là bí quyết giúp béthông minh ngay từ trong bụng mẹ một cách khoa học..',
  ),
  DataLoiKhuyen(
    8,
    'Tiền sản giật.',
    'Là nguy cơ hay xảy ra trong thời kì mang thai, thường gặp như tăng huyết áp, thừa cân, thiếu dinh dưỡng, bệnh lý răng miệng và đặc biệt là yếu tố di truyền (hiểu cách khác là tiền sử bệnh tật trong gia đình).',
  ),
  DataLoiKhuyen(
    9,
    'Bổ sung rau xanh, trái cây & dầu cá.',
    'Chính là nguồn bổ sung chất chống oxy hóa và chất xơ hoàn hảo cho mẹ bầu. Mẹ bầu nên lựa chọn các loại rau có màu xanh đậm, quả đu đủ, việt quất, cà chua, cá thu, cá mồi, v.v… để có thể tận dụng được nguồn chất chống oxy hóa dồi dào. Đồng thời là nguyên tố thiết yếu cho sự phát triển của não bộ và đôi mắt của thai nhi mà còn giảm nguy cơ sinh non ở bạn.',
  ),
  DataLoiKhuyen(
    10,
    'Ngăn ngừa bệnh Liên Cầu Khuẩn nhóm B.',
    'Đặc biệt nhé các mẹ có một phát hiện mới đây từ Reuters về căn bệnh Liên cầu khuẩn nhóm B: từ người mẹ sẽ xâm nhập vào cơ thể thai nhi (trong tử cung) ,từ đó gây ra các bệnh nhiếm trùng máu và viêm màng não ở bé nhưng cũng có trường hợp có thể gây chết thai.',
  ),
  DataLoiKhuyen(
    12,
    'Các mẹ bầu không nên tắm vào buổi tối.',
    'Vì như vậy sẽ ảnh hưởng không tốt lên hệ thần kinh cùa thai nhi. Nên tắm thật sớm vào buổi chiều sau khi làm xong công việc vì da lúc đang mang thai sẽ rất nhạy cảm…',
  ),
  DataLoiKhuyen(
    13,
    'Cung cấp thêm lượng Axit folic trong ngũ cốc cho thai nhi.',
    'Cần hấp thụ Axit folic có trong bánh mì, nên ưu tiên bánh mì được làm từ bột mì thô thay vì bột mì qua tinh chế, ngô, yến mạch, ngũ cốc, gạo lứt, các loại đậu, rau xanh…bổ sung dinh dưỡng cho mẹ và bé ,ngăn ngừa béo phì ở mẹ đồng thời giảm yếu tố nhẹ cân của thai nhi.',
  ),
  DataLoiKhuyen(
    14,
    'Tập một vài động tác thể dục nhẹ nhàng khi có thời gian rảnh.',
    'Khi mẹ bầu hoạt động, sự lưu thông máu sẽ ở mức cao nhất, có lợi cho sự phát triển não bộ của thai nhi.',
  ),
  DataLoiKhuyen(
    15,
    'Khẩu phần ăn là dành cho hai người.',
    'Trong thời kì mang thai các mẹ không nên có ý nghĩ nên ăn gấp đôi vì thời gian này lượng Calo đòi hỏi khoảng 15% nhưng Vitamin và khoáng chất tăng lên gấp ba lần nên bé không thể hấp thu khi mà mẹ nghĩ ăn nhiều bé sẽ nặng cân.',
  ),
  DataLoiKhuyen(
    16,
    'Cẩn thận việc đi lại, di chuyển.',
    'Các mẹ bầu luôn nhớ phải thắt dây an toàn khi đi xe hơi để tránh khỏi sự nguy hiểm cho thai nhi khi phanh gấp hoặc tai nạn.',
  ),
  DataLoiKhuyen(
    17,
    'Ăn sữa chua mỗi ngày.',
    'Trong sữa chua có chứa Probiotic rất tốt cho hệ tiêu hóa. Bên cạnh đó làm giảm sự phát triển bệnh Eczema ở trẻ sơ sinh.',
  ),
  DataLoiKhuyen(
    18,
    'Đầu óc của mẹ bầu phải được thư giản.',
    'Bởi vì bé đã gần hoàn thiện nên hệ thần kinh của bé sẽ chịu ảnh hưởng từ mẹ, chỉ khi mẹ được thoải mái đầu óc thì bé mới được phát triển khỏe mạnh hơn.',
  ),
  DataLoiKhuyen(
    19,
    'Các loại thức ăn giàu chất sắt.',
    'Rau xanh, thịt đỏ, trứng, hoa quả và bột mì. Là những nguyên tố thiết yếu cho sự cấu thành máu của thai nhi và sự phát triển của các cơ quan khác.',
  ),
  DataLoiKhuyen(
    20,
    'Cần tránh xa rượu, bia.',
    'Uống rượu, bia sẽ gây nguy hiểm cho quá trình phát triển hệ thần kinh của thai nhi trong cách ứng xử của bé sau này và làm tăng nguy cơ sảy thai và thai chết lưu.',
  ),
  DataLoiKhuyen(
    21,
    'Nên dùng thực phẩm đã được nấu chín',
    'Ăn chín-uống sôi sẽ tốt hơn cho sự tiêu hóa của dạ dày thay vì dùng các thực phẩm tái sống như: thịt tái, trứng ốp la….',
  ),
  DataLoiKhuyen(
    22,
    'Hút thuốc & khói thuốc lá',
    'Khi mang thai bà bầu không được hít khói thuốc lá mỗi ngày vì khói thuốc sẽ ảnh hưởng rất xấu tới thai nhi, dễ bị tai biến sản khoa hơn người bình thường, dễ bị sinh non, vỡ ối sớm, sinh con thiếu tháng…',
  ),
  DataLoiKhuyen(
    23,
    'Uống nước mỗi ngày khoảng 2,5 lít nước.',
    'Giai đoạn mang thai cơ thể đã thay đổi nội tiết tố nên cần nhiều nước để cung cấp cho dịch ối và sự tăng lưư lượng máu trong bào thai, cung cấp oxy và dinh dưỡng cho thai nhi.',
  ),
  DataLoiKhuyen(
    24,
    'Khám thai định kỳ.',
    'Bạn nên thành thật với bác sĩ về tình hình bệnh tật của mình để bác sĩ có thể chăm sóc sức khỏe của cả hai mẹ con. Đồng thời sẽ không đem đến nguy hiểm cho thai nhi.',
  ),
  DataLoiKhuyen(
    25,
    'Cảm cúm, ho hoặc sốt:',
    'Mẹ bầu nên đến bác sĩ để được chỉ định uống loại thuốc nào mà thai nhi được an toàn vì có một số loại thuốc có thể làm thai nhi bị kích thích như: aspirin có thể gây xảy thai,thai lưu, dị tật thai nhi…',
  ),
  DataLoiKhuyen(
    26,
    'Ăn thức ăn chứa Vitamin E có trong.',
    'Các loại hạt, rau xanh, dầu thực vật. Vitamin E giúp cho bé giảm thiểu nguy cơ bị hen suyễn, eczema, dị ứng.',
  ),
  DataLoiKhuyen(
    27,
    'Đậu phộng.',
    'Nghiên cứu của các nhà khoa học chỉ ra rằng nếu trong gia đình bạn có tiền sử mắc bệnh hen huyễn hoặc dị ứng thì bạn nên liệt kê món ăn này ra khỏi thực đơn của bạn vì nó sẽ làm bạn bị dị ứng và thai nhi trong bụng sau này cũng sẽ bị dị ứng.',
  ),
  DataLoiKhuyen(
    28,
    'Hạn chế các chất kích kích.',
    'Không nên dùng các chất kích thích có trong cà phê, rượu, bia và trà…Khi bạn có thói quen dùng chúng trong thai kì sẽ làm trẻ sinh ra bị nhẹ cân. Không hấp thụ quá 300mg/ngày (khoảng 4tách cà phê/ngày, 3 cốc cà phê đặc, 6 cốc trà).    ',
  ),
  DataLoiKhuyen(
    29,
    'Bổ sung đủ vitamin và canxi.',
    'Cần bổ sung vitamin dạng tổng hợp có trong viên sắt và canxi, để hấp thu đủ thì nên uống sau bữa ăn.',
  ),
  DataLoiKhuyen(
    30,
    'Dấu hiệu bất thường trong cơ thể.',
    'Phải theo dõi thường xuyên từ tháng mang thai đầu tiên cho đến khi sinh em bé..',
  ),
];
