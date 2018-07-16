<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="edu.gdut.shoppingmall.business.factory.EBOFactory"
	import="edu.gdut.shoppingmall.vo.GoodsModel" import="java.util.List"
	import="java.util.Map" import="java.util.HashMap"
	import="java.util.ArrayList"%>
<%
	String username = (String) session.getAttribute("username");
	String manager = (String) session.getAttribute("manager");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>天天淘购物城</title>
<link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/normalize.css" />
<link rel="stylesheet" href="css/component.css" />
<link rel="stylesheet" href="css/lrtk.css">
<link rel="stylesheet" href="css/font-awesome.css" />
<link rel="stylesheet" href="css/animate.css" />
<script src="js/jquery.js"></script>
<script src="js/jquery.slider.js"></script>
<script src="js/popper.js"></script>
<script src="js/tether.js"></script>
<script src="js/bootstrap.js"></script>
<%
	if ((username == null || username == "") && (manager == null || manager == "")) {
%><style>
.main-content {
	display: none;
}
</style>
<%
	} else {
%><style>
.background {
	display: none;
}
</style>
<%
	}
%>
</head>
<body>
	<!-- 主内容 -->
	<div class="divPos">
		<div id="content" class="main-content">
			<span id="registerSuccessTib" class=""></span>
			<!-- 导航栏 -->
			<div class="navigater">
				<div class="div_login" id="div_login">
					<%
						if (username == null || username == "") {
					%>
					<span class="btn btn-default span_btn" data-toggle="modal"
						data-target="#Modal" id="loginBtn" onclick="login()">登录</span> <span
						class="btn btn-default span_btn" data-toggle="modal"
						data-target="#Modal" id="registerBtn" onclick="register()">注册</span>
					<%
						if (manager == null || manager == "") {
					%>
					<span class="btn btn-default span_btn" data-toggle="modal"
						data-target="#MgModal">我的小店</span>
					<%
						} else {
					%>
					<span class="btn btn-default span_btn" onclick="manager()">我的小店</span>
					<%
						}
					%>
					<%
						} else {
					%>
					<span class="btn btn-default span_btn" id="cart">购物车</span> <span
						class="btn btn-default span_btn" id="personal">个人中心</span> <span
						class="btn btn-default span_btn" id="logoutBtn" onclick="logout()">退出登录</span>
					<%
						}
					%>
				</div>
			</div>
			<!-- 搜索框 -->
			<form class="m_search">
				<div class="input-group">
					<input type="text" class="form-control search-input"
						placeholder="搜索商品" id="search_input">
					<div class="input-group-addon seacrch-div" onclick="searchSubmit()">
						<i class="fa fa-search fa-lg"></i>
					</div>
				</div>
			</form>
			<i class="logo"></i>
			<nav class="navbar navbar-expand-sm bg-info navbar-dark">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						data-toggle="tab" href="#all">所有商品</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#discount">特价商品</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#commend">推荐商品</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tushu">图书</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#shipin">食品</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#shuma">数码</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#jiadian">家电</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#jiadian">服饰</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#goodquery">商品查询</a></li>
				</ul>
			</nav>
			<div class="tab-content">
				<div id="all" class="container tab-pane active">
					<br>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col" class="left">商品名称</th>
								<th scope="col">商品描述</th>
								<th scope="col">商品类型</th>
								<th scope="col">商品价格</th>
								<th scope="col">库存数量</th>
								<th scope="col">加入Cart</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<GoodsModel> listAll = EBOFactory.getGoodsEBO().findAll();
								int lengthall = listAll.size() <= 6 ? listAll.size() : 6;
								String isNewall;
								for (int i = 0; i < lengthall; i++) {
									isNewall = listAll.get(i).getIsNew() == 0 ? "" : "<span class='badge badge-success'>New</span>";
							%>
							<tr>
								<td class="left"><%=listAll.get(i).getName() + isNewall%></td>
								<td><%=listAll.get(i).getDescription()%></td>
								<td><%=listAll.get(i).getCategory().getDescription()%></td>
								<td><%=listAll.get(i).getPrice()%></td>
								<td><%=listAll.get(i).getStock()%></td>
								<td><a href="./cart?id=<%=listAll.get(i).getId()%>"><i
										class="fa fa-shopping-cart fa-lg"></i></a></td>
							</tr>
							<%
								}
								if (listAll.size() > 6) {
							%>
							<tr>
								<th colspan="7" class="mouseHover"><a href="./goodsQuery"
									class="checkMore">查看更多</a></th>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div id="discount" class="container tab-pane fade">
					<br>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col" class="left">商品名称</th>
								<th scope="col">商品描述</th>
								<th scope="col">商品类型</th>
								<th scope="col">商品价格</th>
								<th scope="col">库存数量</th>
								<th scope="col">加入Cart</th>
							</tr>
						</thead>
						<tbody>
							<%
								Map<String, String> conditiondis = new HashMap<String, String>();
								conditiondis.put("discount", "1");
								List<GoodsModel> listdis = EBOFactory.getGoodsEBO().findByCondition(conditiondis);
								int dislength = listdis.size() <= 6 ? listdis.size() : 6;
								String isNewdis;
								for (int i = 0; i < dislength; i++) {
									isNewdis = listdis.get(i).getIsNew() == 0 ? "" : "<span class='badge badge-success'>New</span>";
							%>
							<tr>
								<td class="left"><%=listdis.get(i).getName() + isNewdis%></td>
								<td><%=listdis.get(i).getDescription()%></td>
								<td><%=listdis.get(i).getCategory().getDescription()%></td>
								<td><%=listdis.get(i).getPrice()%></td>
								<td><%=listdis.get(i).getStock()%></td>
								<td><a href="./cart?id=<%=listdis.get(i).getId()%>"><i
										class="fa fa-shopping-cart fa-lg"></i></a></td>
							</tr>
							<%
								}
								if (listdis.size() > 6) {
							%>
							<tr>
								<th colspan="7" class="mouseHover"><a
									href="./goodsQuery?discount=1" class="checkMore">查看更多</a></th>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div id="commend" class="container tab-pane fade">
					<br>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col" class="left">商品名称</th>
								<th scope="col">商品描述</th>
								<th scope="col">商品类型</th>
								<th scope="col">商品价格</th>
								<th scope="col">库存数量</th>
								<th scope="col">加入Cart</th>
							</tr>
						</thead>
						<tbody>
							<%
								Map<String, String> conditioncom = new HashMap<String, String>();
								conditioncom.put("commend", "1");
								List<GoodsModel> listcom = EBOFactory.getGoodsEBO().findByCondition(conditioncom);
								int comlength = listcom.size() <= 6 ? listcom.size() : 6;
								String isNewcom;
								for (int i = 0; i < comlength; i++) {
									isNewcom = listcom.get(i).getIsNew() == 0 ? "" : "<span class='badge badge-success'>New</span>";
							%>
							<tr>
								<td class="left"><%=listcom.get(i).getName() + isNewcom%></td>
								<td><%=listcom.get(i).getDescription()%></td>
								<td><%=listcom.get(i).getCategory().getDescription()%></td>
								<td><%=listcom.get(i).getPrice()%></td>
								<td><%=listcom.get(i).getStock()%></td>
								<td><a href="./cart?id=<%=listcom.get(i).getId()%>"><i
										class="fa fa-shopping-cart fa-lg"></i></a></td>
							</tr>
							<%
								}
								if (listcom.size() > 6) {
							%>
							<tr>
								<th colspan="7" class="mouseHover"><a
									href="./goodsQuery?commend=1" class="checkMore">查看更多</a></th>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div id="tushu" class="container tab-pane fade">
					<br>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col" class="left">商品名称</th>
								<th scope="col">商品描述</th>
								<th scope="col">商品价格</th>
								<th scope="col">库存数量</th>
								<th scope="col">加入Cart</th>
							</tr>
						</thead>
						<tbody>
							<%
								Map<String, String> conditiontushu = new HashMap<String, String>();
								conditiontushu.put("category", "A");
								List<GoodsModel> listtushu = EBOFactory.getGoodsEBO().findByCondition(conditiontushu);
								int tushulength = listtushu.size() <= 6 ? listtushu.size() : 6;
								String isNewtushu;
								for (int i = 0; i < tushulength; i++) {
									isNewtushu = listtushu.get(i).getIsNew() == 0 ? "" : "<span class='badge badge-success'>New</span>";
							%>
							<tr>
								<td class="left"><%=listtushu.get(i).getName() + isNewtushu%></td>
								<td><%=listtushu.get(i).getDescription()%></td>
								<td><%=listtushu.get(i).getPrice()%></td>
								<td><%=listtushu.get(i).getStock()%></td>
								<td><a href="./cart?id=<%=listtushu.get(i).getId()%>"><i
										class="fa fa-shopping-cart fa-lg"></i></a></td>
							</tr>
							<%
								}
								if (listtushu.size() > 6) {
							%>
							<tr>
								<th colspan="6" class="mouseHover"><a
									href="./goodsQuery?category=A" class="checkMore">查看更多</a></th>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div id="shipin" class="container tab-pane fade">
					<br>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col" class="left">商品名称</th>
								<th scope="col">商品描述</th>
								<th scope="col">商品价格</th>
								<th scope="col">库存数量</th>
								<th scope="col">加入Cart</th>
							</tr>
						</thead>
						<tbody>
							<%
								Map<String, String> conditionshipin = new HashMap<String, String>();
								conditionshipin.put("category", "B");
								List<GoodsModel> listshipin = EBOFactory.getGoodsEBO().findByCondition(conditionshipin);
								int shipinlength = listshipin.size() <= 6 ? listshipin.size() : 6;
								String isNewshipin;
								for (int i = 0; i < shipinlength; i++) {
									isNewshipin = listshipin.get(i).getIsNew() == 0 ? "" : "<span class='badge badge-success'>New</span>";
							%>
							<tr>
								<td class="left"><%=listshipin.get(i).getName() + isNewshipin%></td>
								<td><%=listshipin.get(i).getDescription()%></td>
								<td><%=listshipin.get(i).getPrice()%></td>
								<td><%=listshipin.get(i).getStock()%></td>
								<td><a href=""><i class="fa fa-shopping-cart fa-lg"></i></a></td>
							</tr>
							<%
								}
								if (listshipin.size() > 6) {
							%>
							<tr>
								<th colspan="6" class="mouseHover"><a
									href="./goodsQuery?category=B" class="checkMore">查看更多</a></th>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div id="shuma" class="container tab-pane fade">
					<br>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col" class="left">商品名称</th>
								<th scope="col">商品描述</th>
								<th scope="col">商品价格</th>
								<th scope="col">库存数量</th>
								<th scope="col">加入Cart</th>
							</tr>
						</thead>
						<tbody>
							<%
								Map<String, String> conditionshuma = new HashMap<String, String>();
								conditionshuma.put("category", "C");
								List<GoodsModel> listshuma = EBOFactory.getGoodsEBO().findByCondition(conditionshuma);
								int shumalength = listshuma.size() <= 6 ? listshuma.size() : 6;
								String isNewshuma;
								for (int i = 0; i < shumalength; i++) {
									isNewshuma = listshuma.get(i).getIsNew() == 0 ? "" : "<span class='badge badge-success'>New</span>";
							%>
							<tr>
								<td class="left"><%=listshuma.get(i).getName() + isNewshuma%></td>
								<td><%=listshuma.get(i).getDescription()%></td>
								<td><%=listshuma.get(i).getPrice()%></td>
								<td><%=listshuma.get(i).getStock()%></td>
								<td><a href="./cart?id=<%=listshuma.get(i).getId()%>"><i
										class="fa fa-shopping-cart fa-lg"></i></a></td>
							</tr>
							<%
								}
								if (listshuma.size() > 6) {
							%>
							<tr>
								<th colspan="6" class="mouseHover"><a
									href="./goodsQuery?category=C" class="checkMore">查看更多</a></th>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div id="jiadian" class="container tab-pane fade">
					<br>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col" class="left">商品名称</th>
								<th scope="col">商品描述</th>
								<th scope="col">商品价格</th>
								<th scope="col">库存数量</th>
								<th scope="col">加入Cart</th>
							</tr>
						</thead>
						<tbody>
							<%
								Map<String, String> conditionjiadian = new HashMap<String, String>();
								conditionjiadian.put("category", "D");
								List<GoodsModel> listjiadian = EBOFactory.getGoodsEBO().findByCondition(conditionjiadian);
								int jiadianlength = listjiadian.size() <= 6 ? listjiadian.size() : 6;
								String isNewjiadian;
								for (int i = 0; i < jiadianlength; i++) {
									isNewjiadian = listjiadian.get(i).getIsNew() == 0 ? "" : "<span class='badge badge-success'>New</span>";
							%>
							<tr>
								<td class="left"><%=listjiadian.get(i).getName() + isNewjiadian%></td>
								<td><%=listjiadian.get(i).getDescription()%></td>
								<td><%=listjiadian.get(i).getPrice()%></td>
								<td><%=listjiadian.get(i).getStock()%></td>
								<td><a href="./cart?id=<%=listjiadian.get(i).getId()%>"><i
										class="fa fa-shopping-cart fa-lg"></i></a></td>
							</tr>
							<%
								}
								if (listjiadian.size() > 6) {
							%>
							<tr>
								<th colspan="6" class="mouseHover"><a
									href="./goodsQuery?category=D" class="checkMore">查看更多</a></th>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div id="fushi" class="container tab-pane fade">
					<br>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col">商品名称</th>
								<th scope="col">商品描述</th>
								<th scope="col">商品价格</th>
								<th scope="col">库存数量</th>
								<th scope="col">加入Cart</th>
							</tr>
						</thead>
						<tbody>
							<%
								Map<String, String> conditionfushi = new HashMap<String, String>();
								conditionfushi.put("category", "E");
								List<GoodsModel> listfushi = EBOFactory.getGoodsEBO().findByCondition(conditionfushi);
								int fushilength = listfushi.size() <= 6 ? listfushi.size() : 6;
								String isNewfushi;
								for (int i = 0; i < fushilength; i++) {
									isNewfushi = listfushi.get(i).getIsNew() == 0 ? "" : "<span class='badge badge-success'>New</span>";
							%>
							<tr>
								<td class="left"><%=listfushi.get(i).getName() + isNewfushi%></td>
								<td><%=listfushi.get(i).getDescription()%></td>
								<td><%=listfushi.get(i).getPrice()%></td>
								<td><%=listfushi.get(i).getStock()%></td>
								<td><a href="./cart?id=<%=listfushi.get(i).getId()%>"><i
										class="fa fa-shopping-cart fa-lg"></i></a></td>
							</tr>
							<%
								}
								if (listfushi.size() > 6) {
							%>
							<tr>
								<th colspan="6" class="mouseHover"><a
									href="./goodsQuery?category=E" class="checkMore">查看更多</a></th>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div id="goodquery" class="container tab-pane fade">
					<br> <span class="querytitle">商品查询</span>
					<form action="./goodsQuery" method="get" class="queryform">
						<input type="hidden" value="query" name="submitFlag">
						<div>
							<label for="goodid">商品条码：</label> <input type="text"
								class="form-control goodinput" placeholder="请输入商品条码" name="id"
								id="goodid">
						</div>
						<div>
							<label for="goodname">商品名称：</label> <input type="text"
								class="form-control goodinput" placeholder="请输入商品名称" name="name"
								id="goodname">
						</div>
						<div>
							<label for="goodcategory">商品类别：</label> <select name="category"
								id="goodcategory" class="form-control goodinput">
								<option value="">全部</option>
								<option value="A">图书</option>
								<option value="B">食品</option>
								<option value="C">数码</option>
								<option value="D">家电</option>
								<option value="E">服饰</option>
							</select>
						</div>
						<div>
							<label for="pricegt">最低价格：</label> <input type="number"
								class="form-control goodinput price" placeholder="请输入商品价格"
								name="pricegt" id="pricegt"> <label for="pricelt">最高价格：</label>
							<input type="number" class="form-control goodinput price"
								placeholder="请输入商品价格" name="pricelt" id="pricelt">
						</div>
						<div class="querybtn">
							<button type="submit" class="btn btn-info">查找商品</button>
							<button type="reset" class="btn btn-warning">重置表单</button>
						</div>
					</form>
				</div>
			</div>
			<!-- 用户登录注册 -->
			<%
				if (username == null || username == "") {
			%>
			<div class="modal lrmodel" id="Modal">
				<div id="login">
					<div class="login">
						<div class="loginform form">
							<div id="owl-login">
								<div class="hand"></div>
								<div class="hand hand-r"></div>
								<div class="arms">
									<div class="arm"></div>
									<div class="arm arm-r"></div>
								</div>
							</div>
							<div class="pad" id="loginPad">
								<div class="form-group row lrrow">
									<label for="loginUser" class="col-form-label">用户：</label>
									<div>
										<i class="fa fa-user fa-lg f-icon1"></i> <input type="text"
											name="name" class="form-control" id="loginUser"
											placeholder="请输入用户名">
									</div>
								</div>
								<div class="form-group row lrrow">
									<label for="loginPassword" class="col-form-label">密码：</label>
									<div>
										<i class="fa fa-unlock-alt fa-lg f-icon2"></i> <input
											type="password" name="password" class="form-control"
											id="loginPassword" placeholder="请输入密码">
									</div>
								</div>
								<div class="form-group row lrrow" id="slider1Ct">
									<label class="col-form-label" for="vercode">验证：</label> <i
										class="fa fa-key fa-lg f-icon3"></i> <input type="text"
										name="vercode" class="form-control vercode" id="vercode"
										placeholder="请输入验证码"> <img alt="验证码"
										src="${pageContext.request.contextPath}/vercode"
										class="img_vercode" height="36" id="img_vercode">
								</div>
								<h6 class="loginTib">
									<span id="loginTib">没有账号？点我注册</span> <span id="verLoginTibs"></span>
								</h6>
								<div class="loginDiv">
									<button id="Main_loginBtn" type="button"
										class="btn btn-light Btn">登录</button>
									<button class="btn btn-light Btn" data-dismiss="modal">关闭</button>
								</div>
							</div>
							<div class="pad" id="registerPad">
								<div class="form-group row lrrow" id="test">
									<label for="registerUser" class="col-form-label">用户：</label>
									<div>
										<i class="fa fa-user fa-lg f-icon1"></i> <input type="text"
											class="form-control" id="registerUser" placeholder="请输入用户名">
									</div>
								</div>
								<div class="form-group row lrrow">
									<label for="registerPassword" class="col-form-label">密码：</label>
									<div>
										<i class="fa fa-unlock-alt fa-lg f-icon2"></i> <input
											type="password" class="form-control" id="registerPassword"
											placeholder="请输入密码">
									</div>
								</div>
								<div class="form-group row lrrow">
									<label for="retruePassword" class="col-form-label">确认：</label>
									<div>
										<i class="fa fa-unlock-alt fa-lg f-icon3"></i> <input
											type="password" class="form-control" id="retruePassword"
											placeholder="请再次输入密码">
									</div>
								</div>
								<h6 class="registerTib">
									<span id="registerTib">已有账号？点我登录</span> <span
										id="verRegisterTibs"></span>
								</h6>
								<div class="loginDiv">
									<button id="Main_registerBtn" type="button"
										class="btn btn-light Btn">注册</button>
									<button class="btn btn-light Btn" data-dismiss="modal">关闭</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 后台登录 -->
			<div class="modal fade" id="MgModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span id="modal-title" class="modal-title">前往我的小店</span> <i
								class="fa fa-times fa-2x close" data-dismiss="modal"></i>
						</div>
						<div class="modal-body Mgbody">
							<form class="Mg_Form">
								<div class="form-group row row_Mg">
									<label for="mgUsername" class="col-form-label">用户：</label>
									<div>
										<input type="text" class="form-control Mg_Input"
											id="mgUsername" name="name" placeholder="请输入管理员名称">
									</div>
								</div>
								<div class="form-group row row_Mg">
									<label for="mgPassword" class="col-form-label">密码：</label>
									<div>
										<input type="password" class="form-control Mg_Input"
											id="mgPassword" name="password" placeholder="请输入登录密码">
									</div>
								</div>
								<div class="Mg_Btn">
									<button type="button" class="btn btn-light" id="mgLogin"
										onclick="mglogin()">前往小店</button>
									<button type="reset" class="btn btn-light">重置表单</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<!-- 欢迎页面 -->
	<div class="background" id="background">
		<div id="large-header" class="large-header">
			<canvas id="canvas"></canvas>
			<div class="main-title" id="main-title"></div>
		</div>
	</div>
	<script src="js/main.js"></script>
	<script src="js/TweenLite.min.js"></script>
	<script src="js/EasePack.min.js"></script>
	<script src="js/animation.js"></script>
	<script src="js/canvas.js"></script>
</body>
</html>