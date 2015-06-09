<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="section"> 
	<div class="container"> 
		<div class="row"> 
			<!-- best consumer review -->
			<div class="col-md-4">이용후기</div>
			<!-- UCar garage -->
			<div class="col-md-4">유카차고</div>
			<!-- find car form -->
			<div class="col-md-4"> 
				예매/찾기
				<!-- <div class="form-group">
					<label class="control-label" for="exampleInputEmail1">Email address</label>
					<input class="form-control" id="exampleInputEmail1" placeholder="Enter email" type="email">
				</div>
				<div class="form-group">
					<label class="control-label" for="exampleInputPassword1">Password</label>
					<input class="form-control" id="exampleInputPassword1" placeholder="Password" type="password">
				</div>
				<button type="submit" class="btn btn-default">Submit</button> -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="#round" data-toggle="tab">왕복</a></li>
					<li><a href="#oneway" data-toggle="tab">편도</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active in" id="round">
						<form role="form">
							왕복
							대여일
							반납일
							지역
							차종
						</form>
					</div>
					<div class="tab-pane fade" id="oneway">
						<form role="form">
							편도
							대여일
							반납일
							지역
							차종
						</form>
					</div>
				</div>
				  
			</div>
		</div>
	</div>
</div>