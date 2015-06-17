<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#pointForm").click(function() {
			var pointType=$(":input[name=pointType]:checked").val();
		 	if (pointType == "pointuse")  {
				var infoText = "<input type='text' id='pointText' name= 'pointText' placeholder='숫자를 입력하세요!'>";
				$("#pointTextView").html(infoText);
				var pointText=$("#pointText").val();	
				pointTextDate = pointText;
				 if(pointText==""){
					alert("사용할 포인트를 입력하세요");
					return;
				} 
			} 
		 	if(pointType== "pointnouse") {
		 		var infoText = "포인트 미사용";
				$("#pointTextView").html(infoText);
		 	} 
		});
		$("#reserveRegister").click(function(){
			var pointType=$(":input[name=pointType]:checked").val();
			if($("#couponType").val()==""){
				alert("쿠폰을 선택하세요!");
				return false;
			} else if(pointType== undefined) {
				alert("포인트 사용여부를 체크해주세요!");
				return;
			} else if($("#payCardType").val()==""){
				alert("결제카드를 선택하세요!");
				return false;
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
	       			<label for="carModel" class="col-lg-10 control-label">모닝</label>
	     		 </div>
	     		 <br><br>
	     		 	<label for="reserve" class="col-lg-2 control-label">일정</label>
	      		<div class="col-lg-10">
	       			<label for="reserve" class="col-lg-10 control-label">왕복 / 2015 6월 10일 19:00 ~ 2015 6월 10일 19:30</label>
	     		 </div>
	     		 <br><br>
	     		 	<label for="time" class="col-lg-2 control-label">이용시간</label>
	      		<div class="col-lg-10">
	       			<label for="time" class="col-lg-10 control-label">총 0시간 30분</label>
	     		 </div>
	     		 <br><br>
	     		 	<label for="ucarZone" class="col-lg-2 control-label">유카존</label>
	      		<div class="col-lg-10">
	       			<label for="ucarZone" class="col-lg-10 control-label">판교역</label>
	     		 </div>
	     		 <br><br>
	     		 	<label for="ucarSpace" class="col-lg-2 control-label">위치</label>
	      		<div class="col-lg-10">
	       			<label for="ucarSpace" class="col-lg-10 control-label">유스페이스</label>
	     		 </div>
	     		 <br><br>
     		 </fieldset>
          </div>  
          <div class="col-md-6">
          	<fieldset>
    			<legend>결제내역</legend>
    			<label for="fee" class="col-lg-2 control-label">대여요금</label>
	      		<div class="col-lg-10">
	       			<label for="fee" class="col-lg-10 control-label">5000원</label>
	     		 </div>
	     		 <br><br>
	     		 <label for="coupon" class="col-lg-2 control-label">쿠폰</label>
	      		<div class="col-lg-10">
	       			 <select class="form-control" id="couponType">
				        	<option value="">쿠폰선택</option>
				        		<option value="coupon1">1000원 할인</option>
				        		<option value="coupon2">2000원 할인</option>
				        		<option value="coupon3">3000원 할인</option>
       						 </select>
	     		 </div>
	     		 <br><br><br>
	     		 <label for="fee" class="col-lg-2 control-label">포인트</label>
	      		<div class="col-lg-10">
	      			<form method="post"  id = "pointForm">
		       			<input type = "radio" name = "pointType" value = "pointuse">포인트 사용&nbsp;&nbsp;
						<input type = "radio" name = "pointType" value = "pointnouse">포인트 미사용<br>
					</form>
					<span id = "pointTextView"></span><br>
	     		 </div>
	     		 <br><br><br>
	     		 <label for="driveFee" class="col-lg-2 control-label">주행요금</label>
	      		<div class="col-lg-10">
	       			<label for="driveFee" class="col-lg-10 control-label">160원/1km당 ※반납 후 주행거리에 따라 부과</label>
	     		 </div>
	     		 <br><br>
	     		 <label for="payCard" class="col-lg-2 control-label">결제카드</label>
	      		<div class="col-lg-10">
		      		 <select class="form-control" id="payCardType">
				        	<option value="">결제카드</option>
				        		<option value="payCard1">신한은행</option>
				        		<option value="payCard2">우리은행</option>
				        		<option value="payCard3">국민은행</option>
	       				 </select>
	     		 </div>
	     		 <br><br><br>
	     		 <label for="payTotal" class="col-lg-2 control-label">결제요금</label>
	      		<div class="col-lg-10">
	       			<label for="payTotal" class="col-lg-10 control-label">10000원</label>
	     		 </div>
	     		 <br><br>
    		</fieldset>
    		<div class="col-lg-10 col-lg-offset-9">
        		<button type="submit" class="btn btn-primary" id ="reserveRegister">예약하기</button>
          </div>
        </div>
      </div>
    </div>
    </div>
 