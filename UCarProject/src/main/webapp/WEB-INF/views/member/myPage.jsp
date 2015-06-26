<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>마이페이지</h4>
<hr>
<div class="container">
	<div class="col-md-8">
		<table class="table">
			<tbody>
				<tr>
					<td>ID</td>
					<td>${memberInfo.memberId }</td>
				</tr>
				<tr>
					<td>NAME</td>
					<td>${memberInfo.memberName }</td>
				</tr>
				<tr>
					<td>E-MAIL</td>
					<td>${memberInfo.memberEmail }</td>
				</tr>
				<tr>
					<td>PHONE</td>
					<td>${memberInfo.memberPhone }</td>
				</tr>
				<tr>
					<td>POINT</td>
					<td>${memberInfo.memberPoint }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="col-sm-offset-2 col-sm-10">
		<a href="${initParam.root}auth_member_updateMember_form.do"><button type="button" class="btn btn-default">UpdateInfo</button></a>
		<a href="${initParam.root}auth_member_lisenseInfo_view.do?memberId=${sessionScope.loginInfo.memberId }"><button type="button" class="btn btn-default">DrivingLicense</button></a>
		<a href="${initParam.root}auth_member_cardInfo_view.do?memberId=${sessionScope.loginInfo.memberId }"><button type="button" class="btn btn-default">Card</button></a>
	</div>
</div>
