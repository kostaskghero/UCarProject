<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#pointTextView").hide();
		$("#pointText").val("");
		$("#pointForm").change(function(){
			if($(":input[name=pointType]:checked").val()!="pointuse"){
				$("#pointTextView").hide();
				$("#pointText").val("");
				$("#payTotalView").html("${reservationInfo.rentalPrice }");
			} else{
				$("#pointTextView").show();
			}
		});
		$("#pointText").keyup(function(){
			if(isNaN($("#pointText").val())){
				alert("숫자 입력하세요!");
				$("#pointText").val("");
				return false;
			} else if(Number("${PointAndCoupon.memberPoint}")<$("#pointText").val()){
				alert("사용가능한 포인트를 초과해서 사용할 수 없습니다");
				$("#pointText").val("");
				$("#payTotalView").html("${reservationInfo.rentalPrice }");
				return false;
			} else{
				$("#payTotalView").html((Number("${reservationInfo.rentalPrice }")-$("#pointText").val()));	
			}	
		});
		$("#reserveRegisterBtn").click(function(){
			var usingPoint=Number($("#pointText").val());
			/* if($("#couponType").val()==""){
				alert("쿠폰을 선택하세요!");
				return false;
			} else */ if($("#payCardType").val()==""){
				alert("결제카드를 선택하세요!");
				return false;
			} else if($(":input[name=pointType]:checked").val()=="pointuse" && $("#pointText").val()==""){
				alert("포인트 입력하세요!");
				return false;
			} else{
				$.ajax({
					type:"post",
					url:"${initParam.root}auth_payment_checkCardPassword.do",
					data:"cardNo="+$("#payCardNo").val()+"&memberId=${sessionScope.loginInfo.memberId}&cardPassword="+$("#cardPassword").val(),
					success:function(data){
						if(data=='ok'){
							location.href="${initParam.root}auth_payment_paymentRentalPrice.do?reservationNo=${reservationInfo.reservationNo}&paymentPrice="+
							$("#payTotalView").text()+"&paymentCardNo="+$("#payCardNo").val()+"&usingPoint="+usingPoint+"&paymentType='이용요금'";
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
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<fieldset>
					<legend>예약내역</legend>
					<label for="carModel" class="col-lg-2 control-label">차량</label>
					<div class="col-lg-10">
						<label for="carModel" class="col-lg-10 control-label">
							${reservationInfo.carVO.carModelInfoVO.carModel}&nbsp;${reservationInfo.carVO.carNickName }
						</label>
					</div>
					<br><br>
					<label for="schedule" class="col-lg-2 control-label">일정</label>
					<div class="col-lg-10">
						<label for="schedule" class="col-lg-10 control-label">
							${reservationInfo.sharingType } / ${reservationInfo.rentalDate } ~ ${reservationInfo.returnDate }
						</label>
					</div>
					<br><br>
					<label for="time" class="col-lg-2 control-label">이용시간</label>
					<div class="col-lg-10">
						<label for="time" class="col-lg-10 control-label">
							총 ${reservationInfo.availableTime } 분
						</label>
					</div>
					<br><br>
					<label for="ucarZone" class="col-lg-2 control-label">유카존</label>
					<div class="col-lg-10">
						<label for="ucarZone" class="col-lg-10 control-label">
							${reservationInfo.carVO.uCarZoneVO.uCarZoneName }
						</label>
					</div>
					<br><br>
					<label for="ucarSpace" class="col-lg-2 control-label">위치</label>
					<div class="col-lg-10">
						<label for="ucarSpace" class="col-lg-10 control-label">
							${reservationInfo.carVO.uCarZoneVO.uCarZoneAddress }
						</label>
					</div>
					<br><br>
				</fieldset>
			</div>
			<div class="col-md-6">
				<fieldset>
					<legend>결제내역</legend>
					<label for="fee" class="col-lg-2 control-label">대여요금</label>
					<div class="col-lg-10">
						<label for="fee" class="col-lg-10 control-label" id="rentalPrice">
							${reservationInfo.rentalPrice } 원
						</label>
					</div>
					<br><br>
					<label for="coupon" class="col-lg-2 control-label">쿠폰</label>
					<div class="col-lg-10">
						<select class="form-control" id="couponType">
							<option value="">쿠폰선택</option>
							<c:forEach items="${PointAndCoupon }">
								<option value=""></option>
							</c:forEach>
						</select>
					</div>
					<br><br><br>
					<label for="fee" class="col-lg-2 control-label">포인트</label>
					<div class="col-lg-10" id = "pointForm">
						<input type = "radio" name = "pointType" value = "pointuse">포인트 사용&nbsp;&nbsp;
						<input type = "radio" name = "pointType" value = "pointnouse" checked="checked">포인트 미사용<br>				
						<span id = "pointTextView">
							사용가능한 포인트 : ${PointAndCoupon.memberPoint} 점<br>
							<input type="text" id="pointText" name="pointText" placeholder="숫자를 입력하세요!">
						</span><br>
					</div>
					<br><br><br>
					<label for="driveFee" class="col-lg-2 control-label">주행요금</label>
					<div class="col-lg-10">
						<label for="driveFee" class="col-lg-10 control-label">
							${reservationInfo.carVO.carModelInfoVO.drivingFee }원(1km당) ※반납 후 주행거리에 따라 부과
						</label>
					</div>
					<br><br>
					<label for="payCard" class="col-lg-2 control-label">결제카드</label>
					<div class="col-lg-10">
						<select class="form-control" id="payCardNo">
							<option value="">결제카드</option>
							<c:forEach items="${cardListByMember }" var="cardInfo">
								<option value="${cardInfo.cardVO.cardNo }">${cardInfo.cardVO.cardNo }</option>
							</c:forEach>
						</select>
					</div>
					<br><br><br>
					<label for="payCard" class="col-lg-2 control-label">카드비밀번호</label>
					<div class="col-lg-10">
						<input type="password" id="cardPassword" maxlength="2">**
					</div>
					<br><br><br>
					<label for="payTotal" class="col-lg-2 control-label">결제요금</label>
					<div class="col-lg-10">
						<label for="payTotal" class="col-lg-10 control-label">
							<span id="payTotalView">${reservationInfo.rentalPrice }</span> 원
						</label>
					</div>
				<br><br>
				</fieldset>
				<div class="col-lg-10 col-lg-offset-9">
					<button type="button" class="btn btn-primary" id ="reserveRegisterBtn">결제하기</button>
				</div>				
			</div>
			<a href="${initParam.root }auth_member_myPage.do"><button type="button" class="btn btn-primary" id ="">다음에 결제하기</button></a>
		</div>
	</div>
</div>
 