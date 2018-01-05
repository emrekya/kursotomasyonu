<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kurs Otomasyon - Personel Listesi</title>
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
					Personel Listesi <small>Kurs Otomasyon</small>
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
					<!-- /.col (left) -->
					<div class="col-md-12">
						<div class="col-md-6">
							<div class="box box-primary">

								<div class="box-body">
									<div class="form-group">
										<label>TC Numarası</label> <input type="text"
											class="form-control" id="personelTC"
											placeholder="Tc Kimlik Numarasını Giriniz">
									</div>
									<button id="btnTcArama" class="btn btn-primary pull-right">Arama
										Yap</button>


								</div>
								<!-- /.box-body -->


							</div>
						</div>
						<div class="col-md-6">
							<div class="box box-primary">

								<div class="box-body">
									<div class="form-group">
										<label>Adı</label> <input type="text" class="form-control"
											id="personelAdi" placeholder="Adınızı Giriniz">
									</div>
									<button id="btnAdiArama" class="btn btn-primary pull-right">Arama
										Yap</button>


								</div>
								<!-- /.box-body -->


							</div>
						</div>
					</div>

				</div>
				<div class="row">

					<div class="col-md-12">
						<div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">Personel Listesi</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-bordered">

									<tr>
										<th style="width: 10px">Sıra</th>
										<th>TC Kimlik</th>
										<th>Adı</th>
										<th>Soyadı</th>
										<th>Telefon</th>
										<th>Branş</th>
										<th>Görevi</th>
										
									</tr>
									<tbody id="ekleYaz">
										<c:if test="${ not empty personelListesi }">

											<c:forEach var="personel" items="${ personelListesi }">
												<tr>
													<td><c:out value="${ personel.getPerSira() }"></c:out></td>
													<td><c:out value="${ personel.getPerTC() }"></c:out></td>
													<td><c:out value="${ personel.getPerAdi() }"></c:out></td>
													<td><c:out value="${ personel.getPerSoyadi() }"></c:out></td>
													<td><c:out value="${ personel.getPerTelefon() }"></c:out></td>
													<td><c:out value="${ personel.getPerBrans() }"></c:out></td>
													<td><c:out value="${ personel.getPerGorev() }"></c:out></td>
													
													<td><a
														href='<s:url value="/personeldetay/${ personel.getPerID() }"></s:url>'
														class="btn btn-warning">Detay</a> <a
														href='<s:url value="/personelguncelleme/${ personel.getPerID() }"></s:url>'
														class="btn btn-success">Düzenle</a> <c:if
															test="${ personel.getPerAktiflik()==1 }">
															<a
																href='<s:url value="/personeldurumaktif/${ personel.getPerID() }"></s:url>'
																class="btn btn-success">Aktif</a>
														</c:if> <c:if test="${ personel.getPerAktiflik()==0 }">
															<a
																href='<s:url value="/personeldurumpasif/${ personel.getPerID() }"></s:url>'
																class="btn btn-danger">Pasif</a>
														</c:if></td>
												</tr>

											</c:forEach>

										</c:if>



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
	<script>
		$('#btnTcArama').click(function() {

			var personelTC = $('#personelTC').val();

			//ajax
			$.ajax({
				url : '<s:url value="/personeltcara"></s:url>',
				type : "post",
				data : {
					"personelTC" : personelTC
				},
				success : function(yanit) {
					$('#ekleYaz').html(yanit);
				}
			});

		});

		$('#btnAdiArama').click(function() {
			var personelAdi = $('#personelAdi').val();
			//ajax
			$.ajax({
				url : '<s:url value="/personeladiara"></s:url>',
				type : "post",
				data : {
					"personelAdi" : personelAdi
				},
				success : function(yanit) {

					$('#ekleYaz').html(yanit);
				}
			});

		});
	</script>


</body>
</html>