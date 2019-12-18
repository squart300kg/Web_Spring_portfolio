<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원목록</title>
	<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" type="text/css"/>
</head>
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>

<body>
	





<!-- Main Content -->
		<div class="box box-primary" style="padding:10px;" >
			<div class="box-header">
				<h3 class="box-title">글 작성</h3>
			</div>
			<form role="form" method="post">
				<div class="box-body">
					<div class="form-group">
						<label>글 제 목</label>
						<input type="text" name="subject" 
							class="form-control" placeholder="Enter Title">
					</div>
					<div class="form-group">
						<label>글 내 용</label>
						<textarea class="form-control" name="content" 
							rows="10" placeholder="Enter Content"></textarea>
					</div>
					<div class="form-group">
						<label>글 쓴 이</label>
						<input type="text" name="writer"  readonly="readonly" value="${User.id}"
							class="form-control" >
					</div>
					<div class="form-group">
						<label>이 메 일</label>
						<input type="text" name="email" 
							class="form-control" placeholder="Enter email">
					</div>
					
				</div>
				
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">글 올리기</button>
				<button type="button" class="btn btn-primary" onclick="document.location.href='<%=request.getContextPath()%>/board/list'">글목록</button>
				
				</div>
			</form>
		</div>




</body>
</html>













