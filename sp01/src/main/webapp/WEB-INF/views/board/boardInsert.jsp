<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
	<h1>게시글 등록</h1>
	<form name = "insertForm" action="boardInsert" method="post">
		<!-- action : 요청경로, method : 요청전송방식 -->
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name = "title"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name ="writer"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name ="contents"></textarea></td>
			</tr>
			<tr>
				<th>이미지</th><!-- app.jpg -->
				<td><input type="text" name ="image"></td>
			</tr>
		</table>
			<button type="button" onclick="location.href='boardList'">목록으로</button>
			<button type="submit">등록</button>
	</form>
</div>
<script>
  //자바스크립트
  document.querySelector('form[name="insertForm"]')
  	    	.addEventListener('submit',boardInsertJs);
  
  function boardInsertJs(event){
	  event.preventDefault(); //원래 가지고있던 submit기능을 일시적으로막음
	  
	  let title = document.getElementsByName('title')[0]; 
	  let writer = document.getElementsByName('writer')[0];
	  
	  if(title.value == ''){
		  alert('제목이 입력되지 않았습니다')
		  title.focus();
		  return;
	  }
	  
	  if(writer.value == ''){
		  alert('작성자가 입력되지 않았습니다')
		  writer.focus();
		  return;
	  }
	  insertForm.submit();//form 태그만 가능! 최소 2개의 입력값을 보장받고 제출
	  //event.target.submit(); //두개다 되긴 된다
	  
  }
  document.querySelector('form[name="insertForm"]')
  .removeEventListener('submit',boardInsertJs) //이벤트 삭제하는거

  //jQuery 활용
  $('form[name="insertForm"]').on('submit',boardInsertJq);
  
  function boardInsertJq(event){
	  event.preventDefault();
	  
	  let title = $('[name="title"]');
	  let writer = $('[name="writer"]');
	  
	  if(title.val()==''){
		  alert('제목을 확인해주세요')
		  title.focus();
		  return;
	  }
	  
	  if(writer.val()==''){
		  alert('작성자를 확인해주세요')
		  writer.focus();
		  return;
	  }
	  
	  insertForm.submit();
  }
  
  
  
  
  
</script>
