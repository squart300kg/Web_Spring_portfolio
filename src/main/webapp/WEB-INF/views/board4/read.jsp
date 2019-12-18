<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix= "spring" uri="http://www.springframework.org/tags" %>    
    
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 상세정보 보기</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/mainStyle.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<body>
<jsp:include page="../squart/top.jsp" flush = "false"/>
<div class = "container">
	<div class="box box-primary" style="padding:10px;" >
			<div class="box-header">
				<h3 class="box-title">질문 게시판</h3>
				<c:if test ="${empty User}">
					<button class="pull-right hidden-xs" type="button" class="btn btn-primary" 
					onclick="document.location.href='<%=request.getContextPath()%>/squart/login1'">로그인</button>
				</c:if>
	</div>
	<div class="container">
		<form role="form"  id="board" method="post">
			<input type="hidden" name="num" value="${num}">
			<input type="hidden" name="page" value="${criteria.page}"/>
			<input type="hidden" name="perPageNum" value="${criteria.perPageNum}"/>
		</form>
		
		<div class = "box-body">
			<div class="form-group">
				<label>제 목</label>
				<input type="text" name="subject" class="form-control"
					value="${boardVO.subject}" readonly="readonly">
			</div>
		</div>
		
		<div class="box-body">
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" name="content" rows="20"
					readonly="readonly">${boardVO.content}</textarea>
			</div>
		</div>
		<div class="box-body">
			<div class="form-group">
				<label>글쓴이</label>
				<input type="text" name="writer" class="form-control"
					value="${boardVO.writer}" readonly="readonly">
			</div>
		</div>
		
		<div class="box-footer">
		
		<c:if test=  "${boardVO.writer == User.id}">
			<button type="submit" class="btn btn-warning">수정</button>
			<button type="submit" class="btn btn-danger">삭제</button>
		</c:if>
		
			<button type="button" class="btn btn-primary" id="bo">글목록</button>
		</div>
	</div>
	
	
	
		<script>
		
			$(document).ready(function(){
				var formObj = $("#board");
				console.log(formObj);
				
				$(".btn-warning").on("click",function(){
					formObj.attr("action","<%=request.getContextPath()%>/board4/update");
					formObj.attr("method","get");
					formObj.submit();
				});
				$(".btn-danger").on("click",function(){
					formObj.attr("action","<%=request.getContextPath()%>/board4/delete");
					formObj.submit();
				});
				$("#bo").on("click",function(){
					self.location = "<%=request.getContextPath()%>/board4/list?page=${criteria.page}";
				});
				
			});
		
		
		</script>
	
	
	
	
	
	<div class="container">
		<form class="form-horizontal" id="reply" name="replyform" role="form2">
			<input type="hidden" id="num" name="num" value="${num}"/>
			<input type="hidden" id="re_level" name="re_level" value="0"/>
			<input type="hidden" id="re_step" name="re_step" value="0"/>
			<input type="hidden" id="writer" name="writer" value="${User.id}"/>
			<input type="hidden" id="ip" name="ip" value="0"/>
			
			<c:if test ="${! empty User}">
				<div class="form-group">
					<label class="control-label col-sm-2">댓 글</label>
					<div class="col-sm-4">
						<textarea class="form-control" rows="10" cols="80" 
						id="contentREFirst" name="content" ></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" class="btn btn-primary"  id="replybutton" value="댓글쓰기" >
					</div>
				</div>
			</c:if>
		</form>
	
	<script>
		   $(document).ready(function() {
		   
			   $("#replybutton").on("click",function(){
		   			
				   if($("#contentREFirst").val() == ""){
				        alert("댓글 입력바람");
				        $("#contentREFirst").focus();
				        return false;
				      }
				   
				   
				   var listReply = [];
				   
				   var sendData = 
				   JSON.stringify({writer:$('#writer').val(), content:$('#contentREFirst').val(), ip:$('#ip').val(),re_step:$('#re_step').val(), re_level:$('#re_level').val(), num: $('#num').val() });
					
				   
				   listReply.push(sendData);
				   
				   
				   console.log(sendData);
				   		
				   
		    alert("${boardVO.writer}");
				
		    $.ajax({
					url : "<%=request.getContextPath()%>/reply4" ,
					type : "POST",
					dataType: "json",
					contentType:"application/json;charset=UTF-8",
					data : sendData,
					
					  success : function (result) {
			                if (result == "regSuccess") {
			                    alert("댓글 등록 완료!");
			                }
			               
				    alert("댓글 등록 완료!!");
					 
			                $('#content').val("");
					  
			                window.location.reload();
					  
					  }
			        })
			    })
		   	});
		</script>
		</div>
		<div>
				<table class="table table-bordered table-hover" id="replyTable">
					<thead>
						<tr>
							<td align="center" width="50">작성자</td>
							<td align="center" width="50">작성일</td>
							<td align="center" width="300">내용</td>
							<td align="center" width= "50">좋아요</td>
						</tr>
					</thead>
					<tbody>
	
	
					<c:forEach  varStatus="status" items="${rlist}" var="replyVO">
						<tr id="replyTR"> 
								<c:set var="re_levelImage" value="${replyVO.re_level}"/>
									<c:choose>
										<c:when test="${re_levelImage > 0 }">
											<td id='writer_${status.index}' align= "center"> 
											  <img src="<%=request.getContextPath()%>/resources/images/level.gif" width="${width}">
			         						   <img src="<%=request.getContextPath()%>/resources/images/re.gif">
											   ${replyVO.writer}</td>
										</c:when>
										<c:otherwise>
											<td id='writer_${status.index}' align= "center"> ${replyVO.writer}</td>
										</c:otherwise>
									</c:choose>
							<td id='reg_date_${status.index}'><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${replyVO.reg_date}"/></td>
							<td id = 'content_${status.index}'>${replyVO.content }</td>		
							<td id = 'likecount_${status.index}'><span class="badge bg-red">${replyVO.likecount}</span></td>
									
						</tr>	
		
					
				        <tr>
							<td colspan ="4" align="right" >
						
					<!-- 	<input type="button" value="댓글 접기/펼치기" onclick="fn_roll(${replyVO.rnum});"> -->
						
						
						<c:if test=  "${replyVO.writer == User.id}">
							<input type="button" value="답글삭제"  onclick="fn_delete(${replyVO.rnum});">
							&nbsp;&nbsp;
							<input type="button" value="답글수정"  name="modify"  id="modif" onclick="document.location.href='<%=request.getContextPath()%>/board4/updateReR?num=${num}&rnum=${replyVO.rnum}&page=${criteria.page}'" >
							&nbsp;&nbsp;
						</c:if>	
						<c:if test=  "${! empty User}">
							<input type="button" value="좋아요" onclick="document.location.href='<%=request.getContextPath()%>/board4/like?num=${num}&rnum=${replyVO.rnum}&page=${criteria.page}'"><br/>
						</c:if>	
							</td>
							
						</tr>
			<tr>
			<td colspan="4" align="right" >
			
			<div class="container">
			<form class="form-horizontal" name="rereplyform" id="rereply" method="post"action = "<%=request.getContextPath() %>/board/read/rereply"		 >
					<input type="hidden" name="rnum" id="rnum2" value="${replyVO.rnum}"/> 
					<input type="hidden" name="num" id="num2" value="${num}"/>
					<input type="hidden" name="page" value="${criteria.page}"/>
					
					<input type="hidden" name="re_level" id="re_level2" value="${replyVO.re_level}"/>
					<input type="hidden" name="re_step" id="re_step2" value="${replyVO.re_step}"/>
					<input type="hidden" name="writer" id="writer2" value="${User.id}"/>
				<c:set var="re_levelJ" value="${replyVO.re_level}"/>
					<c:choose>
						<c:when test="${re_levelJ == 0 && ! empty User}">
						<div class= "box-footer" id="none">
							<div class="form-group">
									<label class="control-label col-sm-2">댓 글</label>
									<div class="col-sm-4">
										<textarea class="form-control" rows="10" cols="80" 
										name="content" id="content2"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="submit" value="댓글쓰기" id="rere"><br/>
												<br/>
									</div>
								</div>
						</div>
						</c:when>
					</c:choose>
					
				</form>
						
			</div>
						
			  	</td>
			  </tr>
  			 <script type="text/javascript">
      
		 
				 function fn_delete(rnum){
						
					 if(confirm("삭제하겠습니까?")){
						  <c:forEach var="replyVO" items="${rlist}" varStatus="status">
				    	   location.href = '<%=request.getContextPath()%>/board4/delRe?num=${num}&rnum='+rnum+'&page=${criteria.page}';
				  		  </c:forEach>
					 }
					};
					
					 function fn_roll(rnum){
							
							  <c:forEach var="replyVO" items="${rlist}" varStatus="status">
					    	   
							  location.href = '<%=request.getContextPath()%>/board4/delRe?num=${num}&rnum='+rnum+'&page=${criteria.page}';
					  		 
					    	   </c:forEach>
					  		  
						};
			        
			    </script>
		</c:forEach>
	</tbody>
	</table>
	</div>
</div>
</div>
<jsp:include page="../squart/bottom.jsp" flush="false"/>
</body>
</html>