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
					Yoklama Raporlar Sınıf Listesi <small>Kurs Otomasyon</small>
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
								<h3 class="box-title">Sınıf Adı</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="col-xs-6">
									<c:if test="${not empty lsSiniflar }">
									<label> Sınıf Seç:</label>
										<div class="form-group">
											<select id="SinifAdi" class="form-control">
												<option>Sınıf Seç</option>
												<c:forEach items="${lsSiniflar}" var="snf">

													<option value=<c:out value="${snf.getSinifId()}"></c:out>><c:out
															value="${snf.getSinifAdi()}"></c:out></option>
												</c:forEach>
											</select>
										</div>

									</c:if>
								</div>
									<div class="col-xs-4	">
								<div class="form-group">
									<label> Tarihi Seç:</label>

									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control pull-right"
											name="ogrDogumTarihi" id="datepicker"
											data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="">
									</div>

									<!-- /.input group -->
								</div>
								</div>
								<div class="col-xs-2">
									<div class="form-group">
										<button type="button" id="sinifsec"
											class="btn btn-block btn-success">Sınıf Seç</button>
									</div>
								</div>
							</div>

						</div>
						<div class="box box-info">
							<div class="box-header with-border" align="left">
								<label class="box-title" id="lblSinifBilgisi">Sınıf
									Listesi </label>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<form id="yoklamaKaydet" action="yoklamakaydet">
									<table class="table table-bordered">
										<tr>
											<th style="width: 10px">Sıra</th>
											<th>TC</th>
											<th>Adı</th>
											<th>Soyadı</th>
											<th>Gelmedi</th>
											<th>Raporlu</th>
											<th>İzinli</th>
											<th>Toplam</th>
											<th>Detay</th>
										</tr>
										<tbody id="ekleYaz">
											<c:if test="${ not empty yoklamaListesi }">
												<c:forEach items="${ yoklamaListesi }" var="yoklama">
													<tr>
														<td><c:out value="${ yoklama.getSira() }"></c:out></td>
														<td><c:out value="${ yoklama.getOgrTC() }"></c:out></td>
														<td><c:out value="${ yoklama.getOgrAdi() }"></c:out></td>
														<td><c:out value="${ yoklama.getOgrSoyadi() }"></c:out></td>
														<td><c:out value="${ yoklama.getOgrGelmedi() }"></c:out></td>
														<td><c:out value="${ yoklama.getOgrRaporlu() }"></c:out></td>
														<td><c:out value="${ yoklama.getOgrIzinli() }"></c:out></td>
														<td><c:out value="${ yoklama.getOgrToplam() }"></c:out></td>
														<td><a
															href='<s:url value="/yoklamaogrencidetay/${ yoklama.getOgrId() }"></s:url>'
															class="btn btn-info">Detay</a></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>

									</table>
								</form>
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

	<script>
		$(function() {
			//Date picker
			$('#datepicker').datepicker({
				autoclose : true
			})
			$('[data-mask]').inputmask()
			//Datemask dd/mm/yyyy
			$('#datemask').inputmask('dd/mm/yyyy', {
				'placeholder' : 'dd/mm/yyyy'
			})
		});
	</script>
</body>
</html>