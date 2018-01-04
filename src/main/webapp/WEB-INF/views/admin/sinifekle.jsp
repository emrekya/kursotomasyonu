<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sınıf Ekleme</title>
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
				<h1>Sınıf Ekle</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->

				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Sınıf Ekleme</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="col-md-12">
								<form role="form" id="sinifKaydet">
									<div class="form-group">
										<label>Sınıf Adı</label> <input type="text"
											class="form-control" name="sinifAdi"
											placeholder="Sınıf Adı Giriniz">
									</div>
									<div class="form-group">
										<label>Öğrenci Sayısı</label> <input type="number"
											class="form-control" name="ogrenciSayisi"
											placeholder="Öğrenci Sayısı Giriniz">
									</div>
									<div class="form-group">
										<label>Seviye</label> <select
											class="form-control select2 select2-hidden-accessible"
											style="width: 100%;" tabindex="-1" aria-hidden="true"
											name="sinifSeviye">
											<option selected="selected">Seçiniz</option>
											<option>Seviye 1</option>
											<option>Seviye 2</option>
											<option>Seviye 3</option>
											<option>Seviye 4</option>
										</select>
									
									<!-- /.box-body -->
								</form>
							</div>
						</div>

						<div class="box-footer">
							<div class="row">
								<div class="col-xs-12">

									<button type="button" class="btn btn-success pull-right"
										id="btnEkle" style="margin-right: 25px;">
										<i class="fa fa-download"></i> Ekle
									</button>

								</div>
							</div>
						</div>
						<!-- /.box-body -->
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
			$('#btnEkle').click(function() {
				var sinif = $('#sinifKaydet').serialize();
				$.ajax({
					url : '<s:url value="/sinifkaydet"></s:url>',
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
