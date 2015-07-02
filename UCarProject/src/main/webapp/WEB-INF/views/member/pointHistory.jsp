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
</script>&nbsp;&nbsp;&nbsp;
<div class="jumbotron col-lg-7">
<h2>현재 보유한 포인트</h2>
</div>
<div class="jumbotron col-lg-5">
<h2 style="color: red" align="right">${memberVO.memberPoint }점</h2>
</div>

<div class="form-group">
	<label for="select" class="col-lg-2 control-label" >조회기간</label>
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
				<th></th><th><h5 align="center">일시</h5></th><th><h5 align="center">내용</h5></th><th><h5 align="center">포인트</h5></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(pointList.list)!=0}">
					<c:forEach items="${pointList.list }" var="pointInfo" varStatus="i">
						<tr>
							<td><h5 align="center">${i.count }</h5></td>
							<td><h5 align="center">${pointInfo.pointDate }</h5></td>
							<td><h5 align="center">${pointInfo.pointContent }</h5></td>
							<c:choose>
								<c:when test="${pointInfo.pointType=='적립' }">
									<td><h5 align="center">+ ${pointInfo.pointValue } 점</h5></td>
								</c:when>
								<c:otherwise>
									<td><h5 align="center">- ${pointInfo.pointValue } 점</h5></td>
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
					test="${pointList.pagingBean.previousPageGroup}">
					<a
						href="${initParam.root}auth_member_getPointListByMemberId.do?searchPeriod=${searchPeriod }&pointPageNo=${pointList.pagingBean.
				 startPageOfPageGroup-1}">Prev</a>
				</c:if> &nbsp;&nbsp;</li>
			<li><c:forEach var="i"
					begin="${pointList.pagingBean.startPageOfPageGroup}"
					end="${pointList.pagingBean.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pointList.pagingBean.nowPage!=i}">
							<a href="${initParam.root}auth_member_getPointListByMemberId.do?searchPeriod=${searchPeriod }&pointPageNo=${i}">${i}</a>
						</c:when>
						<c:otherwise>
						${i}
					</c:otherwise>
					</c:choose>
				</c:forEach> &nbsp;&nbsp;</li>
			<li><c:if test="${pointList.pagingBean.nextPageGroup}">
					<a
						href="${initParam.root}auth_member_getPointListByMemberId.do?searchPeriod=${searchPeriod }&pointPageNo=${pointList.pagingBean.
 			endPageOfPageGroup+1}">
						Next </a>
				</c:if></li>
		</ul>
	</div>
</div>