<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 자동완성 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- 데이터 타임피커 -->
<link rel="stylesheet" href="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.css">
<script src="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.js"></script> 
<style>
	#searchForm {

		font-size:medium;
		background: #f2f2f2; /* Old browsers */
		width: 400px;
		position: relative;
		margin: 10% auto;
		padding: 5px 20px 13px 20px;
		border-radius: 10px;
	}
</style> 
<style type="text/css">   
	html { height: 100% }   
	body { height: 100%; margin: 0px; padding: 0px }   
	#map_canvas { } 
</style> 
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#carSearchBtn").click(function(){
			if($("#ucarZoneNames").val()==""){
				alert("이용할 지역이나 유카존 입력하세요!");
				return false;
			} else if($("#rentalDate").val()=="" || $("#returnDate").val()==""){
				alert("이용할 날짜와 시간 선택하세요!");
				return false;
			} else {
				$("#carSearchResult").html("");
				$.ajax({
					type:"post",
					url:"${initParam.root}search_searchCar.do",
					data:$("#searchForm").serialize(),
					success:function(data){
						if(data.length==0){
							alert("이용할 수 있는 차량이 없습니다.");
							$("#ucarZoneNames").val("").focus();
						} else{
							var tableInfo="<table class='table table-hover' id='carTable'>";
							tableInfo+="<thead><tr><td class='info'>";
							tableInfo+="<div class='col-md-1'><p class='text-center'><strong>유카존</strong></p></div>";
							tableInfo+="<div class='col-md-2'></div>";
							tableInfo+="<div class='col-md-6'><p class='text-center'><strong>차량정보</strong></p></div>";
							tableInfo+="<div class='col-md-1'><p class='text-center'><strong>대여요금</strong></p></div>";
							tableInfo+="<div class='col-md-1'><p class='text-center'><strong>주행요금</strong></p></div>";
							tableInfo+="<div class='col-md-1'> </div>";
							tableInfo+="</td></tr></thead><tbody>";
							$.each(data, function(index, carList){
								tableInfo+="<tr><td><div class='row'>";
								tableInfo+="<div class='col-md-1'><p class='text-center'>"+carList.carVO.uCarZoneVO.uCarZoneName+"</p></div>";
								tableInfo+="<div class='col-md-2'><img src='"+carList.carVO.carModelInfoVO.carPhoto+"' alt='...' width='150' height='150'></div>";
								tableInfo+="<div class='col-md-6'>";
								tableInfo+="<div class='row'>";
								tableInfo+="<div class='col-md-12' style='height: 50px'>";
								tableInfo+=carList.carVO.carModelInfoVO.carModel+"  <strong>"+carList.carVO.carNickName+"</strong>";
								tableInfo+="<p class='pull-right'>"+carList.carVO.carModelInfoVO.oilType+"  </p>";
								tableInfo+="</div></div>";
								tableInfo+="<div class='row'>";
								tableInfo+="<div class='col-md-12' style='height: 50px'>";
								tableInfo+="<strong>옵션</strong>";
								$.each(carList.carVO.carModelInfoVO.carOption, function(index, carOption){
									tableInfo+=" / "+carOption;
								});
								tableInfo+="</div></div>";
								tableInfo+="<div class='row'>";
								tableInfo+="<div class='col-md-12' style='height: 50px'>";
								tableInfo+=carList.rentalDate+" ~ "+carList.returnDate;
								tableInfo+="</div></div></div>";
								tableInfo+="<div class='col-md-1 text-center'><p class='text-center'>"+carList.rentalPrice+" 원</p></div>";
								tableInfo+="<div class='col-md-1 text-center'><p class='text-center'>"+carList.carVO.carModelInfoVO.drivingFee+" 원<br>(1km)</p></div>";
								tableInfo+="<div class='col-md-1 text-center'>";
								if(carList.carVO.available){	// true 이면 예약버튼 활성화 false 이면 예약버튼 비활성화
									tableInfo+="<form method='post' action='${initParam.root}auth_reservation_reservationCar.do' id='"+carList.carVO.carNo+"Form'>";
									tableInfo+="<input type='hidden' name='rentalDate' value='"+carList.rentalDate+"'>";
									tableInfo+="<input type='hidden' name='returnDate' value='"+carList.returnDate+"'>";
									tableInfo+="<input type='hidden' name='memberId' value='${sessionScope.loginInfo.memberId}'>";
									tableInfo+="<input type='hidden' name='carNo' value='"+carList.carVO.carNo+"'>";
									tableInfo+="<input type='hidden' name='rentalPrice' value='"+carList.rentalPrice+"'>";
									tableInfo+="<input type='hidden' name='rentalUcarZoneName' value='"+carList.carVO.uCarZoneVO.uCarZoneName+"'>";
									tableInfo+="<button type='button' class='btn btn-default btn-sm' id='reserveBtn' value='"+carList.carVO.carNo+"'>Reserve</button></form>";
								} else{
									tableInfo+="<button type='button' class='btn btn-default disabled btn-sm'>Reserve</button>";
								}
								tableInfo+="</div></div></td></tr>";
							});
							tableInfo+="</tbody></table>";
							$("#carSearchResultView").html(tableInfo);
						}
					}
				});
			}
		});
		$("#carSearchResultView").on("click","#reserveBtn",function(){
			var formName="#"+$(this).val()+"Form";
			$.ajax({
				type:"post",
				url:"${initParam.root}auth_reservation_checkMemberReservation.do",
				data:$(formName).serialize(),
				success:function(data){
					if(data=="noDrivingLisence"){
						var flag=confirm("운전면허 정보가 등록되지 않았습니다. 운전면허 등록을 하시겠습니까?");
						if(flag){
							location.href="${initParam.root}auth_member_registerLicense_form.do";
						}
					} else if(data=="ok"){
						var flag=confirm("예약하시겠습니까?");
						if(flag)
							$(formName).submit();
					} else if(data.rentalDate!=null){
						var flag=confirm(data.rentalDate+" ~ "+data.returnDate+" 에 예약이 존재합니다. 예약내역을 확인하시겠습니까?");
						if(flag){
							location.href="${initParam.root}";
						}
					} else{
						location.href="${initParam.root}member_login_form.do";
					}
				}
			});
			
		});
		$("#rentalDate").datetimepicker({
			 	minDate: 0, 
			 	ang:'ko',
			    format:'Y/m/d H:i',
			    step: 10 //시간 설정을 10분단위로 나눔
		    });
		
		$("#returnDate").datetimepicker({
		 	minDate: 0, 
		 	ang:'ko',
		    format:'Y/m/d H:i',
		    step: 10 //시간 설정을 10분단위로 나눔
	    }); 
	});
	$(function(){
		$("#uCarZoneNames").autocomplete({
			source:function(request,response){ 
				$.ajax({
					url:"search_searchUCarZone.do",
					dataType:"json",
					data:"term="+request.term,
					success:function(data){
						response(data);
					}
				});//ajax
			}//source
		});//autocomplete
	});//read
</script>
<c:forEach items="${ucarZoneList }" var="zoneInfo" varStatus="i">
	<input type="hidden" value="${zoneInfo.latitude}" id="${i.count}UCarLati">
	<input type="hidden" value="${zoneInfo.longitude}" id="${i.count}UCarLong">
	<input type="hidden" value="${zoneInfo.uCarZoneName}" id="${i.count}UCarName">
</c:forEach>
<div class="section">
	<div class="container">
		<div class="row">
<<<<<<< HEAD
	  	<div class="col-md-5">
			<form class="form-horizontal" role="form" id="searchForm">
				<div class="form-group">
			  <br><br>
				<div class="col-sm-3 col-sm-offset-2">
					<label for="uCarZoneName" class="control-label">지역</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="uCarZoneNames" name="uCarZoneName" placeholder="지역">
				</div>
=======
		  	<div class="col-md-5">
				<form class="form-horizontal" id="searchForm">
					<fieldset>
						<legend>유카찾기</legend>
					</fieldset>	  		
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="uCarZoneName" class="control-label">지역</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="uCarZoneNames" name="uCarZoneName" placeholder="지역" value="${realtimeSearchResult[0].carVO.uCarZoneVO.uCarZoneName }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2" >
							<label for="rentalDate" class="control-label">대여일</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="rentalDate" name="rentalDate" placeholder="YYYY/MM/DD HH:MM" value="${realtimeSearchResult[0].rentalDate }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="returnDate" class="control-label">반납일</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="returnDate" name="returnDate" placeholder="YYYY/MM/DD HH:MM" value="${realtimeSearchResult[0].returnDate }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carType" class="control-label">차종</label>
						</div>
						<div class="col-sm-5">
							<select id="carModel" name="carModel" class="form-control">
								<option value="all">전체차종</option>
								<c:forEach items="${carModelList }" var="carModel">
									<option value="${carModel }">${carModel }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-7 col-sm-7">
							<button type="button" class="btn btn-default" id="carSearchBtn">검색</button>
						</div>
					</div>
				</form>
>>>>>>> branch 'master' of https://github.com/kostaskghero/UCarProject.git
			</div>
			<div class="col-md-4">
				<div id="map_canvas" style="width:730px;height:500px;"></div>
			</div>
		</div>
<br><br>
		<!-- 검색결과 -->
		<div class="col-md-12" id="carSearchResultView">
			<c:if test="${fn:length(realtimeSearchResult)!=0 }">
				<table class="table table-hover" id="carTable">
					<thead>
						<tr>
							<td class="info">
								<div class="col-md-1"><p class="text-center"><strong>유카존</strong></p></div>
								<div class="col-md-2"></div>
								<div class="col-md-6"><p class="text-center"><strong>차량정보</strong></p></div>
								<div class="col-md-1"><p class="text-center"><strong>대여요금</strong></p></div>
								<div class="col-md-1"><p class="text-center"><strong>주행요금</strong></p></div>
								<div class="col-md-1"></div>
							</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${realtimeSearchResult }" var="searchResult">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-1"><p class="text-center">${searchResult.carVO.uCarZoneVO.uCarZoneName }</p></div>
										<div class="col-md-2"><img src="${searchResult.carVO.carModelInfoVO.carPhoto}" alt="..." width="150" height="150"></div>
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-12" style="height: 50px">
													${searchResult.carVO.carModelInfoVO.carModel }&nbsp;&nbsp;<strong>${searchResult.carVO.carNickName }</strong>
													<p class="pull-right">${searchResult.carVO.carModelInfoVO.oilType }&nbsp;&nbsp;</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12" style="height: 50px">
													<strong>옵션</strong> 
													<c:forEach items="${searchResult.carVO.carModelInfoVO.carOption }" var="carOption">
														/ ${carOption }&nbsp;
													</c:forEach>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12" style="height: 50px">
													${searchResult.rentalDate } ~ ${searchResult.returnDate }
												</div>
											</div>
										</div>
										<div class="col-md-1 text-center"><p class="text-center">${searchResult.rentalPrice } 원</p></div>
										<div class="col-md-1 text-center"><p class="text-center">${searchResult.carVO.carModelInfoVO.drivingFee } 원<br>(1km)</p></div>
										<div class="col-md-1 text-center">
											<c:choose>
												<c:when test="${searchResult.carVO.available }">
													<form action="${initParam.root}auth_reservation_reservationCar.do" method="post" id="${searchResult.carVO.carNo }Form">
														<input type="hidden" name="rentalDate" value="${searchResult.rentalDate }">
														<input type="hidden" name="returnDate" value="${searchResult.returnDate }">
														<input type="hidden" name="memberId" value="${sessionScope.loginInfo.memberId}">
														<input type="hidden" name="carNo" value="${searchResult.carVO.carNo }">
														<input type="hidden" name="rentalPrice" value="${searchResult.rentalPrice }">
														<input type="hidden" name="rentalUcarZoneName" value="${searchResult.carVO.uCarZoneVO.uCarZoneName }">
														<button type="button" class="btn btn-default btn-sm" id="reserveBtn" value="${searchResult.carVO.carNo }">Reserve</button>
													</form>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-default btn-sm disabled">Reserve</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>						
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</div>
<script type="text/javascript">
	var map;
	var marker;
	var geocoder;
	var location;
	//지도에 찍을 위치정보를 저장함
	var locaTest =[];
	for(var i=0; i<50; i++) {
		locaTest[i] = new google.maps.LatLng($("#"+i+"UCarLati").val(), $("#"+i+"UCarLong").val());
	}
	function initialize() {
		var latlng = new google.maps.LatLng(37.5632667, 126.9798625);
		var myOptions = {
				zoom: 10,
				center: latlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP};
		map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
		map.setTilt(45);
		for(var i =0; i < locaTest.length; i++) {
			marker = new google.maps.Marker({
				position: locaTest[i],
				map : map
			});
			marker.setTitle((i + 1).toString());
			attachSecretMessage(marker, i);
		}
  /*   // 지도클릭시 마커 생성
	google.maps.event.addListener(map, 'click', function(event) {
		marker = new google.maps.Marker({
		position: event.latLng,
		map: map,
		title: '위치마커'
		});
	}); */
	}
	//마커클릭시 정보
	function attachSecretMessage(marker, num) {
		var message = [];
		for(var i =0; i<50; i++) {
			message[i] = $("#"+i+"UCarName").val();
		}
		var infowindow = new google.maps.InfoWindow({
			content: message[num]
		});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(marker.get('map'), marker);
		});
	}
	window.onload = function() {
		initialize();
	};
</script> 
