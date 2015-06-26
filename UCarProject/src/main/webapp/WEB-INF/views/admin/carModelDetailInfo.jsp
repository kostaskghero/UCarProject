<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-5">
            <img src="${info.carPhoto}"
            class="img-responsive" width="400" height="500">
          </div>
          <div class="col-md-5">
            <h1>${info.carModel}</h1>
            <h3>${info.carType}</h3>
            <p>대여요금 : ${info.rentalFee} 원/10분</p>
             <p>주행요금 : ${info.drivingFee} 원/km</p>
              <p>주유 종류 : ${info.oilType}</p>
              옵션 : 
              <c:forEach items="${requestScope.info.carOption }" var="list">
              ${list}
              </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </body>

</html>