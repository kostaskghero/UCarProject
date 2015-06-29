<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {

		$("#uCarZoneUpdateBtn").click(function() {
			if ($("#inputUCarZoneAddress").val() == "") {
				alert("주소를 입력하세요");
				return false;
			}
			$("#uCarZoneUpdateForm").submit();
		});
	});
</script>
<form class="form-horizontal"
	action="${initParam.root }admin_uCarZoneUpdate.do"
	id="uCarZoneUpdateForm" method="post">
	<fieldset>
		<legend>UCar Zone 수정 </legend>
		<div class="form-group">
			<label for="inputUCarZoneName" class="col-lg-2 control-label">이름</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="uCarZoneName"
					name="uCarZoneName" value="${vo.uCarZoneName}" readonly="readonly">
			</div>
			<span id="nameCheck"> </span>
		</div>
		<div class="form-group">
			<label for="inputuCarZoneAddress" class="col-lg-2 control-label">주소</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" id="uCarZoneAddress"
					name="uCarZoneAddress" value="${vo.uCarZoneAddress}">
			</div>
		</div>
				<div class="form-group">
			<label for="inputLatitude" class="col-lg-2 control-label">위도</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="latitude"
					name="latitude" value="${vo.latitude}">
			</div>
		</div>
		<div class="form-group">
			<label for="inputLongitude" class="col-lg-2 control-label">경도</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="longitude"
					name="longitude" value="${vo.longitude}">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-lg-10 col-lg-offset-2">
				<button type="button" class="btn btn-primary" id="uCarZoneUpdateBtn">수정</button>
			</div>
		</div>
	</fieldset>
</form>