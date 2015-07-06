<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#usingPointView").hide();
		$("#usingPoint").val(0);
		$("#pointForm").change(function(){
			if($(":input[name=pointType]:checked").val()!="pointuse"){
				$("#usingPointView").hide();
				$("#usingPoint").val(0);
				$("#payTotalView").html("${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }");
				$("#paymentPrice").val("${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }");
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
				$("#payTotalView").html("${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }");
				$("#paymentPrice").val("${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }");
				return false;
			} else if($("#usingPoint").val()>Number("${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }")){
				alert("결제금액을 초과해서 포인트를 사용할 수 없습니다");
				$("#usingPoint").val("");
				$("#payTotalView").html("${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }");
				$("#paymentPrice").val("${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }");
			}else{
				$("#payTotalView").html((Number("${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }")-$("#usingPoint").val()));
				$("#paymentPrice").val((Number("${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }")-$("#usingPoint").val()));
			}	
		});
		$("#drivingPaymentBtn").click(function(){
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
							$("#drivingPricePaymentForm").submit();
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
					<legend>반납내역</legend>
					<label for="carModel" class="col-lg-3 control-label">차량</label>
					<div class="col-lg-8">
						<label for="carModel" class="col-lg-8 control-label">
							${returnInfo.carVO.carModelInfoVO.carModel}&nbsp;${returnInfo.carVO.carNickName }
						</label>
					</div>
					<br><br>
					<label for="schedule" class="col-lg-3 control-label">일정</label>
					<div class="col-lg-8">
						<label for="schedule" class="col-lg-8 control-label">
							${returnInfo.rentalDate } ~ ${returnInfo.returnDate }
						</label>
					</div>
					<br><br>
					<label for="availableTime" class="col-lg-3 control-label">이용시간</label>
					<div class="col-lg-8">
						<label for="time" class="col-lg-8 control-label">
							총 ${returnInfo.availableTime } 분
						</label>
					</div>
					<br><br>
					<label for="realReturnDate" class="col-lg-3 control-label">반납시간</label>
					<div class="col-lg-8">
						<label for="time" class="col-lg-8 control-label">
							${returnInfo.returnVO.realReturnDate }
						</label>
					</div>
					<br><br>
					<label for="driveFee" class="col-lg-3 control-label">주행요금</label>
					<div class="col-lg-8">
						<label for="driveFee" class="col-lg-8 control-label">
							${returnInfo.carVO.carModelInfoVO.drivingFee }원(1km)
						</label>
					</div>
					<br><br>
					<label for="mileage" class="col-lg-3 control-label">주행거리</label>
					<div class="col-lg-8">
						<label for="mileage" class="col-lg-8 control-label">
							총 ${returnInfo.returnVO.mileage } km
						</label>
					</div>
					<br><br>
					<c:if test="${returnInfo.extensionPrice>0 }">
						<label for="extensionPrice" class="col-lg-3 control-label">연장이용요금</label>
						<div class="col-lg-8">
							<label for="extensionPrice" class="col-lg-8 control-label">
								${returnInfo.extensionPrice } 원
							</label>
						</div>
						<br><br>
					</c:if>
					<c:if test="${returnInfo.lateFee>0 }">
						<label for="lateTime" class="col-lg-3 control-label">연체이용시간</label>
						<div class="col-lg-8">
							<label for="lateFee" class="col-lg-8 control-label">
								${returnInfo.lateTime } 분
							</label>
						</div>
						<br><br>
						<label for="lateFee" class="col-lg-3 control-label">연체이용요금</label>
						<div class="col-lg-8">
							<label for="lateFee" class="col-lg-8 control-label">
								${returnInfo.lateFee } 원
							</label>
						</div>
						<br><br>
					</c:if>
				</fieldset>
				<div class="col-lg-8 col-lg-offset-4">
					<a href="${initParam.root }auth_member_myPage.do"><button type="button" class="btn btn-primary" id ="">다음에 결제하기</button></a>				
				</div>
			<br><br>
			</div>
		</div>
		<div class="col-md-6">
			<fieldset>
				<legend>결제내역</legend>
				<form action="${initParam.root}auth_payment_paymentDrivingPrice.do" method="post" id="drivingPricePaymentForm">
					<input type="hidden" name="reservationNo" value="${returnInfo.reservationNo}">
					<input type="hidden" name="memberId" value="${sessionScope.loginInfo.memberId }">
					<input type="hidden" name="paymentType" value="주행요금결제">
					<label for="drivingPrice" class="col-lg-2 control-label">주행요금</label>
					<div class="col-lg-9">
						<label for="fee" class="col-lg-9 control-label" id="rentalPrice">
							${returnInfo.returnVO.drivingPrice } 원
						</label>
					</div>
					<br><br>
					<c:if test="${returnInfo.extensionPrice>0 }">
						<label for="extensionPrice" class="col-lg-2 control-label">연장이용요금</label>
						<div class="col-lg-9">
							<label for="extensionPrice" class="col-lg-9 control-label">
								${returnInfo.extensionPrice } 원
							</label>
						</div>
						<br><br>
					</c:if>
					<c:if test="${returnInfo.lateFee>0 }">
						<label for="lateFee" class="col-lg-2 control-label">연체이용요금</label>
						<div class="col-lg-9">
							<label for="lateFee" class="col-lg-9 control-label">
								${returnInfo.lateFee } 원
							</label>
						</div>
						<br><br>
					</c:if>
					<br>
					<label for="point" class="col-lg-2 control-label">포인트</label>
					<div class="col-lg-9" id = "pointForm">
						<input type = "radio" name = "pointType" value = "pointuse">포인트 사용&nbsp;&nbsp;
						<input type = "radio" name = "pointType" value = "pointnouse" checked="checked">포인트 미사용<br>				
						<span id = "usingPointView">
							사용가능한 포인트 : ${memberPoint} 점<br>
							<input type="text" id="usingPoint" name="usingPoint" placeholder="숫자를 입력하세요!">
						</span><br>
					</div>
					<br><br><br>
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
							<input type="hidden" name="paymentPrice" id="paymentPrice" value="${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }">
							<span id="payTotalView">
								${returnInfo.returnVO.drivingPrice + returnInfo.extensionPrice + returnInfo.lateFee }
							</span> 원
						</label>
					</div>
					<br><br>
				</form>
			</fieldset>
			<div class="col-lg-9 col-lg-offset-9">
				<button type="button" class="btn btn-primary" id ="drivingPaymentBtn">결제하기</button>
			</div>				
		</div>
	</div>
</div>
<br><br>
 
