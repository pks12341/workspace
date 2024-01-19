<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
	<h1>게시글 수정</h1>
	<form name="updateForm">
		<table>
			<tr>
				<th>번호</th>
				<td><input type="text" name="bno" value="${boardInfo.bno }" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${boardInfo.title }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="${boardInfo.writer }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents">${boardInfo.contents }</textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<!-- app.jpg -->
				<td><input type="text" name="image" value="${boardInfo.image }"></td>
			</tr>
		</table>
		<button type="button">저장</button>
	</form>
</div>
<script>
	$('form > button:contains(저장)').on('click', boardUpdateAjax);//저장이라는 문자열이 포함된 form안에있는 button을 찾음

	function boardUpdateAjax(event){
		//통신 진행 여부 결정
		if(!validation()) return;

		//통신하기 위한 데이터 가져오기
		let boardDta = getBoardInfo();
		console.log('boardDta',boardDta);

		$.ajax('boardUpdate',{
			 type : 'post',
			 data : boardDta,
			//@ResponseBody 사용시 json으로 한다는뜻이니
			//contentType:'application/json',
			//data : JSON.stringify(boardDta)
		})
		.then(result => {
			console.log(result);
		})
		.fail(err => console.log(err));
	}
	function validation(){
		let title = $('[name="title"]');
	 	let writer = $('[name="writer"]');
	  
	  if(title.val()==''){
		  alert('제목을 확인해주세요')
		  title.focus();
		  return false;
	  }
	  
	  if(writer.val()==''){
		  alert('작성자를 확인해주세요')
		  writer.focus();
		  return false;
	  }
	  
	  return true;
  	}

	function getBoardInfo(){
		let formAry = $('form[name="updateForm"]').serializeArray();//formAry는 jQ객체가 아니라 each를 못쓴다.$()로감싸면 됨
		console.log('FA',formAry);

		let formObj = {};
		$(formAry).each((idx,tag)=>{
			console.log('asdasd',idx,tag);
			formObj[tag.name]=tag.value;
		});
		return formObj;
	}
</script>