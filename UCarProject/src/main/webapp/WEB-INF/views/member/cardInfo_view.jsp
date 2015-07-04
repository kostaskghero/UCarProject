<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$(document).ready(function(){
		$("#registerCardBtn").click(function(){
			$.ajax({
				type:"post",
				url:"${initParam.root}auth_member_countCard.do",
				data:"memberId=${sessionScope.loginInfo.memberId }",
				success:function(data){					
					if(data.exception!=null){
						alert(data.exception);
					} else{
						location.href="${initParam.root}auth_member_registerCard_form.do";
					}
				}
			});
		});
		$(":input[name=deleteBtn]").click(function(){
			var cardNo=$("#"+$(this).val()+"CardInfo").children().children().eq(1).children().eq(1).text();
			alert(cardNo);
			location.href="${initParam.root}auth_member_deleteCard.do?cardNo="+cardNo+"&memberId=${sessionScope.loginInfo.memberId}";
		});
	});
</script>
<h4>등록된 카드 정보</h4>
<hr>
<c:choose>
	<c:when test="${fn:length(info)!=0}">
		<c:forEach items="${info }" var="cardInfo" varStatus="i">
			<strong>결제카드${i.count }</strong>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-default btn-xs" name="deleteBtn" value="${i.count }">삭제</button>
			<div class="container">
				<div class="col-md-9">
					<table class="table" id="${i.count }CardInfo">
						<tbody>
							<tr>
								<td>카드종류</td>
								<td>${cardInfo.cardVO.cardType }</td>
							</tr>
							<tr>
								<td>카드번호</td>
								<td>${cardInfo.cardVO.cardNo }</td>
							</tr>
							<tr>
								<td>유효기간</td>
								<td>${cardInfo.cardVO.cardExpirationDate }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:forEach>
		<div class="col-sm-offset-2 col-sm-10">			
			<button type="button" class="btn btn-default" id="registerCardBtn">registerCard</button>
		</div>
	</c:when>
	<c:otherwise>
		<script>
			var flag=confirm("등록된 카드정보가 없습니다. 등록하시겠습니까?");
			if(flag){
				location.href="${initParam.root}auth_member_registerCard_form.do";
			} else{
				location.href="${initParam.root}auth_member_myPage.do";
			}
		</script>
	</c:otherwise>
</c:choose>