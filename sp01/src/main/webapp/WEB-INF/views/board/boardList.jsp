<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- jsp가 가진 정보를 명시할때 사용 -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div>
<h1>자유게시판</h1>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th><!-- yyyy 년 MM월 dd일 -->
			</tr>
		</thead>
		<tbody>											<!-- varStatus : 반복문에 대한 정보(지금 몇번째 인덱스인지) -->
		<c:forEach items="${boardList }" var = "board" varStatus = "sts"> <!-- items는 $가 붙고(컨트롤러한테 받은정보를 꺼야내해서) var은 빠짐 : 배열값을 담을 임시정보라서 필요x info는 내부에서만 사용-->
			<tr onclick = "location.href = 'boardInfo?bno=${board.bno}'"><!-- info는 배열타입이다 -->
				<td>${sts.count }</td><!-- sts.index는 0부터 시작 -->
				<td>${board.title }</td>
				<td>${board.writer }</td>
				<td><fmt:formatDate value = "${board.regdate }" pattern="yyyy년MM월dd일" /></td>
			</tr>
		</c:forEach>

		</tbody>
	</table>
<!-- 해석 순서 : JSP -> Servelt -> Java => html -> css -> javascript -->



</div>

