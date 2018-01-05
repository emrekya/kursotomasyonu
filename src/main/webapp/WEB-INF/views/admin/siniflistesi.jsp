<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kurs Otomasyon - Sınıf Listesi</title>
<jsp:include page="${request.contextPath}/css"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<jsp:include page="${request.contextPath}/header"></jsp:include>
		<jsp:include page="${request.contextPath}/menu"></jsp:include>


		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Sınıf Listesi <small>Kurs Otomasyon</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Yönetim</a></li>
					<li class="active">Yönetime Git</li>
				</ol>
			</section>
			<!-- /.col (left) -->

			<!-- Main content -->
			<section class="content">
				<div class="row">

					<div class="col-md-12">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Sınıf Listesi</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-striped">
									<tbody>
										<tr>
											<th style="width: 10px">Sıra</th>
											<th>Sınıf Adı</th>
											<th>Öğrenci Sayısı</th>
											<th>Seviye</th>

										</tr>
										<c:if test="${not empty lsSiniflar }">
											<c:forEach items="${lsSiniflar}" var="snf">
												<tr>

													<td><c:out value="${snf.getSinifSira()}"></c:out></td>
													<td><c:out value="${snf.getSinifAdi()}"></c:out></td>
													<td><c:out value="${snf.getOgrenciSayisi() }"></c:out></td>
													<td><c:out value="${snf.getSinifSeviye() }"></c:out></td>
													<%
													if (session.getAttribute("gorev").equals("Admin") || session.getAttribute("gorev").equals("Müdür")
																	|| session.getAttribute("gorev").equals("Müdür Yardımcısı")) {
												%>
													<td><a
														href='<s:url value="/sinifguncelleme/${ snf.getSinifId() }"></s:url>'
														class="btn btn-warning">Düzenle</a></td>
													<%
													}
												%>
													<td><a
														href='<s:url value="/sinifdetay/${ snf.getSinifId() }"></s:url>'
														class="btn btn-warning">Detay</a></td>


												</tr>

											</c:forEach>

										</c:if>


									</tbody>
								</table>
							</div>

						</div>
						<!-- /.box -->
					</div>
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->

		</div>
		<!-- /.content-wrapper -->


		
	<jsp:include page="${request.contextPath}/footer"></jsp:include>
	</div>
	<!-- ./wrapper -->

	<jsp:include page="${request.contextPath}/js"></jsp:include>


</body>
</html>