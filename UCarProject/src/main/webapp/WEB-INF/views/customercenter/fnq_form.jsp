<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchdataForm").submit(function(){
		$("#searchWord").val($("#questionlist").val());
	});
});
</script>
<form class="form-horizontal" method="post" action="${initParam.root}customercenter_searchdata.do" id="searchdataForm">
   <div class="form-group">
    <input type="hidden" name="searchWord" id="searchWord" value="">
     <div class="col-lg-2">
      	<h4>자주 묻는 질문</h4>
     </div>
      	<div class="col-lg-2">
	        <select class="form-control" id="questionlist" >
	        	<option value="" >전체</option>
		        	<c:forEach items="${requestScope.list }" var="data">
		        		<option value="${data }">${data }</option>
		        	</c:forEach>  
	        </select>
	        </div>
	        <div class="col-lg-4">
        		<input type="text" class="form-control" id="memberId" name="memberId" placeholder="검색할 내용 입력">
      		</div>
      		<div class="col-lg-2 ">
        		<button type="submit" class="btn btn-primary">검색</button>
      		</div>
      </div>
      </form>
 <div class="col-md-8">      
     <ul class="nav nav-tabs">
      		<li class="active"><a href="#oftenquestion" data-toggle="tab">자주묻는질문</a></li>
      		<li><a href="#reserveandpaymentquestion" data-toggle="tab">예약과 결제문의</a></li>
      		<li><a href="#registerquestion" data-toggle="tab">가입문의</a></li>
      		<li><a href="#carusequestion" data-toggle="tab">차량이용</a></li>
      		<li><a href="#accidentquestion" data-toggle="tab">사고</a></li>
      		<li><a href="#outquestion" data-toggle="tab">탈퇴</a></li>
      		<li><a href="#anotherquestion" data-toggle="tab">탈퇴</a></li> 
	</ul>
	<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active in" id="oftenquestion">
						<form role="form">
							자주묻는 질문 리스트
						</form>
					</div>
					<div class="tab-pane fade" id="reserveandpaymentquestion">
						<form role="form">
							예약과 결제 질문 리스트
						</form>
					</div>
					<div class="tab-pane fade" id="carusequestion">
						<form role="form">
							차량 이용 질문 리스트
						</form>
					</div>
					<div class="tab-pane fade" id="registerquestion">
						<form role="form">
							가입문의 리스트
						</form>
					</div>
					<div class="tab-pane fade" id="accidentquestion">
						<form role="form">
							사고 질문 리스트
						</form>
					</div>
					<div class="tab-pane fade" id="outquestion">
						<form role="form">
							탈퇴 질문 리스트
						</form>
					</div>
					<div class="tab-pane fade" id="anotherquestion">
						<form role="form">
							기타 질문 리스트
						</form>
					</div>
				</div>	
</div>

