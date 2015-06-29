<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(":input[name=deleteBtn]")
								.click(
										function() {
											if (confirm("삭제하시겠습니까?")) {
												/* location.href = "admin_deleteUcarZone.do?uCarZoneName="
														+ $(this).val(); */
												$
														.ajax({
															type : "POST",
															url : "admin_deleteUcarZone.do",
															data : "uCarZoneName="
																	+ $(this)
																			.val(),
															success : function(
																	data) {
																if (data == "deleteOK") {
																	location.href = "admin_uCarZone_list.do";
																} else {
																	alert("해당 유카존에 차량이 존재하여 삭제할 수 없습니다.");
																}
															}
														});//ajax
											}
										});
						$(":input[name=updateBtn]")
								.click(
										function() {
											if (confirm("수정하시겠습니까?"))
												location.href = "admin_uCarZoneUpdateForm.do?uCarZoneName="
														+ $(this).val();
										});
					});
</script>
<html>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-8"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<table class="table">
						<thead>
							<tr>
								<th>이름</th>
								<th>주소</th>
								<th>위도</th>
								<th>경도</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.list }" var="vo">
								<tr>
									<td>${vo.uCarZoneName}</td>
									<td>${vo.uCarZoneAddress}</td>
									<td>${vo.latitude}</td>
									<td>${vo.longitude}</td>
									<td><button type="button" class="btn btn-xs"
											name="updateBtn" value="${vo.uCarZoneName}">수정</button></td>
									<td><button type="button" class="btn btn-xs"
											name="deleteBtn" value="${vo.uCarZoneName}">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

</html>