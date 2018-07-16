<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="edu.gdut.shoppingmall.business.factory.EBOFactory"
	import="edu.gdut.shoppingmall.vo.UserModel" %>
<% String username = (String)session.getAttribute("username");
UserModel um = EBOFactory.getUserEBO().findUser(username); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="./css/bootstrap.css">
    <script src="./js/jquery.js"></script>
    <script src="./js/tether.js"></script>
    <script src="./js/popper.js"></script>
    <script src="./js/bootstrap.js"></script>
    <style>
        .jumbotron{padding: 20px 32px 10px 32px;box-shadow: 0 0 10px #bbb;position: relative; }
        .container{margin-top: 80px;}
        .display-3{font-family: STkaiti;}
        .Info_content{width: 100%;text-align: center; }
        .Info_btn{display: flex;width: 300px; justify-content: space-around;margin: 0 auto; }
        .nav-tabs{border: none !important; float: right;}
        .nav-link{margin-left: 20px !important; }
        .nav-link.active,.nav-link:hover{border-color:transparent !important;border-radius: 0.25em !important;
             background: #d1bb9f !important; color: #666 !important;}
        .nav-item>a{color: #666}
        .tab-content{height: 320px; }
        .info_label{color: #333;font-size: 30px; font-family: STkaiti;}
        .info_div{width: 360px;margin: 50px 292px 20px; text-align: right; }
        .input-info{width: 200px;display: inline-block; }
        .password_div{width: 380px;margin: 0 292px 30px; text-align: right; }
        .pswform{padding-top: 30px; position: relative;}
        .pswTib{display: none;position: absolute; top: -42px; left: 50%;margin-left: -77px; }
        .btn-info{padding: 7px 11px; }
        .toHome{position: absolute;bottom: 28px;right: 60px; color: #777;font-size: 24px;font-family: STxingkai;cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <div class="jumbotron">
            <h1 class="display-3">Hello, ${sessionScope.username}!</h1>
            <span class="toHome" id="toHome">返回主页</span>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#information">Information</a>
                </li>
                <li class="nav-item">
                    <a id="pass_tab" class="nav-link" data-toggle="tab" href="#password">Password</a>
                </li>
            </ul>
            <p class="lead">This is your personal user information.</p>
            <hr class="my-4">
            <p class="Info_content">
                <div class="tab-content">
                    <div id="information" class="container tab-pane active">
                        <form action="./updateinfo" method="post">
                            <div class="info_div"> 
                                <div class="form-group">
                                    <label class="info_label" for="email"><small>Email：</small></label>
                                    <input type="text" class="form-control input-info" id="email" value="<%= um.getEmail() %>" readonly name="email">
                                </div>
                                <div class="form-group">
                                    <label class="info_label" for="mobile"><small>Mobile：</small></label>
                                    <input type="text" class="form-control input-info" id="mobile" value="<%= um.getMobile() %>" readonly name="mobile">
                                </div>
                                <div class="form-group">
                                    <label class="info_label" for="address"><small>Address：</small></label>
                                    <input type="text" class="form-control input-info" id="address" value="<%= um.getAddress() %>" readonly name="address">
                                </div>
                            </div>
                            <div class="Info_btn">
                                <button type="button" class="btn btn-info" id="btn-info">点击更改</button>
                                <button type="button" class="btn btn-info" id="btn-submit">更新资料</button>
                            </div>
                        </form>
                    </div>
                    <div id="password" class="container tab-pane fade pswform">
                        <div id="pswTib" class="pswTib alert alert-info"></div>
                        <form action="./updatepsw" method="post">
                            <div class="password_div"> 
                                <div class="form-group">
                                    <label class="info_label" for="oldpassword"><small>OldPassword：</small></label>
                                    <input type="password" class="form-control input-info" id="oldpassword" placeholder="原密码" name="oldpassword">
                                </div>
                                <div class="form-group">
                                    <label class="info_label" for="newpassword"><small>NewPassword：</small></label>
                                    <input type="password" class="form-control input-info" id="newpassword" placeholder="新密码" name="newpassword">
                                </div>
                            </div>
                            <div class="Info_btn">
                                <button type="button" class="btn btn-info" id="btn-password">修改密码</button>
                                <button type="reset" class="btn btn-info" id="btn-reset">重置表单</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </div>
    <script>
        $(() => {
            $('#btn-info').on('click',() => {
                $('#address,#mobile,#email').prop('readonly',false);
                $('#email').focus();
                $('#btn-submit').attr('type','submit');
            })
            $('#btn-password').on('click',() => {
                let oldpsw = $('#oldpassword').val();
                let newpsw = $('#newpassword').val();
                $.post('./updatepsw',{oldpsw,newpsw}).then(data => {
                    $('#pswTib').html(data.state).fadeIn(1000);
                    $('#oldpassword').val('');
                    $('#newpassword').val('');
                    setTimeout(() => {
                        $('#pswTib').fadeOut(1000);
                    },2400)
                })
            })
            $('#toHome').on('click',() => {
                location.href = '/TianTianTao/';
            })
        })
    </script>
</body>
</html>