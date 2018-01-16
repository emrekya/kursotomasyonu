<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
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
					Ders Öğretmeni Atama <small>Kurs Otomasyon</small>
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
					<c:if test="${ not empty DersBilgisi }">
						<div class="col-md-12">
							<div class="box">
								<div class="box-header with-border">
									<h3 class="box-title">Ders Bilgisi</h3>
								</div>
								<div class="box-body">
									<div class="col-xs-6">

										<div class="form-group">
											<label>Ders Adı</label> <input type="text" name="dersAdi"
												value='<c:out value="${ DersBilgisi.getDersAdi() }"></c:out>'
												class="form-control" name="dersAdi"
												placeholder="Ders Adı Giriniz" disabled>
										</div>
										<input type="hidden" name="dersId"
											value='<c:out value="${ DersBilgisi.getDersId() }"></c:out>'>

									</div>
									<div class="col-xs-6">
										<div class="form-group">
											<label>Ders İçeriği</label> <input type="text"
												name="dersIcerigi"
												value='<c:out value="${ DersBilgisi.getDersIcerigi() }"></c:out>'
												class="form-control" name="dersIcerigi"
												placeholder="Ders İçeriği Giriniz" disabled>
										</div>
									</div>


								</div>
								<!-- /.row -->
							</div>
						</div>
						<div class="col-md-12">
							<div class="box">
								<div class="box-header with-border">
									<h3 class="box-title">Öğretmen Listesi</h3>
								</div>
								<div class="box-body">
									<table class="table table-striped">

										<tr>
											<th style="width: 10px">Sıra</th>
											<th>TC</th>
											<th>Adı</th>
											<th>Soyadı</th>
											<th>Branş</th>
											<th>Görevi</th>
											<th>İşlem</th>
										</tr>
										<tbody>
											<c:if test="${ not empty OgretmenListesi }">

												<c:forEach var="personel" items="${ OgretmenListesi }">
													<tr>
														<td><c:out value="${ personel.getPerSira() }"></c:out></td>
														<td><c:out value="${ personel.getPerTC() }"></c:out></td>
														<td><c:out value="${ personel.getPerAdi() }"></c:out></td>
														<td><c:out value="${ personel.getPerSoyadi() }"></c:out></td>
														<td><c:out value="${ personel.getPerBrans() }"></c:out></td>
														<td><c:out value="${ personel.getPerGorev() }"></c:out></td>

														<c:if test="${ personel.isPerDersOgretmeni()==true }">
															<td><a
																href='<s:url value="/dersogretmenikaydet/${ DersBilgisi.getDersId() }/${ personel.getPerID() }"></s:url>'
																class="btn btn-danger">Sil</a></td>
														</c:if>
														<c:if test="${ personel.isPerDersOgretmeni()==false }">
															<td><a
																href='<s:url value="/dersogretmenikaydet/${ DersBilgisi.getDersId() }/${ personel.getPerID() }"></s:url>'
																class="btn btn-success">Seç</a></td>
														</c:if>
													</tr>

												</c:forEach>

											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</c:if>





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