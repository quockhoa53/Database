-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th12 25, 2024 lúc 02:04 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `memories`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DANHSACHKINIEM` (IN `P_ID_KH` INT)   BEGIN
    DECLARE V_ID_KN INT;
    
    SELECT ID_KN INTO V_ID_KN
    FROM chitietkiniem
    WHERE ID_KH = P_ID_KH
    LIMIT 1;
    
    SELECT * FROM kiniem
    WHERE ID_KN = V_ID_KN;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DANHSACH_ANHKINIEM` (IN `P_ID_KN` INT)   BEGIN
    SELECT AKN.* FROM anhkiniem AKN
    INNER JOIN chitietanhkiniem CTAKN ON AKN.ID_ANH = CTAKN.ID_ANH
    INNER JOIN kiniem KN ON KN.ID_KN = CTAKN.ID_KN
    WHERE KN.ID_KN = P_ID_KN AND KN.TRANGTHAIXOA = 0 AND AKN.TRANGTHAIXOA = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DANHSACH_NGUOIDUNG_CHUNGKINIEM` (IN `P_ID_KN` INT)   BEGIN
	SELECT KH.* FROM khachhang KH
    INNER JOIN chitietkiniem CTKN
    ON KH.ID_KH = CTKN.ID_KH
    WHERE CTKN.ID_KN = P_ID_KN;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_HUYHENHO` (IN `P_ID_KH1` INT, IN `P_ID_KH2` INT)   BEGIN
   DECLARE V_ID_HH INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;

    SELECT ID_HH INTO V_ID_HH 
    FROM KHACHHANG 
    WHERE ID_KH = P_ID_KH1;
    
    UPDATE khachhang
    SET ID_HH = NULL
    WHERE ID_KH = P_ID_KH1 OR ID_KH = P_ID_KH2;
    
    UPDATE HENHO 
    SET TRANGTHAI = 0 
    WHERE ID_HH = V_ID_HH;
    
    UPDATE KINIEM 
    SET TRANGTHAIXOA = 1
    WHERE ID_KN IN (
        SELECT ID_KN 
        FROM CHITIETKINIEM 
        WHERE ID_KH = P_ID_KH1 OR ID_KH = P_ID_KH2
    );

    COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SETHENHO` (IN `P_MAKH` VARCHAR(10), IN `P_ID_TK` INT, IN `P_NGAYHENHO` DATE)   BEGIN
	DECLARE V_ID_HH INT;
	DECLARE TT INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    SELECT TRANGTHAI INTO TT FROM HENHO WHERE ID_HH = (SELECT ID_HH FROM KHACHHANG WHERE MAKH = P_MAKH);
    IF TT IS NULL OR TT != 1 THEN
        INSERT INTO HENHO (NGAYHENHO, TRANGTHAI) 
        VALUES (P_NGAYHENHO, 1);

        SET V_ID_HH = LAST_INSERT_ID();
        
        UPDATE KHACHHANG
        SET ID_HH = V_ID_HH
        WHERE ID_TK = P_ID_TK OR MAKH = P_MAKH;
    END IF;

    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TACA_ANHKINIEM` (IN `P_KH1` INT, IN `P_KH2` INT)   BEGIN
    SELECT KN.ID_KN, AKN.ID_ANH, AKN.TENANH
    FROM anhkiniem AKN
    INNER JOIN chitietanhkiniem CTAKN ON AKN.ID_ANH = CTAKN.ID_ANH
    INNER JOIN kiniem KN ON KN.ID_KN = CTAKN.ID_KN
    WHERE KN.ID_KN IN (
        SELECT ID_KN 
        FROM CHITIETKINIEM 
        WHERE ID_KH = P_KH1 OR ID_KH = P_KH2
    ) AND KN.TRANGTHAIXOA = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_THEMKINIEM` (IN `P_ID_KH` INT, IN `P_ID_KH_1` INT, IN `P_TENKINIEM` VARCHAR(100), IN `P_NGAYKINIEM` DATE, IN `P_MOTA` TEXT)   BEGIN
    DECLARE V_NGUOIVIET VARCHAR(51);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    SELECT HOTEN INTO V_NGUOIVIET FROM khachhang WHERE ID_KH = P_ID_KH;
    
    INSERT INTO kiniem (TENKINIEM, NGAYKINIEM, MOTA, NGUOIVIET) 
    VALUES (P_TENKINIEM, P_NGAYKINIEM, P_MOTA, V_NGUOIVIET);
    
    SET @last_id = LAST_INSERT_ID();

    INSERT INTO chitietkiniem (ID_KH, ID_KN)
    VALUES (P_ID_KH, @last_id), (P_ID_KH_1, @last_id);

    COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIMKIEM` (IN `STRING` TEXT, IN `P_ID_KH` INT)   BEGIN
    DECLARE QUERY TEXT;
    SET QUERY = CONCAT('%', STRING, '%');
    SELECT KN.ID_KN AS ID, KN.TENKINIEM AS TIEUDE, KN.MOTA AS NOIDUNG, KN.NGAYKINIEM AS NGAY FROM kiniem KN
    INNER JOIN chitietkiniem CTKN ON CTKN.ID_KN = KN.ID_KN
    INNER JOIN khachhang KH ON KH.ID_KH = CTKN.ID_KH
    WHERE KN.TENKINIEM LIKE QUERY AND KN.TRANGTHAIXOA = 0 AND KH.ID_KH = P_ID_KH
    UNION
    SELECT NK.ID_NK, NK.TIEUDE, NK.NOIDUNG, NK.NGAYVIET FROM nhatky NK
    INNER JOIN khachhang KH ON KH.ID_KH = NK.ID_KH
    WHERE NK.TIEUDE LIKE QUERY AND NK.TRANGTHAIXOA = 0 AND KH.ID_KH = P_ID_KH;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIMNGUOIHENHO` (IN `p_EMAIL` VARCHAR(100))   BEGIN
    DECLARE v_ID_TK INT;
    DECLARE v_ID_HH INT;
    DECLARE v_TRANGTHAI BIT;

    SELECT ID_TK INTO v_ID_TK FROM TAIKHOAN WHERE EMAIL = p_EMAIL;
    SELECT ID_HH INTO v_ID_HH FROM KHACHHANG WHERE ID_TK = v_ID_TK;
    SELECT TRANGTHAI INTO v_TRANGTHAI FROM HENHO WHERE ID_HH = v_ID_HH;

    IF v_TRANGTHAI = 1 THEN
        SELECT * FROM KHACHHANG WHERE ID_HH = v_ID_HH AND ID_TK <> v_ID_TK;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_XOACAUHOIGAME` (IN `P_ID_CH` INT)   BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    DELETE FROM danhsachcautraloi WHERE ID_CH = P_ID_CH;
    DELETE FROM CAUHOI WHERE ID_CH = P_ID_CH;
    COMMIT;
END$$

--
-- Các hàm
--
CREATE DEFINER=`root`@`localhost` FUNCTION `SP_KIEMTRA_MAKH` (`P_MAKH` VARCHAR(10)) RETURNS INT(11)  BEGIN
    DECLARE TT INT;
    IF EXISTS (SELECT MAKH FROM KHACHHANG WHERE MAKH = P_MAKH) THEN
        SELECT TRANGTHAI INTO TT 
        FROM HENHO 
        WHERE ID_HH = (SELECT ID_HH FROM KHACHHANG WHERE MAKH = P_MAKH);
        
        IF TT = 1 THEN
            RETURN 0;
        ELSE
            RETURN 1;
        END IF;
    ELSE
        RETURN 0;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `anhkiniem`
--

CREATE TABLE `anhkiniem` (
  `ID_ANH` int(11) NOT NULL,
  `TENANH` text NOT NULL,
  `TRANGTHAIXOA` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `anhkiniem`
--

INSERT INTO `anhkiniem` (`ID_ANH`, `TENANH`, `TRANGTHAIXOA`) VALUES
(102, 'upload/VT1voieiu.jpg', 0),
(103, 'upload/VT2voieiu.jpg', 0),
(104, 'upload/VT3voieiu.jpg', 0),
(105, 'upload/VT4voieiu.jpg', 0),
(106, 'upload/VT5voieiu.jpg', 0),
(107, 'upload/VT6voieiu.jpg', 0),
(108, 'upload/VT7voieiu.jpg', 0),
(109, 'upload/VT8voieiu.jpg', 0),
(110, 'upload/deadline1.jpg', 0),
(111, 'upload/deadline2.jpg', 0),
(112, 'upload/deadline3.jpg', 1),
(113, 'upload/deadline4.jpg', 0),
(114, 'upload/deadline5.jpg', 0),
(115, 'upload/deadline6.jpg', 0),
(116, 'upload/deadline7.jpg', 0),
(117, 'upload/deadline8.jpg', 0),
(118, 'upload/cute1.jpg', 0),
(119, 'upload/cute2.jpg', 0),
(120, 'upload/cute3.jpg', 0),
(121, 'upload/cute4.jpg', 0),
(122, 'upload/cute5.jpg', 0),
(123, 'upload/cute6.jpg', 1),
(124, 'upload/cute7.jpg', 0),
(125, 'upload/cute8.jpg', 0),
(126, 'upload/cute9.jpg', 0),
(127, 'upload/cute1.jpg', 0),
(128, 'upload/cute2.jpg', 0),
(129, 'upload/cute3.jpg', 0),
(130, 'upload/cute4.jpg', 0),
(131, 'upload/cute5.jpg', 0),
(132, 'upload/cute6.jpg', 0),
(133, 'upload/cute7.jpg', 0),
(134, 'upload/cute8.jpg', 0),
(135, 'upload/cute9.jpg', 0),
(136, 'upload/avatarboycute.jpg', 0),
(137, 'upload/avatargirlcute.png', 0),
(138, 'upload/posteranabell.webp', 0),
(139, 'upload/VT8voieiu.jpg', 1),
(140, 'upload/z5554651430901_4103ce95cf399a77174f2494ad58badf.jpg', 0),
(141, 'upload/z5570823561090_6da5ab03d51d8fadf447fe044ef72d61.jpg', 0),
(142, 'upload/z5570823563198_f4c15037dfbaf48f2c4967b1e4e1ecd4.jpg', 0),
(143, 'upload/z5570823568087_771e9a52be490bd0c89e8d3236df132d.jpg', 0),
(144, 'upload/z5570823568123_3a941beb809fdd3e34520ffbdd6ceb2d.jpg', 0),
(145, 'upload/z5666513548650_b713c938966e2c8716581d4703c9085d.jpg', 1),
(146, 'upload/z5666513550321_804f503fb82b2ada8a3d4935cfbd1e31.jpg', 0),
(147, 'upload/1phut.jpg', 0),
(148, 'upload/avatarboycute.jpg', 0),
(149, 'upload/avatargirlcute.png', 0),
(150, 'upload/background_login.png', 0),
(151, 'upload/avatarboycute.jpg', 1),
(152, 'upload/avatargirlcute.png', 1),
(153, 'upload/avatarboycute.jpg', 0),
(154, 'upload/avatargirlcute.png', 0),
(155, 'upload/account.jpg', 1),
(156, 'upload/chonve.jpg', 1),
(157, 'upload/datve1.jpg', 1),
(158, 'upload/datve2.jpg', 1),
(159, 'upload/account.jpg', 1),
(160, 'upload/chonve.jpg', 1),
(161, 'upload/datve1.jpg', 1),
(162, 'upload/datve2.jpg', 0),
(163, 'upload/doimatkhau.jpg', 1),
(164, 'upload/foot.jpg', 0),
(165, 'upload/1.png', 0),
(166, 'upload/3.png', 0),
(167, 'upload/account.jpg', 0),
(168, 'upload/chonve.jpg', 0),
(169, 'upload/tablecontent.png', 1),
(170, 'upload/thanhtoan.jpg', 0),
(171, 'upload/tinhcam.png', 1),
(172, 'upload/account.jpg', 0),
(173, 'upload/chonve.jpg', 0),
(174, 'upload/datve1.jpg', 0),
(175, 'upload/datve2.jpg', 0),
(176, 'upload/doimatkhau.jpg', 0),
(177, 'upload/foot.jpg', 1),
(178, 'upload/forget.jpg', 0),
(179, 'upload/lienhe.jpg', 0),
(180, 'upload/login.jpg', 0),
(181, 'upload/trangchu1.jpg', 0),
(182, 'upload/trangchu2.jpg', 0),
(183, 'upload/trangchu3.jpg', 0),
(184, 'upload/trangchu4.jpg', 0),
(185, 'upload/trangchu5.jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `ID_BL` int(11) NOT NULL,
  `NOIDUNG` text NOT NULL,
  `NGAYBINHLUAN` datetime NOT NULL DEFAULT current_timestamp(),
  `ID_KH` int(11) NOT NULL,
  `ID_KN` int(11) NOT NULL,
  `TRANGTHAIXOA` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`ID_BL`, `NOIDUNG`, `NGAYBINHLUAN`, `ID_KH`, `ID_KN`, `TRANGTHAIXOA`) VALUES
(8, 'Yêu em 😘', '2024-08-31 22:09:57', 1, 33, 0),
(9, 'Đã he xịn he', '2024-09-03 15:26:38', 1, 33, 0),
(10, 'Thấy gớm quá 💢💢💢', '2024-09-05 22:42:03', 3, 34, 0);

--
-- Bẫy `binhluan`
--
DELIMITER $$
CREATE TRIGGER `TRG_UPDATE_TRANGTHAIXOA_TRALOIBINHLUAN` AFTER UPDATE ON `binhluan` FOR EACH ROW BEGIN
    DECLARE V_ID_BL INT;
    DECLARE V_TRANGTHAIXOA BIT;

    SET V_ID_BL = NEW.ID_BL;
    SET V_TRANGTHAIXOA = NEW.TRANGTHAIXOA;

    IF V_TRANGTHAIXOA = 1 THEN
        UPDATE TRALOIBINHLUAN
        SET TRANGTHAIXOA = 1
        WHERE ID_BL = V_ID_BL;
    END IF;
    IF V_TRANGTHAIXOA = 0 THEN
        UPDATE TRALOIBINHLUAN
        SET TRANGTHAIXOA = 0
        WHERE ID_BL = V_ID_BL;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cauhoi`
--

CREATE TABLE `cauhoi` (
  `ID_CH` int(11) NOT NULL,
  `NOIDUNG` text NOT NULL,
  `ID_GAME` int(11) NOT NULL,
  `ID_KH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cauhoi`
--

INSERT INTO `cauhoi` (`ID_CH`, `NOIDUNG`, `ID_GAME`, `ID_KH`) VALUES
(24, 'Ngày hai đứa bình bắt đầu yêu?', 1, 1),
(27, 'Quốc Khoa bị gì?', 1, 3),
(28, 'Vì sao?', 1, 3),
(29, 'Anh yêu em nhiều không?', 1, 3),
(30, 'Người tình của Phan Diệu là ai?', 1, 3),
(31, 'Yêu?', 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietanhkiniem`
--

CREATE TABLE `chitietanhkiniem` (
  `ID_KN` int(11) NOT NULL,
  `ID_ANH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietanhkiniem`
--

INSERT INTO `chitietanhkiniem` (`ID_KN`, `ID_ANH`) VALUES
(33, 102),
(33, 103),
(33, 104),
(33, 105),
(33, 106),
(33, 107),
(33, 108),
(33, 109),
(34, 110),
(34, 111),
(34, 112),
(34, 113),
(34, 114),
(34, 115),
(34, 116),
(34, 117),
(34, 171),
(35, 118),
(35, 119),
(35, 120),
(35, 121),
(35, 122),
(35, 123),
(35, 124),
(35, 125),
(35, 126),
(36, 127),
(36, 128),
(36, 129),
(36, 130),
(36, 131),
(36, 132),
(36, 133),
(36, 134),
(36, 135),
(37, 136),
(37, 137),
(38, 138),
(40, 139),
(40, 140),
(40, 141),
(40, 142),
(40, 143),
(40, 144),
(40, 145),
(40, 146),
(40, 151),
(40, 152),
(41, 147),
(41, 148),
(41, 149),
(41, 150),
(43, 153),
(43, 154),
(43, 155),
(43, 156),
(43, 157),
(43, 158),
(43, 159),
(43, 160),
(43, 161),
(43, 162),
(43, 163),
(43, 164),
(43, 165),
(43, 166),
(43, 167),
(43, 168),
(43, 169),
(43, 170),
(44, 172),
(44, 173),
(44, 174),
(44, 175),
(44, 176),
(44, 177),
(44, 178),
(44, 179),
(44, 180),
(44, 181),
(44, 182),
(44, 183),
(44, 184),
(44, 185);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietgame`
--

CREATE TABLE `chitietgame` (
  `ID_GAME` int(11) NOT NULL,
  `ID_HH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietgame`
--

INSERT INTO `chitietgame` (`ID_GAME`, `ID_HH`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietkiniem`
--

CREATE TABLE `chitietkiniem` (
  `ID_KH` int(11) NOT NULL,
  `ID_KN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietkiniem`
--

INSERT INTO `chitietkiniem` (`ID_KH`, `ID_KN`) VALUES
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(3, 33),
(3, 34),
(3, 35),
(3, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 41),
(3, 42),
(3, 43),
(3, 44);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhsachcautraloi`
--

CREATE TABLE `danhsachcautraloi` (
  `ID_CTL` int(11) NOT NULL,
  `NOIDUNG` text NOT NULL,
  `DAPAN` bit(1) NOT NULL DEFAULT b'0',
  `ID_CH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhsachcautraloi`
--

INSERT INTO `danhsachcautraloi` (`ID_CTL`, `NOIDUNG`, `DAPAN`, `ID_CH`) VALUES
(52, 'Trưa 12/8/2023', b'0', 24),
(53, 'Trưa 13/08/2023', b'0', 24),
(54, 'Tối 12/08/2023', b'1', 24),
(55, 'Tối 13/08/2023', b'0', 24),
(56, 'Chiều 12/08/2023', b'0', 24),
(65, 'Bị khùng', b'0', 27),
(66, 'Bị điên', b'0', 27),
(67, 'Bị dễ thương', b'0', 27),
(68, 'Bị yêu Phan Diệu', b'1', 27),
(69, '?', b'0', 28),
(70, '??', b'0', 28),
(71, '???', b'0', 28),
(72, '????????????????????????????????????', b'0', 28),
(73, 'Vì Quốc Khoa yêu Phan Diệu', b'1', 28),
(74, 'Nhiều', b'0', 29),
(75, 'Rất nhiều', b'0', 29),
(76, 'Yêu vãi luôn', b'1', 29),
(77, 'Khoa', b'0', 30),
(78, 'Quốc Khoa', b'0', 30),
(79, 'Nguyễn Quốc Khoa', b'0', 30),
(80, 'Bé 2 cute phô mai que', b'1', 30),
(81, 'a', b'0', 31),
(82, 'b', b'0', 31),
(83, 'c', b'0', 31),
(84, 'd', b'0', 31),
(85, 'có', b'1', 31);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `game`
--

CREATE TABLE `game` (
  `ID_GAME` int(11) NOT NULL,
  `TENGAME` varchar(100) NOT NULL,
  `ID_TL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `game`
--

INSERT INTO `game` (`ID_GAME`, `TENGAME`, `ID_TL`) VALUES
(1, 'Người ấy hiểu tôi bao nhiêu?', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `henho`
--

CREATE TABLE `henho` (
  `ID_HH` int(11) NOT NULL,
  `NGAYHENHO` date NOT NULL,
  `TRANGTHAI` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `henho`
--

INSERT INTO `henho` (`ID_HH`, `NGAYHENHO`, `TRANGTHAI`) VALUES
(1, '2023-06-12', b'1'),
(37, '2024-08-29', b'0'),
(38, '2024-08-29', b'1'),
(40, '2024-09-13', b'0'),
(41, '2024-09-13', b'0'),
(42, '2024-09-13', b'0'),
(44, '2024-09-13', b'0'),
(45, '2024-09-11', b'0'),
(46, '2024-09-12', b'0'),
(47, '2024-09-26', b'0'),
(48, '2024-09-14', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `ID_KH` int(11) NOT NULL,
  `HOTEN` varchar(100) DEFAULT NULL,
  `SDT` varchar(10) DEFAULT NULL,
  `NGAYSINH` date DEFAULT NULL,
  `GIOITINH` char(3) DEFAULT NULL,
  `DIACHI` text DEFAULT NULL,
  `AVARTAR` text DEFAULT NULL,
  `ID_TK` int(11) DEFAULT NULL,
  `ID_HH` int(11) DEFAULT NULL,
  `MAKH` varchar(10) DEFAULT NULL,
  `DIEMTINHYEU` int(11) DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`ID_KH`, `HOTEN`, `SDT`, `NGAYSINH`, `GIOITINH`, `DIACHI`, `AVARTAR`, `ID_TK`, `ID_HH`, `MAKH`, `DIEMTINHYEU`) VALUES
(1, 'Nguyễn Quốc Khoa', '0969895549', '2003-03-05', 'Nam', 'Ấp Phú Quới, xã Yên Luông, huyện Gò Công Tây, tỉnh Tiền Giang', 'upload/z5666513550321_804f503fb82b2ada8a3d4935cfbd1e31.jpg', 1, 1, '1L3K9EGF', 110),
(3, 'Phan Thị Diệu', '0382418308', '2003-02-08', 'Nữ', 'Phú Tân, An Giang', 'upload/z5666513548650_b713c938966e2c8716581d4703c9085d.jpg', 2, 1, 'Y5MD8V21', 120),
(58, 'Trần Minh Nguyên', '0998876123', '2002-05-04', 'Nam', 'Thành phố Mĩ Tho, tỉnh Tiền Giang', 'upload/avatarboycute.jpg', 10, 38, 'HUTQ0SRC', 100),
(63, 'Huỳnh Thị Ái Trân', '0917576123', '2003-12-09', 'Nữ', 'Thành phố Mĩ Tho, tỉnh Tiền Giang', 'upload/avatargirlcute.png', 11, 38, 'QXJR8YQK', 100),
(64, 'Nguyễn Văn Test', '0349146872', '2008-05-03', 'Nam', 'Thành phố Mĩ Tho, tỉnh Tiền Giang', 'upload/avatarboycute.jpg', 12, NULL, 'WDNKPOX1', 100),
(65, 'Nguyễn Trí Khoa', '0975228174', '1998-08-01', 'Nam', 'Long Thành, Đồng Nai', 'upload/homnaytoibuon.jpg', 19, NULL, '4H4TD4E9', 100);

--
-- Bẫy `khachhang`
--
DELIMITER $$
CREATE TRIGGER `trg_UpdateNguoiViet` AFTER UPDATE ON `khachhang` FOR EACH ROW BEGIN
    DECLARE V_HOTEN VARCHAR(51);
    DECLARE V_ID_KN INT;
    IF NEW.HOTEN != OLD.HOTEN THEN
        SET V_HOTEN = NEW.HOTEN;
        SELECT ID_KN INTO V_ID_KN FROM CHITIETKINIEM WHERE ID_KH = NEW.ID_KH LIMIT 1;
        UPDATE KINIEM SET NGUOIVIET = V_HOTEN WHERE ID_KN = V_ID_KN;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_check_customer_insert` AFTER INSERT ON `khachhang` FOR EACH ROW BEGIN
    DECLARE v_TRANGTHAI TINYINT; 
    DECLARE v_CustomerCount INT;

    -- Lấy giá trị TRANGTHAI từ bảng HENHO
    SELECT TRANGTHAI INTO v_TRANGTHAI
    FROM HENHO
    WHERE ID_HH = NEW.ID_HH;

    -- Kiểm tra số lượng khách hàng với cùng ID_HH nếu TRANGTHAI là 1
    IF v_TRANGTHAI = 1 THEN
        SELECT COUNT(*) INTO v_CustomerCount
        FROM KHACHHANG
        WHERE ID_HH = NEW.ID_HH;

        IF v_CustomerCount > 2 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Không được quá 2 người có cùng mã hẹn hò!';
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_check_customer_update` AFTER UPDATE ON `khachhang` FOR EACH ROW BEGIN
    DECLARE v_TRANGTHAI TINYINT; 
    DECLARE v_CustomerCount INT;

    -- Lấy giá trị TRANGTHAI từ bảng HENHO
    SELECT TRANGTHAI INTO v_TRANGTHAI
    FROM HENHO
    WHERE ID_HH = NEW.ID_HH;

    -- Kiểm tra số lượng khách hàng với cùng ID_HH nếu TRANGTHAI là 1
    IF v_TRANGTHAI = 1 THEN
        SELECT COUNT(*) INTO v_CustomerCount
        FROM KHACHHANG
        WHERE ID_HH = NEW.ID_HH;

        IF v_CustomerCount > 2 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Không được quá 2 người có cùng mã hẹn hò!';
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kiniem`
--

CREATE TABLE `kiniem` (
  `ID_KN` int(11) NOT NULL,
  `TENKINIEM` varchar(100) NOT NULL,
  `NGAYKINIEM` date NOT NULL,
  `MOTA` text NOT NULL,
  `NGUOIVIET` varchar(51) DEFAULT NULL,
  `TRANGTHAIXOA` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `kiniem`
--

INSERT INTO `kiniem` (`ID_KN`, `TENKINIEM`, `NGAYKINIEM`, `MOTA`, `NGUOIVIET`, `TRANGTHAIXOA`) VALUES
(33, 'Vũng tàu cùng em yêu 🥰', '2024-08-07', 'Hôm nay, tôi và người yêu đã có một chuyến đi tuyệt vời đến Vũng Tàu. Từ lâu, chúng tôi đã mong chờ chuyến đi này, và khi ngày ấy đến, cả hai đều không giấu nổi sự háo hức. Buổi sáng, chúng tôi xuất phát từ sớm, đường phố còn vắng người, không khí trong lành và mát mẻ. Chúng tôi vừa đi vừa trò chuyện rôm rả, tiếng cười hòa quyện với tiếng gió, làm con đường dường như ngắn lại.\r\nKhi đến Vũng Tàu, biển xanh hiện ra trước mắt, sóng vỗ rì rào như chào đón chúng tôi. Chúng tôi thả mình trên bãi cát trắng, để đôi chân trần cảm nhận sự mịn màng của cát, để những cơn sóng nhẹ nhàng vỗ về. Cảm giác thật yên bình, như chỉ còn hai đứa giữa không gian bao la của biển cả.\r\nBuổi trưa, chúng tôi cùng nhau thưởng thức hải sản tươi ngon tại một quán nhỏ ven biển. Những món ăn đơn giản nhưng đậm đà hương vị, kết hợp với gió biển mát rượi, làm cho bữa ăn trở nên ngon miệng hơn bao giờ hết. Chúng tôi cùng nhau chia sẻ từng món ăn, vừa thưởng thức vừa nói cười vui vẻ.\r\nBuổi chiều, chúng tôi leo lên ngọn hải đăng, từ trên cao ngắm nhìn toàn cảnh Vũng Tàu. Gió thổi lồng lộng, mang theo mùi hương của biển cả. Chúng tôi cùng nhau chụp những bức ảnh kỷ niệm, ghi lại những khoảnh khắc đáng nhớ. Khi hoàng hôn buông xuống, bầu trời nhuộm một màu cam ấm áp, mặt biển lấp lánh như được dát vàng. Chúng tôi nắm tay nhau, lặng lẽ ngắm nhìn khung cảnh lãng mạn ấy, cảm nhận sự bình yên trong từng giây phút.\r\nĐêm đến, chúng tôi dạo bước trên con đường ven biển, dưới ánh đèn vàng ấm áp. Tiếng sóng vỗ bờ, tiếng cười nói của những người qua lại, tất cả tạo nên một khung cảnh yên bình và đầy thơ mộng. Chúng tôi ngồi bên nhau trên bãi cát, lắng nghe tiếng sóng và kể cho nhau nghe những ước mơ, dự định tương lai.\r\nChuyến đi Vũng Tàu cùng người yêu thật sự là một kỷ niệm đẹp, một ngày trọn vẹn của yêu thương và hạnh phúc. Tôi biết rằng, dù thời gian có trôi qua, những ký ức về chuyến đi này sẽ luôn ở lại trong trái tim tôi, là những kỷ niệm ngọt ngào mà chúng tôi sẽ mãi trân trọng.', 'Nguyễn Quốc Khoa', 0),
(34, 'Chạy deadline cùng tình yêu ❤ ahihi', '2024-09-06', 'Chạy deadline cùng tình yêu là một trải nghiệm vừa căng thẳng vừa ngọt ngào. Khi công việc đổ dồn, áp lực từ những hạn chót khiến ta mệt mỏi, nhưng nếu có người mình yêu thương bên cạnh, mọi thứ dường như trở nên nhẹ nhàng hơn. Họ có thể giúp đỡ, động viên, hoặc đơn giản là ở bên cạnh chia sẻ những khoảnh khắc khó khăn. Đôi khi, chỉ cần một ly cà phê do người yêu pha, một cái ôm ấm áp, hay những lời động viên chân thành cũng đủ để ta tiếp tục kiên trì. Tình yêu không chỉ làm dịu những căng thẳng mà còn tiếp thêm sức mạnh để vượt qua thử thách, biến những giờ phút chạy deadline thành kỷ niệm đáng nhớ.\r\nChạy deadline cùng tình yêu giống như một hành trình đầy thử thách nhưng tràn ngập sự quan tâm. Khi mệt mỏi vì công việc chồng chất, chỉ cần một ánh mắt động viên hay nụ cười ấm áp từ người mình yêu cũng có thể xoa dịu mọi áp lực. Cả hai cùng nhau san sẻ những giờ phút căng thẳng, cùng cố gắng để hoàn thành công việc, vừa là sự hỗ trợ tinh thần, vừa là động lực mạnh mẽ. Những lần cùng thức khuya, cùng nhau vượt qua khó khăn, không chỉ giúp hoàn thành deadline mà còn làm tình yêu thêm sâu sắc. Trong sự bận rộn, tình yêu chính là nguồn năng lượng tuyệt vời nhất.', 'Nguyễn Quốc Khoa', 0),
(35, 'Bọn mình rất đáng yêu', '2024-09-08', 'Trong một góc nhỏ của thế giới, có hai người đáng yêu yêu nhau theo cách đẹp nhất có thể. Họ gặp nhau vào một buổi chiều mùa thu, khi ánh nắng vàng rực rỡ chiếu qua kẽ lá. Anh, với nụ cười ấm áp và ánh mắt dịu dàng, luôn biết cách làm cô cười mỗi khi cô cảm thấy mệt mỏi. Cô, với sự nhạy cảm và trái tim bao la, thường xuyên khiến anh cảm thấy như mỗi ngày đều là một cuộc phiêu lưu thú vị. Họ chia sẻ những khoảnh khắc bình dị nhưng đầy ý nghĩa – từ những buổi chiều dạo chơi trong công viên đến những tối quây quần bên nhau đọc sách hoặc xem phim. Tình yêu của họ không cần quá nhiều lời nói, mà thể hiện qua những hành động nhỏ bé nhưng chân thành, như những cái ôm nhẹ nhàng, những ánh mắt hiểu nhau không cần lời. Đó là một tình yêu thanh khiết, giản dị và đầy sự ấm áp, như một bản nhạc du dương mà cả hai cùng hòa quyện vào trong đó.', 'Nguyễn Quốc Khoa', 0),
(36, 'Bọn mình rất đáng yêu', '2024-09-08', 'rong một góc nhỏ của thế giới, có hai người đáng yêu yêu nhau theo cách đẹp nhất có thể. Họ gặp nhau vào một buổi chiều mùa thu, khi ánh nắng vàng rực rỡ chiếu qua kẽ lá. Anh, với nụ cười ấm áp và ánh mắt dịu dàng, luôn biết cách làm cô cười mỗi khi cô cảm thấy mệt mỏi. Cô, với sự nhạy cảm và trái tim bao la, thường xuyên khiến anh cảm thấy như mỗi ngày đều là một cuộc phiêu lưu thú vị. Họ chia sẻ những khoảnh khắc bình dị nhưng đầy ý nghĩa – từ những buổi chiều dạo chơi trong công viên đến những tối quây quần bên nhau đọc sách hoặc xem phim. Tình yêu của họ không cần quá nhiều lời nói, mà thể hiện qua những hành động nhỏ bé nhưng chân thành, như những cái ôm nhẹ nhàng, những ánh mắt hiểu nhau không cần lời. Đó là một tình yêu thanh khiết, giản dị và đầy sự ấm áp, như một bản nhạc du dương mà cả hai cùng hòa quyện vào trong đó.', 'Nguyễn Quốc Khoa', 1),
(37, 'ảnh đai diện', '2024-09-08', 'Cute boy\r\nCute girl', 'Nguyễn Quốc Khoa', 1),
(38, 'Test thử nè', '2024-09-08', 'Không có gì hết trơn', 'Nguyễn Quốc Khoa', 1),
(39, 'Introduction - html', '2024-09-08', 'jajshaaksklaa', 'Nguyễn Quốc Khoa', 1),
(40, 'Ảnh xinh đẹp của tụi mình 🌹', '2024-09-09', 'Một bức ảnh đẹp không chỉ ghi lại khoảnh khắc trong không gian và thời gian, mà còn chứa đựng cả những cảm xúc, kỷ niệm và câu chuyện đằng sau nó. Khi chúng ta nhìn vào những bức ảnh đẹp của mình, chúng ta không chỉ thấy hình ảnh của bản thân, mà còn thấy một phần cuộc sống đã đi qua, những khoảnh khắc vui vẻ, hạnh phúc, và thậm chí là những lần thăng trầm của cuộc đời. Mỗi nụ cười, ánh mắt trong bức ảnh đều gợi nhắc những điều quý giá và ý nghĩa, khiến chúng ta thêm yêu thương và trân trọng những người bên cạnh mình.\r\nBức ảnh của tụi mình có lẽ không chỉ đơn giản là một tấm hình chụp, mà còn là một tác phẩm nghệ thuật. Chúng ta đã cùng nhau chọn một khung cảnh đẹp, ánh sáng hoàn hảo và những bộ trang phục mà mình yêu thích. Khung cảnh có thể là một cánh đồng hoa rực rỡ, một con phố cổ kính hay một góc quán cà phê ấm cúng. Mỗi lần chúng ta nhìn vào bức ảnh, không chỉ đơn thuần nhớ về vẻ đẹp của cảnh vật, mà còn nhớ đến cảm giác lúc ấy, khi chúng ta tự tin và hạnh phúc trong từng giây phút được sống thật với chính mình.\r\nTrong bức ảnh, từng đường nét trên khuôn mặt, từng biểu cảm của mỗi người đều trở nên rõ nét và lung linh. Mỗi người đều có vẻ đẹp riêng, không ai giống ai, nhưng khi đứng chung một khung hình, lại tạo ra một tổng thể hài hòa và đẹp đẽ. Chúng ta không chỉ đẹp về ngoại hình, mà còn toát lên vẻ đẹp của tình bạn, của sự đoàn kết và yêu thương lẫn nhau. Những khoảnh khắc như thế không dễ dàng có được, và bức ảnh chính là minh chứng cho sự gắn kết, tình cảm chân thành mà chúng ta dành cho nhau.', 'Nguyễn Quốc Khoa', 0),
(41, 'Nguyễn Quốc Khoa', '2024-09-09', 'Test', 'Nguyễn Quốc Khoa', 1),
(42, 'Test', '2024-09-09', 'Test', 'Nguyễn Quốc Khoa', 1),
(43, 'test', '2024-09-09', 'aqahjabhaggahahahaaj', 'Nguyễn Quốc Khoa', 1),
(44, 'Thứ 7 ngày 28/09/2024', '2024-09-28', '***PH N TÍCH HÌNH ẢNH:\r\nCác thành phần và kết nối:\r\nASUS RT-N12 N300 Router:\r\nKết nối tới WAN user (người dùng Internet) qua Cloud (đám mây).\r\nKết nối với LAN user (người dùng cục bộ) qua dây cáp mạng.\r\nKết nối với NETGEAR GS308 Unmanaged Switch qua dây cáp mạng.\r\nNETGEAR GS308 Unmanaged Switch:\r\nĐược kết nối với router ASUS RT-N12.\r\nTừ switch này, có các kết nối cáp tới nhiều thiết bị khác, bao gồm:\r\nVeraPlus Advanced Home Controller (Bộ điều khiển nhà thông minh VeraPlus).\r\nCác IoT Hubs/Coordinators khác (các hình lục giác biểu thị các bộ phối hợp hoặc trung tâm IoT).\r\nVeraPlus Advanced Home Controller:\r\nBộ điều khiển này hỗ trợ các kết nối WiFi, Zigbee, Z-Wave, và Bluetooth.\r\nKết nối không dây với các thiết bị IoT hỗ trợ ZWave hoặc WiFi.\r\nIoT Hubs/Coordinators (các thiết bị điều phối IoT):\r\nCó các thiết bị được kết nối tới switch NETGEAR và giao tiếp không dây với các thiết bị IoT khác thông qua Zigbee hoặc ZWave.\r\nWireshark:\r\nMột máy tính được kết nối trực tiếp tới mạng LAN và có phần mềm Wireshark (dùng để giám sát lưu lượng mạng).\r\nPhân tích tổng thể:\r\nHệ thống mạng này được sử dụng để điều khiển và giám sát các thiết bị IoT thông qua các giao thức không dây phổ biến như WiFi, Zigbee, Z-Wave. VeraPlus Advanced Home Controller đóng vai trò như bộ điều khiển chính cho các thiết bị IoT, đồng thời có thể giao tiếp với các bộ điều phối IoT khác qua switch NETGEAR. Wireshark là một công cụ giám sát lưu lượng mạng để phát hiện các cuộc tấn công mạng, rất hữu ích trong việc nghiên cứu và thử nghiệm an ninh IoT.', 'Nguyễn Quốc Khoa', 0);

--
-- Bẫy `kiniem`
--
DELIMITER $$
CREATE TRIGGER `TRG_UPDATE_TRANGTHAIXOA_BINHLUAN` AFTER UPDATE ON `kiniem` FOR EACH ROW BEGIN
    DECLARE V_ID_KN INT;
    DECLARE V_TRANGTHAIXOA BIT;

    SET V_ID_KN = NEW.ID_KN;
    SET V_TRANGTHAIXOA = NEW.TRANGTHAIXOA;

    IF V_TRANGTHAIXOA = 1 THEN
        UPDATE BINHLUAN
        SET TRANGTHAIXOA = 1
        WHERE V_ID_KN = ID_KN;
    END IF;
    
    IF V_TRANGTHAIXOA = 0 THEN
        UPDATE BINHLUAN
        SET TRANGTHAIXOA = 0
        WHERE V_ID_KN = ID_KN;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loichuc`
--

CREATE TABLE `loichuc` (
  `ID_LC` int(11) NOT NULL,
  `NOIDUNG` text NOT NULL,
  `ANH` text NOT NULL,
  `NGAYCHUC` date DEFAULT current_timestamp(),
  `LOAILC` varchar(20) NOT NULL,
  `ID_KH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loichuc`
--

INSERT INTO `loichuc` (`ID_LC`, `NOIDUNG`, `ANH`, `NGAYCHUC`, `LOAILC`, `ID_KH`) VALUES
(9, 'Chúc eiu sinh nhật vui vẻ', 'upload/VT4voieiu.jpg', '2024-09-08', 'BIRTHDAY', 1),
(10, 'Kỉ niệm này lãng mạn ghê 😜😜😜', 'upload/VT5voieiu.jpg', '2024-09-08', 'MEMORIES', 1),
(11, 'Đã he, đã he ❤', 'upload/cute1.jpg', '2024-09-12', 'MEMORIES', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhatky`
--

CREATE TABLE `nhatky` (
  `ID_NK` int(11) NOT NULL,
  `TIEUDE` varchar(255) DEFAULT NULL,
  `NOIDUNG` text NOT NULL,
  `NGAYVIET` date NOT NULL DEFAULT current_timestamp(),
  `ANH_NK` text NOT NULL,
  `TRANGTHAIXOA` bit(1) DEFAULT b'0',
  `ID_KH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhatky`
--

INSERT INTO `nhatky` (`ID_NK`, `TIEUDE`, `NOIDUNG`, `NGAYVIET`, `ANH_NK`, `TRANGTHAIXOA`, `ID_KH`) VALUES
(63, 'Hôm nay tôi buồn...', '😥😥😥\r\nNgày 30 tháng 8 năm 2024, một ngày mưa\r\nHôm nay tôi buồn. Không phải vì một sự việc cụ thể nào, mà là một nỗi buồn man mác len lỏi trong lòng. Sáng nay, khi thức dậy, tôi cảm thấy mọi thứ xung quanh như bị phủ một lớp sương mờ, lạnh lẽo. Tiếng chim hót ngoài cửa sổ không còn làm tôi vui như mọi ngày. Dường như, trời cũng thấu hiểu cảm giác của tôi, mây xám kéo về che lấp ánh nắng mặt trời.\r\nTôi cố gắng tập trung vào công việc, nhưng tâm trí cứ lạc đi đâu đó. Những kỷ niệm cũ chợt ùa về, làm tôi càng thêm lặng lòng. Có lẽ tôi đang nhớ ai đó, hoặc đang tiếc nuối điều gì đã qua. Nhưng chính tôi cũng không rõ. Chỉ biết rằng, nỗi buồn hôm nay như một cái bóng, theo tôi suốt cả ngày.\r\nBuổi chiều, tôi đi dạo quanh công viên gần nhà, hy vọng rằng không khí trong lành sẽ làm tâm trạng tốt hơn. Nhưng những cơn gió nhẹ thổi qua cũng không thể xua tan được cảm giác nặng nề trong lòng.\r\nTôi biết, nỗi buồn rồi cũng sẽ qua, như mọi lần trước. Nhưng hiện tại, tôi chỉ muốn cho phép mình chìm đắm trong cảm xúc này một chút, để rồi ngày mai, khi ánh nắng rạng rỡ trở lại, tôi sẽ lại mỉm cười với chính mình và bước tiếp.', '2024-08-30', 'upload/homnaytoibuon.jpg', b'0', 1),
(64, 'Tôi được trở về nhà 🏠', 'Hôm nay tôi được về nhà. Cảm giác thật đặc biệt, như mọi thứ đều trở nên gần gũi và ấm áp hơn. Khi bước xuống xe, nhìn thấy cánh cổng quen thuộc và hàng cây xanh rì trước nhà, lòng tôi tràn ngập niềm vui và sự xúc động.\r\nMẹ đã đứng chờ từ lúc nào, nụ cười hiền hậu trên gương mặt đầy yêu thương. Tôi vội chạy đến ôm mẹ, cảm nhận được hơi ấm từ vòng tay mà tôi đã mong nhớ bấy lâu. Ngôi nhà vẫn như xưa, nhưng với tôi, tất cả dường như đẹp đẽ hơn bao giờ hết.\r\n\r\nBuổi trưa, cả nhà quây quần bên mâm cơm. Những món ăn mẹ nấu vẫn giữ nguyên hương vị thân thuộc, làm tôi nhớ lại những ngày tháng còn nhỏ. Tiếng cười nói rộn ràng, những câu chuyện không đầu không cuối, nhưng sao tôi thấy hạnh phúc vô cùng. Bữa cơm gia đình tuy giản dị nhưng ấm cúng, là khoảnh khắc mà tôi đã mong mỏi trong suốt thời gian xa nhà.\r\nChiều nay, tôi dạo quanh vườn, nhìn ngắm những khóm hoa mẹ chăm bón, những cây trái đã lớn lên từng ngày. Mọi thứ đều mang dấu ấn của thời gian, nhưng vẫn giữ được sự bình yên của ngôi nhà mà tôi luôn yêu thương.\r\nĐêm xuống, tôi nằm trên chiếc giường quen thuộc, cảm nhận không khí yên bình của quê hương. Tiếng côn trùng rả rích ngoài kia càng làm tăng thêm sự tĩnh lặng của đêm tối. Tôi chìm vào giấc ngủ, lòng thầm cảm ơn vì đã được trở về, được sống trong tình yêu thương của gia đình.\r\nHôm nay là một ngày thật đẹp, một ngày mà tôi sẽ mãi ghi nhớ.', '2024-08-30', 'upload/nha.jpg', b'0', 1),
(65, 'Code cùng Quốc Khoa', 'HTML:\r\ninput tệp và label tùy chỉnh vẫn giống như trước, nhưng thêm một div với id=\"imagePreview\" để hiển thị ảnh sau khi tải lên.\r\nCSS:\r\nThẻ #imagePreview chứa ảnh được tải lên và sẽ bị ẩn (display: none;) trước khi người dùng tải ảnh.\r\nSau khi ảnh được tải lên, CSS đảm bảo rằng kích thước tối đa của ảnh sẽ là 300x300px.\r\nJavaScript:\r\nFileReader: Dùng để đọc tệp ảnh dưới dạng URL.\r\nreader.onload: Khi ảnh đã sẵn sàng, nó sẽ hiển thị hình ảnh bằng cách tạo một thẻ <img> bên trong div#imagePreview.\r\nreader.readAsDataURL(file): Đọc tệp dưới dạng URL để có thể hiển thị ảnh mà không cần tải lại trang.', '2024-09-08', 'upload/deadline5.jpg', b'0', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `ID_TK` int(11) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `NGAYMOTK` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`ID_TK`, `EMAIL`, `USERNAME`, `PASSWORD`, `NGAYMOTK`) VALUES
(1, 'nguyenquockhoa5549@gmail.com', 'Nguyễn Quốc Khoa', '$2y$10$GuUK1VCf9nE.iOaZ2rLeiurMhjRuxV4yLIfLAgHQW8/xjRYs8pypq', '2024-07-23'),
(2, 'phanthidieu@gmail.com', 'Diệu Phan', '$2y$10$WRoQWJaI/e8XtuKHdl6bwOsSTTmv5uoOXlP2hUos7kBS8Blq8xVIi', '2024-07-23'),
(10, 'n21dccn136@student.ptithcm.edu.vn', 'Trần Minh Nguyên', '$2y$10$UDze.ziYYETwD.dVnthhYOGQmq8ZybnL/lbDOTiwlIm1o9QUEJ6f.', '2024-08-29'),
(11, 'huynhtran@gmail.com', 'Trân Huỳnh', '$2y$10$HSplIsa9Xcyn2LmSQbI8He8aRssbpKkq/tjtFsW4nvBSZ5e3ZV..O', '2024-08-29'),
(12, 'quanly@gmail.com', 'Tài khoản test', '$2y$10$fSnltOhBg2LofsWdeejePuuifBreYI894GDXQpBg0NnyxWg7nlxt.', '2024-08-31'),
(19, 'nqkhoa5303@gmail.com', 'Quốc Khoa', '$2y$10$37W0fotMoHYewgGqQ87DquGZEFTcsexjobyKADgwOjwE.FTGagkaK', '2024-09-13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtich`
--

CREATE TABLE `thanhtich` (
  `ID_TT` int(11) NOT NULL,
  `DIEM` float NOT NULL,
  `SOCAUDUNG` int(11) DEFAULT NULL,
  `NGAY` datetime NOT NULL DEFAULT current_timestamp(),
  `ID_GAME` int(11) NOT NULL,
  `ID_KH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhtich`
--

INSERT INTO `thanhtich` (`ID_TT`, `DIEM`, `SOCAUDUNG`, `NGAY`, `ID_GAME`, `ID_KH`) VALUES
(19, 10, 5, '2024-09-12 20:37:28', 1, 1),
(20, 6, 3, '2024-09-12 20:53:19', 1, 1),
(21, 6, 3, '2024-09-12 21:35:33', 1, 1),
(22, 10, 5, '2024-09-15 12:35:53', 1, 1),
(23, 10, 5, '2024-09-17 20:32:00', 1, 1),
(24, 6, 3, '2024-12-24 11:53:42', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloaigame`
--

CREATE TABLE `theloaigame` (
  `ID_TL` int(11) NOT NULL,
  `TENTHELOAI` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `theloaigame`
--

INSERT INTO `theloaigame` (`ID_TL`, `TENTHELOAI`) VALUES
(1, 'QUESTION');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `traloibinhluan`
--

CREATE TABLE `traloibinhluan` (
  `ID_REP` int(11) NOT NULL,
  `NOIDUNG` text NOT NULL,
  `NGAYTRALOI` datetime NOT NULL DEFAULT current_timestamp(),
  `ID_BL` int(11) NOT NULL,
  `ID_KH` int(11) NOT NULL,
  `TRANGTHAIXOA` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `traloibinhluan`
--

INSERT INTO `traloibinhluan` (`ID_REP`, `NOIDUNG`, `NGAYTRALOI`, `ID_BL`, `ID_KH`, `TRANGTHAIXOA`) VALUES
(19, '&lt;3 &lt;3', '2024-09-03 15:41:16', 8, 1, 1),
(20, '&lt;3', '2024-09-03 15:42:34', 8, 1, 1),
(21, 'Yêu &lt;3', '2024-09-03 15:44:02', 8, 1, 1),
(22, '<3', '2024-09-03 15:47:01', 8, 1, 0),
(23, 'Siêng mà kkk', '2024-09-29 23:19:42', 10, 1, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `anhkiniem`
--
ALTER TABLE `anhkiniem`
  ADD PRIMARY KEY (`ID_ANH`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`ID_BL`),
  ADD KEY `NGAYBINHLUAN` (`NGAYBINHLUAN`),
  ADD KEY `ID_KN` (`ID_KN`),
  ADD KEY `ID_KH` (`ID_KH`);

--
-- Chỉ mục cho bảng `cauhoi`
--
ALTER TABLE `cauhoi`
  ADD PRIMARY KEY (`ID_CH`),
  ADD KEY `ID_GAME` (`ID_GAME`),
  ADD KEY `ID_KH` (`ID_KH`);

--
-- Chỉ mục cho bảng `chitietanhkiniem`
--
ALTER TABLE `chitietanhkiniem`
  ADD PRIMARY KEY (`ID_KN`,`ID_ANH`),
  ADD KEY `FK_ANHKINIEM_CHITIETKINIEM` (`ID_ANH`);

--
-- Chỉ mục cho bảng `chitietgame`
--
ALTER TABLE `chitietgame`
  ADD PRIMARY KEY (`ID_GAME`,`ID_HH`),
  ADD KEY `ID_GAME` (`ID_GAME`),
  ADD KEY `ID_HH` (`ID_HH`);

--
-- Chỉ mục cho bảng `chitietkiniem`
--
ALTER TABLE `chitietkiniem`
  ADD PRIMARY KEY (`ID_KH`,`ID_KN`),
  ADD KEY `ID_KN` (`ID_KN`);

--
-- Chỉ mục cho bảng `danhsachcautraloi`
--
ALTER TABLE `danhsachcautraloi`
  ADD PRIMARY KEY (`ID_CTL`),
  ADD KEY `ID_CH` (`ID_CH`);

--
-- Chỉ mục cho bảng `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`ID_GAME`),
  ADD UNIQUE KEY `ID_TL_2` (`ID_TL`),
  ADD KEY `ID_GAME` (`ID_GAME`),
  ADD KEY `ID_TL` (`ID_TL`);

--
-- Chỉ mục cho bảng `henho`
--
ALTER TABLE `henho`
  ADD PRIMARY KEY (`ID_HH`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`ID_KH`),
  ADD UNIQUE KEY `UK_KHACHHANG_SDT` (`SDT`),
  ADD UNIQUE KEY `UK_KHACHHANG_ID_TK` (`ID_TK`),
  ADD UNIQUE KEY `UK_MAKH` (`MAKH`),
  ADD KEY `UK_KHACHHANG_EMAIL` (`ID_KH`),
  ADD KEY `FK_KHACHHANG_HENHO` (`ID_HH`);

--
-- Chỉ mục cho bảng `kiniem`
--
ALTER TABLE `kiniem`
  ADD PRIMARY KEY (`ID_KN`);

--
-- Chỉ mục cho bảng `loichuc`
--
ALTER TABLE `loichuc`
  ADD PRIMARY KEY (`ID_LC`),
  ADD KEY `ID_KH` (`ID_KH`);

--
-- Chỉ mục cho bảng `nhatky`
--
ALTER TABLE `nhatky`
  ADD PRIMARY KEY (`ID_NK`),
  ADD KEY `FK_NHATKY_KHACHHANG` (`ID_KH`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`ID_TK`),
  ADD UNIQUE KEY `UK_TAIKHOAN_USERNAME` (`USERNAME`),
  ADD UNIQUE KEY `UK_TAIKHOAN_EMAIL` (`EMAIL`);

--
-- Chỉ mục cho bảng `thanhtich`
--
ALTER TABLE `thanhtich`
  ADD PRIMARY KEY (`ID_TT`),
  ADD KEY `ID_KH` (`ID_KH`),
  ADD KEY `ID_GAME` (`ID_GAME`) USING BTREE;

--
-- Chỉ mục cho bảng `theloaigame`
--
ALTER TABLE `theloaigame`
  ADD PRIMARY KEY (`ID_TL`);

--
-- Chỉ mục cho bảng `traloibinhluan`
--
ALTER TABLE `traloibinhluan`
  ADD PRIMARY KEY (`ID_REP`),
  ADD KEY `NGAYTRALOI` (`NGAYTRALOI`),
  ADD KEY `ID_BL` (`ID_BL`),
  ADD KEY `ID_KH` (`ID_KH`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `anhkiniem`
--
ALTER TABLE `anhkiniem`
  MODIFY `ID_ANH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `ID_BL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `cauhoi`
--
ALTER TABLE `cauhoi`
  MODIFY `ID_CH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `chitietanhkiniem`
--
ALTER TABLE `chitietanhkiniem`
  MODIFY `ID_KN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `danhsachcautraloi`
--
ALTER TABLE `danhsachcautraloi`
  MODIFY `ID_CTL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `game`
--
ALTER TABLE `game`
  MODIFY `ID_GAME` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `henho`
--
ALTER TABLE `henho`
  MODIFY `ID_HH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `ID_KH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `kiniem`
--
ALTER TABLE `kiniem`
  MODIFY `ID_KN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `loichuc`
--
ALTER TABLE `loichuc`
  MODIFY `ID_LC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `nhatky`
--
ALTER TABLE `nhatky`
  MODIFY `ID_NK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `ID_TK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `thanhtich`
--
ALTER TABLE `thanhtich`
  MODIFY `ID_TT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `theloaigame`
--
ALTER TABLE `theloaigame`
  MODIFY `ID_TL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `traloibinhluan`
--
ALTER TABLE `traloibinhluan`
  MODIFY `ID_REP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_2` FOREIGN KEY (`ID_KH`) REFERENCES `khachhang` (`ID_KH`),
  ADD CONSTRAINT `binhluan_ibfk_3` FOREIGN KEY (`ID_KN`) REFERENCES `kiniem` (`ID_KN`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cauhoi`
--
ALTER TABLE `cauhoi`
  ADD CONSTRAINT `cauhoi_ibfk_1` FOREIGN KEY (`ID_GAME`) REFERENCES `game` (`ID_GAME`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cauhoi_ibfk_2` FOREIGN KEY (`ID_KH`) REFERENCES `khachhang` (`ID_KH`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chitietanhkiniem`
--
ALTER TABLE `chitietanhkiniem`
  ADD CONSTRAINT `FK_ANHKINIEM_CHITIETKINIEM` FOREIGN KEY (`ID_ANH`) REFERENCES `anhkiniem` (`ID_ANH`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_KINIEM_CHITIETKINIEM` FOREIGN KEY (`ID_KN`) REFERENCES `kiniem` (`ID_KN`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chitietgame`
--
ALTER TABLE `chitietgame`
  ADD CONSTRAINT `chitietgame_ibfk_1` FOREIGN KEY (`ID_GAME`) REFERENCES `game` (`ID_GAME`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietgame_ibfk_2` FOREIGN KEY (`ID_HH`) REFERENCES `henho` (`ID_HH`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chitietkiniem`
--
ALTER TABLE `chitietkiniem`
  ADD CONSTRAINT `chitietkiniem_ibfk_1` FOREIGN KEY (`ID_KH`) REFERENCES `khachhang` (`ID_KH`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietkiniem_ibfk_2` FOREIGN KEY (`ID_KN`) REFERENCES `kiniem` (`ID_KN`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `danhsachcautraloi`
--
ALTER TABLE `danhsachcautraloi`
  ADD CONSTRAINT `danhsachcautraloi_ibfk_1` FOREIGN KEY (`ID_CH`) REFERENCES `cauhoi` (`ID_CH`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`ID_TL`) REFERENCES `theloaigame` (`ID_TL`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `FK_KHACHHANG_HENHO` FOREIGN KEY (`ID_HH`) REFERENCES `henho` (`ID_HH`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_KHACHHANG_TAIKHOAN` FOREIGN KEY (`ID_TK`) REFERENCES `taikhoan` (`ID_TK`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `loichuc`
--
ALTER TABLE `loichuc`
  ADD CONSTRAINT `loichuc_ibfk_1` FOREIGN KEY (`ID_KH`) REFERENCES `khachhang` (`ID_KH`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `nhatky`
--
ALTER TABLE `nhatky`
  ADD CONSTRAINT `FK_NHATKY_KHACHHANG` FOREIGN KEY (`ID_KH`) REFERENCES `khachhang` (`ID_KH`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thanhtich`
--
ALTER TABLE `thanhtich`
  ADD CONSTRAINT `thanhtich_ibfk_1` FOREIGN KEY (`ID_KH`) REFERENCES `khachhang` (`ID_KH`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thanhtich_ibfk_2` FOREIGN KEY (`ID_GAME`) REFERENCES `game` (`ID_GAME`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `traloibinhluan`
--
ALTER TABLE `traloibinhluan`
  ADD CONSTRAINT `traloibinhluan_ibfk_2` FOREIGN KEY (`ID_KH`) REFERENCES `khachhang` (`ID_KH`) ON UPDATE CASCADE,
  ADD CONSTRAINT `traloibinhluan_ibfk_3` FOREIGN KEY (`ID_BL`) REFERENCES `binhluan` (`ID_BL`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
