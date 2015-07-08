<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#usingPointView").hide();
		$("#usingPoint").val(0);
		$("#pointForm").change(function(){
			if($(":input[name=pointType]:checked").val()!="pointuse"){
				$("#usingPointView").hide();
				$("#usingPoint").val(0);
				$("#payTotalView").html("${reservationInfo.rentalPrice }");
				$("#paymentPrice").val("${reservationInfo.rentalPrice }");
			} else{
				$("#usingPointView").show();
			}
		});
		$("#usingPoint").keyup(function(){
			if(isNaN($("#usingPoint").val())){
				alert("숫자 입력하세요!");
				$("#usingPoint").val("");
				return false;
			} else if(Number("${memberPoint}")<$("#usingPoint").val()){
				alert("사용가능한 포인트를 초과해서 사용할 수 없습니다");
				$("#usingPoint").val("");
				$("#payTotalView").html("${reservationInfo.rentalPrice }");
				$("#paymentPrice").val("${reservationInfo.rentalPrice }");
				return false;
			} else if($("#usingPoint").val()>Number("${reservationInfo.rentalPrice }")){
				alert("결제금액을 초과해서 포인트를 사용할 수 없습니다");
				$("#usingPoint").val("");
				$("#payTotalView").html("${reservationInfo.rentalPrice }");
				$("#paymentPrice").val("${reservationInfo.rentalPrice }");
			}else{
				$("#payTotalView").html(
						(Number("${reservationInfo.rentalPrice }")-$("#usingPoint").val()));
				$("#paymentPrice").val(
						(Number("${reservationInfo.rentalPrice }")-$("#usingPoint").val()));
			}	
		});
		$("#reserveRegisterBtn").click(function(){
			if($("#payCardType").val()==""){
				alert("결제카드를 선택하세요!");
				return false;
			} else if($(":input[name=pointType]:checked").val()=="pointuse" && $("#usingPoint").val()==""){
				alert("포인트 입력하세요!");
				return false;
			} else{
				$.ajax({
					type:"post",
					url:"${initParam.root}auth_payment_checkCardPassword.do",
					data:"cardNo="+$("#payCardNo").val()+"&memberId=${sessionScope.loginInfo.memberId}&cardPassword="+$("#cardPassword").val(),
					success:function(data){
						if(data=='ok'){
							$("#rentalPricePaymentForm").submit();
						} else if(data=='fail'){
							alert("카드비밀번호를 확인하세요!");
						} else{
							location.href="${initParam.root}member_login_form.do";
						}
					}
				});
			}
		});
	});
</script>
<c:if test="${fn:length(cardListByMember)==0 }">
	<script>
		alert("등록된 카드가 없어서 결제를 진행할 수 없습니다! 결제카드를 등록하세요!");
		location.href="${initParam.root}auth_member_registerCard_form.do";
	</script>
</c:if>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<fieldset>
					<legend>예약내역</legend>
					<label for="carModel" class="col-lg-2 control-label">차량</label>
					<div class="col-lg-9">
						<label for="carModel" class="col-lg-9 control-label">
							${reservationInfo.carVO.carModelInfoVO.carModel}&nbsp;${reservationInfo.carVO.carNickName }
						</label>
					</div>
					<br><br>
					<label for="schedule" class="col-lg-2 control-label">일정</label>
					<div class="col-lg-9">
						<label for="schedule" class="col-lg-9 control-label">
							 ${reservationInfo.rentalDate } ~ ${reservationInfo.returnDate }
						</label>
					</div>
					<br><br>
					<label for="time" class="col-lg-2 control-label">이용시간</label>
					<div class="col-lg-9">
						<label for="time" class="col-lg-9 control-label">
							총 ${reservationInfo.availableTime } 분
						</label>
					</div>
					<br><br>
					<label for="ucarZone" class="col-lg-2 control-label">유카존</label>
					<div class="col-lg-9">
						<label for="ucarZone" class="col-lg-9 control-label">
							${reservationInfo.carVO.uCarZoneVO.uCarZoneName }
						</label>
					</div>
					<br><br>
					<label for="ucarSpace" class="col-lg-2 control-label">위치</label>
					<div class="col-lg-9">
						<label for="ucarSpace" class="col-lg-9 control-label">
							${reservationInfo.carVO.uCarZoneVO.uCarZoneAddress }
						</label>
					</div>
					<br><br><br><br><br><br><br><br><br><br>
				
				</fieldset>
					<div class="col-lg-9 col-lg-offset-4">
						<a href="${initParam.root }auth_member_myPage.do"><button type="button" class="btn btn-primary" id ="">다음에 결제하기</button></a>
					</div>
					<br><br>
				</div>
			</div>
			<div class="col-md-6">
				<fieldset>
					<legend>결제내역</legend>
					<form action="${initParam.root}auth_payment_paymentRentalPrice.do" method="post" id="rentalPricePaymentForm">
						<input type="hidden" name="reservationNo" value="${reservationInfo.reservationNo}">
						<input type="hidden" name="memberId" value="${sessionScope.loginInfo.memberId }">
						<input type="hidden" name="paymentType" value="이용요금결제">
						<label for="fee" class="col-lg-2 control-label">대여요금</label>
						<div class="col-lg-9">
							<label for="fee" class="col-lg-9 control-label" id="rentalPrice">
								${reservationInfo.rentalPrice } 원
							</label>
						</div>
						<br><br><br>
						<label for="fee" class="col-lg-2 control-label">포인트</label>
						<div class="col-lg-9" id = "pointForm">
							<input type = "radio" name = "pointType" value = "pointuse">포인트 사용&nbsp;&nbsp;
							<input type = "radio" name = "pointType" value = "pointnouse" checked="checked">포인트 미사용<br>				
							<span id = "usingPointView">
								사용가능한 포인트 : ${memberPoint} 점<br>
								<input type="text" id="usingPoint" name="usingPoint" placeholder="숫자를 입력하세요!">
							</span><br>
						</div>
						<br><br><br><br>
						<label for="driveFee" class="col-lg-2 control-label">주행요금</label>
						<div class="col-lg-9">
							<label for="driveFee" class="col-lg-9 control-label">
								${reservationInfo.carVO.carModelInfoVO.drivingFee }원(1km당) ※반납 후 주행거리에 따라 부과
							</label>
						</div>
						<br><br>
						<label for="payCard" class="col-lg-2 control-label">결제카드</label>
						<div class="col-lg-9">
							<select class="form-control" id="payCardNo" name="paymentCardNo">
								<option value="">결제카드</option>
								<c:forEach items="${cardListByMember }" var="cardInfo">
									<option value="${cardInfo.cardVO.cardNo }">${cardInfo.cardVO.cardNo }</option>
								</c:forEach>
							</select>
						</div>
						<br><br><br>
						<label for="payCard" class="col-lg-2 control-label">카드비밀번호</label>
						<div class="col-lg-9">
							<input type="password" id="cardPassword" maxlength="2">**
						</div>
						<br><br><br>
						<label for="payTotal" class="col-lg-2 control-label">결제요금</label>
						<div class="col-lg-9">
							<label for="payTotal" class="col-lg-9 control-label">
								<input type="hidden" name="paymentPrice" id="paymentPrice" value="${reservationInfo.rentalPrice }">
								<span id="payTotalView">
									${reservationInfo.rentalPrice }
								</span> 원
							</label>
						</div>
					<br><br>
					</form>
				</fieldset>
				<div class="col-lg-9 col-lg-offset-9">
					<button type="button" class="btn btn-primary" id ="reserveRegisterBtn">결제하기</button>
				</div>
			</div>
		</div>				
	</div>
<br><br>
 
