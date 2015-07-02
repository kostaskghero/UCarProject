<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#reviewUpdateBtn").click(function(){
			if(	confirm("수정하시겠습니까?")){
				location.href="auth_update_review_form.do?reviewNo=${requestScope.vo.reviewNo}";
			} else{
				return false;
			}
		});
		$("#reviewDelete").click(function(){
		if(	confirm("삭제하시겠습니까?")){
			location.href ="auth_review_delete.do?reviewNo=${requestScope.vo.reviewNo}";
		} else{
			return false;
		}
		});
		$("#reviewList").click(function(){
			location.href ="${initParam.root }customercenter_review_list.do";
		});
		$("#reviewLikeBtn").click(function(){
			if(confirm("추천하시겠습니까?")){
				$.ajax({
					type:"post",
					url:"${initParam.root }auth_review_likeReview.do",
					data:"reviewNo=${requestScope.vo.reviewNo}&memberId=${sessionScope.loginInfo.memberId}",
					success:function(data){
						if(data.flag=='ok'){
							$("#reviewLikeView").html(data.likeCount);
						} else if(data.flag=="fail"){
							if(confirm("이미 추천했습니다. 추천취소하시겠습니까?")){
								$.ajax({
									type:"post",
									url:"${initParam.root }auth_review_likeReviewCancel.do",
									data:"reviewNo=${requestScope.vo.reviewNo}&memberId=${sessionScope.loginInfo.memberId}",
									success:function(data){
										if(data.flag=="ok"){
											$("#reviewLikeView").html(data.likeCount);
										} else{
											location.href="${initParam.root}member_login_form.do";
										}
									}
								});
							}
						} else{
							location.href="${initParam.root}member_login_form.do";
						}
					}
				});
			} else{
				return false;
			}
		});
		$("#commentBtn").click(function(){
			if($("#reviewCommentContent").val()==""){
				alert("댓글 입력하세요!");
				return false;
			} else{
				$.ajax({
					type:"post",
					url:"${initParam.root }auth_reviewComment_writeComment.do",
					data:$("#commentForm").serialize(),
					success:function(data){
						if(data.flag=="ok"){
							var commentTable="<table class='table'>";
							commentTable+="<tbody>";
							$.each(data.commentList, function(index, comment){
								commentTable+="<tr>";
								commentTable+="<td>";
								commentTable+="<div class='col-md-1'>"+comment.reviewCommentMemberId+"</div>";
								commentTable+="<div class='col-md-8' id='"+comment.reviewCommentNo+"CommentContent'>"+comment.reviewCommentContent+"</div>";
								commentTable+="<div class='col-md-2'>"+comment.reviewCommentTimePosted+"</div>";
								if((comment.reviewCommentMemberId=="${sessionScope.loginInfo.memberId}") || ("${sessionScope.admin.memberId}"=="admin")){
									commentTable+="<div class='col-md-1'>";
									commentTable+="<button type='button' class='btn btn-xs' name='editCommentFormBtn' value='"+comment.reviewCommentNo+"'>수정</button>";
									commentTable+="<button type='button' class='btn btn-xs' name='deleteCommentBtn' value='"+comment.reviewCommentNo+"'>삭제</button>";
									commentTable+="</div>";
								}
								commentTable+="</td>";
								commentTable+="</tr>";
							});
							commentTable+="</tbody>";
							commentTable+="</table>";
							$("#ReviewCommentView").html(commentTable);
						} else{
							location.href="${initParam.root}member_login_form.do";
						}
					}
				});
			}
			$("#reviewCommentContent").val("");
		});
		$("#ReviewCommentView").on("click", ":input[name=editCommentFormBtn]", function(){
			var commentNo=$(this).val();
			var commentContent=$("#"+commentNo+"CommentContent").text();
			$.ajax({
				type:"post",
				url:"${initParam.root }reviewComment_editCommentForm.do",
				data:"reviewNo=${vo.reviewNo}",
				success:function(data){
					var commentTable="<table class='table'>";
					commentTable+="<tbody>";
					$.each(data, function(index, comment){
						commentTable+="<tr>";
						commentTable+="<td>";
						commentTable+="<div class='col-md-1'>"+comment.reviewCommentMemberId+"</div>";
						if(comment.reviewCommentNo==commentNo){
							commentTable+="<form id='"+commentNo+"editForm'>";
							commentTable+="<div class='col-md-10'><input class='form-control' type='text' id='"+commentNo+"CommentContent' name='reviewCommentContent' value='"+commentContent+"'></div>";
							commentTable+="<div class='col-md-1'>";
							commentTable+="<button type='button' class='btn btn-primary btn-xs' name='editCommentBtn' value='"+commentNo+"'>수정</button>";
							commentTable+="<input type='hidden' name='reviewCommentNo' value='"+commentNo+"'>";
							commentTable+="<input type='hidden' name='reviewNo' value='${vo.reviewNo}'>";
							commentTable+="</div></form>";
						} else{
							commentTable+="<div class='col-md-8' id='"+comment.reviewCommentNo+"CommentContent'>"+comment.reviewCommentContent+"</div>";
							commentTable+="<div class='col-md-2'>"+comment.reviewCommentTimePosted+"</div>";
							if((comment.reviewCommentMemberId=="${sessionScope.loginInfo.memberId}") || ("${sessionScope.admin.memberId}"=="admin")){
								commentTable+="<div class='col-md-1'>";
								commentTable+="<button type='button' class='btn btn-xs' name='editCommentFormBtn' value='"+comment.reviewCommentNo+"'>수정</button>";
								commentTable+="<button type='button' class='btn btn-xs' name='deleteCommentBtn' value='"+comment.reviewCommentNo+"'>삭제</button>";
								commentTable+="</div>";
							}
						}
						commentTable+="</td>";
						commentTable+="</tr>";
					});
					commentTable+="</tbody>";
					commentTable+="</table>";
					$("#ReviewCommentView").html(commentTable);
				}
			});
		});
		$("#ReviewCommentView").on("click", ":input[name=editCommentBtn]", function(){
			var commentNo=$(this).val();
			var commentContent=$("#"+commentNo+"CommentContent").val();
			if(commentContent==""){
				alert("댓글 입력하세요!");
				return false;
			} else{
				$.ajax({
					type:"post",
					url:"${initParam.root }auth_reviewComment_editComment.do",
					data:"reviewNo="+$("#reviewNo").val()+"&reviewCommentNo="+commentNo+"&reviewCommentContent="+commentContent,
					dataType: 'json',
					success:function(data){
						if(data.flag=="ok"){
							var commentTable="<table class='table'>";
							commentTable+="<tbody>";
							$.each(data.commentList, function(index, comment){
								commentTable+="<tr>";
								commentTable+="<td>";
								commentTable+="<div class='col-md-1'>"+comment.reviewCommentMemberId+"</div>";
								commentTable+="<div class='col-md-8' id='"+comment.reviewCommentNo+"CommentContent'>"+comment.reviewCommentContent+"</div>";
								commentTable+="<div class='col-md-2'>"+comment.reviewCommentTimePosted+"</div>";
								if(comment.reviewCommentMemberId=="${sessionScope.loginInfo.memberId}" || ("${sessionScope.admin.memberId}"=="admin")){
									commentTable+="<div class='col-md-1'>";
									commentTable+="<button type='button' class='btn btn-xs' name='editCommentFormBtn' value='"+comment.reviewCommentNo+"'>수정</button>";
									commentTable+="<button type='button' class='btn btn-xs' name='deleteCommentBtn' value='"+comment.reviewCommentNo+"'>삭제</button>";
									commentTable+="</div>";
								}
								commentTable+="</td>";
								commentTable+="</tr>";
							});
							commentTable+="</tbody>";
							commentTable+="</table>";
							$("#ReviewCommentView").html(commentTable);
						} else{
							location.href="${initParam.root}member_login_form.do";
						}
					}
				});
			}
		});
		$("#ReviewCommentView").on("click", ":input[name=deleteCommentBtn]", function(){
			var commentNo=$(this).val();
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type:"post",
					url:"${initParam.root }auth_reviewComment_deleteComment.do",
					data:"reviewNo="+$("#reviewNo").val()+"&reviewCommentNo="+commentNo,
					dataType: 'json',
					success:function(data){
						if(data.flag=="ok"){
							var commentTable="<table class='table'>";
							commentTable+="<tbody>";
							$.each(data.commentList, function(index, comment){
								commentTable+="<tr>";
								commentTable+="<td>";
								commentTable+="<div class='col-md-1'>"+comment.reviewCommentMemberId+"</div>";
								commentTable+="<div class='col-md-8' id='"+comment.reviewCommentNo+"CommentContent'>"+comment.reviewCommentContent+"</div>";
								commentTable+="<div class='col-md-2'>"+comment.reviewCommentTimePosted+"</div>";
								if(comment.reviewCommentMemberId=="${sessionScope.loginInfo.memberId}" || ("${sessionScope.admin.memberId}"=="admin")){
									commentTable+="<div class='col-md-1'>";
									commentTable+="<button type='button' class='btn btn-xs' name='editCommentFormBtn' value='"+comment.reviewCommentNo+"'>수정</button>";
									commentTable+="<button type='button' class='btn btn-xs' name='deleteCommentBtn' value='"+comment.reviewCommentNo+"'>삭제</button>";
									commentTable+="</div>";
								}
								commentTable+="</td>";
								commentTable+="</tr>";
							});
							commentTable+="</tbody>";
							commentTable+="</table>";
							$("#ReviewCommentView").html(commentTable);
						} else if(data.flag=="empty"){
							$("#ReviewCommentView").html("");
						} else{
							location.href="${initParam.root}member_login_form.do";
						}
					}
				});
			}
		});
	});
</script>
<form class="form-horizontal" method="post" id="reviewForm">
	<fieldset>
		<legend>이용후기 내용</legend>
		<div class="form-group">
			<label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-9">
				<input type="text" class="form-control" id="memberId"
					name="memberId" value="${requestScope.vo.memberId }"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="inputMemberId" class="col-lg-2 control-label">조회수</label>
			<div class="col-lg-9">
				<input type="text" class="form-control" id="reviewHit"
					name="reviewHit" value="${requestScope.vo.reviewHit }"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="inputTitle" class="col-lg-2 control-label">제목</label>
			<div class="col-lg-9">
				<input type="text" class="form-control" id="reviewTitle"
					name="reviewTitle" value="${requestScope.vo.reviewTitle }"
					readonly="readonly">
			</div>
		</div>

		<div class="form-group">
			<label for="inputContent" class="col-lg-2 control-label">내용</label>
			<div class="col-lg-9">
				<div class="well">
				${requestScope.vo.reviewContent }
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${sessionScope.admin != null}">
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="submit" class="btn btn-primary" id="reviewUpdateBtn">수정</button>
						<button type="reset" class="btn btn-default" id="reviewDelete">삭제</button>
						<button type="reset" class="btn btn-default" id="reviewList">목록보기</button>
					</div>
				</div>
			</c:when>
			<c:when
				test="${sessionScope.loginInfo.memberId==requestScope.vo.memberId}">
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="button" class="btn btn-primary" id="reviewLikeViewBtn">추천<span class="badge" id="reviewLikeView">${requestScope.vo.reviewLikeCount }</span></button>
						<button type="button" class="btn btn-primary" id="reviewUpdateBtn">수정</button>
						<button type="button" class="btn btn-default" id="reviewDelete">삭제</button>
						<button type="button" class="btn btn-default" id="reviewList">목록보기</button>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="button" class="btn btn-primary" id="reviewLikeBtn">추천<span class="badge" id="reviewLikeView">${requestScope.vo.reviewLikeCount }</span></button>
						<button type="button" class="btn btn-default" id="reviewList">목록보기</button>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</fieldset>
</form>
<div class="col-md-12">
   <form id="commentForm">
      <div class="col-md-1">댓글</div>
      <div class="col-md-9">
         <input type="hidden" id="reviewNo" name="reviewNo" value="${requestScope.vo.reviewNo }">
         <c:choose>
         	<c:when test="${sessionScope.admin!=null }">
         		<input type="hidden" name="reviewCommentMemberId" id="reviewCommentMemberId" value="${sessionScope.admin.memberId }">
         	</c:when>
         	<c:when test="${sessionScope.loginInfo!=null }">
         		<input type="hidden" name="reviewCommentMemberId" id="reviewCommentMemberId" value="${sessionScope.loginInfo.memberId }">
         	</c:when>
         </c:choose>         
         <input class="form-control" type="text" name="reviewCommentContent" id="reviewCommentContent">
      </div>
      <div class="col-md-2">
         <button type="button" class="btn btn-primary" id="commentBtn">작성</button>
      </div>
   </form>
</div>
<br><br><br>
<div class="col-md-12" id='ReviewCommentView'>
	<c:if test="${fn:length(commentList)!=0 }">
		<table class="table">
			<tbody>
				<c:forEach items="${commentList }" var="comment">
					<tr>
						<td>
							<div class="col-md-1">${comment.reviewCommentMemberId }</div>
							<div class="col-md-8" id="${comment.reviewCommentNo }CommentContent">
								<p>${comment.reviewCommentContent }</p>
							</div>
							<div class="col-md-2">${comment.reviewCommentTimePosted }</div>
							<c:if test="${(comment.reviewCommentMemberId==sessionScope.loginInfo.memberId) || sessionScope.admin != null }">
								<div class="col-md-1">
									<button type="button" class="btn btn-xs" name="editCommentFormBtn" value="${comment.reviewCommentNo }">수정</button><br>
									<button type="button" class="btn btn-xs" name="deleteCommentBtn" value="${comment.reviewCommentNo }">삭제</button>
								</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>  
	</c:if>
</div>

