<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$(function(){
		$(":input[name=cancelBtn]").click(function(){
			//alert($(this).parent().siblings().eq(5).text());
			var reservationNo=$(this).val();
			var sharingStatus=$(this).parent().siblings().eq(5).text();
			var flag=confirm("예약을 취소하시겠습니까?");
			if(flag)
				location.href="${initParam.root}auth_reservation_cancelReservation.do?reservationNo="+reservationNo+"&pageNo=${reservationList.pagingBean.nowPage}&sharingStatus="+sharingStatus;
		});
		$(":input[name=paymentBtn]").click(function(){
			var reservationNo=$(this).val();
			var flag=confirm("결제 하시겠습니까?");
			if(flag)
				location.href="${initParam.root}auth_reservation_reservation_result.do?reservationNo="+reservationNo+"&memberId=${sessionScope.loginInfo.memberId}";
		})
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
												<c:choose>
													<c:when test="${reservationInfo.sharingStatus!='이용요금결제' }">
														<button type="button" class="btn btn-default btn-sm" name="paymentBtn" id="paymentBtn" value="${reservationInfo.reservationNo }">결제</button>&nbsp;
													</c:when>
													<c:otherwise>
														<button type="button" class="btn btn-default btn-sm" name="useBtn" id="useBtn" value="${reservationInfo.reservationNo }">이용</button>&nbsp;
													</c:otherwise>
												</c:choose>
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
									<a href="${initParam.root}auth_member_reservationHistory.do?pageNo=${reservationList.pagingBean.startPageOfPageGroup-1}">«</a>
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
									<li><a href="${initParam.root}auth_member_reservationHistory.do?pageNo=${i}">${i }</a></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="#">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${reservationList.pagingBean.nextPageGroup}">
								<li>
									<a href="${initParam.root}auth_member_reservationHistory.do?pageNo=${reservationList.pagingBean.endPageOfPageGroup+1}">«</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="#">»</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:if test="">
							<li><a href="#">»</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="tab-pane fade" id="usedListView">
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
								<c:when test="${fn:length(usedList.list)!=0}">
									<c:forEach items="${usedList.list }" var="usedInfo" varStatus="i">
										<tr>
											<td>${i.count }</td>
											<td>${usedInfo.carVO.carModelInfoVO.carModel }&nbsp;${usedInfo.carVO.carNickName }</td>
											<td>${usedInfo.rentalDate }</td>
											<td>${usedInfo.returnDate }</td>
											<td>${usedInfo.rentalPrice } 원</td>
											<td>${usedInfo.sharingStatus }</td>
											<td>
												<button type="button" class="btn btn-default btn-sm" id="" value="${usedInfo.reservationNo }"></button>
												<button type="button" class="btn btn-default btn-sm" id="" value="${usedInfo.reservationNo }"></button>
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
									<a href="${initParam.root}auth_member_reservationHistory.do?pageNo=${usedList.pagingBean.startPageOfPageGroup-1}">«</a>
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
									<li><a href="${initParam.root}auth_member_reservationHistory.do?pageNo=${i}">${i }</a></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="#">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${usedList.pagingBean.nextPageGroup}">
								<li>
									<a href="${initParam.root}auth_member_reservationHistory.do?pageNo=${usedList.pagingBean.endPageOfPageGroup+1}">«</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="#">»</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:if test="">
							<li><a href="#">»</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>