<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var flag=confirm("간편가입이 완료되었습니다. 운전면허/결제정보를 등록하시겠습니까?");
	if(flag){
		location.href="${initParam.root}auth_member_registerLicense_form.do";
	}
</script>