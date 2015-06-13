<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${info!=null }">
		<div class="container">
			<div class="col-md-8">
				<table class="table">
					<tbody>
						<tr>
							<td>면허종류</td>
							<td>${info.drivingLicenseVO.licenseType }</td>
						</tr>
						<tr>
							<td>면허번호</td>
							<td>${info.drivingLicenseVO.licenseNo }</td>
						</tr>
						<tr>
							<td>갱신기간 만료일</td>
							<td>${info.drivingLicenseVO.licenseRenewalTerm }</td>
						</tr>
						<tr>
							<td>면허발급일</td>
							<td>${info.drivingLicenseVO.licenseIssueDate }</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>${info.drivingLicenseVO.gender }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<script>
			var flag=confirm("등록된 면허정보가 없습니다. 등록하시겠습니까?");
			if(flag){
				location.href="${initParam.root}auth_member_registerLicense_form.do";
			} else{
				location.href="${initParam.root}auth_member_myPage.do";
			}
		</script>
	</c:otherwise>
</c:choose>