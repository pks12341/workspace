<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- jsp가 가진 정보를 명시할때 사용 -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체사원조회</title>
</head>
<body>
	<button></button>
	<table>
		<thead>
			<tr>
				<th>No.</th>
				<th>employee_id</th>
				<th>last_name</th>
				<th>email</th>
				<th>hire_date</th>
				<th>job_id</th>
				<th>salary</th>
			</tr>
		</thead>
		<tbody>											<!-- varStatus : 반복문에 대한 정보(지금 몇번째 인덱스인지) -->
		<c:forEach items="${empList }" var = "info" varStatus = "sts"> <!-- items는 $가 붙고(컨트롤러한테 받은정보를 꺼야내해서) var은 빠짐 : 배열값을 담을 임시정보라서 필요x info는 내부에서만 사용-->
			<tr onclick = "location.href = 'empInfo?employeeId=${info.employeeId}'"><!-- info는 배열타입이다 -->
				<td>${sts.count }</td><!-- sts.index는 0부터 시작 -->
				<td>${info.employeeId }</td>
				<td>${info.lastName }</td>
				<td>${info.email }</td>
				<td><fmt:formatDate value = "${info.hireDate }" pattern="yyyy년MM월dd일" /></td>
				<td>${info.jobId }</td>
				<td>${info.salary }</td>
				
			</tr>
		</c:forEach>

		</tbody>
	</table>
<!-- 해석 순서 : JSP -> Servelt -> Java => html -> css -> javascript -->


</body>
</html>