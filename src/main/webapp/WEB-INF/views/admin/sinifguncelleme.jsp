<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sınıf Güncelleme</title>
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
				<h1>Sınıf Güncelle</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="rows">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">Sınıf Ekleme</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="col-md-12">
									<form role="form" id="sinifGuncelle">
										<div class="form-group">
											<label>Sınıf Adı</label> <input type="text" name="sinifAdi"
												value='<c:out value="${ snfDuzenle.getSinifAdi() }"></c:out>'
												class="form-control" name="sinifAdi"
												placeholder="Sınıf Adı Giriniz">
										</div>
										<input type="hidden" name="sinifId"
											value='<c:out value="${ snfDuzenle.getSinifId() }"></c:out>'>
										<div class="form-group">
											<label>Öğrenci Sayısı</label> <input type="number"
												class="form-control" name="ogrenciSayisi"
												value='<c:out value="${ snfDuzenle.getOgrenciSayisi() }"></c:out>'
												placeholder="Öğrenci Sayısı Giriniz">
										</div>

										<!-- /.box-body -->
									</form>
								</div>
							</div>

							<div class="box-footer">
								<div class="row">
									<div class="col-xs-12">

										<button type="button" class="btn btn-success pull-right"
											id="btnGuncelle" style="margin-right: 5px;">
											<i class="fa fa-download"></i> Guncelle
										</button>

									</div>
								</div>
							</div>
							<!-- /.box-body -->
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
		$(document).ready(function() {
			$('#btnGuncelle').click(function() {
				var sinif = $('#sinifGuncelle').serialize();
				$.ajax({
					url : '<s:url value="/sinifguncellekaydet"></s:url>',
					type : "post",
					data : sinif,
					success : function(sonuc) {
						alert(sonuc);
					}

				});
			});
		});
	</script>

</body>
</html>
