-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 13, 2025 at 06:00 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quan_ao`
--

-- --------------------------------------------------------

--
-- Table structure for table `bien_the_san_pham`
--

CREATE TABLE `bien_the_san_pham` (
  `id` int NOT NULL,
  `kich_co` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gia` decimal(10,2) NOT NULL,
  `gia_giam` decimal(10,2) NOT NULL,
  `so_luong_ton` int NOT NULL DEFAULT '0',
  `san_pham_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `bien_the_san_pham`
--

INSERT INTO `bien_the_san_pham` (`id`, `kich_co`, `gia`, `gia_giam`, `so_luong_ton`, `san_pham_id`) VALUES
(1, 'S', 140000.00, 130000.00, 50, 1),
(2, 'M', 150000.00, 120000.00, 75, 1),
(3, 'L', 160000.00, 0.00, 60, 1),
(4, 'S', 310000.00, 290000.00, 30, 2),
(5, 'M', 320000.00, 0.00, 45, 2),
(6, 'L', 330000.00, 0.00, 35, 2),
(7, 'S', 430000.00, 0.00, 19, 3),
(8, 'M', 450000.00, 0.00, 30, 3),
(9, 'L', 470000.00, 0.00, 25, 3),
(10, 'S', 560000.00, 0.00, 15, 4),
(11, 'M', 580000.00, 0.00, 25, 4),
(12, 'L', 600000.00, 0.00, 18, 4),
(13, 'S', 270000.00, 0.00, 37, 5),
(14, 'M', 280000.00, 0.00, 60, 5),
(15, 'L', 290000.00, 0.00, 50, 5),
(16, 'S', 370000.00, 0.00, 48, 6),
(17, 'M', 390000.00, 0.00, 35, 6),
(18, 'L', 410000.00, 0.00, 28, 6),
(46, '28', 410000.00, 0.00, 40, 16),
(47, '30', 420000.00, 0.00, 55, 16),
(48, '32', 430000.00, 0.00, 48, 16),
(49, '29', 370000.00, 0.00, 34, 17),
(50, '31', 380000.00, 0.00, 45, 17),
(51, '33', 390000.00, 0.00, 38, 17),
(52, 'S', 155000.00, 0.00, 60, 18),
(53, 'M', 160000.00, 0.00, 80, 18),
(54, 'L', 165000.00, 0.00, 70, 18),
(55, '30', 440000.00, 0.00, 25, 19),
(56, '32', 450000.00, 0.00, 35, 19),
(57, '34', 460000.00, 0.00, 28, 19),
(58, 'S', 280000.00, 0.00, 40, 20),
(59, 'M', 290000.00, 0.00, 55, 20),
(60, 'L', 300000.00, 0.00, 45, 20),
(91, 'L', 300000.00, 0.00, 46, 21);

-- --------------------------------------------------------

--
-- Table structure for table `binh_luan`
--

CREATE TABLE `binh_luan` (
  `id` int NOT NULL,
  `san_pham_id` int DEFAULT NULL,
  `nguoi_dung_id` int DEFAULT NULL,
  `noi_dung` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `binh_luan`
--

INSERT INTO `binh_luan` (`id`, `san_pham_id`, `nguoi_dung_id`, `noi_dung`, `ngay_tao`) VALUES
(1, 1, 2, 'Áo thun mặc rất mát, form đẹp, sẽ ủng hộ shop tiếp!', '2025-11-12 11:20:05'),
(2, 2, 3, 'Sơ mi vải dày dặn, đứng form, xứng đáng với giá tiền.', '2025-11-12 11:20:05'),
(3, 16, 4, 'Quần jeans mặc thoải mái, ống suông đúng ý, 5 sao!', '2025-11-12 11:20:05'),
(4, 5, 5, 'Áo polo mặc đi chơi hay đi làm đều được, chất liệu co giãn tốt.', '2025-11-12 11:20:05'),
(5, 19, 6, 'Quần âu mặc vào rất lịch sự, không bị nhăn, giao hàng nhanh.', '2025-11-12 11:20:05'),
(8, 20, 9, 'Quần jogger mềm, mua về mặc ở nhà rất thích.', '2025-11-12 11:20:05'),
(9, 3, 10, 'Áo hoodie hơi mỏng so với mình tưởng tượng, nhưng màu đẹp.', '2025-11-12 11:20:05'),
(10, 4, 1, 'Khoác bomber form hơi rộng, nên lùi size.', '2025-11-12 11:20:05'),
(11, 17, 2, 'Quần kaki chất vải hơi cứng, giặt lần đầu thấy đỡ hơn.', '2025-11-12 11:20:05'),
(13, 6, 4, 'Áo len không lỗi gì, nhưng màu be hơi khác so với ảnh.', '2025-11-12 11:20:05'),
(17, 1, 8, 'Mua lần thứ hai, vẫn rất hài lòng về chất lượng áo thun.', '2025-11-12 11:20:05'),
(18, 5, 9, 'Áo polo đúng size M, màu xanh lá rất đẹp.', '2025-11-12 11:20:05'),
(19, 16, 10, 'Jeans suông phối với áo thun rất chuẩn phong cách.', '2025-11-12 11:20:05'),
(20, 19, 1, 'Quần âu form slim fit, rất tôn dáng.', '2025-11-12 11:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id` int NOT NULL,
  `don_hang_id` int DEFAULT NULL,
  `san_pham_id` int DEFAULT NULL,
  `bien_the_id` int DEFAULT NULL,
  `mau_sac_id` int DEFAULT NULL,
  `so_luong` int NOT NULL,
  `gia` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id`, `don_hang_id`, `san_pham_id`, `bien_the_id`, `mau_sac_id`, `so_luong`, `gia`) VALUES
(31, 30, 5, 14, 11, 1, 280000),
(32, 31, 17, 49, 34, 1, 370000),
(34, 33, 1, 1, 1, 1, 140000),
(36, 35, 5, 13, 11, 1, 270000),
(44, 43, 5, 13, 11, 1, 270000),
(45, 44, 17, 49, 33, 1, 370000),
(46, 45, 3, 7, 6, 1, 430000),
(55, 53, 6, 16, 13, 1, 370000);

-- --------------------------------------------------------

--
-- Table structure for table `danh_gia`
--

CREATE TABLE `danh_gia` (
  `id` int NOT NULL,
  `san_pham_id` int DEFAULT NULL,
  `nguoi_dung_id` int DEFAULT NULL,
  `diem_danh_gia` int DEFAULT NULL,
  `noi_dung_danh_gia` text COLLATE utf8mb3_unicode_ci,
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `danh_gia`
--

INSERT INTO `danh_gia` (`id`, `san_pham_id`, `nguoi_dung_id`, `diem_danh_gia`, `noi_dung_danh_gia`, `ngay_tao`) VALUES
(1, 1, 11, 5, 'Chất liệu áo thun tuyệt vời, giặt không bai xù. Rất hài lòng.', '2025-11-12 11:20:31'),
(2, 5, 3, 5, 'Áo polo mặc đi tập rất thoải mái, thấm hút mồ hôi nhanh.', '2025-11-12 11:20:31'),
(3, 16, 4, 5, 'Quần jeans form đẹp, đúng size, giao hàng đóng gói cẩn thận.', '2025-11-12 11:20:31'),
(4, 19, 5, 5, 'Quần âu mặc lên đứng dáng, không cần là ủi nhiều, tiện lợi.', '2025-11-12 11:20:31'),
(7, 1, 8, 4, 'Áo basic ổn, nhưng giao hàng hơi chậm hơn dự kiến 1 ngày.', '2025-11-12 11:20:31'),
(8, 2, 9, 4, 'Sơ mi ổn, nhưng phần cổ áo hơi cứng một chút.', '2025-11-12 11:20:31'),
(9, 17, 10, 4, 'Quần kaki chất lượng, nhưng đường may ở túi quần chưa hoàn hảo.', '2025-11-12 11:20:31'),
(10, 3, 1, 4, 'Áo hoodie đẹp, nhưng lớp nỉ bên trong chưa thật sự mềm mịn.', '2025-11-12 11:20:31'),
(12, 4, 3, 3, 'Khoác bomber form hơi rộng so với mô tả, phải mang đi sửa.', '2025-11-12 11:20:31'),
(14, 6, 5, 2, 'Áo len bị xù lông nhẹ sau lần giặt đầu tiên, thất vọng.', '2025-11-12 11:20:31'),
(16, 1, 11, 4, 'fffffff', '2025-12-08 05:08:40'),
(17, 1, 11, 4, 'fffffff', '2025-12-08 05:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` int NOT NULL,
  `ten_danh_muc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mo_ta` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `ten_danh_muc`, `hinh_anh`, `mo_ta`) VALUES
(1, 'Áo', 'https://example.com/images/ao.jpg', 'Các loại áo thun, sơ mi, khoác.'),
(2, 'Quần', 'https://example.com/images/quan.jpg', 'Các loại quần jeans, kaki, short.');

-- --------------------------------------------------------

--
-- Table structure for table `don_hang`
--

CREATE TABLE `don_hang` (
  `id` int NOT NULL,
  `tong_tien` decimal(10,2) NOT NULL,
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP,
  `trang_thai_thanh_toan` enum('chưa thanh toán','chờ thanh toán','đã thanh toán','Hoàn tiền') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'chưa thanh toán',
  `nguoi_dung_id` int DEFAULT NULL,
  `phuong_thuc_van_chuyen_id` int DEFAULT NULL,
  `phuong_thuc_thanh_toan_id` int DEFAULT NULL,
  `ma_giam_gia_id` int DEFAULT NULL,
  `ghi_chu` text COLLATE utf8mb3_unicode_ci,
  `ho_ten` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `so_dien_thoai` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dia_chi` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `don_hang`
--

INSERT INTO `don_hang` (`id`, `tong_tien`, `ngay_tao`, `trang_thai_thanh_toan`, `nguoi_dung_id`, `phuong_thuc_van_chuyen_id`, `phuong_thuc_thanh_toan_id`, `ma_giam_gia_id`, `ghi_chu`, `ho_ten`, `email`, `so_dien_thoai`, `dia_chi`) VALUES
(30, 310000.00, '2025-12-13 10:03:34', 'chưa thanh toán', 18, 1, 1, NULL, '', 'Khá Bảnh', 'nguyenthediem2004@gmail.com', '0332477688', 'khong biết'),
(31, 400000.00, '2025-12-13 10:03:51', 'chưa thanh toán', 18, 1, 1, NULL, '', 'Khá Bảnh', 'nguyenthediem2004@gmail.com', '0332477688', 'khong biết'),
(33, 170000.00, '2025-12-13 10:04:57', 'chưa thanh toán', 18, 1, 1, NULL, '', 'Khá Bảnh', 'nguyenthediem2004@gmail.com', '0332477688', 'khongbiet'),
(35, 300000.00, '2025-12-13 14:56:41', 'đã thanh toán', 18, 1, 3, NULL, '', 'Khá Bảnh', 'nguyenthediem2004@gmail.com', '0332477688', 'khongbiet'),
(43, 300000.00, '2025-12-13 15:52:12', 'đã thanh toán', 18, 1, 1, NULL, '', 'Khá Bảnh', 'nguyenthediem2004@gmail.com', '0332477688', 'khong biết'),
(44, 400000.00, '2025-12-13 15:53:19', 'đã thanh toán', 18, 1, 1, NULL, '', 'Khá Bảnh', 'nguyenthediem2004@gmail.com', '0332477688', 'khong biết'),
(45, 460000.00, '2025-12-13 15:57:20', 'chưa thanh toán', 18, 1, 1, NULL, '', 'Khá Bảnh', 'nguyenthediem2004@gmail.com', '0332477688', 'khong biết'),
(53, 289000.00, '2025-12-13 17:45:26', 'đã thanh toán', 18, 1, 3, 4, '', 'Khá Bảnh', 'nguyenthediem2004@gmail.com', '0332477688', 'khong biết');

-- --------------------------------------------------------

--
-- Table structure for table `mau_sac_san_pham`
--

CREATE TABLE `mau_sac_san_pham` (
  `id` int NOT NULL,
  `san_pham_id` int DEFAULT NULL,
  `ten_mau` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hinh_anh_mau` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ma_mau` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `mau_sac_san_pham`
--

INSERT INTO `mau_sac_san_pham` (`id`, `san_pham_id`, `ten_mau`, `hinh_anh_mau`, `ma_mau`) VALUES
(1, 1, 'Trắng', 'https://cdn.hstatic.net/products/1000184601/women_trang__54__e5d962de3f7e4276850bc972da179fa7_2048x2048.jpg', '#FFFFFF'),
(2, 1, 'Đen', 'https://product.hstatic.net/1000184601/product/1325_den_1c21db1bf8bc461893192584a33c218a_master.png', '#000000'),
(3, 1, 'Xám', 'https://caferacershop.vn/wp-content/uploads/2023/03/basic-tee-white-2.jpg', '#808080'),
(4, 2, 'Trắng', 'https://cdn0199.cdn4s.com/media/542%20tr%E1%BA%AFng.jpg', '#FFFFFF'),
(5, 2, 'Xanh Da Trời', 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liu4n2sl5lhode', '#1E90FF '),
(6, 3, 'Đen', 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsp1936zxaysd6', '#000000'),
(7, 3, 'Xám Tro', 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lluhegf7hk2nd1', '#36454F'),
(8, 4, 'Xanh Navy', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/01/ao-khoac-nam-michael-kors-mk-men-s-bomber-jacket-mk28288-mau-xanh-navy-size-s-65b0840a92b36-24012024102914.jpg', '#000080'),
(9, 4, 'Đỏ Đô', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/11/ao-khoac-nam-calvin-klein-ck-matte-bomber-jacket-40fm512601-mau-do-do-size-s-673d7ebc2771e-20112024131628.jpg', '#8B0000'),
(10, 5, 'Trắng', 'https://tse3.mm.bing.net/th/id/OIP.RpS-LDpZYLkyGnMb6zwrcAHaHa?pid=Api&P=0&h=180', '#FFFFFF'),
(11, 5, 'Xanh Lá', 'https://bulbal.vn/wp-content/uploads/2022/09/AO-POLO-THE-THAO-BULBAL-POLO-FUTURO-XAM-1-scaled.jpg', '#00FF00'),
(12, 5, 'Đen', 'https://bulbal.vn/wp-content/uploads/2022/11/AO-POLO-THE-THAO-NAM-BULBAL-NEO-DEN-1-scaled.jpg', '#000000'),
(13, 6, 'Be', 'https://pos.nvncdn.com/494dd6-88815/art/20220628_dpeZ10WfBLZohPQaEroZc646.png', '#F5F5DC'),
(14, 6, 'Nâu', 'https://4men.com.vn/images/thumbs/2019/12/ao-len-co-lo-tron-mau-bo-al124-14857-slide-products-5df090895d544.jpg', '#A0522D'),
(32, 16, 'Xanh Nhạt', 'https://tse1.mm.bing.net/th/id/OIP.-DtTXpuFbmYV3QFU3Vz8HgHaLH?pid=Api&P=0&h=180', '#BDE4F0 '),
(33, 17, 'Kem', 'https://hd1.hotdeal.vn/images/uploads/2016/01/27/228338/228338-quan-kaki-nam-ong-suong-body%20(6).jpg', '#F5EFD6'),
(34, 17, 'Be', 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lh8kpygi9wxfe2', '#F5F5DC '),
(35, 18, 'Đen', 'https://product.hstatic.net/200000419153/product/quan-short-nam-2-lop-reeta__4__abf1d9c6842a4516ba5dd8c02ed77781_master.jpg', '#000000'),
(36, 18, 'Ghi Sáng', 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m5qoa5k9gh1z1f', '#FBF5E8'),
(37, 19, 'Đen', 'https://cf.shopee.vn/file/7d40028e8b1b11243d17daed7c7983b1', '#000000'),
(38, 19, 'Xanh Than', 'https://dongphuchaianh.vn/wp-content/uploads/2022/06/san-pham-ao-quan-au-nam-8.jpg', '#0F2B3A'),
(39, 20, 'Xám', 'https://tse2.mm.bing.net/th/id/OIP.SC9cUl2v8Xh-c-yDoKtW3gHaJ4?pid=Api&P=0&h=180', '#6B6B6B'),
(40, 20, 'Đen', 'https://joggerstore.vn/wp-content/uploads/2021/06/hieuunganh.com_600141fb6e27c.png', '#000000'),
(41, 21, 'Đen', 'https://saigonsneaker.com/wp-content/uploads/2021/10/Quan-Baggy-Jean-Nam-Ong-Rong-Den-1.jpg', '#000000');

-- --------------------------------------------------------

--
-- Table structure for table `ma_giam_gia`
--

CREATE TABLE `ma_giam_gia` (
  `id` int NOT NULL,
  `ma` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `phan_tram_giam` int DEFAULT NULL,
  `trang_thai` enum('hoat_dong','ngung_hoat_dong') COLLATE utf8mb3_unicode_ci DEFAULT 'hoat_dong',
  `so_luong` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `ma_giam_gia`
--

INSERT INTO `ma_giam_gia` (`id`, `ma`, `ngay_bat_dau`, `ngay_ket_thuc`, `phan_tram_giam`, `trang_thai`, `so_luong`) VALUES
(1, 'SALE15', '2025-11-01', '2025-12-31', 15, 'hoat_dong', 0),
(2, 'VIP20', '2025-11-10', '2025-11-30', 20, 'hoat_dong', 50),
(3, 'OLDCOUPON', '2025-09-01', '2025-10-31', 10, 'ngung_hoat_dong', 10),
(4, 'BIG30', '2025-11-12', '2025-12-16', 30, 'hoat_dong', 8),
(5, 'QUICK5', '2025-11-01', '2025-11-15', 5, 'hoat_dong', 10);

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id` int NOT NULL,
  `ho_ten` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mat_khau` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dia_chi` text COLLATE utf8mb3_unicode_ci,
  `so_dien_thoai` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `vai_tro` enum('admin','khach_hang') COLLATE utf8mb3_unicode_ci DEFAULT 'khach_hang',
  `hinh_anh` varchar(2555) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `ho_ten`, `email`, `mat_khau`, `dia_chi`, `so_dien_thoai`, `vai_tro`, `hinh_anh`) VALUES
(1, 'Quản Trị Viên', 'admin@shop.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Hà Nội', '0901000111', 'admin', NULL),
(2, 'Nguyễn Văn A', 'vana@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'TP Hồ Chí Minh', '0902000222', 'khach_hang', NULL),
(3, 'Trần Thị B', 'thib@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Đà Nẵng', '0903000333', 'khach_hang', NULL),
(4, 'Lê Hoàng C', 'hoangc@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Hải Phòng', '0904000444', 'khach_hang', NULL),
(5, 'Phạm Thu D', 'thud@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Cần Thơ', '0905000555', 'khach_hang', NULL),
(6, 'Võ Minh E', 'minhe@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Huế', '0906000666', 'khach_hang', NULL),
(7, 'Đặng Quốc F', 'quocf@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Nha Trang', '0907000777', 'khach_hang', NULL),
(8, 'Bùi Tố G', 'tog@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Biên Hòa', '0908000888', 'khach_hang', NULL),
(9, 'Hồ Anh H', 'anhh@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Vũng Tàu', '0909000999', 'khach_hang', NULL),
(10, 'Mai Kim I', 'kimi@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Bình Dương', '0910001000', 'khach_hang', NULL),
(11, 'diemne', 'diem@gmail.com', '123456789', 'qwertyergmngnkgklrgkler', '0332477689', 'khach_hang', './public/img/avatar_11_1764943184.jpg'),
(13, 'Hello', 'diemdepchai@gmail.com', '123456789', 'campuchia', '0332477688', 'admin', './public/img/avatar_13_1764923506.jpg'),
(14, '', '', '', NULL, '', 'khach_hang', NULL),
(16, 'ffffffffffffff', 'ffff@gmail.com', '123', NULL, '0332477688', 'khach_hang', NULL),
(17, 'ffffffffffffff', 'fff@gmail.com', '123', NULL, '0332477688', 'khach_hang', NULL),
(18, 'Khá Bảnh', 'nguyenthediem2004@gmail.com', '123456', '', '0332477688', 'admin', './public/img/avatar_18_1765354845.jpg'),
(19, 'Điểm', 'nguyenthediem27@gmail.com', '123', NULL, '0332477688', 'khach_hang', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(20) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `otp`, `expires_at`, `used`, `created_at`) VALUES
(1, 'nguyenthediem2004@gmail.com', '349425', '2025-12-09 20:16:58', 0, '2025-12-09 20:01:58'),
(2, 'nguyenthediem2004@gmail.com', '828376', '2025-12-09 20:17:32', 1, '2025-12-09 20:02:32'),
(3, 'nguyenthediem2004@gmail.com', '841721', '2025-12-10 04:41:22', 1, '2025-12-10 04:26:22'),
(4, 'nguyenthediem2004@gmail.com', '456018', '2025-12-10 04:42:23', 1, '2025-12-10 04:27:23'),
(5, 'nguyenthediem2004@gmail.com', '791558', '2025-12-10 07:03:21', 0, '2025-12-10 06:48:21'),
(6, 'nguyenthediem2004@gmail.com', '312134', '2025-12-10 07:04:13', 1, '2025-12-10 06:49:13'),
(7, 'nguyenthediem2004@gmail.com', '513436', '2025-12-10 08:20:44', 1, '2025-12-10 08:05:44'),
(8, 'nguyenthediem2004@gmail.com', '740767', '2025-12-10 08:54:43', 0, '2025-12-10 08:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `phuong_thuc_thanh_toan`
--

CREATE TABLE `phuong_thuc_thanh_toan` (
  `id` int NOT NULL,
  `ten_phuong_thuc` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `phuong_thuc_thanh_toan`
--

INSERT INTO `phuong_thuc_thanh_toan` (`id`, `ten_phuong_thuc`, `mo_ta`) VALUES
(1, 'Thanh Toán Khi Nhận Hàng (COD)', 'Thanh toán tiền mặt cho nhân viên giao hàng.'),
(3, 'vnpay', 'Thanh toán qua Momo, ZaloPay, hoặc VNPay.');

-- --------------------------------------------------------

--
-- Table structure for table `phuong_thuc_van_chuyen`
--

CREATE TABLE `phuong_thuc_van_chuyen` (
  `id` int NOT NULL,
  `ten_phuong_thuc` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phi_van_chuyen` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mo_ta` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `phuong_thuc_van_chuyen`
--

INSERT INTO `phuong_thuc_van_chuyen` (`id`, `ten_phuong_thuc`, `phi_van_chuyen`, `mo_ta`) VALUES
(1, 'Giao Hàng Tiêu Chuẩn', 30000.00, 'Thời gian giao hàng từ 3-5 ngày làm việc.'),
(2, 'Giao Hàng Nhanh', 55000.00, 'Thời gian giao hàng từ 1-2 ngày làm việc.');

-- --------------------------------------------------------

--
-- Table structure for table `san_pham`
--

CREATE TABLE `san_pham` (
  `id` int NOT NULL,
  `ten_san_pham` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mo_ta` text COLLATE utf8mb3_unicode_ci,
  `trang_thai` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `danh_muc_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `san_pham`
--

INSERT INTO `san_pham` (`id`, `ten_san_pham`, `hinh_anh`, `mo_ta`, `trang_thai`, `danh_muc_id`) VALUES
(1, 'Áo ngắn tay PS46461 ', 'ao (37).webp', 'Áo thun cotton 100%, thoáng mát, phù hợp hàng ngày.', 'còn hàng', 1),
(2, 'Áo Sơ Mi Oxford Trắng', 'ao (8).png', 'Sơ mi dài tay vải Oxford cao cấp, lịch sự.', 'còn hàng', 1),
(3, 'Áo sơ mi tay ngắn ZN5723', 'ao (5).webp', 'Chất liệu nỉ bông dày dặn, giữ ấm tốt.', 'còn hàng', 1),
(4, 'Áo sơ mi tay ngắn 23023NA', 'ao (27).webp', 'Khoác ngoài phong cách Bomber, chống gió nhẹ.', 'còn hàng', 1),
(5, 'Áo chấm đen 23423N1', 'ao (9).webp', 'Áo Polo vải cá sấu co giãn 4 chiều.', 'còn hàng', 1),
(6, 'Áo tay ngắn 32934L', 'ao (13).png', 'Áo len dệt kim, phong cách Hàn Quốc.', 'còn hàng', 1),
(16, 'Quần tây dài 238434N0', 'ao (9).png', 'Jeans denim 100%, không co giãn, ống suông.', 'còn hàng', 2),
(17, 'Quần tây dài 232421N', 'ao (10).png', 'Chất liệu Kaki dày dặn, phong cách công sở.', 'còn hàng', 2),
(18, 'Quần tây dài 93483KA', 'image 24@2x.png', 'Quần short tập luyện, có lớp lót bên trong.', 'còn hàng', 2),
(19, 'Quần tây dài 305635LLA', 'image 26.png', 'Quần tây chất liệu cao cấp, chống nhăn.', 'còn hàng', 2),
(20, 'Quần tây dài 12424MN ', 'ao (11).png', 'Quần jogger bo gấu, thoải mái vận động.', 'còn hàng', 2),
(21, 'Quần Tây dài h 232577LA', 'ao (12).png', 'Kiểu dáng Baggy trẻ trung, dễ phối đồ.', 'còn hàng', 2);

-- --------------------------------------------------------

--
-- Table structure for table `san_pham_yeu_thich`
--

CREATE TABLE `san_pham_yeu_thich` (
  `id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `nguoi_dung_id` int NOT NULL,
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `san_pham_yeu_thich`
--

INSERT INTO `san_pham_yeu_thich` (`id`, `san_pham_id`, `nguoi_dung_id`, `ngay_tao`) VALUES
(22, 20, 18, '2025-12-13 10:14:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bien_the_san_pham`
--
ALTER TABLE `bien_the_san_pham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `san_pham_id` (`san_pham_id`);

--
-- Indexes for table `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `san_pham_id` (`san_pham_id`),
  ADD KEY `nguoi_dung_id` (`nguoi_dung_id`);

--
-- Indexes for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `don_hang_id` (`don_hang_id`),
  ADD KEY `bien_the_id` (`bien_the_id`);

--
-- Indexes for table `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `san_pham_id` (`san_pham_id`),
  ADD KEY `nguoi_dung_id` (`nguoi_dung_id`);

--
-- Indexes for table `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `khach_hang_id` (`nguoi_dung_id`),
  ADD KEY `phuong_thuc_van_chuyen_id` (`phuong_thuc_van_chuyen_id`),
  ADD KEY `phuong_thuc_thanh_toan_id` (`phuong_thuc_thanh_toan_id`),
  ADD KEY `ma_giam_gia_id` (`ma_giam_gia_id`);

--
-- Indexes for table `mau_sac_san_pham`
--
ALTER TABLE `mau_sac_san_pham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `san_pham_id` (`san_pham_id`);

--
-- Indexes for table `ma_giam_gia`
--
ALTER TABLE `ma_giam_gia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ma` (`ma`);

--
-- Indexes for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phuong_thuc_thanh_toan`
--
ALTER TABLE `phuong_thuc_thanh_toan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phuong_thuc_van_chuyen`
--
ALTER TABLE `phuong_thuc_van_chuyen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `danh_muc_id` (`danh_muc_id`);

--
-- Indexes for table `san_pham_yeu_thich`
--
ALTER TABLE `san_pham_yeu_thich`
  ADD PRIMARY KEY (`id`),
  ADD KEY `san_pham_id` (`san_pham_id`),
  ADD KEY `nguoi_dung_id` (`nguoi_dung_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bien_the_san_pham`
--
ALTER TABLE `bien_the_san_pham`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `binh_luan`
--
ALTER TABLE `binh_luan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `danh_gia`
--
ALTER TABLE `danh_gia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `mau_sac_san_pham`
--
ALTER TABLE `mau_sac_san_pham`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `ma_giam_gia`
--
ALTER TABLE `ma_giam_gia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `phuong_thuc_thanh_toan`
--
ALTER TABLE `phuong_thuc_thanh_toan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `phuong_thuc_van_chuyen`
--
ALTER TABLE `phuong_thuc_van_chuyen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `san_pham_yeu_thich`
--
ALTER TABLE `san_pham_yeu_thich`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bien_the_san_pham`
--
ALTER TABLE `bien_the_san_pham`
  ADD CONSTRAINT `bien_the_san_pham_ibfk_1` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`);

--
-- Constraints for table `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`),
  ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`);

--
-- Constraints for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `chi_tiet_don_hang_ibfk_1` FOREIGN KEY (`don_hang_id`) REFERENCES `don_hang` (`id`),
  ADD CONSTRAINT `chi_tiet_don_hang_ibfk_2` FOREIGN KEY (`bien_the_id`) REFERENCES `bien_the_san_pham` (`id`);

--
-- Constraints for table `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD CONSTRAINT `danh_gia_ibfk_1` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`),
  ADD CONSTRAINT `danh_gia_ibfk_2` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`);

--
-- Constraints for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `don_hang_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`),
  ADD CONSTRAINT `don_hang_ibfk_2` FOREIGN KEY (`phuong_thuc_van_chuyen_id`) REFERENCES `phuong_thuc_van_chuyen` (`id`),
  ADD CONSTRAINT `don_hang_ibfk_3` FOREIGN KEY (`phuong_thuc_thanh_toan_id`) REFERENCES `phuong_thuc_thanh_toan` (`id`),
  ADD CONSTRAINT `don_hang_ibfk_4` FOREIGN KEY (`ma_giam_gia_id`) REFERENCES `ma_giam_gia` (`id`);

--
-- Constraints for table `mau_sac_san_pham`
--
ALTER TABLE `mau_sac_san_pham`
  ADD CONSTRAINT `mau_sac_san_pham_ibfk_1` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`);

--
-- Constraints for table `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`danh_muc_id`) REFERENCES `danh_muc` (`id`);

--
-- Constraints for table `san_pham_yeu_thich`
--
ALTER TABLE `san_pham_yeu_thich`
  ADD CONSTRAINT `san_pham_yeu_thich_ibfk_1` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `san_pham_yeu_thich_ibfk_2` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
