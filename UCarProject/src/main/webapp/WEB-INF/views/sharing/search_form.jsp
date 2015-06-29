<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 자동완성 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- 데이터 타임피커 -->
<link rel="stylesheet" href="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.css"> 
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> -->
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
			if($("#ucarZoneName").val()==""){
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
							$("#ucarZoneName").val("").focus();
						} else{
							var tableInfo="<table class='table table-hover' id='carTable'>";
							tableInfo+="<thead><tr><th>유카존</th><th></th><th>차량</th><th>대여요금</th><th>주행요금</th><th></th></tr></thead>";
							tableInfo+="<tbody>";
							$.each(data, function(index, carList){
								tableInfo+="<div id='"+carList.carVO.carNo+"Info'>";
								tableInfo+="<tr><input type='hidden' name='selectCar' value='"+carList.carVO.carNo+"'>";	// car_no 를 넘겨야할듯?
								tableInfo+="<td>"+carList.carVO.uCarZoneVO.uCarZoneName+"</td>";	// 유카존
								tableInfo+="<td><img src='"+carList.carVO.carModelInfoVO.carPhoto+"'></td>";	// 차외관
								tableInfo+="<td>"+carList.carVO.carModelInfoVO.carModel+" "+carList.carVO.carNickName+"</td>";	// 차량정보(닫 : 모델명, 닉네임, 간략한 스케쥴 / 열 : 닫 + 유종, 옵션, 스케쥴 자세히)
								tableInfo+="<td>"+carList.rentalPrice+"원</td>";	// 대여요금
								tableInfo+="<td>"+carList.carVO.carModelInfoVO.drivingFee+"원/km</td>";	// 주행요금
								if(carList.carVO.available){	// true 이면 예약버튼 활성화 false 이면 예약버튼 비활성화
									tableInfo+="<td>";
									tableInfo+="<form method='post' action='${initParam.root}auth_reservation_reservationCar.do' id='"+carList.carVO.carNo+"Form'>";
									tableInfo+="<input type='hidden' name='sharingType' value='왕복'>";
									tableInfo+="<input type='hidden' name='rentalDate' value='"+carList.rentalDate+"'>";
									tableInfo+="<input type='hidden' name='returnDate' value='"+carList.returnDate+"'>";
									tableInfo+="<input type='hidden' name='memberId' value='${sessionScope.loginInfo.memberId}'>";
									tableInfo+="<input type='hidden' name='carNo' value='"+carList.carVO.carNo+"'>";
									tableInfo+="<input type='hidden' name='rentalPrice' value='"+carList.rentalPrice+"'>";
									tableInfo+="<input type='hidden' name='rentalUcarZoneName' value='"+carList.carVO.uCarZoneVO.uCarZoneName+"'>";
									tableInfo+="<input type='hidden' name='returnUcarZoneName' value='"+carList.carVO.uCarZoneVO.uCarZoneName+"'>";
									tableInfo+="<button type='button' class='btn btn-default' id='reserveBtn' value='"+carList.carVO.carNo+"'>Reserve</button></form></td>";
								} else{
									tableInfo+="<td><button type='button' class='btn btn-default disabled'>Reserve</button></td>";
								}
								tableInfo+="</tr></div>";
								/* tableInfo+="<div id='"+carList.carVO.carNo+"Detail'>";
								tableInfo+="<tr><input type='hidden' name='selectCar' value='"+carList.carVO.carNo+"'>";
								tableInfo+="<td rowspan='2'>6</td>";	// 유카존
								tableInfo+="<td rowspan='2'>7</td>";	// 차외관
								tableInfo+="<td>8</td>";	// 차량정보
								tableInfo+="<td>9</td>";	// 대여요금
								tableInfo+="<td>10</td>";	// 주행요금
								if(carList.available){	// true 이면 예약버튼 활성화 false 이면 예약버튼 비활성화
									tableInfo+="<td rowspan='2'><button type='button' class='btn btn-default'>Reserve</button></td>";
								} else{
									tableInfo+="<td rowspan='2'><button type='button' class='btn btn-default disabled'>Reserve</button></td>";
								}
								tableInfo+="</tr>";
								tableInfo+="<tr>";
								tableInfo+="<td colspan='3'>11</td>";
								tableInfo+="</tr></div>"; */
							});
							tableInfo+="</tbody></table>";
							$("#carSearchResultView").html(tableInfo);
						}
					}
				});
			}
		});
		/* $("#carSearchResultView").on("click","#carTable tbody tr",function(){
			alert($(this).children(":input[name=selectCar]").val());
			$.ajax({
				type:"post",
				url:"${initParam.root}reservation_showDetailCarInfo.do",
				data:"carNo="+$(this).children(":input[name=selectCar]").val(),
				success:function(data){
					alert(data);
				}
			});
		}); */
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
	var map;
	var marker;
	var geocoder;
	var location;
	//지도에 찍을 위치정보를 저장함
	var locaTest = [ // 영역설정을 위한 Polygon의 꼭지점 좌표
	                	   new google.maps.LatLng(37.402136,127.106238),
	                       new google.maps.LatLng(37.402236,127.106338),
	                       new google.maps.LatLng(37.402336,127.106438),
	                       new google.maps.LatLng(37.402436,127.106538),
	                       new google.maps.LatLng(37.402536,127.106638),
	                       new google.maps.LatLng(37.402636,127.106738)
	                       ];
	function initialize() {
		var latlng = new google.maps.LatLng(37.402036, 127.106138);     
		var myOptions = {       
			zoom: 15,       
			center: latlng,       
			mapTypeId: google.maps.MapTypeId.ROADMAP     
		};     
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
		  var message = ['This', 'is', 'the', 'secret', 'message','haha'];
		  var infowindow = new google.maps.InfoWindow({
		    content: message[num]
		  });

		  google.maps.event.addListener(marker, 'click', function() {
		    infowindow.open(marker.get('map'), marker);
		  });
		}
	window.onload = function() {
		initialize();
	} 
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
	});//ready

</script>
 <div class="section">
	<div class="container">
		<div class="row">
	  	<div class="col-md-5">
			<form class="form-horizontal" role="form" id="searchForm">
				<div class="form-group">
					<div class ="col-md-5 col-md-offset-5">
		       				<input type = "radio" name = "travelType" value = "round">왕복 &nbsp;&nbsp;&nbsp;
						<!-- 	<input type = "radio" name = "travelType" value = "oneway">편도<br> -->
			 		 </div>
			  <br><br>
				<div class="col-sm-3 col-sm-offset-2">
					<label for="uCarZoneName" class="control-label">지역</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="uCarZoneNames" name="uCarZoneName" placeholder="지역">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-2" >
					<label for="rentalDate" class="control-label">대여일</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="rentalDate" name="rentalDate" placeholder="YYYY/MM/DD HH:MM">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-2">
					<label for="returnDate" class="control-label">반납일</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="returnDate" name="returnDate" placeholder="YYYY/MM/DD HH:MM">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-2">
					<label for="carType" class="control-label">차종</label>
				</div>
				<div class="col-sm-4">
					<select id="carModel" name="carModel">
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
	      </div>
	      <div class="col-md-4">
          	   <div id="map_canvas" style="width:730px;height:500px;"></div>   
		</div> 
		</div>
		<div class="col-md-12">
			<hr>
		</div>
		<!-- 검색결과 -->
		<div class="col-md-12" id="carSearchResultView">
		</div>
	</div>
</div>