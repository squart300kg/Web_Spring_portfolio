<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경</title>
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
            <li class="breadcrumb-item">
            	<a href="<%=request.getContextPath()%>/admin/userManage/userList">회원 조회·수정·삭제</a>
            </li>
            <li class="breadcrumb-item active">회원 정보 수정</li>
          </ol>
          <!-- table -->
           <div class="card mb-3">
            <div class="card-header">
              <h5><i class="fas fa-edit"> 회원 정보 수정</i> </h5>
            </div>
            <div class="card-body">
              <div class="table-responsive">
		          <!-- form -->
					<form class="form-horizontal" role="form" name="writeform" action="userUpdate" method="post">
						<div class="form-group">
							<label class="control-label col-sm-2">아이디</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" name="id" id="id" value="${squartDto.id}" maxlength="50" readonly="readonly">
								<input type="hidden" name="num" value="${squartDto.num}" maxlength="100" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">이름</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" name="name" value="${squartDto.name}" maxlength="20">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">비밀번호</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="password" value="${squartDto.password}" maxlength="300">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">이메일</label>
							<div class="col-sm-3">
									<input type="text" class="form-control" name="email" value="${squartDto.email}" maxlength="50" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">주소</label>
							<div class="col-sm-6">
									<input type="text" class="form-control" name="address" value="${squartDto.address}" maxlength="50">
								</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">
								<input type="submit" class="btn btn-primary" value="수정" onclick="updateCheckForm(this.form)">
								<input type="button" value="회원 삭제" class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>/admin/userManage/userDelete?num=${squartDto.num}'">
							</div>
						</div>
					</form>
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