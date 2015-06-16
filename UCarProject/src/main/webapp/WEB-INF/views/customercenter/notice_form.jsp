<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="form-horizontal" method="post" action="${initParam.root}member_register.do" id="memberRegisterForm">
	<div class="form-group">
	   <div class="col-lg-2"  >
      	<h4>공지사항</h4>
     </div>
      <div class="col-lg-6 col-lg-offset-2">
        		<input type="text" class="form-control" id="memberId" name="memberId" placeholder="검색할 내용 입력">
      		</div>
      		<div class="col-lg-2 ">
        		<button type="submit" class="btn btn-primary">검색</button>
      		</div>
	</div>
</form>
<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <table class="table">
              <thead>
                <tr>
                  <th>글번호</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="bvo" items="${requestScope.lvo.list}">      
				         <tr>
				             <td >${bvo.noticeNo}</td>   
				            <td class="titleView" >               
				             <a href="${initParam.root}notice_showContent.do?noticeNo=${bvo.noticeNo }">${bvo.noticeTitle}</a>
				            </td>
				            <td>${sessionScope.loginInfo.memberName }</td>
				            <td>${bvo.noticeTimePosted }</td>
			         </tr>      
        		 </c:forEach>
              </tbody>
            </table>
          <%--   관리자 글쓰기 추가 버튼미리 해둠! --%>
          <c:if test="${sessionScope.loginInfo.memberId == 'admin'}">
          <div class = "col-md-12 col-lg-offset-11">
          <a href="${initParam.root}customercenter_notice_write_form.do"><img id="writeImg" src="${initParam.root }/img/boardimg/write_btn.jpg" border="0"></a>
		 	</div>
		 	</c:if>
			<br></br> 
			<br><br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <div class="col-md-12">
            <ul class="pager">
              <li>
                <c:if test="${requestScope.lvo.pagingBean.previousPageGroup}">
					 <a href=
					 "${initParam.root}customercenter_home_notice.do?pageNo=${requestScope.lvo.pagingBean.
					 startPageOfPageGroup-1}">Prev</a>
				 </c:if>
				 &nbsp;&nbsp;
              </li>
              <li>
				    <c:forEach var="i" 
						begin="${requestScope.lvo.pagingBean.startPageOfPageGroup}"
							 end="${requestScope.lvo.pagingBean.endPageOfPageGroup}">
							 <c:choose>
							 <c:when test="${requestScope.lvo.pagingBean.nowPage!=i}">
							 <a href="${initParam.root}customercenter_home_notice.do?pageNo=${i}">${i}</a>
							 </c:when>
							 <c:otherwise>
							${i}
						</c:otherwise>
						</c:choose>
					</c:forEach>	 
					&nbsp;&nbsp;
              </li>
              <li>
                <c:if test="${requestScope.lvo.pagingBean.nextPageGroup}">
	 			<a href=
	 			"${initParam.root}customercenter_home_notice.do?pageNo=${requestScope.lvo.pagingBean.
	 			endPageOfPageGroup+1}">
					 Next
	 				</a>
	 			</c:if>	
              </li>
            </ul>
          </div>
          </div>
        </div>
      </div>
    </div>
