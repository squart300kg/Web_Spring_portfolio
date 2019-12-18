<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
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
            <li class="breadcrumb-item">
            	<a href="<%=request.getContextPath()%>/admin/productProcess/productList">상품 목록·수정·삭제</a>
            </li>
            <li class="breadcrumb-item active">상품 수정</li>
          </ol>
          <!-- table -->
           <div class="card mb-3">
            <div class="card-header">
              <h5><i class="fas fa-edit"> 상품 정보 수정</i> </h5>
            </div>
            <div class="card-body">
              <div class="table-responsive">
		          <!-- form -->
					<form class="form-horizontal" role="form" name="writeform" action="productUpdate" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data"타입 기재하면 null값 됨 -->
						<div class="form-group">
							<label class="control-label col-sm-2">분류선택</label>
							<div class="col-sm-2">
								<select class="form-control" name="product_kind">
									<option value="">전체</option> 
									<option value="100">다이어트 보조식품</option>
									<option value="200">운동용품(야외)</option>
									<option value="300">운동용품(홈짐)</option>
									<option value="400">운동복</option>
									<option value="500">헬스용품</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">상품 코드</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_id" value="${productDto.product_id } " maxlength="100" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_title" value="${productDto.product_title } " maxlength="100">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">가격</label>
							<div class="col-sm-2">
								<div class="input-group">
									<input type="text" class="form-control" name="product_price" value="${productDto.product_price } " maxlength="9">
									<span class="input-group-addon">원</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">수량</label>
							<div class="col-sm-2">
								<div class="input-group">
									<input type="text" class="form-control" name="product_count" value="${productDto.product_count } " maxlength="5">
									<span class="input-group-addon">개</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">브랜드</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="brand" value="${productDto.brand } " maxlength="40">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">이미지</label>
							<div class="col-sm-4">
								<input type="file" class="form-control" name="image" value="${productDto.product_image } ">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">내용</label>
							<div class="col-sm-8">
								<textarea class="form-control" rows="12" cols="160" name="product_content">${productDto.product_content }</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">할인율</label>
							<div class="col-sm-2">
								<div class="input-group">
									<input type="text" class="form-control" name="discount_rate" value="${productDto.discount_rate }" maxlength="2">
									<span class="input-group-addon">%</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">
								<input type="submit" class="btn btn-primary" value="수정" onclick="updateCheckForm(this.form)"> 
								<input type="reset" class="btn btn-warning" value="취소"> 
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