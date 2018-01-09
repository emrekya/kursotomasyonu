<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Ders Ekleme</title>
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
				<h1>Ders Ekle</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->

				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Ders Ekleme</h3>
						</div>

						<!-- /.box-header -->
						<div class="box-body">
							<div class="col-md-12">
								<form role="form" id="dersGuncelleme">
									<div class="form-group">
										<label>Ders Adı</label> <input type="text" name="dersAdi"
											value='<c:out value="${ drsDuzenle.getDersAdi() }"></c:out>'
											class="form-control" name="dersAdi"
											placeholder="Ders Adı Giriniz">
									</div>
									<input type="hidden" name="dersId"
										value='<c:out value="${ drsDuzenle.getDersId() }"></c:out>'>
									<div class="form-group">
										<label>Ders İçeriği</label> <input type="text"
											name="dersIcerigi"
											value='<c:out value="${ drsDuzenle.getDersIcerigi() }"></c:out>'
											class="form-control" name="dersIcerigi"
											placeholder="Ders İçeriği Giriniz">
									</div>


									<!-- /.box-body -->
									<div class="box-footer">
										<div class="row">
											<div class="col-xs-12">


												<button type="button" id="btnEkle"
													class="btn btn-success pull-right"
													style="margin-right: 5px;">
													<i class="fa fa-download"></i> Güncelle
												</button>

											</div>
										</div>
									</div>
									<!-- /.box-body -->
								</form>
							</div>
							<!-- /.row -->
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
			$('#btnEkle').click(function() {
				var ders = $('#dersGuncelleme').serialize();
				$.ajax({
					url : '<s:url value="/dersguncellekaydet"></s:url>',
					type : "post",
					data : ders,
					success : function(sonuc) {
						alert(sonuc);
					}

				});
			});
		});
	</script>
</body>
</html>
