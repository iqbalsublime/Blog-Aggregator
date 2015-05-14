<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>

<h1>Details of <c:out value="${user.name}" /></h1>

<label>Name:</label> <h5>${user.name}</h5>
<label>ID:</label> <h5>${user.id}</h5>
<label>Password:</label> <h5>${user.password}</h5>

	<c:forEach items="${user.blogs}" var="blog">
		<h2>${blog.name}</h2>
		<p>${blog.url}</p>
		
		
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
						<td>${item.title}</td>
						<td>${item.link}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:forEach>