<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<legend class="col-lg-10"><h2>회원 상세 정보 </h2></legend><br>

<html>
<body>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
			<h4>회원정보</h4>
				<div class="col-lg-8">
					<div id="searchTable">
						<table class="table">
							<thead>
								<tr>
									<th>아이디</th>
									<th>&nbsp;이름&nbsp;</th>
									<th>포인트</th>
									<th>이메일</th>
									<th>핸드폰</th>



								</tr>
							</thead>
							<tbody>
								<tr id="carInfo">
									<td>${vo.get(0).memberId}</td>
									<td>${vo.get(0).memberName}</td>
									<td>${vo.get(0).memberPoint}</td>
									<td>${vo.get(0).memberEmail}</td>
									<td>${vo.get(0).memberPhone}</td>


								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

<h4>면허 정보 </h4>
	<br>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div id="searchTable">
						<table class="table">
							<thead>
								<tr>
									<th>면허번호</th>
									<th>면허종류</th>
									<th>갱신기간</th>
									<th>발급일</th>
									<th>성별</th>
								</tr>
							</thead>
							<tbody>
								<tr id="carInfo">
									<td>${vo.get(0).drivingLicenseVO.licenseNo}</td>
									<td>${vo.get(0).drivingLicenseVO.licenseType}</td>
									<td>${vo.get(0).drivingLicenseVO.licenseRenewalTerm}</td>
									<td>${vo.get(0).drivingLicenseVO.licenseIssueDate}</td>
									<td>${vo.get(0).drivingLicenseVO.gender}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${vo.size()>=1 }">
			<c:forEach items="${requestScope.vo }" var="vo" varStatus="i">
			<h4>카드정보${i.index+1} </h4>
				<br>
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-lg-8"></div>
						</div>
					</div>
				</div>
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-lg-8">
								<div id="searchTable">
									<table class="table">
										<thead>
											<tr>
												<th>카드번호</th>
												<th>카드종류</th>
												<th>유효기간</th>
												<th>생년월일</th>

											</tr>
										</thead>
										<tbody>
											<tr id="carInfo">
												<td>${vo.cardVO.cardNo}</td>
												<td>${vo.cardVO.cardType}</td>
												<td>${vo.cardVO.cardExpirationDate}</td>
												<td>${vo.cardVO.cardBirth}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>

	</c:choose>
	
</body>
</html>
