create database shop default character set utf8 default collate utf8_general_ci;

use shop;
create table `shop`.`users`(
`id` varchar(10) not null primary key
);

create table `shop`.`new_user` (
	`id` varchar(10) not null primary key,
    `pw` varchar(20) not null,
	`name` varchar(5) not null,
    `gender` char(1),
    `birthday` date not null,
    `age` int not null
    );

alter table `new_user` add `phone` varchar(20) ;
alter table `new_user` drop column `age`; 
alter table `new_user` modify `age` int;
alter table `new_user` rename column `phone` to `phonenumber`;

drop table `users`;

insert into `new_user` (`age`, `id`, `pw`, `name`, `birthday`) values (15, 'aaa', '11111', 'bbbbb', '2000-02-23');
insert into `new_user` values ('aaa2', '22222', 'cccc', '2000-02-23');
insert into `new_user` values ('aaa3', '22222', 'ddddd', null, '2000-02-23', 17, null);

insert into `new_user` (`id`, `pw`, `name`, `gender`, `birthday`, `age`) values ('dvadva', 'k3f3ah', '송하나', 'F', '1994-06-03', 22);
insert into `new_user` (`id`, `pw`, `name`, `gender`, `birthday`, `age`) values ('hanjo', 'jk48fn4', '한조', 'M', '1994-10-08', 25);
insert into `new_user` (`id`, `pw`, `name`, `gender`, `birthday`, `age`) values ('hong1234', 'k3dd3ah', '김이박', 'F', '2000-08-03-4', 22);


truncate `new_user`;
alter table `new_user` drop column `phonenumber`;
insert into `new_user` 
values ('dvadva', 'k3f3ah', '송하나', 'F', '1994-06-03', 22),
("hanjo", "jk48fn4", "한조", "M", "1984-10-18", 39),
("hong1234", "8o4bkg", "홍길동", "M", "1990-01-31", 33),
("jungkrat", "4ifha4", "정크랫", "M", "1994-06-03", 24),
("power70", "qxur8sda", "변사또", "M", "1970-05-02", 53),
("sexysung", "87awjkdf", "성춘향", 'F', "1992-03-31", 31),
("widowmaker", "38ewifh3", "위도우", null, "1986-06-27", 47);

update `new_user` set `pw` = 'songsong' where `id` = 'dvadva';
update `new_user` set `name` = '핫토리' where `id` = 'hanjo';
delete from `new_user` where `id` = 'sexysung';