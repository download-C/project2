<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<h1>board/read.jsp</h1>
<%-- 
<%
	if (loginID == null) {
%>
<script>
	alert("세션값이 만료되어 로그인 페이지로 이동합니다.");
	location.href = "/member/login";
</script>
<%
	}
%>
 --%>

<!-- ======== for 썸머노트 ============== -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300, // 에디터 높이
			width : 1000,
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
		});
	});
</script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
<!-- ======== for 썸머노트 끝 ============== -->


<!-- ======= for 댓글,, comment.js 파일 추가 및 테스트======= -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	console.log(cmtService);
	var bnoValue = '<c:out value="${vo.bno}"/>';
	var cmtUL = $('#cmt');
	
	
	showCmtList(1);
	
	function showCmtList(page){
		
		alert("showCmtList 작동 성공");
		
		cmtService.getCmtList({bno:bnoValue, page:page||1}, function(list){
			var str="";
			
			if( list == null || list.length == 0 ) {
				cmtUL.html("");
				
				return;
			}
			
			// 반복문 돌면서 댓글 list 채우기
			for (var i = 0, len = list.length||0; i < len; i++) {
				str += "<li data-cno='"+list[i].cno+"'>";
				str += "<div id='cmt-body'><div id='cmt-header'><strong>"+list[i].id+"</strong>";
				str += "<small>"+list[i].c_regdate+"</small></div>";
				str += "<p>"+list[i].cno + " / " + list[i].c_content+"</p></div></li>";
			}
			
			cmtUL.html(str);
			
// 		<ul id="cmt">
// 			<li data-cno='2'>
// 				<div id="cmt-body">
// 					<div id="cmt-header">
// 						<strong>user_id,, nick</strong> 
// 						<small>regdate </small>
// 					</div>
// 					<p>c_content</p>
	
// 				</div>
// 			</li>
// 		</ul>
			
		}); // getCmtList()
		
	}// showCmtList()
	
}); // jquery ready



// 1. add(cmt, callback, error)
// cmtService.add(
// 	// cmt
// 	{c_content: "아 쏘 이지네 ㅋ ", id:"ghgh", bno:bnoValue},
	
// 	// callback
// 	function(result){
// 		alert("RESULT: " + result);
// 	}
// );// add()


// 2. getCmtList(param, callback, error)
// cmtService.getCmtList(
// 		// param
// 		{bno:bnoValue, page:1}, 
		
// 		// callback
// 		function(rList){

// 			for(var i = 0, len = rList.length || 0; i < len; i++) {
// 				console.log(rList[i]);
// 			}
// 		}
//  );// getCmtList()

 
// 3. deleteCmt(cno, callback, error)
// cmtService.deleteCmt(
// 		// cno
// 		12, 
		
// 		// callback
// 		function(deleteResult){
// 			console.log("deleteResult: " + deleteResult);
	
// 			if(deleteResult === "success") {
// 				alert("댓글이 삭제되었습니다");
// 			}
// 		}, 
	
// 		// error
// 		function(error){
// 			alert("에러...... ");
// 		}
// );// deleteCmt()


// 4. updateCmt(cmtVO, callback, error)
// cmtService.updateCmt(
// 		// cmtVO
// 		{ cno : 10,
// 		  bno : bnoValue,
// 		  c_content : "10번 댓글 수정합니다 수정 수정"},
		
// 		// callback
// 		function(rData){
// 			alert("댓글 수정 완");
// 		}
// );// updateCmt()


// 5. getCmtOne(cno, callback, error)
// cmtService.getCmtOne(
// 		// cno
// 		10, 
		
// 		// callback
// 		function(rData){
// 			console.log(rData);
// 		});// getCmtOne()

</script>
<!-- ======= for 댓글,, comment.js 파일 추가 및 테스트 끝 ======= -->



<h1>${vo.bno }번 글 🐱🐶 상세 보기 🐱🐶 </h1>

		<!-- 수정, 삭제 시 필요한 글 번호(bno) 저장하는 폼태그 =====================-->
		<form role="bno_form" method="post">
			<input type="hidden" name="bno" value="${vo.bno }">
		</form>
		<!-- 수정, 삭제 시 필요한 글 번호(bno) 저장하는 폼태그 껏 =====================-->

	<div>
		<div>
			아이디
			<div>  <!-- hidden으로 바꾸기!!!  -->
				<input type="text" name="id" value="${vo.id}" readonly>
			</div>
		</div>
		<br>
		<div>
			닉네임
			<div>
				<input type="text" value="${nick }" readonly>
			</div>
			<!-- 		닉네임,, 아이디 -> 닉네임 끌어오는 메서드를 만들어야 하남? DB에 넣을 필욘 없고 걍 보여주기만 -->
		</div>
		<br>
		<div>
			카테고리
			<div>
				<input type="text" value="${vo.b_ctgr }" readonly></span>
			</div>
		</div>
		<br>
		<div>
			제목
			<div>
				<input type="text" name="b_title" value="${vo.b_title }" readonly>
			</div>
		</div>
		<br>
		<div>
			내용
			<textarea id="summernote" name="b_content" readonly> ${vo.b_content }</textarea>
		</div>
		<br>
		<div>
			파일
			<div>
				<input type="text" name="b_file" value="${vo.b_file }" readonly>
			</div>
		</div>
		<br>
		<div>
			<input type="button" value="수정" class="btn_mod">
			<input type="button" value="삭제" class="btn_del">
			<input type="button" value="목록" class="btn_list">
		</div>
	</div>
	
	
	<!-- ----------------------- 댓글 리스트 구간 --------------------------------- -->
	<div style="border: 1px solid black">
		<div>
			<h6>댓글</h6>
		</div>
		<ul id="cmt">
			<li data-cno='2'>
				<div id="cmt-body">
					<div id="cmt-header">
						<strong>user_id,, nick</strong> <small>regdate </small>
					</div>
					<p>c_content</p>
	
				</div>
			</li>
		</ul>
	</div>
<%-- 							<fmt:formatDate value="${cdto.date }" pattern="yyyy.MM.dd hh:mm" /> --%>
											<!-- 댓글 삭제 버턴,,
													지 거만 지울 수 있게,,, + admin일 때
													세션 로그인 아이디 == cdto에서 꺼내온 아이디 -->
								<c:if test="${sessionScope.loginID eq cdto.id || sessionScope.loginID eq 'admin'}">
									<input type="button" value="삭제" class="Bbtn btn1" 
									onclick="location.href='./CommentDelete.bo?c_bno=${cdto.c_bno}&bno=${dto.bno }';"
									style="padding: 3px; font-size: x-small; margin: 0px;">
								</c:if>
						</div>
					</div>

				<!-- ----------------------- 댓글 리스트 구간 끝^^ --------------------------------- -->
				
		      
				<!-- ----------------------- 댓글 작성 구간^^ --------------------------------- -->

				<div style="border: 1px solid black;">
					<h6>댓글을 남겨주세요</h6>
					<form action="/comments/new" method="post" name="frm">
								<input type="hidden" name="bno" value="${vo.bno }">  <!-- bno : 메인 글의 bno!! (BoardDTO의 bno!!!!) 여기가 중요 ★★★-->
						
						<div class="form-group">
							<label for="message">내용</label>
							<textarea name="content" id="message" cols="7" rows="3" class="form-control cmt-update-content"></textarea>
						</div>
						<div class="btn btn-primary" >
							<input type="submit" value="댓글 달기😘"
								class="btn py-1 px-2 btn-primary">
						</div>
						
					</form>
				</div>
				<!-- ----------------------- 댓글 작성 구간 끝^^ --------------------------------- -->
	
	


<script type="text/javascript">
// jQuery 구간 시작~ =================================================
  $(document).ready(function(){
// 	  alert('jQuery 실행🎊🎊');
	  // 버턴들 제어할 거!!!!!!!!!!!!
	  
	  // 글번호 정보를 포함하는 폼태그에 접근
	  var fr = $('form[role="bno_form"]'); // role이 form인 폼태그에 접근해서 그걸 fr 변수에 담기
	  
	  
	  $(".btn_mod").click(function(){
// 		  alert('정상 동작 중');
		  // bno폼태그 속성 바꿀 거!!
		  fr.attr("action", "/board/update");
		  fr.attr("method", "get"); // get방식으로 바꿔서 전달 
		  fr.submit(); // 클릭하면? 속성 바꾸고 -> submit 되게~~
	  });// 수정 버턴 click
	  
	  
	  $(".btn_list").click(function(){
		  // 목록 버턴 클릭했을 때
		  history.back();
	  });// 목록 버턴 click
	  
	  
	  $(".btn_del").click(function(){
		  // 삭제 버턴 클릭했을 때~~
		  alert('삭제 버턴 클릭됨');
		  fr.attr("action", "/board/delete");
		  fr.submit(); // 클릭하면? 속성 바꾸고 -> submit 되게~~
	  });// 삭제 버튼 click
	  
	  
  });// jQuery ready

</script>


<%@ include file="../include/footer.jsp"%>