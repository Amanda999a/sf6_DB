update `new_user` set `age` = 45 where `id` = 'hanjo';
update `new_user` set `age` = `age` + 1 where `gender` = `F` limit 3;

delete from `new_user` where `id` = 'hanjo';

truncate table `new_user`;