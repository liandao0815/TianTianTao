<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String manager = (String)session.getAttribute("manager"); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的小店</title>
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="./css/bootstrap.css">
    <link rel="stylesheet" href="./css/font-awesome.css">
    <script src="./js/jquery.js"></script>
    <script src="./js/tether.js"></script>
    <script src="./js/popper.js"></script>
    <script src="./js/bootstrap.js"></script>
    <style>
        .container{margin-top: 44px; }
        .jumbotron{background: #fafafa !important;padding: 10px 20px;position: relative;box-shadow: 0 0 10px #bbb; }
        .navbar{border-radius: 3px; }
        .manager_logo{display: block;width: 280px;height: 82px;background: url("./img/manager_logo.png") -62px;cursor: pointer; }
        .fa-bars{color: #ccc; }
        .navbar-nav{position: absolute;right: 20px; }
        .div_login{position: relative; top: 120px; }
        .modal-title{font-size: 30px;font-family: STxingkai;margin: 0 auto;width: 500px;display: block;text-align: center; }
        .Mg_Form{margin-top: 20px;text-align: center;position: absolute;left: 50%;transform: translateX(-50%); }
        .Mg_Input{width: 300px;}
        .Mg_Btn{width: 240px;margin: 0 auto;display: flex;justify-content: space-around;padding-top: 6px;}
        .nav-item{font-size: 22px;font-weight:bold; font-family: kaiti;cursor: pointer;margin-left: 16px; }
        .navreset{color: #e6e6e6 !important; }
        .active.nav-link.nav-active{color: #a79d1a !important; }
        .content{width: 100%;height: 540px; }
        .tab-content{width: 100%;text-align: center; }
        .form-control{width: 320px;height: 40px;display: inline-block; }
        #goods,#user{padding-top: 12px; }
        .Btn{margin-top: -5px; margin-left: -16px;    }
        .queryForm,.frozenForm{margin-top: 160px; }
        #query,#frozen{position: relative; }
        .queryTib,.frozenTib{position: absolute;top: -100px;left: 50%;margin-left: -77px; display: none;}
        .list-group{width: 40%;margin:-70px auto; }
        .input_div{margin-top: 20px; }
        .last{position: relative;left: -213px; }
        .addbtn,.updatebtn{position: relative;left: 688px; top: -40px; width: 600px; }
        #add,#update{margin-top: 90px; position: relative;}
        #delete,#select{margin-top: 160px;position: relative; }
        .btn{cursor: pointer; }
        .addtib,.updatetib{position: absolute;top: -60px;display: none; left: 50%;margin-left: -77px;}
        .deletetib,.selecttib{position: absolute;top: -90px;display: none;left: 50%;margin-left: -77px; }
        .selectTable{position: relative;top: -24px; }
        .ul-list{position: relative;top: -16px; }
        #deleteid,#selectid,#queryUser,#frozenUser{text-indent: 16px; }
        .fa{position: relative;right: 318px; }
        .custom-controls-stacked{display: inline-block;width: 320px; }
        .custom-radio{margin-right: 30px; }
        .ctcategory{width: 400px;display: inline-block;text-align: left; }
        #addcategory,#updatecategory{width: 286px; }
    </style>
</head>
<body>
    <% if(manager == null || manager == ""){ %>
    	<div class="div_login">
            <span id="modal-title" class="modal-title">前往我的小店</span>
            <form class="Mg_Form">
                <div class="form-group row row_Mg">
                    <label for="mgUsername" class="col-form-label">用户：</label>
                    <div>
                        <input type="text" class="form-control Mg_Input" id="mgUsername" name="name" placeholder="请输入管理员名称">
                    </div>
                </div>
                <div class="form-group row row_Mg">
                    <label for="mgPassword" class="col-form-label">密码：</label>
                    <div>
                        <input type="password" class="form-control Mg_Input" id="mgPassword" name="password" placeholder="请输入登录密码">
                    </div>
                </div>
                <div class="Mg_Btn">
                    <button type="button" class="btn btn-light" id="mgLogin" onclick="mglogin()">前往小店</button>
                    <button type="reset" class="btn btn-light">重置表单</button>
                </div>
            </form>
        </div>
    <% } else { %>
    	<div class="container">
            <div class="jumbotron">
                <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                    <i class="manager_logo"></i>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active nav-active" data-toggle="tab" href="#goods">商品管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-active" data-toggle="tab" href="#user">用户管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link navreset" id="logoutManager">离开小店</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link navreset" id="returnIndex">返回主页</a>
                        </li>
                    </ul>
                </nav>                       
                <div class="content">
                    <div class="tab-content">
                        <!-- 商品管理 -->
                        <div id="goods" class="tab-pane active"><br>
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#add">增加商品</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#delete">删除商品</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#update">更新商品</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#select">查询商品</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="add" class="container tab-pane active">
                                    <span class="addtib alert alert-info"></span>
                                    <input type="hidden" id="addsubmitFlag" value="add">
                                    <form>
                                        <div class="goodForm">
                                            <div class="input_div">
                                                <label for="addid">商品条码：</label>
                                                <input type="text" class="form-control" placeholder="请输入商品条码" name="id" id="addid">&nbsp;&nbsp;&nbsp;&nbsp;
                                                <div class="ctcategory">
                                                    <label for="addcategory">商品类别：</label>
                                                    <select name="category" id="addcategory" class="form-control custom-select">
                                                        <option value="A">图书</option>
                                                        <option value="B">食品</option>
                                                        <option value="C">数码</option>
                                                        <option value="D">家电</option>
                                                        <option value="E">服饰</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="input_div">
                                                <label for="addname">商品名称：</label>
                                                <input type="text" class="form-control" placeholder="请输入商品名称" name="name" id="addname">&nbsp;&nbsp;&nbsp;&nbsp;
                                                <label>是否新品：</label>
                                                <div class="custom-controls-stacked add">
                                                    <label class="custom-control custom-radio">
                                                        <input id="addisNew1" name="isNew" type="radio" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">新品商品</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input id="addisNew2" name="isNew" type="radio" value="0" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">一般商品</span>
                                                    </label>
                                                </div>    
                                            </div>
                                            <div class="input_div">
                                                <label for="addprice">商品价格：</label>
                                                <input type="text" class="form-control" placeholder="请输入商品价格" name="price" id="addprice">&nbsp;&nbsp;&nbsp;&nbsp;  
                                                <label>是否推荐：</label>
                                                <div class="custom-controls-stacked add">
                                                    <label class="custom-control custom-radio">
                                                        <input id="addcommend1" name="commend" type="radio" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">推荐商品</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input id="addcommend2" name="commend" type="radio" value="0" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">一般商品</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="input_div">
                                                <label for="addstock">库存数量：</label>
                                                <input type="text" class="form-control" placeholder="请输入库存数量" name="stock" id="addstock">&nbsp;&nbsp;&nbsp;&nbsp; 
                                                <label>是否特价：</label>
                                                <div class="custom-controls-stacked add">
                                                    <label class="custom-control custom-radio">
                                                        <input id="adddiscount1" name="discount" type="radio" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">特价商品</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input id="adddiscount2" name="discount" type="radio" value="0" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">一般商品</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="input_div last">
                                                <label for="adddescription">商品描述：</label>
                                                <input type="text" class="form-control" placeholder="请输入商品描述" name="description" id="adddescription">
                                                <div class="addbtn">
                                                    <button type="button" class="btn btn-info" id="addbtn">增加商品</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <button type="reset" class="btn btn-warning">重置表单</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div id="delete" class="container tab-pane fade">
                                    <span class="deletetib alert alert-info"></span>
                                    <input type="hidden" id="deletesubmitFlag" value="delete">
                                    <div class="goodForm">
                                        <label for="deleteid">商品条码：</label>
                                        <input type="text" class="form-control" placeholder="请输入您要删除的商品" name="id" id="deleteid">
                                        <i class="fa fa-trash-o fa-lg"></i>
                                        <button type="button" class="btn btn-info Btn" id="deletebtn">删除商品</button>
                                    </div>
                                </div>
                                <div id="update" class="container tab-pane fade">
                                    <input type="hidden" id="updatesubmitFlag" value="update">
                                    <span class="updatetib alert alert-info"></span>
                                    <form>
                                        <div class="goodForm">
                                            <div class="input_div">
                                                <label for="updateid">商品条码：</label>
                                                <input type="text" class="form-control" placeholder="请输入商品条码" name="id" id="updateid">&nbsp;&nbsp;&nbsp;&nbsp;
                                                <div class="ctcategory">
                                                    <label for="updatecategory">商品类别：</label>
                                                    <select name="category" id="updatecategory" class="form-control custom-select">
                                                        <option value="A">图书</option>
                                                        <option value="B">食品</option>
                                                        <option value="C">数码</option>
                                                        <option value="D">家电</option>
                                                        <option value="E">服饰</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="input_div">
                                                <label for="updatename">商品名称：</label>
                                                <input type="text" class="form-control" placeholder="请输入商品名称" name="name" id="updatename">&nbsp;&nbsp;&nbsp;&nbsp;
                                                <label>是否新品：</label>
                                                <div class="custom-controls-stacked update">
                                                    <label class="custom-control custom-radio">
                                                        <input id="updateisNew1" name="isNew" type="radio" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">新品商品</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input id="updateisNew2" name="isNew" type="radio" value="0" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">一般商品</span>
                                                    </label>
                                                </div>    
                                            </div>
                                            <div class="input_div">
                                                <label for="updateprice">商品价格：</label>
                                                <input type="text" class="form-control" placeholder="请输入商品价格" name="price" id="updateprice">&nbsp;&nbsp;&nbsp;&nbsp;  
                                                <label>是否推荐：</label>
                                                <div class="custom-controls-stacked update">
                                                    <label class="custom-control custom-radio">
                                                        <input id="updatecommend1" name="commend" type="radio" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">推荐商品</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input id="updatecommend2" name="commend" type="radio" value="0" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">一般商品</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="input_div">
                                                <label for="updatestock">库存数量：</label>
                                                <input type="text" class="form-control" placeholder="请输入库存数量" name="stock" id="updatestock">&nbsp;&nbsp;&nbsp;&nbsp; 
                                                <label>是否特价：</label>
                                                <div class="custom-controls-stacked update">
                                                    <label class="custom-control custom-radio">
                                                        <input id="updatediscount1" name="discount" type="radio" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">特价商品</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input id="updatediscount2" name="discount" type="radio" value="0" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">一般商品</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="input_div last">
                                                <label for="updatedescription">商品描述：</label>
                                                <input type="text" class="form-control" placeholder="请输入商品描述" name="description" id="updatedescription">
                                                <div class="updatebtn">
                                                    <button type="button" class="btn btn-info" id="updatebtn">更新商品</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <button type="reset" class="btn btn-warning">重置表单</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div id="select" class="container tab-pane fade">
                                    <span class="selecttib alert alert-info"></span>
                                    <input type="hidden" id="selectsubmitFlag" value="select">
                                    <div class="goodForm">
                                        <label for="selectid">商品条码：</label>
                                        <input type="text" class="form-control" placeholder="请输入您要查找的商品" name="id" id="selectid">
                                        <i class="fa fa-search fa-lg"></i>
                                        <button type="button" class="btn btn-info Btn" onclick="selectbtn()">查询商品</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 用户管理 -->
                        <div id="user" class="tab-pane fade"><br>
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#query">查询用户资料</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#frozen">冻结或解冻</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="query" class="container tab-pane active">
                                    <span class="alert alert-warning queryTib" id="queryTib"></span>
                                    <div class="queryForm">
                                        <label for="queryUser">用户名：</label>
                                        <input type="text" class="form-control" placeholder="请输入您要查找的用户" name="name" id="queryUser">
                                        <i class="fa fa-user fa-lg"></i>
                                        <button type="button" class="btn btn-info Btn" onclick="queryUser()">提交</button>
                                    </div>
                                </div>
                                <div id="frozen" class="container tab-pane fade">
                                    <span class="alert alert-success frozenTib" id="frozenTib"></span>
                                    <div class="frozenForm">
                                        <label for="frozenUser">用户名：</label>
                                        <input type="text" class="form-control" placeholder="请输入您要冻结/解冻的用户" name="name" id="frozenUser">
                                        <i class="fa fa-user fa-lg"></i>
                                        <button type="button" class="btn btn-info Btn" id="frozenBtn">提交</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <% } %>
    <script>
        $(() => {
            $('#frozenBtn').on('click',() => {
                let name = $('#frozenUser').val();
                $.post('./frozenUser',{name},data => {
                    $('#frozenTib').html(data.state).fadeIn(1000);
                    $('#frozenUser').val('');
                    setTimeout(() => {
                        $('#frozenTib').fadeOut(1000); 
                    },2000)
                })
            })
            $('#logoutManager').on('click',() => {
                location.href = './logoutManager';
            })
            $('#returnIndex').on('click',() => {
                location.href = './'
            })
            $('#addbtn').on('click',() => {
                let id = $('#addid').val();
                let name = $('#addname').val();
                let description = $('#adddescription').val();
                let price = $('#addprice').val();
                let isNew = $('.add [name=isNew]:checked').val();
                let commend = $('.add [name=commend]:checked').val();
                let discount = $('.add [name=discount]:checked').val();
                let stock = $('#addstock').val();
                let category = $('#addcategory').val();
                let submitFlag = $('#addsubmitFlag').val();
                $.post('./managerGood',{id,name,description,price,isNew,commend,discount,stock,category,submitFlag},data => {
                    $('#addid').val('');
                    $('#addname').val(''); 
                    $('#adddescription').val('');
                    $('#addprice').val('');   
                    $('.add [name=isNew]:checked').prop('checked',false);
                    $('.add [name=commend]:checked').prop('checked',false);
                    $('.add [name=discount]:checked').prop('checked',false);
                    $('#addstock').val('');  
                    $('#addcategory').val('A');
                    $('.addtib').text(data.state).fadeIn(1000);
                    setTimeout(() => {
                        $('.addtib').text(data.state).fadeOut(1000);
                    },2000)
                })
            })
            $('#deletebtn').on('click',() => {
                let id = $('#deleteid').val();
                let submitFlag = $('#deletesubmitFlag').val();
                $.post('./managerGood',{id,submitFlag},data => {
                    $('#deleteid').val('');
                    $('.deletetib').text(data.state).fadeIn(1000);
                    setTimeout(() => {
                        $('.deletetib').text(data.state).fadeOut(1000);
                    },2000)
                })
            })
            $('#updatebtn').on('click',() => {
                let id = $('#updateid').val();
                let name = $('#updatename').val();
                let description = $('#updatedescription').val();
                let price = $('#updateprice').val();
                let isNew = $('.update [name=isNew]:checked').val();
                let commend = $('.update [name=commend]:checked').val();
                let discount = $('.update [name=discount]:checked').val();
                let stock = $('#updatestock').val();
                let category = $('#updatecategory').val();
                let submitFlag = $('#updatesubmitFlag').val();
                $.post('./managerGood',{id,name,description,price,isNew,commend,discount,stock,category,submitFlag},data => {
                    $('#updateid').val('');
                    $('#updatename').val(''); 
                    $('#updatedescription').val('');
                    $('#updateprice').val('');   
                    $('.update [name=isNew]:checked').prop('checked',false);
                    $('.update [name=commend]:checked').prop('checked',false);
                    $('.update [name=discount]:checked').prop('checked',false); 
                    $('#updatestock').val('');  
                    $('#updatecategory').val('A');
                    $('.updatetib').text(data.state).fadeIn(1000);
                    setTimeout(() => {
                        $('.updatetib').text(data.state).fadeOut(1000);
                    },2000)
                })
            })
        })
        function mglogin(){
            let name = $('#mgUsername').val();
            let password = $('#mgPassword').val();
            $.post('./ismanager',{name,password}).then(data => {
                if(data.code === 1){
                    alert(data.state);
                } else {
                    location.href = './manager';
                }
            })
        }
        function returnQuery(){
            $('.queryForm').html(`<label for="queryUser">用户名：</label>
                <input type="text" class="form-control" placeholder="请输入您要查找的用户" name="name" id="queryUser">
                <i class="fa fa-user fa-lg"></i>
                <button type="button" class="btn btn-info Btn" onclick="queryUser()">提交</button>`)
        }
        function queryUser(){
            let name = $('#queryUser').val();
            $.post('./queryUser',{name},data => {
                if(data.code === 1){
                    $('#queryTib').text(data.state).fadeIn(1000);
                    setTimeout(() => {
                        $('#queryTib').fadeOut(1000); 
                    },2000)
                } else {
                    $('.queryForm').html('<ul class="list-group ul-list">'+
                        '<li class="list-group-item list-group-item-info">'+data.name+'的个人信息</li>'+
                        '<li class="list-group-item">地址：'+data.address+'</li>'+
                        '<li class="list-group-item">电话：'+data.mobile+'</li>'+
                        '<li class="list-group-item">邮箱：'+data.email+'</li>'+
                        '<li class="list-group-item">状态：'+data.status+'</li>'+
                        '<li class="list-group-item"><button class="btn btn-success" onclick="returnQuery()">返回</button></li>'
                    );
                }
            })
        }
        function selectbtn() {
            let id = $('#selectid').val();
            let submitFlag = $('#selectsubmitFlag').val();
            $.post('./managerGood',{id,submitFlag},data => {
                $('#selectid').val('');
                if(data.code !== 0){
                    $('.selecttib').text(data.state).fadeIn(1000);
                    setTimeout(() => {
                        $('.selecttib').text(data.state).fadeOut(1000);
                    },2000)
                } else{
                    let isNew,commend,discount;
                    data.isNew == 0 ? isNew = '旧品' : isNew = '新品';
                    data.commend == 0 ? commend = '一般' : commend = '推荐';
                    data.discount == 0 ? discount = '一般' : discount = '特价';
                    $('#select').html('<table class="table selectTable"><thead class="thead-light"><tr><th>商品条码</th><th>商品名称</th>'+
                        '<th>商品类型</th><th>商品类型</th><th>是否新品</th><th>是否推荐</th><th>是否特价</th><th>库存数量</th>'+
                        '</tr></thead><tbody><tr><td>'+data.id+'</td><td>'+data.name+'</td><td>'+data.category+'</td>'+
                        '<td>'+data.price+'</td><td>'+isNew+'</td><td>'+commend+'</td><td>'+discount+'</td>'+
                        '<td>'+data.stock+'</td></tr></tbody></table><button class="btn btn-success" onclick="returnSelect()">返回</button>'
                    );
                }
            })
        }
        function returnSelect(){
            $('#select').html(`<span class="selecttib alert alert-info"></span>
                <input type="hidden" id="selectsubmitFlag" value="select">
                <div class="goodForm">
                <label for="selectid">商品条码：</label>
                <input type="text" class="form-control" placeholder="请输入您要查找的商品" name="id" id="selectid">
                <i class="fa fa-search fa-lg"></i>
                <button type="button" class="btn btn-info Btn" onclick="selectbtn()">查询商品</button>
                </div>`
            );
        }
    </script>
</body>
</html>