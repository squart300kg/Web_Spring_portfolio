<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
            <li class="breadcrumb-item active">상품 관리</li>
            <li class="breadcrumb-item active">상품 목록·수정·삭제</li>
          </ol>
          
          <!-- search -->
         <div class="col-sm-12">
        	 <form name="form1"><!-- method="post" -->
		        <select name="searchOption">
		            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
		            <option value="all" <c:out value="${map.searchOption == 'all' ? 'selected' : ''}"/> >품명+종류</option>
		            <option value="product_title" <c:out value="${map.searchOption == 'product_title'?'selected':''}"/> >품명</option>
		            <option value="product_kind" <c:out value="${map.searchOption == 'product_kind'?'selected':''}"/> >종류</option>
		        </select>
		        <input type="text"  name="keyword"  id="keywordInput"  value="${map.keyword}">
		        <input type="button"  id="searchBtn" value="조회">
		    </form>
    	</div>
    	
	    <!-- search script -->	
	    <script type="text/javascript">
			
		$(document).ready(function(){
			$("#searchBtn").on("click",function(event){
				self.location = "/workout/admin/productProcess/productList"
				+ "?searchOption=" + $("select option:selected").val()
				+ "&keyword=" + encodeURIComponent($("#keywordInput").val());
			});
			

		</script>  
    
    	<!-- 레코드 갯수 및 목록을 테이블에 출력 -->
        <div class="card mb-3">
           <div class="card-header">
              <h5><i class="fas fa-table"> ${map.pCount}개의 상품이 검색되었습니다. </i></h5>
           </div>
           <div class="card-body">
             <div class="table-responsive">  
               <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr class="tr-info">
						<td>상품코드</td>
						<td>품목</td>
						<td>제품명</td>
						<td>가격</td>
						<td>재고</td>
						<td>브랜드</td>
						<td>이미지</td>
						<td>내용</td>
						<td>할인율</td>
						<td>등록일</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
				</thead>
				<c:forEach var="dto" items="${map.pList}" varStatus="status">
				<tbody>
					<tr>
						<td>${dto.product_id}</td>
						<td>${dto.product_kind}</td>
						<td>${dto.product_title}</td>
						<td>${dto.product_price}</td>
						<td>${dto.product_count}</td>
						<td>${dto.brand}</td>
						<td><img src="<%=request.getContextPath()%>/images/${dto.product_image}" width="50" height="50"><br />${dto.product_image}</td>
						<td>${dto.product_content}</td>
						<td>${dto.discount_rate}</td>
						<td>${dto.reg_date}</td>
						<td><a href="productUpdate?product_id=${dto.product_id}">수정</a></td>
						<td><a href="#" onclick="fn_delete(${dto.product_id});" >삭제</a></td>
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

		<!-- 삭제 스크립트 -->
		<script>
		 function fn_delete(id){
				
				if(confirm("삭제하겠습니까?")){
				 
			    <c:forEach var="dto" items="${map.pList}" varStatus="status">
			    	   location.href = '/workout_login2_RealFinal_190130/admin/productProcess/productDelete?product_id='+id;
			    </c:forEach>
						};
	    	   
		};	
		</script>

</body>
</html>