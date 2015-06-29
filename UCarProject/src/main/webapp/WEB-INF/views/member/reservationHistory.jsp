<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(function(){
		$("#extensionBtnView").hide();
		$("#extensionPriceView").hide();
		$(":input[name=cancelBtn]").click(function(){
			//alert($(this).parent().siblings().eq(5).text());
			var reservationNo=$(this).val();
			var sharingStatus=$(this).parent().siblings().eq(5).text();
			var flag=confirm("예약을 취소하시겠습니까?");
			if(flag)
				location.href="${initParam.root}auth_memberSharing_cancelReservation.do?reservationNo="+reservationNo+"&sharingStatus="+sharingStatus+"&memberId=${sessionScope.loginInfo.memberId}";
		});
		$(":input[name=rentalPaymentBtn]").click(function(){
			var reservationNo=$(this).val();
			var flag=confirm("결제 하시겠습니까?");
			if(flag)
				location.href="${initParam.root}auth_reservation_reservationResult.do?reservationNo="+reservationNo+"&memberId=${sessionScope.loginInfo.memberId}";
		});
		$(":input[name=useBtn]").click(function(){
			var reservationNo=$(this).val();
			var flag=confirm("유카 이용 하시겠습니까?");
			if(flag)
				location.href="${initParam.root}auth_memberSharing_usingSharingService.do?reservationNo="+reservationNo+"&memberId=${sessionScope.loginInfo.memberId}";
		});
		$(":input[name=returnViewBtn]").click(function(){
			var reservationNo=$(this).val();
			$("#"+reservationNo+"ButtonView").hide();
			var inputForm="<input type='text' name='mileage' id='mileage'>km<br>";
			inputForm+="<button type='button' class='btn btn-default btn-sm' name='returnBtn' value='"+reservationNo+"'>반납</button>";
			inputForm+="<button type='button' class='btn btn-default btn-sm' name='cancelReturnBtn' value='"+reservationNo+"'>취소</button>";
			$("#"+reservationNo+"inputMileageView").html(inputForm);
		});
		$("#usedListTable").on("click",":input[name=cancelReturnBtn]", function(){
			var reservationNo=$(this).val();
			$("#"+reservationNo+"inputMileageView").hide();
			$("#"+reservationNo+"ButtonView").show();
		});
		$("#usedListTable").on("click",":input[name=returnBtn]", function(){
			var reservationNo=$(this).val();
			var flag=confirm("반납 하시겠습니까?");
			if(flag)
				location.href="${initParam.root}auth_memberSharing_returnSharingService.do?reservationNo="+reservationNo+"&memberId=${sessionScope.loginInfo.memberId}&mileage="+$(":input[name=mileage]").val();
		});
		$(":input[name=drivingPaymentBtn]").click(function(){
			var reservationNo=$(this).val();
			var extensionPrice=$("#"+reservationNo+"ExtensionPrice").val();
			var flag=confirm("결제 하시겠습니까?");
			if(flag)
				location.href="${initParam.root}auth_reservation_returnResult.do?reservationNo="+reservationNo+"&memberId=${sessionScope.loginInfo.memberId}&extensionPrice="+extensionPrice;
		});
		$(":input[name=exetensionBtn]").click(function(){
			var reservationNo=$(this).val();
			$("#returnDateView").html($("#"+reservationNo+"ReturnDate").text());
			$("#reservationNo").val(reservationNo);
			location.href="#extensionModal";
		});
		$("#checkExtensionBtn").click(function(){
			$.ajax({
				type:"post",
				url:"${initParam.root}auth_memberSharing_checkExtension.do",
				data:"reservationNo="+$("#reservationNo").val()+"&extensionDate="+$("#extensionDate").val()+"&returnDate="+$("#returnDateView").text(),
				success:function(data){					
					if(data.flag=="ok"){
						$("#extensionPrice").val(data.extensionPrice);						
						$("#hiddenExtensionDate").val($("#extensionDate").val());
						$("#extensionPriceView").html("연장일시 : "+extensionDate+" / 이용요금 : "+data.extensionPrice+"원").show();
						$("#extensionBtnView").show();
					} else if(data.flag=="fail"){
						alert("연장할수없습니다");
					} else{
						location.href="${initParam.root}member_login.do";
					}
				}
			});
		});
		$("#extensionReservationBtn").click(function(){
			if($("#hiddenExtensionDate").val()==$("#extensionDate").val()){
				alert("연장 가능한지 확인해주세요!");
				return false;
			} else{
				$("#extensionForm").submit();
			}
		});
		$("#extensionDate").datetimepicker({
		 	minDate: 0, 
		 	ang:'ko',
		    format:'Y/m/d H:i',
		    step: 10 //시간 설정을 10분단위로 나눔
	    }); 
	});
</script>
<div class="container">
	<div class="col-md-9">
		<h1>예약내역관리</h1>
		<br>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#reservationListView" data-toggle="tab">예약중인차량</a></li>
			<li><a href="#usedListView" data-toggle="tab">이용한차량</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="reservationListView">
				<div class="col-md-12">
					<br><br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th><th>차모델</th><th>대여일시</th><th>반납일시</th><th>이용요금</th><th>상태</th><th></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(reservationList.list)!=0}">
									<c:forEach items="${reservationList.list }" var="reservationInfo" varStatus="i">
										<tr>
											<td>${i.count }</td>
											<td>${reservationInfo.carVO.carModelInfoVO.carModel }&nbsp;${reservationInfo.carVO.carNickName }</td>
											<td>${reservationInfo.rentalDate }</td>
											<td>${reservationInfo.returnDate }</td>
											<td>${reservationInfo.rentalPrice } 원</td>
											<td>${reservationInfo.sharingStatus }</td>
											<td>
												<c:if test="${reservationInfo.sharingStatus!='이용요금결제' }">
													<button type="button" class="btn btn-default btn-sm" name="rentalPaymentBtn" id="rentalPaymentBtn" value="${reservationInfo.reservationNo }">결제</button>&nbsp;
												</c:if>
												<button type="button" class="btn btn-default btn-sm" name="cancelBtn" id="cancelBtn" value="${reservationInfo.reservationNo }">취소</button>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="9">예약내역이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<ul class="pagination">
						<c:choose>
							<c:when test="${reservationList.pagingBean.previousPageGroup}">
								<li>
									<a href="${initParam.root}auth_memberSharing_reservationHistory.do?pageNo=${reservationList.pagingBean.startPageOfPageGroup-1}">«</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="#">«</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${reservationList.pagingBean.startPageOfPageGroup}" end="${reservationList.pagingBean.endPageOfPageGroup}">
							<c:choose>
								<c:when test="${reservationList.pagingBean.nowPage!=i}">
									<li><a href="${initParam.root}auth_memberSharing_reservationHistory.do?pageNo=${i}">${i }</a></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="#">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${reservationList.pagingBean.nextPageGroup}">
								<li>
									<a href="${initParam.root}auth_memberSharing_reservationHistory.do?pageNo=${reservationList.pagingBean.endPageOfPageGroup+1}">»</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="#">»</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<div class="tab-pane fade" id="usedListView">
				<div class="col-md-12">
					<br><br>
					<table class="table table-hover" id="usedListTable">
						<thead>
							<tr>
								<th>번호</th><th>차모델</th><th>대여일시</th><th>반납일시</th><th>추가요금</th><th>상태</th><th></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(usedList.list)!=0}">
									<c:forEach items="${usedList.list }" var="usedInfo" varStatus="i">
										<tr>
											<td>${i.count }</td>
											<td>${usedInfo.carVO.carModelInfoVO.carModel }&nbsp;${usedInfo.carVO.carNickName }</td>
											<td>${usedInfo.rentalDate }</td>
											<c:choose>
												<c:when test="${usedInfo.sharingStatus=='연장' }">
													<td>${usedInfo.extensionDate }</td>
												</c:when>
												<c:otherwise>
													<td id="${usedInfo.reservationNo }ReturnDate">${usedInfo.returnDate }</td>	
												</c:otherwise>
											</c:choose>											
											<td>${usedInfo.extensionPrice + usedInfo.lateFee } 원<input type="hidden" id="${usedInfo.reservationNo }ExtensionPrice" value="${usedInfo.extensionPrice }"></td>
											<td>${usedInfo.sharingStatus }</td>
											<td>
												<div class="col-md-6">
												<c:choose>
													<c:when test="${usedInfo.sharingStatus =='이용중' }">
														<span id="${usedInfo.reservationNo }ButtonView">
															<button type="button" class="btn btn-default btn-sm" name="returnViewBtn" value="${usedInfo.reservationNo }">반납</button>
															<button type="button" class="btn btn-default btn-sm" name="exetensionBtn" value="${usedInfo.reservationNo }">연장</button>
														</span>
														<span id="${usedInfo.reservationNo }inputMileageView">
														</span>
													</c:when>
													<c:when test="${usedInfo.sharingStatus=='반납' }">
														<button type="button" class="btn btn-default btn-sm" name="drivingPaymentBtn" value="${usedInfo.reservationNo }">결제</button>
													</c:when>
													<c:when test="${usedInfo.sharingStatus=='연장' || usedInfo.sharingStatus=='연체' }">
														<span id="${usedInfo.reservationNo }ButtonView">
															<button type="button" class="btn btn-default btn-sm" name="returnViewBtn" value="${usedInfo.reservationNo }">반납</button>
														</span>
														<span id="${usedInfo.reservationNo }inputMileageView">
														</span>
													</c:when>
												</c:choose>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="9">이용내역이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<ul class="pagination">
						<c:choose>
							<c:when test="${usedList.pagingBean.previousPageGroup}">
								<li>
									<a href="${initParam.root}auth_memberSharing_reservationHistory.do?pageNo=${usedList.pagingBean.startPageOfPageGroup-1}">«</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="#">«</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${usedList.pagingBean.startPageOfPageGroup}" end="${usedList.pagingBean.endPageOfPageGroup}">
							<c:choose>
								<c:when test="${usedList.pagingBean.nowPage!=i}">
									<li><a href="${initParam.root}auth_memberSharing_reservationHistory.do?pageNo=${i}">${i }</a></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="#">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${usedList.pagingBean.nextPageGroup}">
								<li>
									<a href="${initParam.root}auth_memberSharing_reservationHistory.do?pageNo=${usedList.pagingBean.endPageOfPageGroup+1}">»</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="#">»</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="extensionModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
		<form class="form-horizontal" action="${initParam.root }auth_memberSharing_extensionReservation.do" id="extensionForm">
			<fieldset>
				<legend></legend>
				<div class="form-group">
					<label for="returnDateView" class="control-label">반납일시</label>
					<span id="returnDateView"></span>
				</div>
				<div class="form-group">
					<label for="inputExtensionDate" class="control-label">연장</label>
					<input type="text" class="form-control" id="extensionDate" name="extensionDate" placeholder="YYYY/MM/DD HH:MM">
					<input type="hidden" id="reservationNo" name="reservationNo">
					<input type="hidden" id="hiddenextensionDate" name="hiddenExtensionDate">
					<input type="hidden" id="extensionPrice" name="extensionPrice">
					<span id="extensionPriceView">						
					</span>
				</div>
				<div class="form-group" >
					<div class="col-lg-4">
						<button type="button" class="btn" id="checkExtensionBtn" >연장확인</button>
					</div>
					<div class="col-lg-4" id="extensionBtnView">
						<button type="button" class="btn btn-primary" id="extensionReservationBtn" >연장</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>