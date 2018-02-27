//function 선언 -> 호출해서 사용한다.
function seq_no(name){
	 //findAndModify
	 var ret = db.seq_no.findAndModify(
	 	{query:{_id:name}, update:{$inc:{next:1}}, new:true, upsert:true})
	 return ret.next;
	 
}

seq_no("notice_seq")

db.seq_no.find()

db.system.js.save(
{_id:"seq_no",
  value:function (name){
		 //findAndModify
			 var ret = db.seq_no.findAndModify(
		 		{query:{_id:name}, update:{$inc:{next:1}}, new:true, upsert:true})
			 return ret.next; 
		}
})
// db.loadServerScripts()를 이용해서 로드해서 사용하세요.
db.loadServerScripts()
seq_no("board_seq")
db.seq_no.find()
db.board.find()
db.board.insert({_id:seq_no("board_seq"), title:"java"})
db.board.insert({_id:seq_no("board_seq"), title:"oracle"})
