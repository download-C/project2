<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../include/header.jsp"%>
<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js"></script>

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
 
<!-- 로그인 실패 모달 -->
<script>
//warning 버튼
function warning(message) {

    Swal.fire(
        '경고',
        message,
        'warning' /*디자인 타입*/
    )

}//warning 버튼
</script>

<!-- document.ready -->
<script>
$(document).ready(function(){
	let message = "${msg }";
	if(message!="") {
		warning(message);
	}
})
</script>

<div class="container">
	<div class="row">	
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card border-0 shadow rounded-3 my-5">
	          <div class="card-body p-4 p-sm-5">
	            <h5 class="card-title text-center mb-5 fw-light fs-5"><b>로그인</b></h5>
				<form action="/main/login" method="post">
<%-- 					<sec:csrfInput/> --%>
				<div class="form-floating mb-3">
               		<input type="text" name="id" class="form-control" id="floatingInput" placeholder="name@example.com">
                	<label for="floatingInput">아이디</label>
             	 </div>
              	 <div class="form-floating mb-3">
	                <input type="password" name="pw" class="form-control" id="floatingPassword" placeholder="Password">
	                <label for="floatingPassword">비밀번호</label>
              	 </div>
				 <div class="d-grid">
                	<button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">로그인하기</button>
                 </div>
			<%-- 	<div><input type="hidden" value="${_csrf.token }" name=${_csrf.parameterName }></div> --%>
				 <hr class="my-4">
                 <div class="d-grid mb-2">
	                 <button class="btn btn-kakao btn-login text-uppercase fw-bold" type="submit">
	                  카카오 아이디로 로그인하기	                  
	                 </button>
              	 </div>
              	 <div class="d-grid mb-2">
	                 <button class="btn btn-google btn-login text-uppercase fw-bold" type="submit">
	                 	구글 아이디	로 로그인하기
	                 </button>
                 </div>
             	 <div class="d-grid mb-2">
	                 <button class="btn btn-facebook btn-login text-uppercase fw-bold" type="submit">
	                  네이버 아이디로 로그인하기
	                 </button>
              	 </div>
				 </form>
				 </div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>