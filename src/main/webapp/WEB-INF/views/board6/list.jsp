<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="te.pr.dao.boardDaoImpl1" %>
<%@ page import="te.pr.service.BoardServiceImpl1" %>



<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8>
	<title>회원목록</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no' name='viewport'>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/mainStyle.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>

<body>
<jsp:include page="../squart/top.jsp" flush="false"/>

<div class = "container">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
		</header>
	</div>
	
	<div class="content-wrapper">
	
		<section class="content-header">
			<h1>
			회 원 관 리
			</h1>
		
		<c:if test ="${! empty User}">
		<button type="submit" class="btn btn-primary" id="bo">글작성</button>
		</c:if>
		
		
		</section>


	<script>
		
			$(document).ready(function(){
			
				$("#bo").on("click",function(){
					self.location = "<%=request.getContextPath()%>/board6/insert";
				});
				
			});
		
		
		</script>
				


<!-- 메인 컨텐츠 -->
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">List Page -게시글 개수  : ${pageMaker.totalCount} </h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">번호</th>
							<th>제 목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th style="width: 40px">조회수</th>
						</tr>
					<c:forEach items="${slist}" var="boardVO">
						<tr> 
							<td>${boardVO.num}</td>
							<td><a href="<%=request.getContextPath() %>/board6/read?num=${boardVO.num}&page=${searchCriteria.page}">${boardVO.subject}</a></td>
							<td>${boardVO.writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${boardVO.reg_date}"/></td>
							<td><span class="badge bg-red">${boardVO.readcount}</span></td>
									
						</tr>	
					</c:forEach>
					</table>
				
				
				</div>
			</div>
		</div>	
	</div>
</section>

</div>

<script>
var result='${msg}';
if(result == 'SUCCESS') {
	alert("처리가 완료되었습니다.");
}
</script>
<div class="box-footer">
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li> <a href="<%=request.getContextPath()%>/board6/list${pageMaker.makeSearch(pageMaker.startPage -1)}">이전</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : '' }"/>>
					<a href="<%=request.getContextPath()%>/board6/list${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>	
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li> <a href="<%=request.getContextPath()%>/board6/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
			
		</ul>
	</div>
</div>

<div class="box-footer">
	<div class="form-group col-sm-2">
		<select class="form-control" name="searchType" id="searchType">
			<option value="n" <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
			<option value="subject" <c:out value="${searchCriteria.searchType == 'subject'  ? 'selected' : '' }"/>> 제목 </option>
			<option value="content" <c:out value="${searchCriteria.searchType == 'content' ? 'selected' : '' }"/>> 내용 </option> 
			<option value="writer" <c:out value="${searchCriteria.searchType == 'writer'  ? 'selected' : '' }"/>> 작성자 </option> 
		</select>
	</div>
	<div class="form-group col-sm-10">
		<div class="input-group">
			<input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCriteria.keyword}" placeholder="검색어">
			<span class="input-group-btn">
				<button type="button" class="btn btn-primary btn-flat" id="searchBtn">
					<i class="fa fa-search"></i> 검색
				</button>
			</span>
		
		</div>
	</div>
	</div>
	<script type="text/javascript">
		
	$(document).ready(function(){
		$("#searchBtn").on("click",function(event){
			self.location = "<%=request.getContextPath()%>/board6/list${pageMaker.makeQuery(1)}"
			+ "&searchType=" + $("select option:selected").val()
			+ "&keyword=" + encodeURIComponent($("#keywordInput").val());
		});
	});
	
	</script>





</div>
<%@ include file="../include/footer.jsp" %>


<jsp:include page="../squart/bottom.jsp" flush="false"/>








