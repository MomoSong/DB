db
use test
board={no:1, title:"mongoDB", content:"noSQL DB", writer:"관리자", writedate:new Date(), hit:0}
db.board.insert(board)

//여러줄을 볼 때는 find
db.board.find()
show dbs
db.board.insert({no:2})
db.board.insert({no:2, title:"java"})

//한개만 데이터를 가져올 때
db.board.findOne({no:2})

//데이터 삭제
db.board.remove({no:1})
db.board.find()

//업데이트
db.board.update({no:2}, board)
db.board.find()

//help
help

show dbs
db.stats()
db.hostInfo()
db.logout()
db

db.shutdownServer() //관리자 DB에서만 가능 -> admin
use admin
db.shutdownServer()

db
use test
show collections
//member라는 일반 collection 생성
db.createCollection("member")
show collections

//제한 collection 생성하기
db.createCollection("notice", {capped:true, size:200000000, max:500000})
db.stats()
db.notice.stats()
show collections

db.notice.drop()
board
board.title="oracle"
board.content="oracle jjang"
db.board.find()
board.no = 2
db.board.update({no:2},board)

db.board.remove({no:1})

//데이터 처리 : 처음 입력시 insert(), 항목별 수정 update({조건}, 수정데이터)
// 문서별 수정 save(수정데이터) - 똑같은 문서가 없으면 insert되고 
// 똑같은 문서가 있으면 update가 된다.
db.board.save(board)
db.board.remove({}) // 모든 데이터를 삭제할 때 조건형식만 넣어주고 내용은 없이 넣어준다.
