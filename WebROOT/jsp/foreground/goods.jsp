<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"
	import="edu.gdut.shoppingmall.business.factory.EBOFactory"
	import="edu.gdut.shoppingmall.vo.GoodsModel" 
	import="java.util.List"
	import="edu.gdut.shoppingmall.vo.PageBean"
	import="java.util.ArrayList" %>

<% PageBean pageBean = (PageBean)request.getAttribute("result");
List<GoodsModel> list = pageBean.getData(); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品查询</title>
	<link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
	<link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="./css/bootstrap.css">
    <script src="./js/jquery.js"></script>
    <script src="./js/tether.js"></script>
    <script src="./js/popper.js"></script>
	<script src="./js/bootstrap.js"></script>
	<style>
		.goods_logo{display: block;width: 27%;height: 90px;background: url("./img/good_logo.png") no-repeat;
			margin:20px auto; }
		.table{width: 80%; margin: 0 auto;margin-top:20px; }
		td,th{text-align:center;vertical-align:middle; }
		.pagination{position: absolute;left: 50%;transform: translateX(-50%);bottom: -86px; }
		.badge{transform: scale(0.68);position: relative;top: -5px;text-indent: 0;}
		.content{position: relative; }
		.return{cursor: pointer;color: #007bff !important;}
	</style>
</head>
<body>
	<span class="goods_logo"></span>
	<div class="content">
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col">商品名称</th>
					<th scope="col">商品描述</th>
					<th scope="col">商品类型</th>
					<th scope="col">商品价格</th>
					<th scope="col">库存数量</th>
					<th scope="col">加入Cart</th>
				</tr>
			</thead>
			<tbody>
				<% String isNew;
				for(int i=0;i<list.size();i++) {
					isNew = list.get(i).getIsNew() == 0 ? "" : "<span class='badge badge-success'>New</span>";%>
				<tr class="table-secondary">
					<td><%= list.get(i).getName()+isNew %></td>
					<td><%= list.get(i).getDescription() %></td>
					<td><%= list.get(i).getCategory().getDescription() %></td>
					<td><%= list.get(i).getPrice() %></td>
					<td><%= list.get(i).getStock() %></td>
					<td><a href="./cart?id=<%= list.get(i).getId() %>"><i class="fa fa-shopping-cart fa-lg"></i></a></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		<% String url = null;
		if(request.getQueryString() == null) {
			url = request.getContextPath() + "/goodsQuery" + "?";
		} else {
			boolean isAll = request.getQueryString().contains("&currentPage");
			if(isAll) {
				String[] strUrl1 = request.getQueryString().split("&currentPage");
				url = request.getContextPath() + "/goodsQuery" + "?" + strUrl1[0] + "&";
			}
			else{
				String[] strUrl2 = request.getQueryString().split("currentPage");
				url = request.getContextPath() + "/goodsQuery" + "?" + strUrl2[0] + "&";	
			}
		} %>
		<ul class="pagination">
			<li class="page-item disabled">
				<a class="page-link">当前第<%= pageBean.getCurrentPage() %>页&nbsp;<b>/</b>&nbsp;共<%= pageBean.getTotalPage() %>页</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="<%= url %>currentPage=<%= pageBean.getFirstPage() %>&pageSize=<%= pageBean.getPageSize() %>">首页</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="<%= url %>currentPage=<%= pageBean.getPrePage() %>&pageSize=<%= pageBean.getPageSize() %>">上一页</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="<%= url %>currentPage=<%= pageBean.getNextPage() %>&pageSize=<%= pageBean.getPageSize() %>">下一页</a>   
			</li>
			<li class="page-item">
				<a class="page-link" href="<%= url %>currentPage=<%= pageBean.getTotalPage() %>&pageSize=<%= pageBean.getPageSize() %>">末页</a>
			</li>
			<li class="page-item ">
				<a class="page-link return" id="index">返回主页</a>
			</li>
		</ul>
		
	</div>
	<script>
		$(() => {
			$('#index').on('click',() => {
				location.href = './'
			})
		})
	</script>
</body>
</html>