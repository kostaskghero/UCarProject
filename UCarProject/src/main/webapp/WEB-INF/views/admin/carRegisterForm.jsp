<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var checkResultNick="";
	var checkZone="fail";
	$("#ucarZoneConfirm").click(function(){
		$.ajax({
			type:"POST",
			url:"uCarZoneCheck.do",
			data:"uCarZoneName="+$("#uCarZoneName").val().trim(),
			success:function(data){					
				if(data=="fail"){
				checkZone="fail";	
				alert("유카존을 확인해주세요.");
				$("#uCarZoneName").val("");
				return false;
				}else if(data=="ok"){						
					checkZone="ok";
					alert("존재하는 유카존 입니다.")
				}					
			}//callback			
		});//ajax
	})
	$("#carNickName").keyup(function(){
		var nick=$("#carNickName").val().trim();
		if(nick.length<2 || nick.length>10){
			$("#nickCheck").html("아이디는 2자이상 10자 이하여야 함!");
			checkResultNick="";
			return;
		}
		$.ajax({
			type:"POST",
			url:"nickNamecheck.do",
			data:"carNickName="+nick,
			success:function(data){					
				if(data=="fail"){
				$("#nickCheck").html("중복된 아이디 입니다.");
					checkResultNick="";
				}else{						
					$("#nickCheck").html("사용가능한 아이디 입니다.");		
					checkResultNick=nick;
				}					
			}//callback			
		});//ajax
	});
	$("#registerCarBtn").click(function(){
	
		if($("#carType").val()==""){
			alert("차종을 선택하세요");
			return false;
		}
		if($("#carModel").val()==""){
			alert("차량 모델을 선택하세요");
			return false;
		}
		if($("#carNickName").val()==""){
			alert("닉네임을 입력하세요");
			return false;
		}
		if($("#uCarZoneName").val()==""){
			alert("유카존을 입력하세요");
			return false;
		}
		if(checkResultNick==""){
			alert("닉네임을 확인하세요");
			return false;
		}

		$("#carRegisterForm").submit();	
	});
	$("#carType").change(function(){	
		$.ajax({
			type:"POST",
			url:"getCarModelByType.do",
			dataType:"json",  
			data:"carType="+$(this).val(),
			success:function(list){ 
				
				var selectModel= "<select class='form-control' id='carModel' name='carModel'>";
				selectModel+="<option value=''>------</option>";
				$.each(list,function(i,model){
					selectModel+="<option value='"+model+"'>"+model+"</option>";
				});
				selectModel+="</select>";
				$("#selectModel").html(selectModel);
				}
		});//ajax
	});
	$(function(){
		$("#uCarZoneName").autocomplete({
			source:function(request,response){
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
});

</script>
<form class="form-horizontal" method="post"
	action="${initParam.root}admin_carRegister.do" id="carRegisterForm">
	<fieldset>
		<legend>차량 등록 </legend>
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
			<label for="inputCarModel" class="col-lg-2 control-label">모델</label>
			<div class="col-lg-2" id="selectModel"  >
				<select class="form-control" id="carModel" name="carModel">
					<option value="">------</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="inputUCarZone" class="col-lg-2 control-label">유카존</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="uCarZoneName"
					name="uCarZoneName" placeholder="유카존 검색">
			</div>
					<button type="button" class="btn btn-default	" id="ucarZoneConfirm">확인</button>
		</div>

		<div class="form-group">
			<label for="inputNickName" class="col-lg-2 control-label">닉네임</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="carNickName"
					name="carNickName" placeholder="자동차 닉네임">
			</div>
			<span id="nickCheck"> </span>
		</div>

		<div class="form-group">
			<div class="col-lg-10 col-lg-offset-2">
				<button type="reset" class="btn btn-default">Cancel</button>
				<button type="button" class="btn btn-primary" id="registerCarBtn">차량등록</button>
			</div>
		</div>
	</fieldset>
</form>
