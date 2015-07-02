<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

	$(document).ready(
			function() {
				$("#carNickName").keypress(function(e){
					if(e.Keyword==13){
						$("#searchCarBtn").click();
					}
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
									table+="</tr>";
								});
								table+="</tbody></table>"; 
							$("#searchTable").html(table);
						}
					});//ajax
				});//click
			});//ready
</script>
<legend ><h2>차량 목록</h2> </legend>
<html>
<br>
<form class="form-horizontal" id="searchCar">
	<fieldset>
		<div class="col-lg-2" >
			<select class="form-control" id="carModel" name="carModel">
				<option value="">모델전체</option>
				<c:forEach items="${requestScope.data.modelList }" var="data">
					<option value="${data }">${data }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-lg-3">
			<select class="form-control" id="uCarZoneName" name="uCarZoneName">
				<option value="">유카존전체</option>
				<c:forEach items="${requestScope.data.uCarZoneList }" var="data">
					<option value="${data.uCarZoneName }">${data.uCarZoneName}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<div class="col-lg-3">
				<input type="text" class="form-control" id="carNickName"
					name="carNickName" placeholder="닉네임" onKeyDown="javascript:if (event.keyCode == 13) return false;" >

			</div>
			<button type="button" class="btn btn-primary" id="searchCarBtn">검색</button>
		</div>
	</fieldset>
</form>
<form class="form-horizontal" id="searchCar">
	<fieldset>
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
				<div id="searchTable">
					<table class="table" >
						<thead>
							<tr>
								<th>번호</th>
								<th>모델</th>
								<th>유카존</th>
								<th>닉네임</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.data.carList }" var="vo" >
								<tr id="carInfo">
									<td>${vo.carNo}</td>
									<td>${vo.carModelInfoVO.carModel}</td>
									<td>${vo.uCarZoneVO.uCarZoneName}</td>
									<td><a href="admin_carDetailInfo.do?carNo=${vo.carNo}">${vo.carNickName}</a></td>
									<td >
										<button type="button" class="btn btn-xs" name="updateBtn"
											value="${vo.carNo}">수정</button>
											
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
</fieldset>
</form>
</html>