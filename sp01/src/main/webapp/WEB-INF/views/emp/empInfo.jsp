<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 조회 및 수정</title>
</head>
<body>
	<form>
		<div>
			<label>
				employee_id : 
				<input type="number" name ="employeeId" value ="${empInfo.employeeId }">
			</label><br>
			<label>
				last_name : 
				<input type="text" name ="lastName" value ="${empInfo.lastName }">
			</label>	<br>
			<label>
				email : 
				<input type="text" name ="email" value ="${empInfo.email }">
			</label>	<br>
			<label>
				hire_date : 
				<input type="date" name ="hireDate" value ='<fmt:formatDate value = "${empInfo.hireDate }" pattern = "yyyy-MM-dd" />'>
			</label>	<br>
			<label>
				job_id : 
				<input type="text" name ="jobId" value ="${empInfo.jobId }">
			</label>	<br>
			<label>
				salary : 
				<input type="number" name ="salary" value ="${empInfo.salary }">
			</label>		
		</div>
		<div>
			<button type = "button" onclick = "location.href='empList'">목록으로</button>
			<button type = "button" id ="updateBtn">수정</button>
			<button type = "button" onclick = "location.href='empDelete?eid=${empInfo.employeeId}'">삭제</button><!-- 컨트롤러에서 사용한 변수인 eid를 쓴다 -->
			
		</div>
	</form>
  <script>
  	document.querySelector('#updateBtn')//위에 id=updateBtn부분
  		.addEventListener('click', updateEmpInfo);
  	
  	function updateEmpInfo(event){ 
  		//form태그 내부의 입력태그를 기반으로 정보를 가져옴
  		let empInfo = getEmpInfo();
  		console.log(empInfo);
  		
  		//해당 정보를 기반으로 Ajax
  		//QueryString : key=value&key=value.. 객체랑은 다른형태 그래서 변환이필요
   		fetch('empUpdate',{ //실제 컨트롤러의 경로
  			method : 'post',
  			body : new URLSearchParams(empInfo)
  		})
  		.then(response=>response.json())
  		.then(result => {
  			console.log('QueryString',result)
  		})
  		.catch(err=>console.log(err));
  		
  		// - JSON : {"key":"value", "key" : "value",...}(객체이다)
  		fetch('empUpdateAjax',{
  			method : 'post',//json방식 자체가 get방식으로 넘길수없다ㅣ. 그래서 post로 body에 담아 넘겨야함
  			headers : {
  				'content-type' : 'application/json'//
  			},
  			body : JSON.stringify(empInfo) //변환 method
  			
  		})
  		.then(response=>response.json())
  		.then(result => {
  			console.log('JSON',result)
  		})
  		.catch(err=>console.log(err));
  	}
  	
  	function getEmpInfo(){
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