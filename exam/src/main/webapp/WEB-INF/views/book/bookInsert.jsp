<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
	<h1>도서 등록</h1>
	<form name = "insertForm" action="bookInsert" method="post">
		<!-- action : 요청경로, method : 요청전송방식 -->
		<table>
			<tr>
				<th>도서번호</th>
				<td><input type="number" name = "bookNo"></td>
			</tr>
			<tr>
				<th>도서명</th>
				<td><input type="text" name ="bookName"></td>
			</tr>
			<tr>
				<th>도서표지</th>
				<td><input type="text" name ="bookCoverimg"></td>
			</tr>
			<tr>
				<th>출판일자</th><!-- app.jpg -->
				<td><input type="date" name ="bookDate"></td>
			</tr>
			<tr>
				<th>금액</th><!-- app.jpg -->
				<td><input type="text" name ="bookPrice"></td>
			</tr>
			<tr>
				<th>출판사</th><!-- app.jpg -->
				<td><input type="text" name ="bookPublisher"></td>
			</tr>
			<tr>
				<th>도서소개</th><!-- app.jpg -->
				<td><input type="text" name ="bookInfo"></td>
			</tr>
		</table>
			<button type="submit">등록</button>
			<button type="button" onclick="location.href='bookList'">조회</button>
	</form>
</div>
<script>
  //자바스크립트
  
  document.querySelector('form[name="insertForm"]')
  	    	.addEventListener('submit',bookInsertJs);
  
  function bookInsertJs(event){
	  event.preventDefault(); //원래 가지고있던 submit기능을 일시적으로막음
	  
	  let bookName = document.getElementsByName('bookName')[0]; 

	  
	  if(bookName.value == ''){
		  alert('도서명이 입력되지 않았습니다')
		  title.focus();
		  return;
	  }
	  

	  insertForm.submit();//form 태그만 가능! 최소 2개의 입력값을 보장받고 제출
	  //event.target.submit(); //두개다 되긴 된다
	  
  }
  document.querySelector('form[name="insertForm"]')
  //.removeEventListener('submit',boardInsertJs) //이벤트 삭제하는거

  
  
  
  
  
</script>
