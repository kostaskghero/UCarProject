<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h2>회원정보</h2>
<br>
<c:choose>
	<c:when test="${vo.size()==1 }">

	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>


<html>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-7"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div id="searchTable">
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>&nbsp;Name&nbsp;</th>
									<th>Point</th>
									<th>Email</th>
									<th>Phone</th>



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

	<h2>면허정보</h2>
	<br>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-7"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div id="searchTable">
						<table class="table">
							<thead>
								<tr>
									<th>LicenseNo</th>
									<th>LicenseType</th>
									<th>licenseRenewalTerm</th>
									<th>licenseIssueDate</th>
									<th>Gender</th>
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
				<h2>카드정보${i.index+1}</h2>
				<br>
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-7"></div>
						</div>
					</div>
				</div>
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-7">
								<div id="searchTable">
									<table class="table">
										<thead>
											<tr>
												<th>CardNo</th>
												<th>CardType</th>
												<th>CardExpirationDate</th>
												<th>Birth</th>

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
