<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<legend><h2>차량 상세 정보</h2> </legend>
<div class ="cotanier">
		<div class ="row">
	 	<div class="col-md-12">	
	 		<h4>차 정보</h4>
			<hr>
			<div class = "col-md -3"  >
				<label for="carNo" class="col-lg-3 col-md-offset-1 control-label">차 번호</label>
			</div>
			<div class = "col-md -3">
			 	${requestScope.info.carNo }
				</div>
				<br>
			</div>
			<div class="col-md-12">	
			<div class = "col-md -3"  >
				<label for="carNickName" class="col-lg-3 col-md-offset-1 control-label">닉네임</label>
			</div>
			<div class = "col-md -3">
			 	${requestScope.info.carNickName }
		</div>
		<hr>
			<br>
			</div>
			<div class="col-md-12">	
	 		<h4>유카존</h4>
			<hr>
			<div class = "col-md -3"  >
				<label for="UCarZoneName" class="col-lg-3 col-md-offset-1 control-label">유카존 이름</label>
			</div>
			<div class = "col-md -3">
			 	${requestScope.info.uCarZoneVO.uCarZoneName }
				</div>
				<br>
			</div>
		<div class="col-md-12">	
			<div class = "col-md -3"  >
				<label for="UCarZoneAddress" class="col-lg-3 col-md-offset-1 control-label">유카존 주소</label>
			</div>
			<div class = "col-md -3">
			 	${requestScope.info.uCarZoneVO.uCarZoneAddress }
				</div>
					<hr>
				<br>
			</div>
			<div class="col-md-12">	
	 		<h4>차량 상세정보</h4>
			<hr>
			<div class = "col-md -3"  >
				<label for="ucarModel" class="col-lg-3 col-md-offset-1 control-label">차 모델</label>
			</div>
			<div class = "col-md -3">
			 	${requestScope.info.carModelInfoVO.carModel }
				</div>
				<br>
			</div> 
			<div class="col-md-12">	
			<div class = "col-md -3"  >
				<label for="rentalFee" class="col-lg-3 col-md-offset-1 control-label">대여 요금</label>
			</div>
			<div class = "col-md -3">
			 	${requestScope.info.carModelInfoVO.rentalFee }
				</div>
				<br>
			</div> 
				<div class="col-md-12">	
			<div class = "col-md -3"  >
				<label for="rentalFee" class="col-lg-3 col-md-offset-1 control-label">주행 요금</label>
			</div>
			<div class = "col-md -3">
			 	${requestScope.info.carModelInfoVO.drivingFee }
				</div>
				<br>
			</div>
		
			<div class="col-md-12">	
			<div class = "col-md -3"  >
				<label for="oilType" class="col-lg-3 col-md-offset-1 control-label">오일타입</label>
			</div>
			<div class = "col-md -3">
			 	${requestScope.info.carModelInfoVO.oilType }
				</div>
				<br>
			</div>
		</div>
</div>
	