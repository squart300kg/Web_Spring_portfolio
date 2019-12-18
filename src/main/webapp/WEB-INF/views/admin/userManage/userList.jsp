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
            <li class="breadcrumb-item active">회원 관리</li>
            <li class="breadcrumb-item active">회원 조회·수정·삭제</li>
          </ol>
          
          <!-- search -->
         <div class="col-sm-12">
        	 <form name="form1"><!-- method="post" -->
		        <select name="searchOption">
		            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
		            <option value="all" <c:out value="${map.searchOption == 'all' ? 'selected' : ''}"/> >아이디+이름</option>
		            <option value="id" <c:out value="${map.searchOption == 'id'?'selected':''}"/> >아이디</option>
		            <option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}"/> >이름</option>
		        </select>
		        <input type="text"  name="keyword"  id="keywordInput"  value="${map.keyword}">
		        <input type="button"  id="searchBtn" value="조회">
		    </form>
    	</div>
    	
	    <!-- search script -->	
	    <script type="text/javascript">
			
		$(document).ready(function(){
			$("#searchBtn").on("click",function(event){
				self.location = "/workout/admin/userManage/userList"
				+ "?searchOption=" + $("select option:selected").val()
				+ "&keyword=" + encodeURIComponent($("#keywordInput").val());
			});
			

		</script>  
    
    	<!-- 레코드 갯수 및 목록을 테이블에 출력 -->
        <div class="card mb-3">
           <div class="card-header">
              <h5><i class="fas fa-table"> ${map.uCount}명의 회원이 있습니다. </i></h5>
           </div>
           <div class="card-body">
             <div class="table-responsive">  
               <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr class="tr-info" height="30">
						<td align = "center" width="50">아이디</td>
						<td align = "center" width="50">이름</td>
						<td align = "center" width="50">비밀번호</td>
						<td align = "center" width="50">이메일</td>
						<td align = "center" width="50">주소</td>
					</tr>
				</thead>
				<c:forEach var="dto" items="${map.uList}" varStatus="status">
				<tbody>
					<tr>
						<td><a href="userUpDel?num=${dto.num}">${dto.id}</a></td>
						<td>${dto.name}</td>
						<td>${dto.password}</td>
						<td>${dto.email}</td>
						<td>${dto.address}</td>
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



</body>
</html>