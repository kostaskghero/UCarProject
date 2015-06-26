<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		var checkResultName="";
		$("#registerCarModelBtn").click(function() {
			if(checkResultName==""){
				alert("차량 모델명을 확인하세요");
				return false;
			}
			if($("#carType").val()==""){
				alert("차종을 선택하세요");
				return false;
			}
			if($("#rentalFee").val()==""){
				alert("대여요금을 입력하세요");
				return false;
			}
			if( isNaN($("#rentalFee").val()) ){
				alert("대여요금을 숫자로 입력하세요");
				return false;
			}
			if($("#drivingFee").val()==""){
				alert("주행요금을 입력하세요");
				return false;
			}
			if( isNaN($("#drivingFee").val()) ){
				alert("주행요금을 숫자로 입력하세요");
				return false;
			}
			if($("#carModelRegisterForm :radio[name=oilType]:checked").length==0){
				alert("기름 종류를 선택하세요");
				return false;
			}
			if($("#file").val()==""){
				alert("차량 사진을 첨부하세요");
				return false;
			}
			
			$("#carModelRegisterForm").submit();
		});
 		$(":checkbox[name=allCheck]").change(function() {
			var allFlag = $(this).prop("checked");
				$(":checkbox[name=optionInfo]").prop("checked", allFlag);
		}); 
 		$("#carModel").keyup(function(){
 			var modelName=$("#carModel").val().trim();
 			$("#nameCheck").html("");
 			$.ajax({
 				type:"POST",
 				url:"modelNamecheck.do",
 				data:"modelName="+modelName,
 				success:function(data){					
 					if(data=="fail"){
 					$("#nameCheck").html("중복된 모델명 입니다.");
 						checkResultName="";
 					}else{						
 						$("#nameCheck").html("사용가능한 모델명 입니다.");		
 						checkResultName=modelName;
 					}					
 				}//callback			
 			});//ajax
 		});
	});
</script>
<form class="form-horizontal" method="post"
	action="${initParam.root}admin_carModelRegister.do"
	id="carModelRegisterForm"  enctype="multipart/form-data">
	<fieldset>
		<legend>차량 모델 등록 </legend>
		<div class="form-group">
			<label for="inputCarType" class="col-lg-2 control-label">차종</label>
			<div class="col-lg-2">
				<select class="form-control" id="carType" name="carType">
					<option value="">------</option>
					<c:forEach items="${requestScope.carTypeList }" var="data">
						<option value="${data }">${data }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="inputCarModel" class="col-lg-2 control-label">모델명</label>
			<div class="col-lg-2" >
				<input type="text" class="form-control" id="carModel"
					name="carModel" placeholder="차량 모델명 입력">
			</div>
			<span id="nameCheck"></span>
		</div>
		<div class="form-group">
			<label for="inputCarModel" class="col-lg-2 control-label">기름
				타입</label>
			<div class="col-lg-2" id="oilType">
				<div id="radio">
					<label class="radio-inline"> <input type="radio"
						name="oilType" id="oilType" value="휘발유"> 휘발유
					</label> <label class="radio-inline"> <input type="radio"
						name="oilType" id="oilType" value="경유"> 경유
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="inputUCarZone" class="col-lg-2 control-label">대여요금</label>
			<div class="col-lg-2">
				<input type="text" class="form-control" id="rentalFee"
					name="rentalFee" placeholder="10분/원">
			</div>
		</div>
		<div class="form-group">
			<label for="inputDrivingFee" class="col-lg-2 control-label">주행요금</label>
			<div class="col-lg-2	">
				<input type="text" class="form-control" id="drivingFee"
					name="drivingFee" placeholder="KM/원">
			</div>
		</div>

		<div class="form-group">
			<label for="inputCarOption" class="col-lg-2 control-label">옵션
				선택</label>
			<div class="row">
				<input type="checkbox" name="allCheck"> 전체선택&nbsp; <input
					type="checkbox" name="optionInfo" value="에어백"> 에어백&nbsp; <input
					type="checkbox" name="optionInfo" value="후방감지센서"> 후방감지센서 &nbsp;<input
					type="checkbox" name=optionInfo value="블랙박스">블랙박스&nbsp;<input
					type="checkbox" name="optionInfo" value="네비게이션"> 네비게이션&nbsp;

			</div>
			<br>
			<div class="row">
				<label for="inputCarOption" class="col-lg-2 control-label">&nbsp;</label>
				<input type="checkbox" name="optionInfo" value="열선시트"> 열선시트 &nbsp;<input
					type="checkbox" name="optionInfo" value="AUX"> AUX&nbsp; <input
					type="checkbox" name="optionInfo" value="USB">USB&nbsp; <input
					type="checkbox" name="optionInfo" value="CD플레이어">CD플레이어&nbsp; <input
					type="checkbox" name="optionInfo" value="블루투스">블루투스&nbsp;

			</div>
		</div>
			<div class="form-group">
			<label for="inputFile" class="col-lg-2 control-label">차량 사진</label>
			<div class="col-lg-5">
				<input type="file" class="form-control"  name="file" id="file">
			</div>
		</div>

		<div class="form-group">
			<br>
			<div class="col-lg-10 col-lg-offset-2">
				<button type="reset" class="btn btn-default">취소</button>
				<button type="button" class="btn btn-primary"
					id="registerCarModelBtn">모델등록</button>
			</div>
		</div>
	</fieldset>
</form>
