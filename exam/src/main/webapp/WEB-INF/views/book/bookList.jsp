<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- jsp가 가진 정보를 명시할때 사용 -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div>
<h1>도서목록조회</h1>
	<table class="table">
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>표지</th>
				<th>출판일자</th>
				<th>금액</th>
				<th>출판사</th>
				<th>도서소개</th>
			</tr>
		</thead>
		<tbody>											<!-- varStatus : 반복문에 대한 정보(지금 몇번째 인덱스인지) -->
		<c:forEach items="${bookList }" var = "book"> <!-- items는 $가 붙고(컨트롤러한테 받은정보를 꺼야내해서) var은 빠짐 : 배열값을 담을 임시정보라서 필요x info는 내부에서만 사용-->
			<tr>
				<td>${book.bookNo }</td>
				<td>${book.bookName }</td>
				<td><img style = "width:200px;" src = "<c:url value = "/resources/images/${book.bookCoverimg}"/>"></td>
				<td><fmt:formatDate value = "${book.bookDate }" pattern="yyyy년MM월dd일" /></td>
                <td><fmt:formatNumber value="${book.bookPrice}" pattern="#,##0" /></td>
				<td>${book.bookPublisher }</td>
				<td>${book.bookInfo }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>




</div>

