<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchBtn").click(function() {
		if($("#searchId").val()!=""){
			location.href="admin_getAllPointHistoryById.do?memberId="+$("#searchId").val();
		}else{
			location.href="admin_pointHistoryList.do";
		}
	});//click
});k
</script>
<fieldset>
	<legend><h2>포인트 내역</h2> </legend>
	<div class="form-group">
		<div class="col-lg-5">
	<label for="searchInput" class="col-lg-2 control-label col-lg-offset-1"><h4>아이디 검색</h4></label>
			<input type="text" class="form-control" id="searchId" name="searchId"
				placeholder="아이디"
				onKeyDown="javascript:if (event.keyCode == 13) return false;">

		</div>
		<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
	</div>
	<div class="col-md-12" id="pointHistoryView">
		<table class="table table-hover">
			<thead>
				<tr>
					<th></th>
					<th>일시</th>
					<th>아이디
					<th>내용</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(lvo.list)!=0}">
						<c:forEach items="${lvo.list }" var="pointInfo" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td>${pointInfo.pointDate }</td>
								<td>${pointInfo.memberId }</td>
								<td>${pointInfo.pointContent }</td>
								<c:choose>
									<c:when test="${pointInfo.pointType=='적립' }">
										<td>+ ${pointInfo.pointValue } 점</td>
									</c:when>
									<c:otherwise>
										<td>- ${pointInfo.pointValue } 점</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회할 포인트가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<br></br> <br> <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="col-md-12">
			<ul class="pager">
				<li><c:if
						test="${requestScope.lvo.pagingBean.previousPageGroup}">
						<a
							href="${initParam.root}admin_getAllPointHistoryById.do?memberId=${requestScope.memberId}&pageNo=${requestScope.lvo.pagingBean.
					 startPageOfPageGroup-1}">Prev</a>
					</c:if> &nbsp;&nbsp;</li>
				<li><c:forEach var="i"
						begin="${requestScope.lvo.pagingBean.startPageOfPageGroup}"
						end="${requestScope.lvo.pagingBean.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${requestScope.lvo.pagingBean.nowPage!=i}">
								<a href="${initParam.root}admin_getAllPointHistoryById.do?memberId=${requestScope.memberId}&pageNo=${i}">${i}</a>
							</c:when>
							<c:otherwise>
							${i}
						</c:otherwise>
						</c:choose>
					</c:forEach> &nbsp;&nbsp;</li>
				<li><c:if test="${requestScope.lvo.pagingBean.nextPageGroup}">
						<a
							href="${initParam.root}admin_getAllPointHistoryById.do?memberId=${requestScope.memberId}&pageNo=${requestScope.lvo.pagingBean.
	 			endPageOfPageGroup+1}">
							Next </a>
					</c:if></li>
			</ul>
		</div>
	</div>
</fieldset>