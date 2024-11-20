create database shop default character set utf8 default collate utf8_general_ci;

use shop;

create table `shop`.`member` (
	`id` varchar(20) primary key not null,
	`name` varchar(5) not null,
    `age` int ,
    `gender` varchar(2),
    `email` varchar(50) not null,
    `promotion` varchar(2) default 'x'
    );
    
    alter table `member` modify `id` varchar(10);
    alter table `menber` drop column `age`;
    alter table `member` add `interest` varchar(100) ;
    
