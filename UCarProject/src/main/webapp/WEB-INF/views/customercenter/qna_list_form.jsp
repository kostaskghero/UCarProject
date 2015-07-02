<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
<c:when test="${sessionScope.loginInfo!=null ||sessionScope.admin!=null }">
  <legend>1:1 문의 게시판</legend>
<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <table class="table">
              <thead>
                <tr>
                  <th>글번호</th>
                  <th>문의유형</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="bvo" items="${requestScope.lvo.list}">      
				         <tr>
				             <td >${bvo.qnaNo}</td>   
				              <td >${bvo.qnaCategory}</td> 
				            <td class="titleView" >   
							<c:if test="${bvo.qnaRelevel!=0}">
              				 <c:forEach begin="0" end="${bvo.qnaRelevel}" step="1">&nbsp;&nbsp;</c:forEach>
               				<img src="${initParam.root }/img/reply.jpg">
               					</c:if>            
				             <a href="${initParam.root}qna_showContent.do?qnaNo=${bvo.qnaNo }">${bvo.qnaTitle}</a>
				             		<c:if test="${bvo.checkReply==true}">
				             		&nbsp;[답변완료]
				             		</c:if>
				            </td>
				            <td>${bvo.qnaMemberId }</td>
				            <td>${bvo.qnaTimePosted }</td>
			         </tr>      
        		 </c:forEach>
              </tbody>
            </table>
            		<br></br> 
			<br><br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <div class="col-md-12">
            <ul class="pager">
              <li>
                <c:if test="${requestScope.lvo.pagingBean.previousPageGroup}">
					 <a href=
					 "${initParam.root}auth_customercenter_home_qna_boardList.do?pageNo=${requestScope.lvo.pagingBean.
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
							 <a href="${initParam.root}auth_customercenter_home_qna_boardList.do?pageNo=${i}">${i}</a>
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
	 			"${initParam.root}auth_customercenter_home_qna_boardList.do?pageNo=${requestScope.lvo.pagingBean.
	 			endPageOfPageGroup+1}">
					 Next
	 				</a>
	 			</c:if>	
              </li>
            </ul>
          </div>
<%-- 			<br></br> 
			<br><br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <div class="col-md-12" align="center">
            <ul class="pagination">
              <li>
                <c:if test="${requestScope.lvo.pagingBean.previousPageGroup}">
					 <a href=
					 "${initParam.root}customercenter_home_qna_boardList.do?pageNo=${requestScope.lvo.pagingBean.
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
							 <a href="${initParam.root}customercenter_home_qna_boardList.do?pageNo=${i}">${i}</a>
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
	 			"${initParam.root}customercenter_home_qna_boardList.do?pageNo=${requestScope.lvo.pagingBean.
	 			endPageOfPageGroup+1}">
					 Next
	 				</a>
	 			</c:if>	
              </li>
            </ul>
          </div> --%>
          </div>
        </div>
      </div>
    </div>
    </c:when>
<c:otherwise>
	<script type="text/javascript">
		alert("로그인하세요");
		location.href = "${initParam.root }member_login_form.do";
	</script>
</c:otherwise> 
</c:choose>
