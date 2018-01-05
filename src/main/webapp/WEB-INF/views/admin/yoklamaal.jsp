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
					Sınıf Listesi <small>Kurs Otomasyon</small>
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
								<div class="col-xs-2">
									<div class="form-group">
										<button type="button" id="sinifsec"
											class="btn btn-block btn-success">Sınıf Seç</button>
									</div>
								</div>
							</div>

						</div>
						<!-- /.box -->
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
											<th>Geldi</th>
											<th>Gelmedi</th>
											<th>Raporlu</th>
											<th>İzinli</th>
										</tr>
										<tbody id="ekleYaz">
										</tbody>

									</table>
									<div class="form-group">
										<button type="submit" id="yoklamayikaydet"
											class="btn btn-block btn-success">Yoklamayı Kaydet</button>
									</div>
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
		$('#sinifsec')
				.click(
						function() {
							var SinifAdi = $('#SinifAdi').val();
							var lblsinif = $('#SinifAdi option:selected')
									.html();

							//ajax
							$
									.ajax({
										url : '<s:url value="/yoklamasinifgetir"></s:url>',
										type : "post",
										data : {
											"SinifAdi" : SinifAdi
										},
										success : function(yanit) {
											if (yanit == "hata") {
												$('#lblSinifBilgisi')
														.html(
																lblsinif
																		+ " sınıfının  yoklaması daha önce alınmıştır");
												$('#ekleYaz').html("");
											} else {
												$('#lblSinifBilgisi')
														.html(
																lblsinif
																		+ " Sınıf Listesi");
												$('#yoklamaKaydet')
														.attr(
																'action',
																("yoklamakaydet/" + SinifAdi));
												$('#ekleYaz').html(yanit);
											}
										}
									});

						});
	</script>
</body>
</html>