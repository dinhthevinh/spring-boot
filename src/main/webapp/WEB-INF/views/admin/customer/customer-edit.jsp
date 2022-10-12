<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="customerAPI" value="/api/customer" />
<c:url var="redirect" value="/admin/customer-list" />
<html>
<head>
<title>Chỉnh sửa tòa nhà</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value='/admin/home'></c:url>">Home</a>
					</li>
					<li class="active">Dashboard</li>
				</ul>
				<!-- /.breadcrumb -->

			</div>

			<div class="page-content">

				<div class="row">
					<div class="col-xs-12">
						<form:form modelAttribute="modelSearch" action="" id="formEdit"
							method="GET" cssClass="form-horizontal">

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-left"
									for="fullName"> Tên đầy đủ</label>

								<div class="col-sm-9">
									<input type="text" id="name" class="form-control"
										name="fullName" value="${customerModel.fullName}" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="phone">Số điện thoại</label>
								<div class="col-sm-9">
									<input type="text" id="phone" class="form-control" name="phone"
										value="${customerModel.phone}" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="numberOfBasement">Email</label>
								<div class="col-sm-9">
									<input type="text" id="street" class="form-control"
										name="email" value="${customerModel.email}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="companyName">Tên công ty</label>
								<div class="col-sm-9">
									<input type="text" id="companyName" class="form-control"
										name="companyName" value="${customerModel.companyName}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="demand">Nhu cầu</label>
								<div class="col-sm-9">
									<input type="text" id="demand" class="form-control"
										name="demand" value="${customerModel.demand}" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="note">Ghi chú </label>
								<div class="col-sm-9">
									<input type="text" id="note" class="form-control" name="note"
										value="${customerModel.note}" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for=""></label>
								<div class="col-sm-9">
									<button type="button" class="btn btn-primary"
										id="btnAddCustomer">Cập nhật khách hàng</button>
								</div>
							</div>

							<div class="row" >
							<c:forEach var="item" items="${transactions}">
							<h2>${item.transactionType}</h2>
								<table id="buildingList"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>Ngày tạo</th>
											<th>Ghi chú</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${item.createdDate}</td>
											<td>${item.note}</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
										</tr>

									</tbody>
								</table>
							</c:forEach>
								

								
							</div>
							</form>
						</form:form>
					</div>

				</div>
				<!-- /.row -->

			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->

	<script>
		

		console.log("c");
		 $('#btnAddCustomer').click(function(e) {
			e.preventDefault();
			//call api addBuilding
			var data = {}; // định dạng jason nhưng data là javaScript Object phải chuyển sang jason để sever nhận		
			var formdata = $('#formEdit').serializeArray();
			$.each(formdata, function(index, v) {			
					data["" + v.name + ""] = v.value;			
			});
					
			data['id'] = "${customerModel.id}";
			$.ajax({
				type : "POST",
				url : '${customerAPI}', //thêm url api addBuilding
				data : JSON.stringify(data), // chuyển từ javaScript Object sang Json
				dataType : "json", // kiểu dữ liệu từ sever về client
				contentType : "application/json",// kiểu dữ liệu từ client về sever			
				success : function(response) {
					console.log('success');
					window.location.href = '${redirect}';
				},
				error : function(response) {
					console.log('failed');
					console.log(response);
				},
			});

		});
		 
	</script>

</body>

</html>