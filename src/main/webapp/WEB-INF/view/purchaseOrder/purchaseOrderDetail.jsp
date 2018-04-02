<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
<div class="row">
	<div class="col-xs-9">
		<h3>PURCHASE ORDER DETAIL</h3>
		<hr style="border-color: black; border-top: 1px dashed;">
	</div>
	<div class="col-xs-3">
		<script>
			if('${po.status}' == 'Created'){
				document.write('<select id="action-po" class="btn-primary form-control" key-id="${po.id }">'
						+'<option disabled selected>More</option>'
						+'<option value="approve">Approve</option>'
						+'<option value="reject">Reject</option>'
						+'<option value="print">Print</option>'
						+'<option value="create-po" disabled>Create PO</option>');
			}else if('${po.status}' == 'Rejected'){
				document.write('<select id="action-po" class="btn-primary form-control" key-id="${po.id }">'
						+'<option disabled selected>More</option>'
						+'<option value="approve" disabled>Approve</option>'
						+'<option value="reject" disabled>Reject</option>'
						+'<option value="print">Print</option>'
						+'<option value="create-po" disabled>Create PO</option>');
			}else if('${po.status}' == 'PO Created'){
				document.write('<select id="action-po" class="btn-poimary form-control" key-id="${po.id }">'
						+'<option disabled selected>More</option>'
						+'<option value="approve" disabled>Approve</option>'
						+'<option value="reject" disabled>Reject</option>'
						+'<option value="print">Print</option>'
						+'<option value="create-po" disabled>Create PO</option>');
			}else if('${po.status}' == 'Approved'){
				document.write('<select id="action-po" class="btn-primary form-control" key-id="${po.id }">'
						+'<option disabled selected>More</option>'
						+'<option value="approve" disabled>Approve</option>'
						+'<option value="reject" disabled>Reject</option>'
						+'<option value="print">Print</option>'
						+'<option value="create-po">Create PO</option>');
			}
		</script>
			
		</select>
	</div>
</div>
<div class="row">
<div class="col-xs-8">
<h5>${po.supplier.name }</h5>
<table class="table table-hover table-borderless">
	<tr>
		<td>${po.supplier.phone }</td>
		<td colspan="2">${po.supplier.email }</td>
	</tr>
	<tr>
		<td colspan="3">${po.supplier.address }</td>
	</tr>
	<tr>
		<td>${po.supplier.province.name }</td>
		<td>${po.supplier.region.name }</td>
		<td>${po.supplier.postalCode }</td>
	</tr>
</table>
</div>
</div>
<div class="form-group">
	<label for="input-note">Notes</label>
	<textarea class="form-control" id="input-note" rows="5" style="resize:none;" readonly>${po.notes }</textarea>
</div>
<div class = "row">
	<div class="col-xs-8">
		<table class = "table table-borderless table-hover">
			<tr>
				<td>PO Number : ${po.poNo }</td>
			</tr>
			<tr>
				<td>Created By : ${po.createdBy }</td>
			</tr>
			<tr>
				<td>Email : ${po.outlet.email }
			</tr>
			<tr>
				<td>Outlet : ${po.outlet.name }</td>
			</tr>
			<tr>
				<td>Phone : ${po.outlet.phone }</td>
			</tr>
			<tr>
				<td>Address : ${po.outlet.address }</td>
			</tr>
			<tr>
				<td>PO Status : ${po.status }</td>
			</tr>
		</table>
	</div>
</div>
<h5>
	<b>Status History</b>
</h5>
<hr style="border-color: black; border-top: 1px dashed;">
<div class="row">
	<div class="col-xs-8">
		<table id="data-history" class="table table-striped table-borderless table-hover">
			<c:forEach items="${po.history }" var="his">
				<tr>
					<td>On 
						<script>
							var waktu = '${his.createdOn}';
							var wkt = waktu.split('.');
							document.write(wkt[0]);
						</script>
					&#8208; ${po.poNo } is ${his.status }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<h5>
	<b>Purchase Items</b>
</h5>
<hr style="border-color: black; border-top: 1px dashed;">
<table id="data-purchase-item"
	class="table table-striped table-bordered table-hover">
	<thead>
		<th>Item</th>
		<th>In Stock</th>
		<th>Request Qty.</th>
	</thead>
	<tbody id="list-item">
		<c:forEach items="${po.detail }" var ="pod">
			<tr>
				<td>${pod.variant.item.name }-${pod.variant.name }</td>
				<td id="td${pod.id }">
					<script type="text/javascript">
							$.ajax({
								type : 'GET',
								url : '${pageContext.request.contextPath}/transaksi/purchase-order/get-inventory?idPo='+${po.id}+'&idPod='+${pod.id},
								dataType: 'json',
								success : function(inv){
									$('#td${pod.id}').append('<td>'+inv[0]+'<td>');
								}
							});
					</script>
				</td>
				<td>${pod.requestQty }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="row">
	<div class="col-xs-9"></div>
	<div class="col-xs-3"><a href="${pageContext.request.contextPath}/transaksi/purchase-request" class="btn btn-primary btn-block">Done</a></div>
</div>
</section>
</body>
<script>
	$(function(){
		
		$('#action-po').change(function(){
			var action = $(this).val();
			var id = $(this).attr('key-id');
			if(action == 'print'){
				window.print();
			}else{
				$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/transaksi/purchase-request/'+action+'/'+id,
					success : function(){
						console.log('sukses');
						window.location = '${pageContext.request.contextPath}/transaksi/purchase-request/detail/'+id;
					},
					error : function(){
						console.log('gagal');
					}
				});
			}
		});
	})
</script>
</html>