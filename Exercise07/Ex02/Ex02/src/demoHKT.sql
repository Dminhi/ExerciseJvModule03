-- Tạo cơ sở dữ liệu
CREATE DATABASE IF NOT EXISTS LibraryManagement;

-- Sử dụng cơ sở dữ liệu
USE LibraryManagement;

-- Bảng Category
CREATE TABLE Category
(
    Id     INT PRIMARY KEY AUTO_INCREMENT,
    Name   VARCHAR(100) NOT NULL,
    Status TINYINT DEFAULT 1 CHECK (Status IN (0, 1))
);

-- Bảng Author
CREATE TABLE Author
(
    Id        INT PRIMARY KEY AUTO_INCREMENT,
    Name      VARCHAR(100) NOT NULL UNIQUE,
    TotalBook INT DEFAULT 0
);

-- Bảng Book
-- Bảng Book
CREATE TABLE Book
(
    Id              INT PRIMARY KEY AUTO_INCREMENT,
    Name            VARCHAR(150) NOT NULL,
    Status          TINYINT  DEFAULT 1 CHECK (Status IN (0, 1)),
    Price           FLOAT        NOT NULL CHECK (Price >= 100000),
    BookCreatedDate DATETIME default CURRENT_TIMESTAMP,
    CategoryId      INT          NOT NULL,
    AuthorId        INT          NOT NULL,
    FOREIGN KEY (CategoryId) REFERENCES Category (Id),
    FOREIGN KEY (AuthorId) REFERENCES Author (Id)
);

-- Bảng Customer
CREATE TABLE Customer
(
    Id                  INT PRIMARY KEY AUTO_INCREMENT,
    Name                VARCHAR(150) NOT NULL,
    Email               VARCHAR(150) NOT NULL UNIQUE CHECK (Email LIKE '%@gmail.com' OR Email LIKE '%@facebook.com' OR
                                                            Email LIKE '%@bachkhoa-aptech.edu.vn'),
    Phone               VARCHAR(50)  NOT NULL UNIQUE,
    Address             VARCHAR(255),
    CustomerCreatedDate DATETIME default CURRENT_TIMESTAMP,
    Gender              TINYINT      NOT NULL CHECK (Gender IN (0, 1, 2)),
    BirthDay            DATE         NOT NULL
);

-- Bảng Ticket
CREATE TABLE Ticket
(
    Id         INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT NOT NULL,
    Status     TINYINT  DEFAULT 1 CHECK (Status IN (0, 1, 2, 3)),
    TicketDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerId) REFERENCES Customer (Id)
);

-- Bảng TicketDetail
CREATE TABLE TicketDetail
(
    TicketId    INT NOT NULL,
    BookId      INT NOT NULL,
    Quantity    INT NOT NULL CHECK (Quantity > 0),
    DeposiPrice FLOAT,
    RentCost    FLOAT,
    PRIMARY KEY (TicketId, BookId),
    FOREIGN KEY (TicketId) REFERENCES Ticket (Id),
    FOREIGN KEY (BookId) REFERENCES Book (Id)
);
-- Trigger for TicketDetail
DELIMITER //
CREATE TRIGGER before_insert_TicketDetail
    BEFORE INSERT
    ON TicketDetail
    FOR EACH ROW
BEGIN
    SET NEW.DeposiPrice = (SELECT Price FROM Book WHERE Id = NEW.BookId);
    SET NEW.RentCost = 0.1 * NEW.DeposiPrice;
END;
//
DELIMITER ;

-- Thêm dữ liệu vào bảng Category
INSERT INTO Category (Name)
VALUES ('Fiction'),
       ('Science'),
       ('Romance'),
       ('Mystery'),
       ('Biography');

-- Thêm dữ liệu vào bảng Author
INSERT INTO Author (Name)
VALUES ('John Doe'),
       ('Jane Smith'),
       ('Mark Johnson'),
       ('Lisa Anderson'),
       ('Chris Brown');

-- Thêm dữ liệu vào bảng Book
-- Thêm 15 bản ghi dữ liệu vào bảng Book với tên sách ngẫu nhiên
INSERT INTO Book (Name, Status, Price, BookCreatedDate, CategoryId, AuthorId,salePrice)
VALUES ('The Silent Garden', 1, 150000, '2024-03-08', 1, 1,300000),
       ('Eternal Flame', 1, 200000, '2024-03-08', 2, 2,300000),
       ('Whispering Shadows', 1, 120000, '2024-03-08', 3, 3,300000),
       ('Secrets of the Cosmos', 1, 180000, '2024-03-08', 4, 4,300000),
       ('Astral Serenity', 1, 250000, '2024-03-08', 5, 5,300000),
       ('Chronicles of Destiny', 1, 160000, '2024-03-08', 1, 1,300000),
       ('Dancing with Dragons', 1, 220000, '2024-03-08', 2, 2,300000),
       ('Moonlit Journey', 1, 130000, '2024-03-08', 3, 3,300000),
       ('Enchanted Echoes', 1, 190000, '2024-03-08', 4, 4,300000),
       ('Starlight Symphony', 1, 280000, '2024-03-08', 5, 5,300000),
       ('Realm of Dreams', 1, 170000, '2024-03-08', 1, 1,300000),
       ('Whirlwind of Wonders', 1, 240000, '2024-03-08', 2, 2,300000),
       ('Mystical Melodies', 1, 140000, '2024-03-08', 3, 3,300000),
       ('Celestial Harmony', 1, 200000, '2024-03-08', 4, 4,300000),
       ('Beyond the Horizon', 1, 300000, '2024-03-08', 5, 5,300000);
-- Thêm dữ liệu vào bảng Customer
INSERT INTO Customer (Name, Email, Phone, Address, Gender, BirthDay)
VALUES ('Customer1', 'customer1@gmail.com', '123456789', '123 Street, City', 0, '1990-01-01'),
       ('Customer2', 'customer2@facebook.com', '987654321', '456 Street, City', 1, '1995-05-05');
-- thêm tiếp...

-- Thêm dữ liệu vào bảng Ticket
INSERT INTO Ticket (CustomerId, Status, TicketDate)
VALUES (1, 1, '2024-03-11 12:00:00'),
       (2, 2, '2024-03-11 14:30:00');
-- thêm tiếp...

-- Thêm dữ liệu vào bảng TicketDetail
INSERT INTO TicketDetail (TicketId, BookId, Quantity, DeposiPrice, RentCost)
VALUES (1, 1, 2, 30000, 15000),
       (1, 2, 1, 40000, 20000),
       (2, 3, 3, 25000, 12000);
-- Yêu cầu 1
select *
from Book
order by Price desc;
select c.id, c.name, count(b.id), if(c.Status, 'Hiển thị', '')
from Category c
         join Book B on c.Id = B.CategoryId
group by c.id;

select ct.id,
       Name,
       email,
       phone,
       address,
       customercreateddate,
       case
           when gender = '0' then 'Nam'
           when Gender = '1' then 'Nu'
           else 'Khac' end                                                   as gender,
       birthday,
       YEAR(NOW()) - YEAR(BirthDay) - (RIGHT(NOW(), 5) < RIGHT(BirthDay, 5)) AS Age
from Customer ct;

update Author a
set TotalBook = (select count(b.id) from book b where b.AuthorId = a.Id)
where exists(select 1 from Book b where b.AuthorId = a.Id);

delete
from Author
where TotalBook = 0;

-- Yêu cầu 2
-- View v_getBookInfo thực hiện lấy ra danh sách các Book được mượn nhiều hơn 3 cuốn
create view v_getBookInfo as
select b.name, td.Quantity
from Book b
         join TicketDetail TD on b.Id = TD.BookId
where Quantity >= 3;
-- View v_getTicketList hiển thị danh sách Ticket gồm: Id, TicketDate, Status, CusName, Email, Phone,TotalAmount (Trong đó TotalAmount là tổng giá trị tiện phải trả, cột Status nếu = 0 thì hiển thị Chưa trả, = 1 Đã trả, = 2 Quá hạn, 3 Đã hủy)
create view v_getTicketList as
select tk.Id,
       tk.TicketDate,
       case
           when tk.Status = 0 then 'Chưa trả'
           when tk.Status = 1 then 'Đã trả'
           when tk.Status = 2 then 'Quá hạn'
           when tk.Status = 3 then 'Huỷ'
           else 'Khác'
           end                   as statuss,
       c.Name,
       c.Phone,
       td.Quantity * td.RentCost as totalAmount
from Ticket tk
         join Customer C on C.Id = tk.CustomerId
         join TicketDetail td on tk.Id = td.TicketId;
-- Yêu cầu 3 ( Sử dụng lệnh SQL tạo thủ tục Stored Procedure )
-- 1.	Thủ tục addBookInfo thực hiện thêm mới Book, khi gọi thủ tục truyền đầy đủ các giá trị của bảng Book ( Trừ cột tự động tăng )


delimiter //
create procedure addBookInfor(book_name varchar(150), book_status tinyint, book_price float, CreatedDateBook datetime,
                              idCatagory int, idAuthor int)
begin
    insert into Book(name, status, price, BookCreatedDate, CategoryId, AuthorId) value
        (book_name, book_status, book_price, CreatedDateBook, idCatagory, idAuthor);
end //
// delimiter ;


call addBookInfor('Người phán sử', 1, 200000, '2000-12-12', 1, 1);

-- Thủ tục getTicketByCustomerId hiển thị danh sách đơn hàng của khách hàng theo Id khách hàng gồm:
-- Id, TicketDate, Status, TotalAmount (Trong đó cột Status nếu =0 Chưa trả, = 1  Đã trả, = 2 Quá hạn, 3 đã hủy ),
-- Khi gọi thủ tục truyền vào id cuả khách hàng

delimiter //
create procedure getTicketByCustomerId(idCustomer int)
begin
    select tk.id,
           tk.customerid,
           case
               when tk.status = 0 then 'Chưa trả'
               when tk.status = 1 then 'Đã trả'
               when tk.status = 2 then 'Quá hạn'
               when tk.status = 3 then 'Đã huỷ'
               else 'Khac' end,
           td.Quantity * td.RentCost as Amount
    from Ticket tk
             join TicketDetail TD on tk.Id = TD.TicketId
    where tk.CustomerId = idCustomer;
end //

// delimiter ;

call getTicketByCustomerId(1);

-- Thủ tục getBookPaginate lấy ra danh sách sản phẩm có phân trang gồm:
-- Id, Name, Price, Sale_price, Khi gọi thủ tuc truyền vào limit và page

alter table Book
    add column salePrice float not null;

update Book
set salePrice = Price * 1.1;

delimiter //
create procedure getBookPaginate(limits int, pageNumber int)
begin
    declare offsetValue int;
    set offsetValue = (pageNumber - 1) * limits;
    select id, name, price, salePrice
    from Book b
    limit limits OFFSET offsetValue;
end //
// delimiter ;
call getBookPaginate(5, 2);

-- Yêu cầu 4 ( Sử dụng lệnh SQL tạo Trigger )
-- 1.	Tạo trigger tr_Check_total_book_author sao cho khi thêm Book
-- nếu Author đang tham chiếu có tổng số sách > 5 thì không cho thêm mới
-- và thông báo “Tác giả này có số lượng sách đạt tới giới hạn 5 cuốn,
-- vui long chọn tác giả khác”

delimiter //
CREATE trigger tr_Check_total_book_author
    before insert
    on Book
    for each row
begin
    declare countAuthor int;
    select count(*)
    into countAuthor
    from Book
    where AuthorId = new.AuthorId;
    if countAuthor > 5 then
    signal sqlstate '45000'
    set message_text = 'Tác giả này có số lượng sách đạt tới giới hạn 5 cuốn,
    vui long chọn tác giả khác';
    end if;
end
// delimiter ;
-- 2.Tạo trigger tr_Update_TotalBook khi thêm mới Book
-- thì cập nhật cột TotalBook rong bảng Author = tổng của Book theo AuthorId

delimiter //
create trigger tr_Insert_TotalBook
    after insert on Book
    for each row
    begin
        update Author set
        TotalBook = TotalBook+1 where Id = NEW.AuthorId;
    end //
    //delimiter ;