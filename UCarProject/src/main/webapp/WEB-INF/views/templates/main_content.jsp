<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 자동완성 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- 데이트 타임피커 -->
<link rel="stylesheet" href="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.css"> 
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> -->
<script src="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
		$("#rentalDate").datetimepicker({
			 	minDate: 0, 
			 	ang:'ko',
			    format:'Y/m/d H:i',
			    step: 10 //시간 설정을 10분단위로 나눔
		    });
		
		$("#returnDate").datetimepicker({
		 	minDate: 0, 
		 	ang:'ko',
		    format:'Y/m/d H:i',
		    step: 10 //시간 설정을 10분단위로 나눔
	    });
});
/* 자동완성 */
$(function(){
	$("#uCarZoneName1").autocomplete({
		source:function(request,response){
			//alert(request.term);// 검색어 입력 정보가 출력 
			$.ajax({
				url:"searchUCarZone.do",
				dataType:"json",
				data:"term="+request.term,
				success:function(data){
					response(data);
				}
			});//ajax
		}//source
	});//autocomplete
});//ready
</script>
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
			<a href = "${initParam.root }sharing_cargarage.do"><img src ="${initParam.root }img/ucargarage.png"  width="300" height="200" ><br>
			<h5>다양한 차들을 직접 선택하여 드라이빙 하세요!</h5></a>
			</div>
			<!-- find car form -->
		<div class="col-md-4">
			<form class="form-horizontal" role="form" id="searchForm" action = "#">
				<div class="form-group">
					<div class="col-sm-2">
						<label for="sharingType" class="control-label"></label>
					</div>
					<div class ="col-md-5 col-md-offset-2">
		       				<input type = "radio" name = "travelType" value = "round">왕복 &nbsp;&nbsp;&nbsp;
			 		 </div>
			  <br><br>
				<div class="col-sm-3 col-sm-offset-1">
					<label for="uCarZoneName" class="control-label">지역</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="uCarZoneName1" name="uCarZoneName1" placeholder="지역">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-1" >
					<label for="rentalDate" class="control-label">대여일</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="rentalDate" name="rentalDate" placeholder="YYYY/MM/DD HH:MM">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-1">
					<label for="returnDate" class="control-label">반납일</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="returnDate" name="returnDate" placeholder="YYYY/MM/DD HH:MM">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-1">
					<label for="carType" class="control-label">차종</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="carModel" name="carModel">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-5">
					<button type="button" class="btn btn-default" id="carSearchBtn">예약하러가기</button>
				</div>
			</div>
			</form> 
	      </div>
		</div>
	</div>
</div>