<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>

<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>ID</th>
			<th>User Name</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="user">
			<tr>
				<td> <a href='<spring:url value="/users/${user.id}.html"></spring:url>'>${user.name}</a></td>
				<td>${user.id}</td>
				<td> <a href='<spring:url value="/user/remove/${user.id}.html"></spring:url>' class="btn btn-danger">Remove User</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
