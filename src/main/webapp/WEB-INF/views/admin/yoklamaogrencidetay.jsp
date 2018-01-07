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
					Devamsızlık Detay <small>Kurs Otomasyon</small>
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
							<div class="box-header with-border" align="left">
								<label class="box-title" id="lblSinifBilgisi">Öğrenci
									Bilgisi </label>
							</div>
							<div class="box-body">

								<c:if test="${ not empty ogrDetay }">
									<div class="col-xs-3">
										<div class="form-group">
											<label for="#">Tc Kimlik</label> <input type="text"
												value='<c:out value="${ ogrDetay.getOgrTC() }"></c:out>'
												name="ogrGuncelleTC" id="ogrTC" placeholder="Tc Kimlik"
												class="form-control" data-inputmask='"mask":"99999999999"'
												data-mask disabled />

										</div>
									</div>
									<div class="col-xs-3">
										<div class="form-group">
											<label for="#">Adı</label> <input type="text"
												value='<c:out value="${ ogrDetay.getOgrAdi() }"></c:out>'
												name="ogrAdi" placeholder="Adı" class="form-control"
												disabled />
										</div>
									</div>
									<div class="col-xs-3">
										<div class="form-group">
											<label for="#">Soyadı</label> <input type="text"
												value='<c:out value="${ ogrDetay.getOgrSoyadi() }"></c:out>'
												name="ogrSoyadi" placeholder="Soyadı" class="form-control"
												disabled />
										</div>
									</div>
									<div class="col-xs-3">
										<div class="form-group">
											<label for="#">Sınıf Adı</label> <input type="text"
												value='<c:out value="${ ogrDetay.getOgrSinifAdi() }"></c:out>'
												name="ogrSinif" placeholder="Sınıfı" disabled
												class="form-control" />
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="box box-info">
							<div class="box-header with-border" align="left">
								<label class="box-title" id="lblSinifBilgisi">Öğrenci
									Gelmediği Günler </label>
							</div>

							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-bordered">
									<tr>
										<th>Tarih</th>
										<th>Gelmeme Sebebi</th>
									</tr>
									<tbody>
										<c:if test="${ not empty devamsizlikListesi }">
											<c:forEach items="${ devamsizlikListesi }" var="devam">
												<tr>
													<td><c:out value="${ devam.getgTarih() }"></c:out></td>
													<td><c:out value="${ devam.getgSebep() }"></c:out></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>

								</table>
							</div>
						</div>
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