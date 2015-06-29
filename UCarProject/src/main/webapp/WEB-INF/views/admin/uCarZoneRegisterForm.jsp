<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		var checkResultName = "";

		$("#uCarZoneName").keyup(function() {
			var name = $("#uCarZoneName").val().trim();
			if (name.length < 2) {
				$("#nameCheck").html("아이디는 2자이상 이여야 합니다.");
				checkResultNick = "";
				return;
			}
			$.ajax({
				type : "POST",
				url : "uCarZoneNameCheck.do",
				data : "uCarZoneName=" + name,
				success : function(data) {
					if (data == "fail") {
						$("#nameCheck").html("중복된 이름 입니다.");
						checkResultName = "";
					} else {
						$("#nameCheck").html("사용가능한 이름 입니다.");
						checkResultName = name;
					}
				}//callback			
			});//ajax
		});
		$("#uCarZoneRegisterBtn").click(function() {
			if ($("#inputUCarZoneName").val() == "") {
				alert("이름을 입력하세요");
				return false;
			}
			if ($("#inputUCarZoneAddress").val() == "") {
				alert("주소를 입력하세요");
				return false;
			}
			if (checkResultName == "") {
				alert("유카존 이름을 확인하세요");
				return false;
			}
			if ($("#longitude").val() == "") {
				alert("경도를 입력하세요");
				return false;
			}
			if ($("#latitude").val() == "") {
				alert("위도를 입력하세요");
				return false;
			}
			$("#uCarZoneRegisterForm").submit();
		});
	});
</script>
<form class="form-horizontal"
	action="${initParam.root }admin_uCarZoneRegister.do"
	id="uCarZoneRegisterForm" method="post">
	<fieldset>
		<legend>UCar Zone 등록 </legend>
		<div class="form-group">
			<label for="inputUCarZoneName" class="col-lg-2 control-label">이름</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="uCarZoneName"
					name="uCarZoneName" placeholder="유카존 이름">
			</div>
			<span id="nameCheck"> </span>
		</div>
		<div class="form-group">
			<label for="inputuCarZoneAddress" class="col-lg-2 control-label">주소</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" id="uCarZoneAddress"
					name="uCarZoneAddress" placeholder="유카존 주소">
			</div>
		</div>
		<div class="form-group">
			<label for="inputLatitude" class="col-lg-2 control-label">위도</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="latitude"
					name="latitude" placeholder="유카존 위도">
			</div>
		</div>
		<div class="form-group">
			<label for="inputLongitude" class="col-lg-2 control-label">경도</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="longitude"
					name="longitude" placeholder="유카존 경도">
			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-10 col-lg-offset-2">
				<button type="button" class="btn btn-primary"
					id="uCarZoneRegisterBtn">등록</button>
			</div>
		</div>
	</fieldset>
</form>