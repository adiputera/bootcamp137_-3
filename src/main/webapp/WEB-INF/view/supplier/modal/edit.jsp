<!-- begin form save -->
	<div class="modal fade" id="modal-edit" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Edit Supplier</h4>
				</div>
				<div class="modal-body">
					<form id="formdepartemen" data-parsley-validate method="post">
						
						<div>
							<div><h5>Supplier Name</h5></div>
							<div ><input type="text" class="form-control full-span" id="edit-name" data-parsley-required="true" /></div>
						</div>
						
						<div>
							<div><h5>Supplier Address</h5></div>
							<div >
							<textarea class="form-control" rows="3" id="edit-address"></textarea>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-4"><h5>Phone</h5></div>
							<div class="col-xs-4"><h5>Email</h5></div>
							<div class="col-xs-3"><h5>Postel Code</h5></div>
						</div>
						<div class="row">
							<div class="col-xs-4"><input type="text" id="edit-phone" data-parsley-required="true" /></div>
							<div class="col-xs-4"><input type="text" id="edit-email" data-parsley-required="true" placeholder="rama@gmail.com" /></div>
							<div class="col-xs-3"><input type="text" id="edit-postal" data-parsley-required="true" placeholder="max six characters" /></div>
						</div>
						
						<div class="row">
							<div class="col-xs-4"><h5>Province</h5></div>
							<div class="col-xs-4"><h5>Region</h5></div>
							<div class="col-xs-3"><h5>District</h5></div>
						</div>
						
						<div class="row">
						<div class="col-xs-4">
						<select name="area" required="required" id="prov-edit">
    					<option disabled selected value=""> --- Select A Province --- </option>
    					<c:forEach var="prov" items="${provinces }">
    						<option value="${prov.id }">${prov.name }</option>
    					</c:forEach>
						</select>
						</div>
						
						<div class="col-xs-4">
						<select name="area" required="required" id="reg-edit">
    						<option disabled selected value=""> --- Select A Region --- </option>
						</select>
						</div>
						
						<div class="col-xs-3">
						<select name="area" required="required" id="dist-edit">
    						<option disabled selected value=""> --- Select A District --- </option>
						</select>
						</div>
						
						</div>
						<input type="hidden" name="id" id="edit-id">
						
						</form>
						
				</div>
				<div class="modal-footer">
				<div class="row">
						<div class="form-group" style="float:left; margin-left:20px;">
							<button type="button" class="btn btn-danger" id="tbl-delete">X</button>
						</div>
						<div class="form-group" style="float:left; margin-left:350px;">
							<button type="reset" class="btn btn-warning" id="tbl-cancel">Cancel</button>
						</div>
						<div class="form-group" style="float:right; margin-right:20px;">
							<button type="button" class="btn btn-info" id="tbl-edit">Save</button>
						</div>
					</div>
				</div>
				
				
			</div>

		</div>
	</div>
<!-- end form save -->