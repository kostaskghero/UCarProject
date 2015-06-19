<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <hr>
<div class="section"> 
	<div class="container"> 
		<div class="row"> 
			<!-- best consumer review -->
			<div class="col-md-4" align="center">
			<fieldset>
			<legend align="center">이용후기</legend>
			</fieldset>
						이용후기글
			</div>
			<!-- UCar garage -->
			<div class="col-md-4" align="center">
			<fieldset>
			<legend align="center">유카차고</legend>
			</fieldset>
			<img src ="${initParam.root }img/ucargarage.png"  width="300" height="200" ><br>
			<h5>다양한 차들을 직접 선택하여 드라이빙 하세요!</h5>
			</div>
			<!-- find car form -->
		<div class="col-md-4"> 
			  <fieldset>
    	<legend align="center">실시간 예약</legend>
          <label for="travelSelect" class="col-lg-3 control-label">여정</label>
          <div class="col-lg-6">
          	<form method="post"  id = "travel">
		       	<input type = "radio" name = "travelType" value = "round">왕복 &nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "travelType" value = "oneway">편도<br>
			</form>
			</div>
			<br><br>
			<label for="travelDateSelect" class="col-lg-3 control-label">대여일</label>
			<div class="col-lg-4">
				<select class="form-control" id="startDateSelect">
		        	<option value="">시작일 설정</option>
		        	<option value="payment">시작일</option>
		        </select>
		    </div>
		    <div class="col-lg-4">
		        <select class="form-control" id="startDaysSelect">
		        	<option value="">시간</option>
		        	<option value="payment">시간!</option>
		        </select>
		     </div>
		     <br><br><br>
			<label for="travelDateSelect" class="col-lg-3 control-label">반납일</label>
			<div class="col-lg-4">
				<select class="form-control" id="endDateSelect">
		        	<option value="">밥납일 설정</option>
		        	<option value="payment">반납일</option>
		        </select>
		    </div>
		    <div class="col-lg-4">
		        <select class="form-control" id="endDaysSelect">
		        	<option value="">시간</option>
		        	<option value="payment">시간!</option>
		        </select>
		     </div>
		     <br><br><br>
		     <label for="location" class="col-lg-3 control-label">지역</label>
		     <div class="col-lg-8">
		     <input type="text" class="form-control" id="location" name="location" >
		     </div>
		     <br><br><br>
		     <label for="carModel" class="col-lg-3 control-label">차종</label>
		     <div class="col-lg-8">
		     <input type="text" class="form-control" id="carModels" name="carModels"  placeholder="전체차종">
		     </div>
		     <br><br><br>
		     <div class="col-lg-7 col-lg-offset-7"  >
			 		<button type="button" class="btn btn-primary" id ="searchCar">UCar 찾기</button>
			 </div> 
			 </fieldset>	  
			 </div>
		</div>
	</div>
</div>