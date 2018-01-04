<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>KYS</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Kurs</b> Yönetim Sistemi</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">

          
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="http://localhost:8080/resim/server/php/files/<%=session.getAttribute("tc") %>/thumbnail/<%=session.getAttribute("resimadi") %>" class="user-image" alt="User Image">
              <span class="hidden-xs"><%=session.getAttribute("kuladi") %> <%=session.getAttribute("kulsoyadi") %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="http://localhost:8080/resim/server/php/files/<%=session.getAttribute("tc") %>/thumbnail/<%=session.getAttribute("resimadi") %>" class="img-regrangle" alt="User Image">

                <p>
                  <%=session.getAttribute("kuladi") %> <%=session.getAttribute("kulsoyadi") %> - <%=session.getAttribute("gorev") %>
                  <small>Branş: <%=session.getAttribute("brans") %></small>
                </p>
              </li>
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href='<s:url value="/personelbilgisi"></s:url>' class="btn btn-default btn-flat">Bilgiler</a>
                </div>
                <div class="pull-right">
                  <a href='<s:url value="/cikisyap"></s:url>' class="btn btn-default btn-flat">Çıkış Yap</a>
                </div>
              </li>
            </ul>
          </li>
          
        </ul>
      </div>

    </nav>
  </header>