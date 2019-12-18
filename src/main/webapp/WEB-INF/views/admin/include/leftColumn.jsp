<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
       <li class="nav-item active">
          <a class="nav-link" href="<%=request.getContextPath()%>/admin/adminMain">
            <i class="fas fa-fw fa-home"></i>
            <span>메인</span>
          </a>
        </li>
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-pencil-alt"></i>
            <span>상품 관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="<%=request.getContextPath() %>/admin/productProcess/productRegister">상품 등록</a>
            <a class="dropdown-item" href="<%=request.getContextPath() %>/admin/productProcess/productList">상품 목록·수정·삭제</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-shopping-cart"></i>
            <span>주문 관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="<%=request.getContextPath() %>/admin/orderedProduct/orderedList">주문 조회·변경</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-shopping-cart"></i>
            <span>회원 관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="<%=request.getContextPath() %>/admin/userManage/userList">회원 조회·수정·삭제</a>
          </div>
        </li>
      </ul>
    