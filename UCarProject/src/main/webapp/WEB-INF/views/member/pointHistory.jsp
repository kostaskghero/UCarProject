<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<legend>포인트내역</legend>
<script>
	$(document).ready(function(){
		$("#searchPeriod").change(function(){
			location.href="${initParam.root}auth_member_getPointListByMemberId.do?searchPeriod="+$(this).val();
		})
	})
</script>
<div class="jumbotron">
현재 보유한 포인트 ${memberVO.memberPoint }점
</div>
<div class="form-group">
	<label for="select" class="col-lg-2 control-label">조회기간</label>
	<div class="col-lg-2">
		<select class="form-control" id="searchPeriod">
			<option value="">----</option>
			<option value="1">1개월</option>
			<option value="3">3개월</option>
			<option value="6">6개월</option>
		</select>
	</div>
</div>
<div class="col-md-12" id="pointHistoryView">
	<table class="table table-hover">
		<thead>
			<tr>
				<th></th><th>일시</th><th>내용</th><th>포인트</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(pointList.list)!=0}">
					<c:forEach items="${pointList.list }" var="pointInfo" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td>${pointInfo.pointDate }</td>
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
	<ul class="pagination">
		<c:choose>
			<c:when test="${pointList.pagingBean.previousPageGroup}">
				<li>
					<a href="${initParam.root}auth_member_getPointListByMemberId.do?searchPeriod=${searchPeriod }&pointPageNo=${pointList.pagingBean.startPageOfPageGroup-1}">«</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="#">«</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${pointList.pagingBean.startPageOfPageGroup}" end="${pointList.pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pointList.pagingBean.nowPage!=i}">
					<li><a href="${initParam.root}auth_member_getPointListByMemberId.do?searchPeriod=${searchPeriod }&pointPageNo=${i}">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pointList.pagingBean.nextPageGroup}">
				<li>
					<a href="${initParam.root}auth_member_getPointListByMemberId.do?searchPeriod=${searchPeriod }&pointPageNo=${pointList.pagingBean.endPageOfPageGroup+1}">»</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="#">»</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>