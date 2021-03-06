<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>


<label>Name:</label> <h5>${user.name}</h5>
<label>ID:</label> <h5>${user.id}</h5>
<label>Password:</label> <h5>${user.password}</h5>

<!-- Button trigger modal -->
<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#myModal">
  New Blog
</button>

<br/> <br/>

<script type="text/javascript">
$(document).ready(function() {
	$('.nav-tabs a:first').tab('show'); // Select first tab
	$(".triggerRemove").click(function(e) {
		e.preventDefault();
		$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
		$("#modalRemove").modal();
	});
	
	$(".blogForm").validate(
			{
				rules: {
					name: {
						required : true,
						minlength : 3
					},
					url: {
						required : true,
						url: true
					}	
				},
				highlight: function(element) {
					$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
				},
				unhighlight: function(element) {
					$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
				}
			}
		);
});
</script>

<!-- Nav tabs -->
<ul class="nav nav-tabs">
	<c:forEach items="${user.blogs}" var="blog">
	  <li><a href="#blog_${blog.id}" data-toggle="tab"><c:out value="${blog.name}" /></a></li>
	</c:forEach>
</ul>

<!-- Tab panes -->
<div class="tab-content">
<c:forEach items="${user.blogs}" var="blog">
  <div class="tab-pane" id="blog_${blog.id}">
	<h1><c:out value="${blog.name}" /></h1>
	<p>
	<a href='<spring:url value="/blog/remove/${blog.id}.html" />' class="btn btn-danger triggerRemove">Remove Blog</a>
	<c:out value="${blog.url}" /></p>

	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Title</th>
				<th>Link</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${blog.items}" var="item">
				<tr>
					<td><c:out value="${item.title}" /></td>
					<td><c:out value="${item.link}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
  </div>
</c:forEach>
</div>



<form:form commandName="blog" cssClass="form-horizontal blogForm">
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add New Blog</h4>
      </div>
      <div class="modal-body">
        	<div class="form-group">
				<label for="name" class="col-sm-2 control-label">Blog Name:</label>
				<div class="col-sm-10">
					<form:input path="name" cssClass="form-control"/>
					<form:errors path="name"/>
				</div>
			</div>
			<div class="form-group">
				<label for="url" class="col-sm-2 control-label">URL:</label>
				<div class="col-sm-10">
					<form:input path="url" cssClass="form-control"/>
					<form:errors path="url"/>
				</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" value="Save" class="btn btn-success">
      </div>
    </div>
  </div>
</div>
</form:form>
<br/>

<!-- Modal -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove Blog</h4>
      </div>
      <div class="modal-body">
        Really want to remove blog ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
        <a href="" class="btn btn-danger btn-sm removeBtn">Remove</a>
      </div>
    </div>
  </div>
</div>



	