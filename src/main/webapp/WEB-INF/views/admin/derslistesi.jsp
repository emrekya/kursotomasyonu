<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kurs Otomasyon - Ders Listesi</title>
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
				Ders Listesi <small>Kurs Otomasyon</small>
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

				<div class="col-lg-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Ders Listesi</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table class="table table-striped">
								<tbody>
									<tr>
										<th style="width: 10px">Sıra</th>
										<th>Ders Adı</th>
										<th>Ders İçeriği</th>


									</tr>
									<c:if test="${not empty lsDersler }">
										<c:forEach items="${lsDersler}" var="drs">
											<tr>
												<td><c:out value="${ drs.getDersSira() }"></c:out></td>

												<td><c:out value="${drs.getDersAdi() }"></c:out></td>
												<td><c:out value="${drs.getDersIcerigi() }"></c:out></td>

												<td><a
													href='<s:url value="/dersguncelleme/${ drs.getDersId() }"></s:url>'
													class="btn btn-warning">Düzenle</a></td>

											</tr>

										</c:forEach>

									</c:if>
									<tr>
								</tbody>
							</table>
						</div>

						<!-- /.box-body -->
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right">
								<li><a href="#">«</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">»</a></li>
							</ul>

						</div>
					</div>

					<!-- /.box -->


					<!-- /.box -->
				</div>








			</div>
			<!-- /.row --> </section>
			<!-- /.content -->

		</div>
		<!-- /.content-wrapper -->


		<jsp:include page="${request.contextPath}/footer"></jsp:include>

	</div>
	<!-- ./wrapper -->

	<jsp:include page="${request.contextPath}/js"></jsp:include>


</body>
</html>
