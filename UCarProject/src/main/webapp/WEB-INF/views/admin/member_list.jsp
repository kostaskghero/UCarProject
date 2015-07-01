<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- ${requestScope.memberList} test --%>
<script type="text/javascript">
$(document).ready(function(){
	$(":input[name=deleteBtn]").click(
			function() {
			if (confirm("삭제하시겠습니까?"))
					location.href = "admin_deleteMember.do?memberId="
							+ $(this).val(); 
			});
	$(":input[name=pointBtn]").click(function() {
		var point=$("#"+$(this).val()+"memberPoint").val();
	if(	confirm($(this).val() +"님에게 "+point+"점을 지금하시겠습니까?"))
		location.href="admin_givePoint.do?point="+point+"&memberId="+$(this).val();
});
});
</script>
<legend>회원 목록 </legend>
<html>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-7"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div id="searchTable">
						<table class="table">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>포인트</th>
									<th>회원관리</th>
									<th>회원삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.memberList }" var="vo">
									<tr id="carInfo">
										<td><a
											href="admin_memberDetailInfo.do?memberId=${vo.memberId}">${vo.memberId}</a></td>
										<td>${vo.memberName}</td>
										<td>${vo.memberPoint}</td>
										<td>

											<div class="col-lg-5">
												<input type="text" class="form-control" name="memberPoint"
													id="${vo.memberId}memberPoint" placeholder="포인트">
											</div>
											<button type="button" class="btn btn-xs" name="pointBtn"
												id="pointBtn" value="${vo.memberId}">지급</button>

										</td>
										<td>
											<button type="button" class="btn btn-xs" name="deleteBtn"
												value="${vo.memberId}">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>