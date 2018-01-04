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
				<h1>Sınıf Detay</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->

				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Sınıf Detay</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="col-md-12">
								<form role="form" id="sinifDetay">
									<div class="form-group">
										<label>Sınıf Adı</label> <input type="text" name="sinifAdi"  value='<c:out value="${ snfDetay.getSinifAdi() }"></c:out>'
											class="form-control" name="sinifAdi"
											placeholder="Sınıf Adı Giriniz" disabled>
									</div>
									<input type="hidden" name="sinifId" value='<c:out value="${ snfDetay.getSinifId() }"></c:out>' >
									<div class="form-group">
										<label>Öğrenci Sayısı</label> <input type="number" 
											class="form-control" name="ogrenciSayisi"  value='<c:out value="${ snfDetay.getOgrenciSayisi() }"></c:out>'
											placeholder="Öğrenci Sayısı Giriniz" disabled>
									</div>
			
									<!-- /.box-body -->
								</form>
							</div>
						</div>

						<div class="box-footer">
							<div class="row">
								<div class="col-xs-12">
				
							

								</div>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
			
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
										<th>Sınıf</th>
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
	$(document).ready(function() {
		$('#btnDetay').click(function(){
			var sinif = $('#sinifDetay').serialize();
			$.ajax({
				url :'<s:url value="/sinifdetay"></s:url>',
				type :"post",
				data : sinif,
				success : function(sonuc){
					alert(sonuc);
				}
				
			});
	});
	});
</script>

</body>
</html>
