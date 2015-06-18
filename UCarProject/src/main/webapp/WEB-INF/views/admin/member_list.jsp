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
});
</script>
<html>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div id="searchTable">
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Point</th>
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
											<button type="button" class="btn btn-xs" name="updateBtn"
												value="${vo.memberId}">관리</button>
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