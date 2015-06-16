<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<table class="table">
						<thead>
							<tr>
								<th>이름</th>
								<th>주소</th>

								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.list }" var="vo">
								<tr>
									<td>${vo.uCarZoneName}</td>
									<td>${vo.uCarZoneAddress}</td>
									<td><a href="updateCarForm.do?">수정</a></td>
									<td><a href="deleteCar.do">삭제</a></td>
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