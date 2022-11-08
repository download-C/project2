<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js"></script>

<%
	if (loginID == null) {
%>
<script>
	alert("로그인 후 사용 가능한 페이지입니다.");
	location.href = "/main/login";
</script>
<%
	}
%>

<!-- 예산 설정 후 결과 출력 -->
<script type="text/javascript">
$(document).ready(function(){
	$("#budgetBtn").click(function(){
		let msg = "${msg}";
		var budget = document.getElementById("bk_budget").value;		
		var year = "<c:out value='${year}' />";
		var month = "<c:out value='${month}' />";
		$.ajax({
			method: "post",
			url: "/ajax/writeBudget",
			dataType: "text",
			data: {"bk_budget":budget, 
				   "year": year,
				   "month": month,
				   "loginID":"<c:out value='<%=loginID%>' />"
		    },
	   		success: function(data){
// 	   			alert("성공");
				budget = data;
				Swal.fire(
					'예산 설정 완료!',
                year+'년 '+month+'월 예산이 '+data+'원으로 설정되었습니다.',
                'success' /*디자인 타입*/
         	   )
	   			
	   		},
	   		error: function(){
	   			alert("실패");
	   		}
		}); //ajax
	});//budgetBtn click
	
	
	if(msg!="") {
		if(msg=="ok"){
			
		}else {
			Swal.fire(
	            '경고',
	            '예산 수정 실패',
	            'warning' /*디자인 타입*/
            )
		}
	}
})
</script>




<div class="container">
	<div class="box" style="display: flex; justify-content: space-between; flex-flow: row nowrap;">
	<div style="border: 3px solid red; width: 38%;">
	<h1>그래프 자리???</h1> 
	 <br><br><br><br><br><br><br><br><br><br><br><br>
	</div> 
			
	<div class="bookList" style="border: 3px solid yellow; width: 60%;"> <br>
	
		<div class="bookListTitle" >
			<h3><a href="/book/list?page=1&year=${year}&month=${month }">${year }월 ${month }월 가계부</a></h3>
			
		</div>
		<div style="display: flex; justify-content: space-between;  flex-flow: row nowrap;">
			<div id="budget">
				이번 달 예산 <input type="number" name="bk_budget" id="bk_budget" value="${bk_budget}" >원
				<button id="budgetBtn">예산 입력</button>
			</div>
			<input type="button" id="bookBtn" value="가계부 쓰기" 
					class="btn btn-primary m-2"
					onclick="location.href='/book/write';" >
			</div>
		<table border="1" style="width: 100%; text-align: center; font-size: small;">
		<thead style="background-color: yellow; ">
			<tr>
				<td width="20%">날짜</td>
				<td width="10%">항목</td>
				<td width="10%">자산</td>
				<td width="15%">카테고리</td>
				<td width="20%">금액</td>
				<td width="25%">메모</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${detailList }" var="list" end="5">
			<tr>
				<td>${list.book.bk_year }년 ${list.book.bk_month }월 ${list.bk_day }일</td>
				<td>${list.bk_iow }</td>
				<td>${list.bk_group }</td>
				<td>${list.bk_category }</td>
				<td>${list.bk_money }원</td>
				<td>${list.bk_memo }</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
		<div style="text-align: center;">
			<button onclick="location.href='/book/list?year=${year}&month=${month }';">더보기</button>
		</div>
		</div>
	</div> <!-- box -->
</div> <!-- container -->

<%@ include file="../include/footer.jsp"%>