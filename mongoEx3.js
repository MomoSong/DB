db.employees.find()

//입사일 1980-1-1 부터 1981-12-31 사이의 사원들의 데이터를 가지고 
//부서별 월급의 합계를 구해보자.
// select deptno, sum(sal) csum from employees 
// where hiredate between '01-01-1980' and '31-12-1981' group by deptno
//몽고DB에서는 group(), aggregate(), mapReduce를 각각 이용해서 만들 수 있음
db.employees.group({
	key:{deptno:true}, // 그룹핑 하는 항목
	cond:{hiredate:{$gte: ISODate("1980-0101"), $lte:ISODate("1981-12-31")}}, // 조건
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
// 'S.*H' -> S 글자가 먼저오고 H가 나중에 오는 문자열을 찾아라.
// .: 한문자, *: 앞에 글자가 0번 이상 나온다.
// S로 시작하고 H로 끝나는 문자열 : '^S.*H$'
db.employees.find({ename:{$regex:'^S.*H$', $options:'i'}}, {_id:0, empno:1, ename:1})

db.employees.find({ename:{$regex:'^s.*h$', $options:'i'}}, {_id:0, empno:1, ename:1})

db.employees.find({ename:{$regex:'s.*h$', $options:'m'}}, {_id:0,empno:1,ename:1})

// $options : 'i' 대소문자 구별 안함. 'm' 대소문자 구별함

db.employees.find({ename:{$regex:'^[a-zA-Z]{4,5}$',$options:'i'}},{_id:0,empno:1,ename:1})

//employees 에서 데이터 한개를 가져오자.
db.employees.findOne()
db.employees.find().skip((3-1)*3).limit(3)

