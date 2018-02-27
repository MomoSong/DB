db.order.find();
/* 고객아이디, 주문 가격 */
var map_function=function(){
    emit(this.cust_id, this.price);
};

/* 주문가격을 더하는 처리 */
var reduce_function=function(keyCustId, valuesPrices){
    return Array.sum(valuesPrices);
}

/* 선언되어져 있는 함수를 이용해서 데이터 처리 */
db.order.mapReduce(
    map_function,
    reduce_function,
    {out:"order_cust_total"});
    
db.order_cust_total.find();
   

/* 제품명별 수량의 평균 */

/* 제품이름과 수량을 가져 오는데 items안에 배열로 있다. */
var map_function=function(){
    for(var idx=0;idx<this.items.length;idx++){
        var key=this.items[idx].item_name;
        var value={
            count:1,
            qty:this.items[idx].qty
        };
        /* emit() 데이터를 여러개 내보내므로 배열이 된다. */
        emit(key,value);
    }
}

/* map 함수에서 값을 넘겨 주는 것이 배열이므로 배열 처리한다. */
var reduce_function=function(keySKU,valuesCountObjects){
    reducedValue={count:0, qty:0}; //카운트와 주문수량을 합하는 객체
    for ( var idx=0;idx<valuesCountObjects.length ; idx++){
        reducedValue.count += valuesCountObjects[idx].count;
        reducedValue.qty += valuesCountObjects[idx].qty;
    };
    return reducedValue; //finalize 더해진 결과를 값으로 전달 받는다.
}

var finalize_function=function(key,reducedValue){
    // 평균을 구해서 reducedValue 객체에 추가한다.
    reducedValue.average=reducedValue.qty/reducedValue.count;
    return reducedValue;
}

db.order.mapReduce(
    map_function,
    reduce_function,
    {
        // merge : colloection이 존재하면 합친다.
        // replace : colloection이 존재하면 교체한다.
        // reduce :  colloection이 존재하면서 key가 같은 document는 덮어 쓴다.
        out:{merge:"map_reduce_example"},
        query:{order_date:{$gt:new Date('01/01/2012')}},
        finalize:finalize_function
    }
);
    
db.map_reduce_example.find();
    
db.order.find();



//2018-2-27
//system의 로그처리 (사용자 아이디, 접속시간, 사용한 시간)
db.log_session.save({userid:"T2013001",ts:ISODate("2013-01-03 15:07:00"), length:88});
db.log_session.save({userid:"T2013002",ts:ISODate("2013-01-03 15:13:00"), length:10});
db.log_session.save({userid:"T2013003",ts:ISODate("2013-01-03 16:12:00"), length:120});
db.log_session.save({userid:"T2013004",ts:ISODate("2013-01-03 17:35:00"), length:35});
db.log_session.save({userid:"T2013001",ts:ISODate("2013-01-04 12:15:00"), length:125});
db.log_session.save({userid:"T2013002",ts:ISODate("2013-01-04 14:04:00"), length:110});
db.log_session.save({userid:"T2013003",ts:ISODate("2013-01-04 18:50:00"), length:135});
db.log_session.save({userid:"T2013004",ts:ISODate("2013-01-04 16:27:00"), length:85});

db.log_session.find();

var map_function = function(){
	var key = this.userid;
	var value = {userid: this.userid, 
	total_time:this.length, //사용 시간을 전부 더한다.
	count:1, // 접속할 때 마다 1을 더한다.
	avg_time:0 // 접속 평균은 합계를 구한 후 더한다.
	}
	emit(key, value)
}

// map에서 던진 데이터를 받아서 처리하는 reduce 함수를 만든다.
// 합계와 카운트를 구한다.
var reduce_function=function(key,values){
    //reduce 결과를 담을 객체 선언
    var reducedObject={
        userid:key,
        total_time:0,
        count:0,
        avg_time:0
    };
    //가져온 values를 처리한다. -> for문을 이용한 length
    //향상된 for -> foreach
    values.forEach(function(value){
        reducedObject.total_time += value.total_time;
        reducedObject.count += value.count;
    });
    return reducedObject;
}

//reduce 결과를 가지고 평균을 구하는 finalize function
var finalize_function = function(key, reduceValue){
  //0으로 나눠지는 것을 방지하기 위해 if문 처리
    if(reduceValue.count>0)
        reduceValue.avg_time = reduceValue.total_time/reduceValue.count;
    return reduceValue;
}

db.log_session.mapReduce(
    map_function,
    reduce_function,
    {
        out:{replace:"session_stat"},
        finalize:finalize_function
    }
);
    
db.session_stat.find();
