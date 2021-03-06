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
<body>
	<div>
		<form action="category/category_findAll.action?pageBean.page=1"
			method="post">
			级别名称： <input type="text" name="cname" id="cname" /> <input
				type="reset" value="重置" class="login" /><input class="login"
				type="submit" value="查询" />
		</form>
		<s:if test="list == null">
			<div align="left" style="color: red;">
				<s:actionmessage />
			</div>
		</s:if>
		<s:if test="list != null">
			<div>
				<p
					style="margin: 0px auto; font-size: 24px; font-weight: bolder; color: blue;"
					align="center">员工列表</p>
					<p style="margin-top: 0px; margin-left: 920px">
					<a href="category/category_addPage.action" class="login">添加</a>
				</p>
			</div>
			<table border="1" bordercolor="#A9ADF8" cellpadding="0" cellspacing="0"
				align="center" style="margin: 0px auto;">
				<thead>
					<tr>
						<td align="center" width="10%">序号</td>
						<td align="center" width="15%">级别编号</td>
						<td align="center" width="20%">名称</td>
						<td align="center" width="40%">描述</td>
						<td width="15%" align="center">操作</td>
					</tr>
				</thead>
				<tbody align="center">
					<s:iterator var="list" value="list" status="id" step="1">

						<c:if test="${id.index % 2 != 0 }">
							<tr style="background-color: aqua;">
						</c:if>
						<c:if test="${id.index % 2 == 0 }">
							<tr>
						</c:if>
						<td>${id.index+1 }</td>
						<td><s:property value="#list.cid" /></td>
						<td><s:property value="#list.cname" /></td>
						<td><textarea rows="4" cols="40" readonly="readonly" style="font-size: 18px"><s:property value="#list.cdesc" /></textarea></td>
						<td><a
							href="category/category_editPage.action?cid=<s:property value="#list.cid" />">
								<img alt="删除" src="images/i_edit.gif" />
						</a> <a
							href="category/category_delete.action?cid=<s:property value="#list.cid" />">
								<img alt="删除" src="images/i_del.gif" />
						</a></td>
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
						href="category/category_findAll.action?pageBean.page=1">首页</a>&nbsp;
		<a style="color: #000"
						href="category/category_findAll.action?pageBean.page=<s:property value="pages.pageBean.page-1"/>">上一页</a>&nbsp;
		</s:if>

				<s:if test="pages.pageBean.page != pages.pageBean.totalPage">
					<a style="color: #000"
						href="category/category_findAll.action?pageBean.page=<s:property value="pages.pageBean.page+1" />">下一页</a>&nbsp;
			<a style="color: #000"
						href="category/category_findAll.action?pageBean.page=<s:property value="pages.pageBean.totalPage"/>">尾页</a>
				</s:if>
			</p>
		</s:if>
	</div>
</body>
</html>