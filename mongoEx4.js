db.order.drop();

db.order.insert({cust_id : "A2012001",
    order_date: new Date("Oct 01, 2012"),
    status:"A",
    price:250,
    items:[{item_name:"Bunny Boots", qty:5, price:25},
    {item_name:"Skey Pole", qty:5, price:25}]});
    
db.order.insert({cust_id : "A2012001",
    order_date: new Date("Sep 15, 2012"),
    status:"A",
    price:500,
    items:[{item_name:"Bunny Boots", qty:15, price:25},
    {item_name:"Skey Pole", qty:5, price:25}]});

db.order.insert({cust_id : "A2012002",
    order_date: new Date("Sep 15, 2012"),
    status:"A",
    price:500,
    items:[{item_name:"Bunny Boots", qty:15, price:25},
    {item_name:"Skey Pole", qty:5, price:25}]});

db.order.find();

/*
 select sum(price) from order	
 $group - 그룹함수 처리를 위해서 결과값을 사용할 때 대상을 정의
		   불러온 데이터의 항목을 사용하려면 필드앞에 $를 붙인다.
 $sort -  처리된 결과를 정렬해서 가져올 정렬을 정의한다.
 $match - 처리된 결과 중에서 조건에 맞는 데이터를 정의한다.
 		  조건이 여거개인 경우 $match를 하나 더 만들 수 있다.
 $project = 보여줄 항목에 대한 정의
 $sum - 항목
*/
db.order.aggregate([
	{$group:{_id:null, total_price:{$sum:"$price"}}}
])    

/*
select count(*) from order
*/
db.order.aggregate([
	{$group:{_id:null, count:{$sum:1}}}
])    

/*
고객 번호로 그루핑해서 데이터 처리
select cust_id, sum(price) from order
group by cust_id
*/
db.order.aggregate([
	{$group:{_id:"$cust_id",total_price:{$sum:"$price"}}}
])

db.order.aggregate([
	{$group:{_id:"$cust_id",total_price:{$sum:"$price"}}},{$sort:{total_price:-1}}
])

db.order.aggregate([
	{$group:{_id:"$cust_id",total_price:{$sum:"$price"},count:{$sum:1}}},{$sort:{count:-1}}
])

/*
그루핑한 데이터의 결과 중에 조건에 맞는 데이터 가져오기
select cust_id, count() from order group by cust_id having count(*) > 1
*/
db.order.aggregate([
	{$group: {_id:{cust_id:"$cust_id"}, count:{$sum:1}}},
	{$match: {count : {$gt:1}}}
])

/*
부서 번호가 10번이고 급여가 1000~3000사이
*/
//db.employees.find(
//	{{},{}},{} 
//)
db.employees.aggregate([
	{$match:{deptno:10, sal:{$gte:1000, $lte:3000}}},
	{$project:{_id:0, empno:1, sal:1, ename:{$toLower:"$ename"}, job:{$toUpper:"$job"}}}
])

db.employees.find(
	{deptno:10, sal:{$gte:1000, $lte:3000}},
	{_id:0, empno:1, sal:1}
)

/*
사원 컬렉션에서 부서별 사원수와 급여의 총합계, 평균을 구하는 처리문을 aggregate를 이용해서 처리하시오.
*/
db.employees.aggregate([
	{$match:{deptno:10, avg:{$avg:"$sal"}}},
	{$project:{_id:0, empno:1, sal:1, ename:{$toLower:"$ename"}, job:{$toUpper:"$job"}}}
])

db.employees.aggregate([
 {
   $group:{_id:"$deptno", count:{$sum:1}, dept_total_sal:{$sum:"$sal"}, dept_avg_sal:{$avg:"$sal"}}
 }
])


