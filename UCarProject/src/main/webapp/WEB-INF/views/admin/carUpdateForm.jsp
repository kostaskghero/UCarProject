<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var checkResultNick="${requestScope.info.carNickName }";
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
				return false;
				}else if(data=="ok"){						
					checkZone="ok";
					alert("존재하는 유카존 입니다.")
				}					
			}//callback			
		});//ajax
	})
	$("#updateCarBtn").click(function(){
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
	 	 if(checkZone=="fail"){
	 		alert("유카존을 확인하세요. ");
	 		return false;
	 		}
		$("#carUpdateForm").submit();	
	});
	$(function(){
		$("#uCarZoneName").autocomplete({
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
				
				}else if(nick=="${requestScope.info.carNickName }"){
					checkResultNick=nick;
					alert("맞음");
					$("#nickCheck").html("원래아이디es");		
				}else{						
					$("#nickCheck").html("사용가능한 아이디 입니다.");		
					checkResultNick=nick;
					
				}					
			}//callback			
		});//ajax
	});
});

</script>
<form class="form-horizontal" method="post"
	action="${initParam.root}admin_carUpdate.do" id="carUpdateForm">
	<fieldset>
		<legend>차 정보 수정</legend>
	<div class="form-group">
	<input type="hidden" name="carNo" id="carNo" value="${requestScope.info.carNo }">
		</div>
	<div class="form-group">
			<label for="inputCarModel" class="col-lg-2 control-label">모델</label>
				<div class="col-lg-4">
				<input type="text" class="form-control" id="carModel"
					name="carModel" value="${requestScope.info.carModelInfoVO.carModel}" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="inputUCarZone" class="col-lg-2 control-label">유카존</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="uCarZoneName"
					name="uCarZoneName" value="${requestScope.info.uCarZoneVO.uCarZoneName}">
			</div>
			<button type="button" class="btn btn-default	" id="ucarZoneConfirm">확인</button>
		</div>

		<div class="form-group">
			<label for="inputNickName" class="col-lg-2 control-label">닉네임</label>
			<div class="col-lg-4">
				<input type="text" class="form-control" id="carNickName"
					name="carNickName" value="${requestScope.info.carNickName}">
			</div>
			<span id="nickCheck"> </span>
		</div>

		<div class="form-group">
			<div class="col-lg-10 col-lg-offset-2">
				<button type="reset" class="btn btn-default">Cancel</button>
				<button type="button" class="btn btn-primary" id="updateCarBtn">수정</button>
			</div>
		</div>
	</fieldset>
</form>
