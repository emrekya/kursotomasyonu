<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin Yönetim Paneli</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

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
					Öğrenci Listeleme <small>Spring MVC</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Yönetim</a></li>
					<li class="active">Yönetime Git</li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<!-- /.col (left) -->
					<div class="col-md-12">
						<div class="col-md-4">
							<div class="box box-primary">

								<div class="box-body">
									<div class="form-group">
										<label>TC Numarası</label> <input type="text"
											class="form-control" id="ogrenciTC"
											placeholder="Tc Kimlik Numarasını Giriniz">
									</div>
									<button id="btnTcArama" class="btn btn-primary pull-right">Arama
										Yap</button>


								</div>
								<!-- /.box-body -->


							</div>
						</div>
						<div class="col-md-4">
							<div class="box box-primary">

								<div class="box-body">
									<div class="form-group">
										<label>Adı</label> <input type="text" class="form-control"
											id="ogrenciAdi" placeholder="Adınızı Giriniz">
									</div>
									<button id="btnAdiArama" class="btn btn-primary pull-right">Arama
										Yap</button>


								</div>
								<!-- /.box-body -->


							</div>
						</div>
						<div class="col-md-4">
							<div class="box box-primary">

								<div class="box-body">
									<div class="form-group">
										<label>Sınıf Adı</label>
										<c:if test="${not empty lsSiniflar }">

											<select name="SinifAdi" class="form-control" id="SinifAdi">
											<option value="">Sınıf Seçiniz</option>
												<c:forEach items="${lsSiniflar}" var="snf">

													<option value=<c:out value="${snf.getSinifId()}"></c:out>><c:out
															value="${snf.getSinifAdi()}"></c:out></option>
												</c:forEach>
											</select>


										</c:if>
									</div>
									<button id="btnSinifArama" class="btn btn-primary pull-right">Arama
										Yap</button>


								</div>
								<!-- /.box-body -->


							</div>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Öğrenci Listesi</h3>
							</div>

							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-bordered">
									<tr>
									
										<th style="width: 10px">Sıra</th>
										<th>TC</th>
										<th>Adı</th>
										<th>Soyadı</th>
										<th>Doğum Tarihi</th>
										<th>Telefon</th>
										<th>EMail</th>
										<th>Öğrenim Durumu</th>
										<th>Sınıfı</th>
										<th colspan=2>İşlemler</th>
										
									</tr>
									<tbody id="ekleYaz">
										<c:if test="${ not empty lsOgrenci }">
											<c:forEach items="${ lsOgrenci }" var="ogr">
												<tr>

													<td><c:out value="${ ogr.getOgrSira() }"></c:out></td>
													<td><c:out value="${ ogr.getOgrTC() }"></c:out></td>
													<td><c:out value="${ ogr.getOgrAdi() }"></c:out></td>
													<td><c:out value="${ ogr.getOgrSoyadi() }"></c:out></td>
													<td><c:out value="${ ogr.getOgrDogumTarihi() }"></c:out></td>
													<td><c:out value="${ ogr.getOgrTelefon() }"></c:out></td>
													<td><c:out value="${ ogr.getOgrEMail() }"></c:out></td>
													<td><c:out value="${ ogr.getOgrDurumu() }"></c:out></td>
													<td><c:out value="${ ogr.getOgrSinifAdi() }"></c:out></td>
													<td><a
														href='<s:url value="/ogrencimezundetay/${ ogr.getOgrID() }"></s:url>'
														class="btn btn-warning">Detay</a></td>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
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

			var ogrenciTC = $('#ogrenciTC').val();

			//ajax
			$.ajax({
				url : '<s:url value="/ogrencimezuntcara"></s:url>',
				type : "post",
				data : {
					"ogrenciTC" : ogrenciTC
				},
				success : function(yanit) {
					$('#ekleYaz').html(yanit);
				}
			});

		});

		$('#btnAdiArama').click(function() {
			var ogrenciAdi = $('#ogrenciAdi').val();
			//ajax
			$.ajax({
				url : '<s:url value="/ogrencimezunadiara"></s:url>',
				type : "post",
				data : {
					"ogrenciAdi" : ogrenciAdi
				},
				success : function(yanit) {

					$('#ekleYaz').html(yanit);
				}
			});

		});
		
		$('#btnSinifArama').click(function() {
			var SinifAdi = $('#SinifAdi').val();
			//ajax
			$.ajax({
				url : '<s:url value="/ogrencimezunsinifara"></s:url>',
				type : "post",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
		        scriptCharset: "utf-8",
				data : {
					"SinifAdi" : SinifAdi
				},
				success : function(yanit) {
					
					$('#ekleYaz').html(yanit);
				}
			});

		});
	</script>
</body>
</html>
