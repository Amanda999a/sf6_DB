-- 실습1) 테이블 생성하기
create table `customers`(
	`id` varchar(50) primary key not null,
    `name` varchar(50) not null,
    `email` varchar(255) not null,
    `address` varchar(255) not null
    );
    
create table `orders`(
	`id` int primary key not null,
    `customer_id` varchar(50) not null,
    `date` varchar(255) not null,
    foreign key (customer_id) references customers(id)
    on update cascade on delete cascade
    );
    
create table `order_detail`(
	`order_id` int,
    `item` varchar(50) not null,
    `quantitiy` int not null,
    foreign key (order_id) references orders(id)
    on update cascade on delete cascade
    );

    -- 실습 2) 테이블에 데이터 삽입하기
    insert into customers(id, name, email, address) values 
    ('alice789', 'Alice Johnson', 'alice.johson@gotmail.com', '789 Elm st, Nowhere'),
    ('jane456', 'Jane Doe', 'jane.doe@yahoo.om', '456 Oak Ave, Somewhere'), 
    ('john123', 'John Smith', 'john.smith@gmail.com', '123 Main St, Anytown, USA') ;
    
	insert into orders(id, customer_id, date) values 
    ('1', 'john123', '2022-01-01'),
    ('2', 'john123', '2022-02-01'), 
    ('3', 'jane456', '2022-03-01');
    
    insert into order_detail(order_id, item, quantitiy) values 
    ('1', 'pen', '10'),
    ('1', 'toy', '2'), 
	('2', 'clothes', '5'), 
    ('3', 'socks', '100');
    
    -- 실습3) DML, DDL 복습 
    -- 1. orders 테이블에 총 금액(total) 컬럼 추가하기
    alter table orders add total int;
    -- 2. 총 금액을 아래와 같이 업데이트 하기
    update orders set total = 10000 where id = 1;
    update orders set total = 15000 where id = 2;
    update orders set total = 20000 where id = 3;
    -- 3. id가 john123인 고객 John Park으로 이름 수정하기
    update customers set name = 'John Park' where id = 'john123';
    
    
    
    