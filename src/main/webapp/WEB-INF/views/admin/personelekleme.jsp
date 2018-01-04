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
					Personel Ekleme <small>Kurs Otomasyon</small>
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

						<!-- general form elements disabled -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Personel Bilgileri</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<form role="form" id="frmPersonel">

									<div class="col-xs-4">
										<div class="form-group">
											<label for="#">Tc Kimlik</label> <input type="text"
												name="perTC" id="perTC" placeholder="Tc Kimlik"
												class="form-control" data-inputmask='"mask":"99999999999"'
												data-mask autocomplete=off />

										</div>
										<div class="form-group">
											<label for="#">Giriş Şifresi</label> <input type="password"
												name="perSifre" id="perParola" placeholder="Giriş Şifresi"
												class="form-control" autocomplete=off />

										</div>
										<div class="form-group">
											<label for="#">Adı</label> <input type="text" name="perAdi"
												placeholder="Adı" class="form-control" />
										</div>
										<div class="form-group">
											<label for="#">Soyadı</label> <input type="text"
												name="perSoyadi" placeholder="Soyadı" class="form-control" />
										</div>
										<div class="form-group">
											<label>Doğum Tarihi:</label>

											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" class="form-control pull-right"
													name="perDogumTarihi" id="datepicker"
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
												<input type="text" class="form-control" name="perTelefon"
													data-inputmask='"mask":"(999) 999-9999"' data-mask />
											</div>
											<!-- /.input group -->
										</div>
										<!-- /.form group -->
										<div class="form-group">
											<label for="#">E-Mail</label>
											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-envelope"></i>
												</div>
												<input type="text" name="perEMail" placeholder="E-Mail"
													class="form-control" />
											</div>
										</div>
									</div>

									<div class="col-xs-4">
										<div class="form-group">
											<label>Öğrenim Durumu</label> <select name = "perOgrenimDurumu" class="form-control">
												<option>Ön Lisans</option>
												<option>Lisans</option>
												<option>Yüksek Lisans</option>
												<option>Doktora</option>
											</select>
										</div>
										<div class="form-group">
											<label for="#">Bitirdiği Okul</label> <input type="text"
												name="perBitirdigiOkul" placeholder="Bitirdiği Okul"
												class="form-control" />
										</div>
										<div class="form-group">
											<label for="#">Branş</label> <input type="text"
												name="perBrans" placeholder="Branş" class="form-control" />
										</div>
										<div class="form-group">
											<label for="#">Banka Adı</label> <input type="text"
												name="perBankaAdi" placeholder="Banka Adı"
												class="form-control" />
										</div>
										<div class="form-group">
											<label for="#">IBAN </label> <input type="text"
												name="perIBAN" placeholder="IBAN" class="form-control" />
										</div>
										<div class="form-group">
											<label for="#">Maaş </label> <input type="text"
												name="perMaas" placeholder="Maaş" class="form-control" />
										</div>


									</div>

									<div class="col-xs-4">
										<!--  <div class="form-group">

											<img class="profile-user-img img-responsive img-regtangle"
												style="width: 200px; height: 200px" src="#"
												alt="User profile picture">
										</div>-->
										<div class="form-group">
											<label>Personel Resim</label>
											<div id="acil" style="">
												<iframe id="resim" src=""
													style="width: 100%; height: 350px;" frameborder="0"></iframe>

											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="col-xs-8">
												<div class="form-group">
													<label for="#">Adres </label>
													<textarea name="perAdres" placeholder="Adres"
														class="form-control" rows="3">
														</textarea>
												</div>
											</div>
											<div class="col-xs-4">
												<div class="form-group">
													<br> <br> <br>
													<button type="button" id="btnKaydet"
														class="btn btn-block btn-success">Kaydet</button>
												</div>
											</div>
										</div>
									</div>
								</form>

							</div>
							<!-- /.box-body -->
						</div>

					</div>
					<!--/.col (right) -->
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


	<!-- Page script-->
	<script>
		$(function() {
			//Date picker
			$('#datepicker').datepicker({
				autoclose : true
			})

		})
	</script>
	<script>
		$(document)
				.ready(
						function() {

							// perTC değiştiğinde yapılacak işlemler
							$('#perTC')
									.change(
											function() {
												var tc = $('#perTC').val();
												var yaz = "http://localhost:8080/resim/index.php?resim_id="
														+ tc;
												$('#resim').attr('src', yaz);
												$('#acil').show();
											});

							$('#btnKaydet')
									.click(
											function() {
												var personel = $('#frmPersonel')
														.serialize();
												//ajax
												$
														.ajax({
															url : '<s:url value="/personelkaydet"></s:url>',
															type : "post",
															data : personel,
															success : function(
																	yanit) {
																alert(yanit);
															}
														});

											});
							$('[data-mask]').inputmask()
							//Datemask dd/mm/yyyy
							$('#datemask').inputmask('dd/mm/yyyy', {
								'placeholder' : 'dd/mm/yyyy'
							})
						});
	</script>
</body>
</html>
