<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>列表</title>
<link href="css/register.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div>
		<form
			action="user/userAction_findAllUser.action?pageBean.page=1"
			method="post">
			用户名： <input type="text" name="uname" id="uname" /><input
				class="login" type="submit" value="查询" />
		</form>
		<s:if test="users == null">
			<div align="left" style="color: red;">
				<s:actionmessage />
			</div>
		</s:if>
		<s:if test="users!= null">
			<div>
				<p
					style="margin: 10px auto; font-size: 32px; font-weight: bolder; color: blue;"
					align="center">用户列表</p>
			</div>
			<table border="1" bordercolor="#A9ADF8" cellpadding="0" cellspacing="0"
				align="center" style="margin: 0px auto;">
				<thead>
					<tr>
						<th width="4%">序号</th>
						<th width="8%">用户编号</th>
						<th width="10%">姓名</th>
						<th width="25%">邮箱</th>
						<th width="14%">联系电话</th>
						<th width="4%">性别</th>
						<th width="4%">年龄</th>
						<th colspan="31%">地址</th>
					</tr>
				</thead>
				<tbody align="center">
					<s:iterator var="user" value="users" status="id" step="1">
						<tr>
							<td>${id }</td>
							<td><s:property value="#user.id" /></td>
							<td><s:property value="#user.uname" /></td>
							<td><s:property value="#user.uemail" /></td>
							<td><s:property value="#user.utel" /></td>
							<td><s:property value="#user.usex" /></td>
							<td><s:property value="#user.uage" /></td>
							<td><s:property value="#user.uaddress" /></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<p align="center">
				每页显示：
				<s:property value="pages.pageBean.rows" />
				/
				<s:property value="pages.pageBean.listnum" />
				条记录！当前页：
				<s:property value="pages.pageBean.page" />
				/
				<s:property value="pages.pageBean.totalPage" />
				页！
				<s:if test="pages.pageBean.page != 1">
					<a style="color: #000"
						href="user/userAction_findAllUser_findAll.action?pageBean.page=1">首页</a>&nbsp;
		<a style="color: #000"
						href="user/userAction_findAllUser_findAll.action?pageBean.page=<s:property value="pages.pageBean.page-1"/>">上一页</a>&nbsp;
		</s:if>

				<s:if test="pages.pageBean.page != pages.pageBean.totalPage">
					<a style="color: #000"
						href="user/userAction_findAllUser_findAll.action?pageBean.page=<s:property value="pages.pageBean.page+1" />">下一页</a>&nbsp;
			<a style="color: #000"
						href="user/userAction_findAllUser_findAll.action?pageBean.page=<s:property value="pages.pageBean.totalPage"/>">尾页</a>
				</s:if>
			</p>
		</s:if>
	</div>
</body>
</html>