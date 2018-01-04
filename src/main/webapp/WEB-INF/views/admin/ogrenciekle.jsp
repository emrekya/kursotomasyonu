<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
					Öğrenci Ekleme <small>Kurs Otomasyon</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Yönetim</a></li>
					<li class="active">Yönetime Git</li>
				</ol>
			</section>
			<!-- /.col (left) -->

			<!-- Main content -->
			<section class="content">

				<!-- general form elements disabled -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Öğrenci Bilgileri</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<form role="form" id="frmOgrenci">
							<div class="row">
								<div class="col-md-12">
									<div class="col-xs-4">
										<div class="form-group">

											<label for="#">Tc Kimlik</label> <input type="text"
												name="ogrTC" id="ogrTC" placeholder="Tc Kimlik"
												class="form-control" data-inputmask='"mask":"99999999999"'
												data-mask />

										</div>
										<div class="form-group">
											<label for="#">Adı</label> <input type="text" name="ogrAdi"
												placeholder="Adı" class="form-control" />
										</div>
										<div class="form-group">
											<label for="#">Soyadı</label> <input type="text"
												name="ogrSoyadi" placeholder="Soyadı" class="form-control" />
										</div>

										<div class="form-group">
											<label>Doğum Tarihi:</label>

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


										<!-- phone mask -->
										<div class="form-group">
											<label>Telefon</label>

											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-phone"></i>
												</div>
												<input type="text" class="form-control" name="ogrTelefon"
													data-inputmask='"mask":"(999) 999-9999"' data-mask>
											</div>
											<!-- /.input group -->
										</div>
										<%
											Date date = new java.util.Date();
											pageContext.setAttribute("date", date);
										%>
										<c:set var="date" value="${ date }" />
										<div class="form-group">
											<label>Kayıt Tarihi:</label>

											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" class="form-control pull-right"
													name="ogrKayitTarihii" id="datepicker1"
													value='<fmt:formatDate pattern="dd/MM/yyyy" value="${ date }"/>'
													disabled>
											</div>

											<!-- /.input group -->
										</div>
										<input type="hidden" name="ogrKayitTarihi"
											value='<fmt:formatDate pattern="dd/MM/yyyy" value="${ date }"/>'>


									</div>

									<div class="col-xs-4">
										<div class="form-group">
											<label for="#">Okul</label> <input type="text" name="ogrOkul"
												placeholder="Okul Adı" class="form-control" />
										</div>

										<div class="form-group">
											<label for="#">Bölüm</label> <input type="text"
												name="ogrBolum" placeholder="Bölüm" class="form-control" />
										</div>

										<div class="form-group">
											<label>Öğrenim Durumu</label> <select name="ogrDurumu"
												class="form-control">
												<option>İlkokul</option>
												<option>Ortaokul</option>
												<option>Lise</option>
												<option>Lisans</option>
												<option>Yüksek Lisans</option>
											</select>
										</div>

										<c:if test="${not empty lsSiniflar }">
											<div class="form-group">
												<label>Sınıf Adı</label> <select name="ogrSinifAdi"
													class="form-control">
													<c:forEach items="${lsSiniflar}" var="snf">

														<option value=<c:out value="${snf.getSinifId()}"></c:out>><c:out
																value="${snf.getSinifAdi()}"></c:out></option>
													</c:forEach>
												</select>
											</div>

										</c:if>
										<div class="form-group">
											<label for="#">E-Mail</label>
											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-envelope"></i>
												</div>
												<input type="text" name="ogrEMail" placeholder="E-Mail"
													class="form-control" />
											</div>
										</div>
										<div class="form-group">
											<label>Mezun Tarihi:</label>

											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" class="form-control pull-right"
													name="ogrMezunTarihi" id="datepicker"
													data-inputmask="'alias': 'dd/mm/yyyy'" data-mask=""
													disabled>
											</div>

											<!-- /.input group -->
										</div>

									</div>
									<div class="col-xs-4">
										<label>Öğrenci Resim</label>
										<div class="form-group">

											<img class="profile-user-img img-responsive img-regtangle"
												style="width: 200px; height: 200px"
												src='<c:out value="resources/dist/img/emptyhoto.png"></c:out>'
												alt="User profile picture">
										</div>
										<div class="form-group">

											<div id="acil" style="">
												<iframe id="resim" src=""
													style="width: 100%; height: 150px;" frameborder="0"></iframe>

											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="col-xs-8">
										<div class="form-group">
											<label for="#">Adres </label>
											<textarea name="ogrAdres" placeholder="Adres"
												class="form-control" rows="3"></textarea>
										</div>
									</div>
									<div class="col-xs-4">
										<label id="lblResimBilgi">Resim yüklemek için önce
											kaydı tamamlamalısınız! </label>
										<div class="form-group">

											<button type="button" id="btnKaydetOgr"
												class="btn btn-block btn-success">Kaydet</button>
										</div>
									</div>
								</div>
							</div>
						</form>

					</div>
					<!-- /.box-body -->
				</div>
			</section>
			<!-- /.content-wrapper -->
		</div>

		<!-- /.content -->
		<jsp:include page="${request.contextPath}/footer"></jsp:include>
	</div>






	<jsp:include page="${request.contextPath}/js"></jsp:include>



	<!-- Page script-->
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
	<script>
		$('#btnKaydetOgr')
				.click(
						function() {
							var ogrenci = $('#frmOgrenci').serialize();

							//ajax
							$
									.ajax({

										url : '<s:url value="/ogrencikaydet"></s:url>',
										type : "post",
										data : ogrenci,
										success : function(yanit) {
											alert(yanit);
											if (yanit) {
												alert($('#datepicker1').val());
												$('#lblResimBilgi')
														.val(
																"Kayıt Başarılı Resim Yükleyebilirsiniz")
												$("#lblResimBilgi")
														.html(
																"Kayıt Başarılı Resim Yükleyebilirsiniz")

												alert("Kayıt Başarılı");
												var tc = $('#ogrTC').val();
												var yaz = 'http://localhost:8080/resimogrenci/index.php?resim_id='
														+ tc;
												$('#resim').attr('src', yaz);
												$('#acil').show();

											}
										}
									});
						});
	</script>
</body>
</html>
