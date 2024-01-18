<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- jsp가 가진 정보를 명시할때 사용 -->

<div class="container">
	<h1>게시글 조회</h1>
	<table>
		<tr>
			<th>게시글 번호</th>
			<td>${boardInfo.bno}</td>
		</tr>

		<tr>
			<th>제목</th>
			<td>${boardInfo.title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${boardInfo.writer}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="3" cols="2" style="width: 100px;" readonly>
			${boardInfo.contents}</textarea></td>
		</tr>
		<tr>
			<th>이미지</th>
			<!-- app.jpg -->
			<td><img src = "<c:url value = "/resources/${boardInfo.image}"/>"></td>
		</tr>
		<tr>
			<th>작성 날짜</th>
			<td>${boardInfo.regdate}</td>
		</tr>
	</table>

</div>
<div>
	<button type="button" onclick="location.href='boardList'">목록으로</button>
	<button type="button" id="updateBtn">수정</button>
	<button type="button"
		onclick="location.href='boardDelete?eid=${boardInfo.bno}'">삭제</button>
	<!-- 컨트롤러에서 사용한 변수인 bno를 쓴다 -->

</div>

<script>
  	document.querySelector('#updateBtn')//위에 id=updateBtn부분
  		.addEventListener('click', updateBoardInfo);
  	
  	function updateBoardInfo(event){ 
  		//form태그 내부의 입력태그를 기반으로 정보를 가져옴
  		let boardInfo = getBoardInfo();
  		console.log(boardInfo);
  		
  		//해당 정보를 기반으로 Ajax
  		//QueryString : key=value&key=value.. 객체랑은 다른형태 그래서 변환이필요
   		fetch('boardUpdate',{ //실제 컨트롤러의 경로
  			method : 'post',
  			body : new URLSearchParams(boardInfo)
  		})
  		.then(response=>response.json())
  		.then(result => {
  			console.log('QueryString',result)
  		})
  		.catch(err=>console.log(err));
  		
  		// - JSON : {"key":"value", "key" : "value",...}(객체이다)
  		fetch('boardUpdateAjax',{
  			method : 'post',//json방식 자체가 get방식으로 넘길수없다ㅣ. 그래서 post로 body에 담아 넘겨야함
  			headers : {
  				'content-type' : 'application/json'//
  			},
  			body : JSON.stringify(boardInfo) //변환 method
  			
  		})
  		.then(response=>response.json())
  		.then(result => {
  			console.log('JSON',result)
  		})
  		.catch(err=>console.log(err));
  	}
  	
  	function getBoardInfo(){
  		let inputList = document.querySelectorAll('form input'); //form태그를 기준으로 하위의 모든 input태그 불러옴 form과 input사이 공백 = 하위요소를 의미
  		
  		let objData = {};
  		inputList.forEach(tag => {
  			objData[tag.name] = tag.value; //배열이아니라push가아님
  		});
  		
  		return objData;
  	}
  	
  </script>
</body>
</html>