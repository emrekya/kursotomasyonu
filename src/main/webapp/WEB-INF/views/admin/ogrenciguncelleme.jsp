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
					Öğrenci Güncelleme <small>Kurs Otomasyon</small>
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

						<!-- general form elements  -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Öğrenci Bilgileri</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<form role="form" id="frmOgrenciDuzenle">
									<c:if test="${ not empty ogrDetay }">
										<div class="col-xs-4">
											<div class="form-group">

												<label for="#">Tc Kimlik</label> <input type="text"
													value='<c:out value="${ ogrDetay.getOgrTC() }"></c:out>'
													name="ogrGuncelleTC" id="ogrTC" placeholder="Tc Kimlik"
													class="form-control" data-inputmask='"mask":"99999999999"'
													data-mask disabled />

											</div>
											<div class="form-group">
												<label for="#">Adı</label> <input type="text"
													value='<c:out value="${ ogrDetay.getOgrAdi() }"></c:out>'
													name="ogrAdi" placeholder="Adı" class="form-control"
													disabled />
											</div>
											<div class="form-group">
												<label for="#">Soyadı</label> <input type="text"
													value='<c:out value="${ ogrDetay.getOgrSoyadi() }"></c:out>'
													name="ogrSoyadi" placeholder="Soyadı" class="form-control"
													disabled />
											</div>

											<div class="form-group">
												<label>Doğum Tarihi:</label>

												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text"
														value='<c:out value="${ ogrDetay.getOgrDogumTarihi() }"></c:out>'
														class="form-control pull-right" name="ogrDogumTarihi"
														id="datepicker" disabled>
												</div>

											</div>


											<!-- phone mask -->
											<div class="form-group">
												<label>Telefon</label>

												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-phone"></i>
													</div>
													<input type="text"
														value='<c:out value="${ ogrDetay.getOgrTelefon() }"></c:out>'
														class="form-control" name="ogrTelefon"
														data-inputmask='"mask":"(999) 999-9999"' data-mask>
												</div>
												<!-- /.input group -->
											</div>
											<div class="form-group">
												<label>Kayıt Tarihi:</label>

												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text"
														value='<c:out value="${ ogrDetay.getOgrKayitTarihi() }"></c:out>'
														class="form-control pull-right" name="ogrKayitTarihi"
														id="datepicker" disabled>
												</div>

											</div>
										</div>

										<div class="col-xs-4">
											<div class="form-group">
												<label for="#">Okul</label> <input type="text"
													value='<c:out value="${ ogrDetay.getOgrOkul() }"></c:out>'
													name="ogrOkul" placeholder="Okul Adı" class="form-control" />
											</div>

											<div class="form-group">
												<label for="#">Bölüm</label> <input type="text"
													value='<c:out value="${ ogrDetay.getOgrBolum() }"></c:out>'
													name="ogrBolum" placeholder="Bölüm" class="form-control" />
											</div>
											<input type="hidden" name="ogrID"
												value='<c:out value="${ ogrDetay.getOgrID() }"></c:out>'>
											<div class="form-group">
												<label>Öğrenim Durumu</label> <select name="ogrDurumu"
													class="form-control">

													<c:choose>
														<c:when test="${ ogrDetay.getOgrDurumu()=='ilkokul' }">
															<option selected>İlkokul</option>
														</c:when>
														<c:otherwise>
															<option>İlkokul</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${ ogrDetay.getOgrDurumu()=='ortaokul' }">
															<option selected>Ortaokul</option>
														</c:when>
														<c:otherwise>
															<option>Ortaokul</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${ ogrDetay.getOgrDurumu()=='lise' }">
															<option selected>Lise</option>
														</c:when>
														<c:otherwise>
															<option>Lise</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${ ogrDetay.getOgrDurumu()=='lisans' }">
															<option selected>Lisans</option>
														</c:when>
														<c:otherwise>
															<option>Lisans</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when
															test="${ ogrDetay.getOgrDurumu()=='yükseklisans' }">
															<option selected>Yüksek Lisans</option>
														</c:when>
														<c:otherwise>
															<option>Yüksek Lisans</option>
														</c:otherwise>
													</c:choose>

												</select>
											</div>
											<c:if test="${not empty lsSiniflar }">
												<div class="form-group">
													<label>Sınıf Adı</label> <select name="ogrSinifAdi"
														class="form-control">
														<c:forEach items="${lsSiniflar}" var="snf">
															<c:choose>
																<c:when
																	test="${ ogrDetay.getOgrSinifAdi()==snf.getSinifAdi()}">
																	<option
																		value=<c:out value="${snf.getSinifId()}"></c:out>
																		selected><c:out value="${snf.getSinifAdi()}"></c:out></option>
																</c:when>
																<c:otherwise>
																	<option
																		value=<c:out value="${snf.getSinifId()}"></c:out>><c:out
																			value="${snf.getSinifAdi()}"></c:out></option>
																</c:otherwise>
															</c:choose>

														</c:forEach>
													</select>
												</div>

											</c:if>

											<!-- /.form group -->
											<div class="form-group">
												<label for="#">E-Mail</label>
												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-envelope"></i>
													</div>
													<input type="text"
														value='<c:out value="${ ogrDetay.getOgrEMail() }"></c:out>'
														name="ogrEMail" placeholder="E-Mail" class="form-control" />
												</div>
											</div>
											<div class="form-group">
												<label>Mezun Tarihi:</label>

												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text"
														value='<c:out value="${ ogrDetay.getOgrMezunTarihi() }"></c:out>'
														class="form-control pull-right" name="ogrMezunTarihi"
														id="datepicker" disabled>
												</div>

											</div>
										</div>
										<div class="col-xs-4">
											<div class="form-group">
												<label>Öğrenci Resim</label>
												<div class="form-group">
<c:choose>
														<c:when test="${ not empty ogrDetay.getOgrResimAdi() }">
															<img
																class="profile-user-img img-responsive img-regtangle"
																style="width: 200px; height: 200px"
																src="http://localhost:8080/resimogrenci/server/php/files/<c:out value="${ ogrDetay.getOgrTC() }"></c:out>/<c:out value="${ ogrDetay.getOgrResimAdi() }"></c:out>"
																alt="User profile picture">

														</c:when>
														<c:otherwise>
															<img
																class="profile-user-img img-responsive img-regtangle"
																style="width: 200px; height: 200px"
																src='<c:out value="/kursotomasyonu/resources/dist/img/emptyhoto.png"></c:out>'
																alt="User profile picture">
														</c:otherwise>
													</c:choose>
													</div>	
												<div class="form-group">

													<div>
														<iframe id="resim"
															src='http://localhost:8080/resimogrenci/index.php?resim_id=<c:out value="${ ogrDetay.getOgrTC() }"></c:out>'
															style="width: 100%; height: 150px;" frameborder="0"></iframe>

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
															class="form-control" rows="3"><c:out
																value="${ ogrDetay.getOgrAdres() }"></c:out></textarea>
													</div>

												</div>
												<div class="col-xs-4">
													<div class="form-group">
														<br> <br> <br>
														<button type="button" id="btnGuncelleOgr"
															class="btn btn-block btn-success">Güncelle</button>
													</div>
												</div>
											</div>
										</div>

									</c:if>
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
			$('[data-mask]').inputmask()
			//Datemask dd/mm/yyyy
			$('#datemask').inputmask('dd/mm/yyyy', {
				'placeholder' : 'dd/mm/yyyy'
			})
		})
	</script>
	<script>
		$('#btnGuncelleOgr').click(function() {
			var ogrenci = $('#frmOgrenciDuzenle').serialize();
			//ajax
			$.ajax({
				url : '<s:url value="/ogrenciguncellekaydet"></s:url>',
				type : "post",
				data : ogrenci,
				success : function(yanit) {
					alert(yanit);
				}
			});

		});
	</script>
</body>
</html>
