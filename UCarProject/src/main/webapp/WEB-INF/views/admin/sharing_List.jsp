<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#searchSharingBtn").click(function(){
			$.ajax({
				type : "POST",
				url : "admin_searchSharing.do",
				dataType : "json",
				data : $("#searchSharingForm").serialize(),
				success : function(data) {
					
					var table="<table class='table table-hover'>";
						table+="<thead><tr><th>번호</th><th>차모델</th><th>대여자</th><th>대여일시</th><th>반납일시</th><th>이용요금</th><th>상태</th></tr></thead>";
						table+="<tbody>";
				 		$.each(data,function(i,vo){
							table+="<tr>";
							table+="<td>"+i+"</td>";
							table+="<td>"+vo.carVO.carModelInfoVO.carModel+" - "+vo.carVO.carNickName+"</td>";
							table+="<td>"+vo.memberVO.memberId +"</td>";
					 	 	table+="<td>"+vo.rentalDate+"</td>";
							table+="<td >"+vo.returnDate+"</td>";
							table+="<td>"+vo.rentalPrice+" 원</td>";  
							table+="<td>"+vo.sharingStatus+"</td>";  
							table+="</tr>";
						}); 
						table+="</tbody></table>"; 
					$("#searchTable").html(table);
					$("#carNickName").val("");
					$("#memberId").val("");
					$("#sharingStatus").val("");
				}
			});//ajax
		});
	});
</script>


<legend>예약내역 </legend>
<form class="form-horizontal" id="searchSharingForm">
	
	<fieldset><br>
	<label for="searchInput" class="col-lg-1 control-label col-lg-offset-1"><h4>검색</h4></label>
		<div class="col-lg-2 col-lg-offset-1" >
			<select class="form-control" id="sharingStatus" name="sharingStatus">
				<option value="">상태</option>
				<c:forEach items="${requestScope.data.statusList }" var="data">
					<option value="${data }">${data }</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<div class="col-lg-3">
				<input type="text" class="form-control" id="carNickName"
					name="carNickName" placeholder="차량닉네임"
					onKeyDown="javascript:if (event.keyCode == 13) return false;">
			</div>
			<div class="col-lg-3">
				<input type="text" class="form-control" id="memberId"
					name="memberId" placeholder="회원아이디"
					onKeyDown="javascript:if (event.keyCode == 13) return false;">
			</div>
			<button type="button" class="btn btn-primary" id="searchSharingBtn">검색</button>
		</div>

	</fieldset>
</form>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-9"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div id="searchTable">					
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>차모델</th>
										<th>대여자</th>
										<th>대여일시</th>
										<th>반납일시</th>
										<th>이용요금</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.data.reservationList }"
										var="vo" varStatus="i">
										<tr>
											<td>${i.count}</td>
											<td>${vo.carVO.carModelInfoVO.carModel }&nbsp;-&nbsp;${vo.carVO.carNickName }</td>
											<td>${vo.memberVO.memberId }</td>
											<td>${vo.rentalDate }</td>
											<td>${vo.returnDate }</td>
											<td>${vo.rentalPrice }원</td>
											<td>${vo.sharingStatus }</td>
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