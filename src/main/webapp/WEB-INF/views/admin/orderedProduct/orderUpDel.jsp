<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 변경</title>
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
            <li class="breadcrumb-item active">주문 관리</li>
            <li class="breadcrumb-item">
            	<a href="<%=request.getContextPath()%>/admin/orderedProduct/orderedList">주문 조회·변경</a>
            </li>
            <li class="breadcrumb-item active">주문 변경</li>
          </ol>
          <!-- table -->
           <div class="card mb-3">
            <div class="card-header">
              <h5><i class="fas fa-edit"> 주문 변경</i> </h5>
            </div>
            <div class="card-body">
              <div class="table-responsive">
		          <!-- form -->
					<form class="form-horizontal" role="form" name="writeform" action="orderUpdate" method="post"> <!-- enctype="multipart/form-data"타입 기재하면 null값 됨 -->
						<div class="form-group">
							<label class="control-label col-sm-2">주문 번호</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="buy_num" id="buy_num" value="${buyDto.buy_num}" maxlength="20" readonly="readonly">
								<input type="hidden" name="buy_id" value="${buyDto.buy_id}" maxlength="100" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">구매자</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="buyer" value="${buyDto.buyer}" maxlength="100" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">판매상품</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_title" value="${buyDto.product_title}" maxlength="100" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">주문가격</label>
							<div class="col-sm-2">
								<div class="input-group">
									<input type="text" class="form-control" name="buy_price" value="${buyDto.buy_price}" maxlength="9" readonly="readonly">
									<span class="input-group-addon">원</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">주문수량</label>
							<div class="col-sm-2">
								<div class="input-group">
									<input type="text" class="form-control" name="buy_count" value="${buyDto.buy_count}" maxlength="5">
									<span class="input-group-addon">개</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">주문일자</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="buy_date" value="${buyDto.buy_date}" maxlength="100" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">결제 계좌</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="account" value="${buyDto.account}" maxlength="100" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">수령인</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="delivery_name" value="${buyDto.delivery_name}" maxlength="100">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">수령인 전화</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="delivery_tel" value="${buyDto.delivery_tel}" maxlength="100">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">수령지</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="delivery_address" value="${buyDto.delivery_address}" maxlength="100">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">배송 상태</label>
							<div class="col-sm-2">
								<select class="form-control" name="sanction">
									<option value="">전체</option> 
									<option value="주문 완료">주문 완료</option>
									<option value="배송 준비 중">배송 준비 중</option>
									<option value="배송 중">배송 중</option>
									<option value="배송 완료">배송 완료</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">
								<input type="submit" class="btn btn-primary" value="수정" onclick="updateCheckForm(this.form)">
								<input type="button" value="주문 삭제" class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>/admin/orderedProduct/orderDelete?buy_id=${buyDto.buy_id}'">
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