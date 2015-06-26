<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${requestScope.list }" var="carVO">

		<div class="col-lg-6 col-lg-4">
			<div class="thumbnail">
				<img src="${carVO.carPhoto}" alt="..." width="242"
					height="200">
				<div class="caption">
					<h3>${carVO.carModel}</h3>
					<p>자동차 타입 : ${carVO.carType}</p>
					<p>대여요금 : ${carVO.rentalFee} 원/10분</p>
					<p>주행요금 : ${carVO.drivingFee} 원/km</p>
					<p>오일타입 : ${carVO.oilType}</p>
		 		<p>
					<a href="admin_carModelUpdateForm.do" class="btn btn-default" role="button">수정하기</a>
						<a href="admin_carModelDetailInfo.do?carModel=${carVO.carModel}" class="btn btn-default" role="button">상세보기</a>
				</p> 
			</div>
			</div>
		</div>

</c:forEach>