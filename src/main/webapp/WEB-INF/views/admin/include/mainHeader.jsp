<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--main_header.jsp--%>
<%-- Main Header --%>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <h3><a class="navbar-brand mr-1" href="<%=request.getContextPath()%>/admin/adminMain">ADMIN PAGE</a></h3>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto "> <!-- ml-md-0 -->
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">로그아웃</a>
          </div>
        </li>
      </ul>

</nav>
    
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">로그아웃 버튼을 누르시면 로그아웃됩니다.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
            <a class="btn btn-primary" href="<%=request.getContextPath() %>/admin/login/adminLogin">로그아웃</a>
          </div>
        </div>
      </div>
    </div>
    