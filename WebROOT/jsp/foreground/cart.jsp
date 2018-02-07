<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
  import="edu.gdut.shoppingmall.business.factory.EBOFactory"
  import="edu.gdut.shoppingmall.vo.GoodsModel"
  import="java.util.Iterator"
  import="java.util.Map" %>
<% String username = (String)session.getAttribute("username");%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="./css/bootstrap.css">
    <link rel="stylesheet" href="./css/font-awesome.css">
    <script src="./js/jquery.js"></script>
    <script src="./js/tether.js"></script>
    <script src="./js/popper.js"></script>
    <script src="./js/bootstrap.js"></script>
    <style>
        .header{width:40%;text-align:center;margin:0 auto;margin-top:80px;margin-bottom:20px;}
        .title{font-family:Stxingkai;color:#333;font-size: 52px;}
        table{width: 900px !important;margin-top: 20px;margin: 0 auto;}
        .footer{width:50%;text-align:center;margin:0 auto;margin-top:20px;}
        .cart_input{display: inline-block;width: 60px; }
        .td{padding: 8px !important; }
        tr,td{text-align: center;vertical-align: middle; }
        #home,#clean{font-size: 27px;font-family: Kaiti;margin-left: 42px;cursor: pointer;color: #727272; }
        .abtn{font-size: 24px;font-family: Kaiti; }
        .fa{cursor: pointer;color: rgb(104, 67, 67); }
        form{display: inline-block; }
        .empty{font-size: 32px; }
    </style>
</head>
<body>
    <div class="header">
        <h2 class="title">商品购物车</h2>
    </div>
    <table class="table table-hover">
    <% @SuppressWarnings("unchecked")
        Map<String,Integer> cartMap = (Map<String, Integer>) session.getAttribute(username+"cart");
        float sum = 0;
        if(cartMap != null ){ %>
        <thead class="thead-dark">
            <tr>
                <th><a class="btn">名称</a></th>
                <th><a class="btn">数量</a></th>
                <th><a class="btn">价格</a></th>
                <th><a class="btn">操作</a></th>
            </tr>
        </thead>
        <% Iterator<Map.Entry<String,Integer>> iter = cartMap.entrySet().iterator();
           while(iter.hasNext()) {
               Map.Entry<String, Integer> entry = iter.next();
               GoodsModel gm = EBOFactory.getGoodsEBO().findById(entry.getKey());
               String goodName = gm.getName();
               String id= entry.getKey();
               sum += entry.getValue() * gm.getPrice(); %>
           <tr>
               <td><a class="btn"><%= goodName %></a></td>
               <td><a class="btn" href="./cart?minus=true&id=<%= entry.getKey() %>"><i class="fa fa-minus fa-lg" id="minus"></i>&nbsp;&nbsp;</a>
                   <form action="./cart" method="get">
                       <input type="hidden" name="id" value="<%= id %>">
                       <input type="text" class="form-control cart_input" value="<%= entry.getValue() %>" 
                       name="count" pattern="^[1-9][0-9]*$">
                   </form>
                   <a class="btn" href="./cart?id=<%= entry.getKey() %>">&nbsp;&nbsp;<i class="fa fa-plus fa-lg" id="plus"></i></a>
                </td>
               <td><a class="btn">￥<%=entry.getValue() * gm.getPrice() %></a></td>
               <td><a class="btn"  href="./docart?submitFlag=cleanOne&id=<%= entry.getKey() %>"><i class="fa fa-trash-o fa-lg" id="delete"></i></a></td>
           </tr>
           <% } %>
           <tr>
                <td colspan="4"><a class="btn abtn">总计：￥<%= sum %></a></td>
            </tr>
           <% } else{ %>
            <tr>
                <td colspan="4"><a class="btn abtn empty">购物车空空如也~</a></td>
            </tr>
            <% } %>
    </table>
    <div class="footer">
        <span id="home">返回主页</span>
        <span id="clean">清空购物车</span>
    </div>
    <script>
        $(() => {
            $('#home').click(() => {
                location.href = './';
            })
            $('#clean').click(() => {
                location.href = './docart?submitFlag=cleanAll';
            })
        })
    </script>
</body>
</html>