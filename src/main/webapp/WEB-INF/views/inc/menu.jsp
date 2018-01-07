<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img
					src="http://localhost:8080/resim/server/php/files/<%=session.getAttribute("tc")%>/thumbnail/<%=session.getAttribute("resimadi")%>"
					class="img-circle" alt="User Image">
			</div>

			<div class="pull-left info">
				<p><%=session.getAttribute("kuladi")%>
					<%=session.getAttribute("kulsoyadi")%>
				</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">İŞLEMLER</li>
			<%
				if (session.getAttribute("gorev").equals("Admin") || session.getAttribute("gorev").equals("Müdür")
						|| session.getAttribute("gorev").equals("Müdür Yardımcısı")) {
			%>

			<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
					<span>Personel İşlemleri</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li><a href='<s:url value="/personelekleme"></s:url>'><i
							class="fa fa-circle-o"></i> Personel Kayıt</a></li>
					<li><a href='<s:url value="/personellistesi"></s:url>'><i
							class="fa fa-circle-o"></i> Personel Listesi</a></li>

				</ul></li>
			<%
				}
			%>
			<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
					<span>Öğrenci İşlemleri</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<%
						if (session.getAttribute("gorev").equals("Admin") || session.getAttribute("gorev").equals("Müdür")
								|| session.getAttribute("gorev").equals("Müdür Yardımcısı")) {
					%>
					<li><a href='<s:url value="/ogrenciekle"></s:url>'><i
							class="fa fa-circle-o"></i> Öğrenci Ekle</a></li>

					<%
						}
					%>
					<li><a href='<s:url value="/ogrencilistesi"></s:url>'><i
							class="fa fa-circle-o"></i> Öğrenci Listesi</a></li>
					<%
						if (session.getAttribute("gorev").equals("Admin") || session.getAttribute("gorev").equals("Müdür")
								|| session.getAttribute("gorev").equals("Müdür Yardımcısı")) {
					%>
					<li><a href='<s:url value="/ogrencimezun"></s:url>'><i
							class="fa fa-circle-o"></i> Öğrenci Mezuniyet İşlemleri</a></li>
					<li><a href='<s:url value="/ogrencimezunlar"></s:url>'><i
							class="fa fa-circle-o"></i> Mezun Öğrenciler</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
					<span>Ders İşlemleri</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>

				<ul class="treeview-menu">
					<li><a href='<s:url value="/dersekle"></s:url>'><i
							class="fa fa-circle-o"></i> Ders Ekleme</a></li>

					<li><a href='<s:url value="/derslistesi"></s:url>'><i
							class="fa fa-circle-o"></i> Ders Listesi</a></li>

				</ul></li>
			<%
				}
			%>
			<li class="treeview"><a href="#"> <i class="fa fa-pie-chart"></i>
					<span>Sınıf İşlemleri</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>

				<ul class="treeview-menu">
					<%
						if (session.getAttribute("gorev").equals("Admin") || session.getAttribute("gorev").equals("Müdür")
								|| session.getAttribute("gorev").equals("Müdür Yardımcısı")) {
					%>
					<li><a href='<s:url value="/sinifekle"></s:url>'><i
							class="fa fa-circle-o"></i> Sınıf Ekleme</a></li>
					<%
						}
					%>
					<li><a href='<s:url value="/siniflistesi"></s:url>'><i
							class="fa fa-circle-o"></i> Sınıf Listesi</a></li>

				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
					<span>Yoklama İşlemleri</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>

				<ul class="treeview-menu">
					<li><a href='<s:url value="/yoklamaal"></s:url>'><i
							class="fa fa-circle-o"></i> Yoklama Al</a></li>

					<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
							<span>Raporlar</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href='<s:url value="/dersekle"></s:url>'><i
									class="fa fa-circle-o"></i> Sınıfa Göre Rapor Al</a></li>
							<li><a href='<s:url value="/yoklamaraporogrencilistesi"></s:url>'><i
									class="fa fa-circle-o"></i> Öğrenciye Göre Rapor Al</a></li>
						</ul></li>

				</ul></li>
			<!--  
        <li class="header">LABELS</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>-->
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>