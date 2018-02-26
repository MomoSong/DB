db.order.find();

//map 함수 정의 --> 데이터가 배열로 나오게 된다.
//var 변수 선언하는 키워드
var map_function = function(){
  //고객 아이디와 구매 금액을 수집해서 내보낸다.
	emit(this.cust_id, this.price);
}

//reduce 함수 정의(키, 값) -> 데이터 처리하는 함수
var reduce_function = function(keyCustId, valuesPrices){
	return Array.sum(valuesPrices);
}

//mapReduce 함수를 이용한 데이터 처리
db.order.mapReduce(
	map_function,
	reduce_function,
	//컬렉션을 지정해서 저장한다.
	{out:"order_cust_total"}
)

db.order_cust_total.find()

// maReduce 위와 동일한 맵리듀스
db.order.mapReduce(

	function(){
	  //고객 아이디와 구매 금액을 대상으로 작업
		emit(this.cust_id, this.price);
	},

	function(keyCustId, valuesPrices){
		return Array.sum(valuesPrices);
	},
	// 컬렉션을 지정해서 저장한다.
	{out:"order_cust_total"}
)


// 제품별 수량의 평균 맵리듀스
// 데이터를 넘기는 함수를 작성한다.
var map_function = function(){
	for(var idx = 0; idx < this.items.length; idx++){
		var key = this.items[idx].item_name; //상품별 
		var value = {
			count:1, qty:this.items[idx].qty
		}
		
		emit(key, value); //위에서 수집한 데이터를 내보낸다.
	}
}

//넘어온 데이터로 처리하는 함수
var reduce_function = function(keySKU, values){
	// 결과 변수
	reduceValue = {count:0, qty:0} //return하는 객체
	for(var idx = 0; idx < values.length; idx++){
		reduceValue.count += values[idx].count; //1증가
		reduceValue.qty += values[idx].qty; //상품의 주문 수량 더하기
	};
	return reduceValue;
}

//map:추출데이터 -> reduce:처리 -> finalize : 추가처리(평균을 구한다.)
var finalize_function = function(key, reducedValue){
	reducedValue.average = 
	reducedValue.qty / reducedValue.count;
	return reducedValue;
}

db.order.mapReduce(
	map_function,
	reduce_function,
	{out:"map_reduce_example", 
	  finalize:finalize_function} 
)

db.map_reduce_example.find()







