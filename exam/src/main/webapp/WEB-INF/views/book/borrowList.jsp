<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- jsp가 가진 정보를 명시할때 사용 -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div>
<h1>도서별 대여매출현황</h1>
	<table class="table">
		<thead>
			<tr>
				<th style="text-align: center;">도서번호</th>
				<th style="text-align: center;">도서명</th>
				<th style="text-align: center;">대여총계</th>
				<th style="text-align: center;">대여횟수</th>
			</tr>
		</thead>
		<tbody>											<!-- varStatus : 반복문에 대한 정보(지금 몇번째 인덱스인지) -->
		<c:forEach items="${borrowList }" var = "book"> <!-- items는 $가 붙고(컨트롤러한테 받은정보를 꺼야내해서) var은 빠짐 : 배열값을 담을 임시정보라서 필요x info는 내부에서만 사용-->
			<tr>
				<td style="text-align: center;">${book.bookNo }</td>
				<td style="text-align: left;">${book.bookName }</td>
				<td style="text-align: right;">${book.sumPrice }</td>
				<td style="text-align: right;">${book.allCount }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>




</div>

