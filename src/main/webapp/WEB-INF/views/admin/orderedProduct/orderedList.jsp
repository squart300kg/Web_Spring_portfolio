<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>

</head>

<body id="page-top">
<!-- main header -->
<%@ include file="/WEB-INF/views/admin/include/mainHeader.jsp" %>
<!-- wrapper start -->  
<div id="wrapper">

	<!-- left side column -->
	<%@ include file="/WEB-INF/views/admin/include/leftColumn.jsp" %>  
	
	<!-- content wrapper -->
      <div id="content-wrapper">
		
		<!-- container-fluid -->
        <div class="container-fluid">
        
          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="<%=request.getContextPath()%>/admin/adminMain">메인</a>
            </li>
            <li class="breadcrumb-item active">판매 관리</li>
            <li class="breadcrumb-item active">주문 조회·변경</li>
          </ol>
        
          <!-- search -->
         <div class="col-sm-12">
        	 <form name="form1"><!-- method="post" -->
		        <select name="searchOption">
		            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
		            <option value="all" <c:out value="${map.searchOption == 'all' ? 'selected' : ''}"/> >아이디+전화번호</option>
		            <option value="buyer" <c:out value="${map.searchOption == 'buyer'?'selected':''}"/> >아이디</option>
		            <option value="delivery_tel" <c:out value="${map.searchOption == 'delivery_tel'?'selected':''}"/> >전화번호</option>
		        </select>
		        <input type="text"  name="keyword"  id="keywordInput"  value="${map.keyword}">
		        <input type="button" id="searchBtn" value="조회">
		    </form>
    	</div>
    	         
        <!-- 레코드 갯수 및 목록을 테이블에 출력 -->        
        <div class="card mb-3">
           <div class="card-header">
              <h5><i class="fas fa-table"> ${map.oCount}개의 상품이 검색되었습니다. </i></h5>
           </div>
           <div class="card-body">
             <div class="table-responsive">  
               <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr class="tr-info">
						<th>주문번호</th>
						<th>아이디</th>
						<th>판매상품</th>
						<th>판매가격</th>
						<th>판매수량</th>
						<th>판매일</th>
						<th>결제계좌</th>
						<th>수령인</th>
						<th>수령인전화</th>
						<th>수령지</th>
						<th>배송상황</th>
					</tr>	
				</thead>
				<c:forEach items="${map.oList}" var="dto">
				<tbody>
					<tr>
						<td><a href="orderUpDel?buy_id=${dto.buy_id}">${dto.buy_num }</a></td>
						<td>${dto.buyer }</td>
						<td>${dto.product_title }</td>
						<td>${dto.buy_price }</td>
						<td>${dto.buy_count }</td>
						<td>${dto.buy_date }</td>
						<td>${dto.account }</td>
						<td>${dto.delivery_name }</td>
						<td>${dto.delivery_tel }</td>
						<td>${dto.delivery_address }</td>
						<td>${dto.sanction }</td>
					</tr>
				</tbody>		
				</c:forEach>
                </table>
              </div>
            </div>
          </div>
		</div>
		
		
   
		<!-- /container-fluid -->
		<!-- main footer -->
		<%@ include file="/WEB-INF/views/admin/include/mainFooter.jsp" %>  
	</div>
	<!-- /content wrapper -->
</div>
<!-- /wrapper -->

		<!-- search script -->	
	    <script type="text/javascript">
			
		$(document).ready(function(){
			$("#searchBtn").on("click", function(event){
				self.location = "/workout/admin/orderedProduct/orderedList"
				+ "?searchOption=" + $("select option:selected").val()
				+ "&keyword=" + encodeURIComponent($("#keywordInput").val());
			});
			

		</script>     
</body>
</html>