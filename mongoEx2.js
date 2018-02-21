show collections
/* select * from employees; */
db.employees.find()

/* empno = 7269인 데이터를 가져오자
   select * from employees where empno = 7369; */
db.employees.find({empno:7369}) //데이터를 배열로 받아옴 (기본이 여러개 받아옴)
db.employees.findOne({empno:7369}) //Document로 받아옴 (하나만 받아옴)

/* employees에서 사원번호가 7900인 사원의 이름 받아오기
   select ename from employees where empno = 7900;*/
db.employees.find({empno:7900}, {_id:0, ename:1})
db.employees.find({}, {_id:0, ename:1})

/* select empno, ename from employees where ename >= 'ALLEN' and ename < SCOTT 
  크다 적다를 비교 순서대로 되어져 있는게 필요 
  인뎃스를 오름차순, 내림차순으로 생성한다. */
// create index index 이름 on employees(ename)
db.employees.ensureIndex({ename:1}) //1은 오름차순 -1은 내림차순

//크다 적다의 min(), max()를 사용하려면 정렬이 되어 이어야 합니다. index or sort
db.employees.find({}, {_id:0, empno:1, ename:1}).min({ename:"ALLEN"}).max({ename:"SCOTT"})

db.employees.ensureIndex({empno:1})
/* select empno, ename, sal from employees where empno >= 7500 and empno <= 7600; 
MongoDB 비교 연산자 : {empno:{$gt:7500}} : $gt-크다, $lt-작다 */
db.employees.find({empno:{$gte:7500, $lte:7600}}, {_id:0, empno:1, ename:1, sal:1})

/* employees 컬렉션에서 job이 CLERK이고 sal이 2500~3000사이 사원번호, 사원이름, job, sal를 출력하는 처리문 작성 
  select empno, ename, job, sal from employees where job='MANAGER' and sal between 2500 and 3000; */
db.employees.find({sal:{$gte:2500, $lte:3000}, job:"MANAGER"}, {_id:0, empno:1, ename:1, job:1, sal:1})

/* 사원번호가 7521, 7782, 7839인 사원의 사원번호와 이름을 출력하시오.
select empno, ename from employees where empno in(7521, 7782, 7839) */
db.employees.find({$or:[{empno:7521},{empno:7782},{empno:7839}]}, {_id:0, empno:1, ename:1})
db.employees.find({empno:{$in:[7521, 7782, 7839]}}, {_id:0, empno:1, ename:1})

/* employees 컬렉션에 데이터가 몇개나 있습니까?
 select count(*) from employees */
 db.employees.count()
 
 /* employees에 empno>7900 데이터가 몇개나 있습니까?
 select count(*) from employees */
 db.employees.find({empno:{$gt:7900}}).count()
 
 /* 부서 코드를 모두 출력하시오
    select deptno from employees  */
db.employees.find({}, {_id:0, deptno:1})

 /* 부서 코드를 모두 출력하시오
    select distinct deptno from employees  */
db.employees.distinct("deptno").sort()

/* 부서번호 10인 사원들의 사원번호, 이름, job, 부서번호를 사원명으로 역순 정렬해서 가져오시오 
   select empno, ename, job, deptno from employees where deptno = 10 order by ename DESC */
db.employees.find({deptno:10},
{_id:0, empno:1, ename:1, job:1, deptno:1})
.sort({ename:-1}) //sort({ename:1}) - 오름차순, sort({ename:-1}) - 내림차순

db.employees.find({deptno:10},
{_id:0, empno:1, ename:"", job:"", deptno:""})
.sort({ename:-1}) //sort({ename:1}) - 오름차순, sort({ename:-1}) - 내림차순


/* 사원 중에서 커미션이 있는 사원의 사원번호, 이름, 커미션을 출력하시오
   select empno, ename, comm from employees where comm is not null; */
db.employees.find({comm:{$exists:true}},{_id:0, empno:1, ename:1, comm:1})




