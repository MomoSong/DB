db.employees.find()

//입사일 1980-1-1 부터 1981-12-31 사이의 사원들의 데이터를 가지고 
//부서별 월급의 합계를 구해보자.
// select deptno, sum(sal) csum from employees 
// where hiredate between '01-01-1980' and '31-12-1981' group by deptno
//몽고DB에서는 group(), aggregate(), mapReduce를 각각 이용해서 만들 수 있음
db.employees.group({
	key:{deptno:true}, // 그룹핑 하는 항목
	cond:{hiredate:{$gte:"01-01-1980", $lte:"31-12-1981"}}, // 조건
	reduce:function(obj,prev){prev.csum += obj.sal;}, // 한개의 데이터당 처리하는 내용
	initial:{csum:0} // 초기값 세팅
})

var res = db.employees.group({
	key:{deptno:true}, // 그룹핑 하는 항목
	cond:{hiredate:{$gte:"01-01-1980", $lte:"31-12-1981"}}, // 조건
	reduce:function(obj,prev){prev.csum += obj.sal;}, // 한개의 데이터당 처리하는 내용
	initial:{csum:0} // 초기값 세팅
})
printjson(res)

//정규식을 이용한 데이터 검색 -> 오라클의 like 연산자가 없어서
db.employees.find({ename:{$regex:'^S.*h$', $options:'i'}}, {_id:0, empno:1, ename:1})