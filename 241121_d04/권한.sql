-- < DCL >

-- 현재 root만 존재함~
-- 1. MySQL 사용자 추가 (= 새로운 계정 'other' 추가)
CREATE USER 'other'@'localhost' IDENTIFIED BY '1234';

-- 2. codee 계정에 DB 권한 부여 (모든 DB에 접근 가능하도록)
-- 참고) WITH GRANT OPTION: 권한을 다른 사용자한테 부여 가능 여부를 결정하는 옵션 
-- (1) 권한 설정
-- GRANT PRIVILEGES ON [데이터베이스명.테이블명] TO [사용자@호스트] IDENTIFIED BY '비밀번호' WITH GRANT OPTION;
-- (2) 모든 권한 허용
-- GRANT ALL PRIVILEGES ON *.* TO [사용자@호스트] IDENTIFIED BY '비밀번호' WITH GRANT OPTION;
-- (3) 특정 테이블의 특정 컬럼 조회 권한 허용
-- GRANT SELECT(id, name), INSERT ON [데이터베이스명].[테이블명] TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON shop.* TO 'other'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'other'@'localhost' WITH GRANT OPTION;

/*
# 모든 데이터베이스의 모든 테이블에 모든 권한을 줌
grant all privileges on *.* to '사용자'@'localhost';

# 특정 데이터베이스의 모든 테이블에 모든 권한을 줌
grant all privileges on DB이름.* to '사용자'@'localhost';

# 특정 데이터베이스의 특정 테이블에 모든 권한을 줌
grant all privileges on DB이름.테이블명 to '사용자'@'localhost';

# 특정 데이터베이스의 특정 테이블에 select 권한을 줌
grant select on DB이름.테이블명 to '사용자'@'localhost';

# 특정 데이터베이스의 특정 테이블에 select, insert 권한을 줌
grant select, insert on DB이름.테이블명 to '사용자'@'localhost';

# 특정 데이터베이스의 특정 테이블의 컬럼1과 컬럼2의 update 권한을 줌
grant update(컬럼1, 컬럼2) on DB이름.테이블명 to '사용자'@'localhost';
*/

-- 3. 현재 사용중인 MySQL 캐시를 지우고 새로운 설정 적용
FLUSH PRIVILEGES; 
-- 테이블이나 데이터베이스 권한 GRANT로 수정시 해당 명령어 필요 없음
-- 단, INSERT, UPDATE, DELETE로 권한 수정시에는 바로 반영이 안되기 때문에 새로고침 필요함

-- 참고) 생성한 유저 확인 (mysql 데이터베이스의 user 테이블)
SELECT * FROM mysql.user;

-- 참고) MySQL 비번 변경하고 싶다면?
ALTER USER 'other'@'localhost' IDENTIFIED WITH mysql_native_password BY '변경할_비밀번호';



-- GRANT : 특정 데이터베이스의 특정 사용자에게 권한 부여
-- permission_type: SELECT, INSERT, UPDATE, DELETE 부여 권한 유형
-- database_name.table_name: 특정 데이터베이스의 특정 테이블 
-- username: 권한 부여되는 사용자 이름
-- host: 데이터베이스 위치
GRANT permission_type ON database_name.table_name TO 'username'@'host';

-- EX. 'codingon'라는 데이터베이스의 모든 테이블(*)에'codee'이라는 사용자의 SELECT 권한을 취소
GRANT SELECT ON shop.* TO 'other'@'localhost';



-- REVOKE : 권한 회수
-- permission_type: SELECT, INSERT, UPDATE, DELETE 취소 권한 유형
-- database_name.table_name: 특정 데이터베이스의 특정 테이블 
-- username: 권한 취소되는 사용자 이름
-- host: 데이터베이스 위치
REVOKE permission_type ON database_name.table_name FROM 'username'@'host';

-- EX. 'shop'라는 데이터베이스에서 모든 테이블(*) 'codee'이라는 사용자의 SELECT 권한을 취소
/*
REVOKE 명령은 지정된 사용자에 대해 지정된 권한만 취소하며 
사용자의 계정이나 사용자에게 부여되었을 수 있는 다른 권한은 제거하지 않는다는 점에 유의해야 합니다. 
또한 사용자가 특정 데이터베이스 또는 테이블에 대해 여러 권한을 가지고 있는 경우 
REVOKE 명령을 사용하여 개별 권한을 선택적으로 제거하고 다른 권한은 그대로 둘 수 있습니다.
*/
REVOKE SELECT ON shop.* FROM 'other'@'localhost';

-- 모든 권한 박탈
REVOKE ALL ON *.* FROM 'other'@'localhost'; -- FROM 왜 밑줄?


-- 계정 삭제
DROP USER 'other'@'localhost';
FLUSH PRIVILEGES;


DESC mysql.user;
SELECT user, host FROM mysql.user;