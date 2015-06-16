<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#updateB").click(function(){
					alert("제발");
				});
				$("#searchTable").on("click", "#updateBtn",function(){
					if (confirm("수정하시겠습니까?"))
						location.href = "admin_carUpdateForm.do?carNo="
								+ $(this).val();
				});
				$("#searchTable").on("click", "#deleteBtn",function(){
					if (confirm("삭제하시겠습니까?"))
						location.href = "admin_carDeleteForm.do?carNo="
								+ $(this).val();
				});
				$(":input[name=deleteBtn]").click(
						function() {
							if (confirm("삭제하시겠습니까?"))
								location.href = "admin_carDeleteForm.do?carNo="
										+ $(this).val();
						});
				$(":input[name=updateBtn]").click(
						function() {
							if (confirm("수정하시겠습니까?"))
								location.href = "admin_carUpdateForm.do?carNo="
										+ $(this).val();
						});

				$("#searchCarBtn").click(function() {
					$.ajax({
						type : "POST",
						url : "admin_searchCar.do",
						dataType : "json",
						data : $("#searchCar").serialize(),
						success : function(data) {
							
							var table="<table class='table'>";
								table+="<thead>	<tr><th>No</th>	<th>Mdoel</th><th>UcarZone</th><th>NickName</th><th>수정</th><th>삭제</th></tr>	</thead>";
								table+="<tbody>";
								$.each(data,function(i,vo){
									table+="<tr>";
									table+="<td>"+vo.carNo+"</td>";
									table+="<td>"+vo.carModelInfoVO.carModel+"</td>";
									table+="<td>"+vo.uCarZoneVO.uCarZoneName+"</td>";
							 	 	table+="<td><a href='admin_carDetailInfo.do?carNo="+vo.carNo+"'>"+vo.carNickName+"</a></td>";
									table+="<td ><button type='button' class='btn btn-xs' id='updateBtn' value='"+vo.carNo+"'>수정</button></td>";
									table+="<td><button type='button' class='btn btn-xs' id='deleteBtn'value='"+vo.carNo+"'> 삭제 </button></td>";  
									table+="</tr>";
								});
								table+="</tbody></table>"; 
							$("#searchTable").html(table);
						}
					});//ajax
				});//click
			});//ready
</script>
<html>
<form class="form-horizontal"
	action="${initParam.root }admin_searchCar.do" id="searchCar">
	<fieldset>

		<div class="col-lg-2">
			<select class="form-control" id="carModel" name="carModel">
				<option value="">모델</option>
				<c:forEach items="${requestScope.data.modelList }" var="data">
					<option value="${data }">${data }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-lg-3">
			<select class="form-control" id="uCarZoneName" name="uCarZoneName">
				<option value="">유카존</option>
				<c:forEach items="${requestScope.data.uCarZoneList }" var="data">
					<option value="${data.uCarZoneName }">${data.uCarZoneName}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<div class="col-lg-3">
				<input type="text" class="form-control" id="carNickName"
					name="carNickName" placeholder="닉네임">

			</div>
			<button type="button" class="btn btn-primary" id="searchCarBtn">검색</button>
		</div>
	</fieldset>
</form>
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
					<table class="table" >
						<thead>
							<tr>
								<th>No</th>
								<th>Mdoel</th>
								<th>UcarZone</th>
								<th>NickName</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.data.carList }" var="vo">
								<tr id="carInfo">
									<td>${vo.carNo}</td>
									<td>${vo.carModelInfoVO.carModel}</td>
									<td>${vo.uCarZoneVO.uCarZoneName}</td>
									<td><a href="admin_carDetailInfo.do?carNo=${vo.carNo}">${vo.carNickName}</a></td>
									<td >
										<button type="button" class="btn btn-xs" name="updateBtn"
											value="${vo.carNo}">수정</button>
											
									</td>
									<td>
										<button type="button" class="btn btn-xs" name="deleteBtn"
											value="${vo.carNo}">삭제</button>
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