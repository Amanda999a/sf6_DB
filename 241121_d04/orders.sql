SELECT * FROM 241121_실습1.orders;

-- 실습 4. SELECT 복습
-- 1. 2022-01-01 ~ 2022-02-01 기간동안 주문한 고객의 아이디를 중복 없이 가져오기
SELECT DISTINCT customer_id
	FROM `241121_실습1`.`orders`
	WHERE date >= '2022-01-01' and date <= '2022-02-01';

-- 2. 2022-01-01 ~ 2022-02-01 기간동안 주문한 고객의 이름 중복없이 가져오기 (서브쿼리)
select `name` from customers
	where id = (SELECT DISTINCT customer_id
	FROM `241121_실습1`.`orders`
	WHERE date >= '2022-01-01' and date <= '2022-02-01');

-- 3. 총 금액이 가장 높은 데이터 가져오기 (MAX 함수 사용하지않고)
SELECT *
	FROM `241121_실습1`.`orders`
	ORDER BY `total` desc
	LIMIT 1;

-- 4. 총 금액이 가장 높은 데이터 가져오기(MAX 함수 사용해서)
SELECT max(total) from orders;

-- 5. 각각의 customer가 몇 개의 주문을 했는지 검색하기
select customer_id, count(customer_id)
	from orders
	group by customer_id;

-- 6. 21000원 이상 결제한 고객의 총 금액 total_price로 가져오기
select customer_id, sum(total) as `total_price`
	from orders
	group by customer_id
	having total_price >= 21000;

-- 7. 각 주문 정보에 대해 고객 정보와 주문 정보를 함께 가져오기
select * 
	from orders
	inner join customers 
	on customers.id = orders.customer_id;
    
-- 8. 주문을 하지 않은 고객 정보도 가져오기
select *
	from orders 
    right join customers
    on customers.id = orders.customer_id;
