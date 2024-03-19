create
database TicketFilm;
       use
TicketFilm;
       -- Bước 1: Tạo 4 bảng
CREATE TABLE tblPhim
(
    PhimID    INT PRIMARY KEY AUTO_INCREMENT,
    Ten_phim  NVARCHAR(30),
    Loai_phim NVARCHAR(25),
    Thoi_gian INT
);

CREATE TABLE tblPhong
(
    PhongID    INT PRIMARY KEY AUTO_INCREMENT,
    Ten_phong  NVARCHAR(20),
    Trang_thai TINYINT
);

CREATE TABLE tblGhe
(
    GheID   INT PRIMARY KEY AUTO_INCREMENT,
    PhongID INT,
    So_ghe  VARCHAR(10),
    FOREIGN KEY (PhongID) REFERENCES tblPhong (PhongID)
);

CREATE TABLE tblVe
(
    PhimID     INT,
    GheID      INT,
    Ngay_chieu DATETIME,
    Trang_thai NVARCHAR(20),
    FOREIGN KEY (PhimID) REFERENCES tblPhim (PhimID),
    FOREIGN KEY (GheID) REFERENCES tblGhe (GheID)
);

-- Bước 2: Áp đặt các ràng buộc khóa chính và khóa ngoại
ALTER TABLE tblGhe
    ADD CONSTRAINT fk_tblGhe_PhongID FOREIGN KEY (PhongID) REFERENCES tblPhong (PhongID);
ALTER TABLE tblVe
    ADD CONSTRAINT fk_tblVe_PhimID FOREIGN KEY (PhimID) REFERENCES tblPhim (PhimID);
ALTER TABLE tblVe
    ADD CONSTRAINT fk_tblVe_GheID FOREIGN KEY (GheID) REFERENCES tblGhe (GheID);

-- Bước 3: Chèn dữ liệu vào các bảng
INSERT INTO tblPhim (Ten_phim, Loai_phim, Thoi_gian)
VALUES ('Em bé Hà Nôi', 'Tâm lý', 90),
       ('Nhiệm vụ bất khả thi', 'Hành động', 100),
       ('Dị nhân', 'Viễn tưởng', 90),
       ('Cuốn theo chiều gió', 'Tình cảm', 120);

INSERT INTO tblPhong (Ten_phong, Trang_thai)
VALUES ('Phòng chiếu 1', 1),
       ('Phòng chiếu 2', 1),
       ('Phòng chiếu 3', 0);

INSERT INTO tblGhe (PhongID, So_ghe)
VALUES (1, 'A3'),
       (1, 'B5'),
       (2, 'A7'),
       (2, 'D1'),
       (3, 'T2');

INSERT INTO tblVe (PhimID, GheID, Ngay_chieu, Trang_thai)
VALUES (1, 1, '2008-10-20', 'Đã bán'),
       (1, 3, '2008-11-20', 'Đã bán'),
       (1, 4, '2008-12-23', 'Đã bán'),
       (2, 1, '2009-02-14', 'Đã bán'),
       (3, 1, '2009-02-14', 'Đã bán'),
       (2, 5, '2009-03-08', 'Chưa bán'),
       (2, 3, '2009-03-08', 'Chưa bán');
-- 2. Hiển thị danh sách các phim (sắp xếp theo thời gian)
SELECT *
FROM tblPhim
ORDER BY Thoi_gian;

-- 3. Hiển thị Ten_phim có thời gian chiếu dài nhất
SELECT Ten_phim
FROM tblPhim
ORDER BY Thoi_gian DESC LIMIT 1;

-- 4. Hiển thị Ten_Phim có thời gian chiếu ngắn nhất
SELECT Ten_phim
FROM tblPhim
ORDER BY Thoi_gian LIMIT 1;

-- 5. Hiển thị danh sách So_Ghe bắt đầu bằng chữ ‘A’
SELECT *
FROM tblGhe
WHERE So_ghe LIKE 'A%';

-- 6. Sửa cột Trang_thai của bảng tblPhong sang kiểu nvarchar(25)
ALTER TABLE tblPhong MODIFY COLUMN Trang_thai NVARCHAR(25);

-- 7. Cập nhật giá trị cột Trang_thai của bảng tblPhong
UPDATE tblPhong
SET Trang_thai = CASE
                     WHEN Trang_thai = 0 THEN 'Đang sửa'
                     WHEN Trang_thai = 1 THEN 'Đang sử dụng'
                     ELSE 'Unknow'
    END;

-- Hiển thị bảng tblPhong
CALL show_table('tblPhong');

-- 8. Hiển thị danh sách tên phim có độ dài > 15 và < 25 ký tự
SELECT *
FROM tblPhim
WHERE LENGTH(Ten_phim) > 15
  AND LENGTH(Ten_phim) < 25;

-- 9. Hiển thị Ten_Phong và Trang_Thai trong bảng tblPhong trong 1 cột với tiêu đề ‘Trạng thái phòng chiếu’
SELECT CONCAT(Ten_phong, ' - ', Trang_thai) AS 'Trạng thái phòng chiếu'
FROM tblPhong;

-- 10. Tạo view có tên tblRank
CREATE VIEW tblRank AS
SELECT @rownum := @rownum + 1 AS STT, Ten_phim, Thoi_gian
FROM tblPhim, (SELECT @rownum := 0) r
ORDER BY Ten_phim;

-- 11. Trong bảng tblPhim
-- a. Thêm trường Mo_ta kiểu nvarchar(max)
ALTER TABLE tblPhim
    ADD COLUMN Mo_ta NVARCHAR(MAX);

-- b. Cập nhật trường Mo_ta
UPDATE tblPhim
SET Mo_ta = CONCAT('Đây là bộ phim thể loại ', Loai_phim);

-- c. Hiển thị bảng tblPhim sau khi cập nhật
SELECT *
FROM tblPhim;

-- d. Cập nhật trường Mo_ta
UPDATE tblPhim
SET Mo_ta = REPLACE(Mo_ta, 'bộ phim', 'film');

-- e. Hiển thị bảng tblPhim sau khi cập nhật
SELECT *
FROM tblPhim;

-- 12. Xóa tất cả các khóa ngoại trong các bảng trên
ALTER TABLE tblGhe DROP FOREIGN KEY fk_tblGhe_PhongID;
ALTER TABLE tblVe DROP FOREIGN KEY fk_tblVe_PhimID;
ALTER TABLE tblVe DROP FOREIGN KEY fk_tblVe_GheID;

-- 13. Xóa dữ liệu ở bảng tblGhe
DELETE
FROM tblGhe;

-- 14. Hiển thị ngày giờ hiện chiếu và ngày giờ chiếu cộng thêm 5000 phút trong bảng tblVe
SELECT Ngay_chieu, DATE_ADD(Ngay_chieu, INTERVAL 5000 MINUTE) AS 'Ngày giờ chiếu cộng thêm 5000 phút'
FROM tblVe;
