
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="container">    
  <div class="row">
  
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">운동 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									<a style = "color:white" href = "<%=request.getContextPath()%>/board1/list"><strong>더보기</strong></a>
        </div>
        <div class="panel-body">
        	<c:forEach var = "bservice" items = "${bservice1 }" varStatus = "status" end = "4">
        		<li>
        			<a href = "<%=request.getContextPath() %>/board1/read?num=${bservice.num }">${status.index + 1 } : ${ bservice.subject}</a>
        		</li><hr>
        	</c:forEach>
        </div>
        <div class="panel-footer">젊음을 재창조하는 운동 게시판</div>
      </div>
    </div>
    
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">체중 관리 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									<a style = "color:white" href = "<%=request.getContextPath()%>/board2/list"><strong>더보기</strong></a>
        
        </div>
        <div class="panel-body">
        	<c:forEach var = "bservice" items = "${bservice2 }" varStatus = "status" end = "4">
        		<li>
        			<a href = "<%=request.getContextPath() %>/board2/read?num=${bservice.num }">${status.index + 1 } : ${ bservice.subject}</a>
        		</li><hr>
        	</c:forEach>
        </div>
        <div class="panel-footer">거울이 좋아지는 체중 관리  게시판</div>
      </div>
    </div>
    
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">관절 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									<a style = "color:white" href = "<%=request.getContextPath()%>/board3/list"><strong>더보기</strong></a>
        
        </div>
        <div class="panel-body">
        	<c:forEach var = "bservice" items = "${bservice3 }" varStatus = "status" end = "4">
        		<li>
        			<a href = "<%=request.getContextPath() %>/board3/read?num=${bservice.num }">${status.index + 1 } : ${ bservice.subject}</a>
        		</li><hr>
        	</c:forEach>
        </div>
        <div class="panel-footer">관절이 강철이 되어버리는 관절 게시판</div>
      </div>
    </div>
    
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">질문 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									<a style = "color:white" href = "<%=request.getContextPath()%>/board4/list"><strong>더보기</strong></a>
        </div>
        <div class="panel-body"><!-- 게시판 링크 <a link> -->
        	<c:forEach var = "bservice" items = "${bservice4 }" varStatus = "status" end = "4">
        		<li>
        			<a href = "<%=request.getContextPath() %>/board4/read?num=${bservice.num }">${status.index + 1 } : ${ bservice.subject}</a>
        		</li><hr>
        	</c:forEach>
        </div>
        <div class="panel-footer">피트니스 박사가 되는 질문 게시판</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">자유 토론 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									<a style = "color:white" href = "<%=request.getContextPath()%>/board5/list"><strong>더보기</strong></a>
        </div>
        <div class="panel-body"><!-- 게시판 링크 <a link> -->
        	<c:forEach var = "bservice" items = "${bservice5 }" varStatus = "status" end = "4">
        		<li>
        			<a href = "<%=request.getContextPath() %>/board5/read?num=${bservice.num }">${status.index + 1 } : ${ bservice.subject}</a>
        		</li><hr>
        	</c:forEach>
        </div>
        <div class="panel-footer">나를 분출시켜버리는 자유 토론 게시판</div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">공지 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        									<a style = "color:white" href = "<%=request.getContextPath()%>/board6/list"><strong>더보기</strong></a>
        </div>
        <div class="panel-body"><!-- 게시판 링크 <a link> -->
        	<c:forEach var = "bservice" items = "${bservice6 }" varStatus = "status" end = "4">
        		<li>
        			<a href = "<%=request.getContextPath() %>/board6/read?num=${bservice.num }">${status.index + 1 } : ${ bservice.subject}</a>
        		</li><hr>
        	</c:forEach>
        </div>
        <div class="panel-footer">읽지 않으면 불이익을 당하는 공지 게시판</div>
      </div>
    </div>
  </div>
</div><br><br>