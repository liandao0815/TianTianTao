<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录提示</title>
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
	<link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="./css/bootstrap.css">
    <script src="./js/jquery.js"></script>
    <script src="./js/tether.js"></script>
    <script src="./js/popper.js"></script>
	<script src="./js/bootstrap.js"></script>
    <style>
        .h2{
            margin-top: 100px;
            margin-bottom: 20px;
            width:100%;
            text-align:center;
            font-size: 42px;
            font-family: STkaiti;
        }
        .h3{
            width: 100%;
            margin-top: 48px;
            text-align:center;
            color: #333;
            font-family: STxingkai;
            cursor: pointer;
        }
        .Btn{
            width: 192px;
            height: 36px;
            padding: 0 !important;
            line-height: 34px !important;
        }
        .Mg_Input{
            width: 340px;
        }
        form{
            width: 100%;
            text-align: center;
        }
        .form-control{
            display: inline-block;
            text-indent: 16px;
        }
        .Mg_vercode{
            width: 188px;
        }
        .img_vercode{
            margin-top: -6px;
            cursor: pointer;
        }
        .form-group{
            margin-top: 40px;
            margin-bottom: 40px;
        }
        .font_img{
            display: inline-block;
            position: relative;
        }
        .fa{
            position: absolute;
            top: 12px;
            left: 8px;
        }
    </style>
</head>
<body>
    <h2 class="h2">请登录后再访问</h2>
    <form>
        <div class="form-group">
            <label for="name" class="col-form-label">用户：</label>
            <div class="font_img">
                <i class="fa fa-user fa-lg f-icon1"></i>
                <input type="text" class="form-control Mg_Input" id="name" name="name" placeholder="请输入用户名">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-form-label">密码：</label>
            <div class="font_img">
                <i class="fa fa-unlock-alt fa-lg f-icon2"></i>
                <input type="password" class="form-control Mg_Input" id="password" name="password" placeholder="请输入用户密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-form-label" for="vercode">验证：</label>
            <div class="font_img">
                <i class="fa fa-key fa-lg f-icon3"></i>
                <input type="password" class="form-control Mg_vercode" id="vercode" name="vercode" placeholder="请输入验证码">
            </div>
            <img alt="验证码" src="${pageContext.request.contextPath}/vercode" class="img_vercode" height="36" id="img_vercode">
        </div>
        <div class="loginDiv">
            <button id="loginBtn" type="button" class="btn btn-light Btn">登录</button>
            <button type="reset" class="btn btn-light Btn" data-dismiss="modal">重置</button>
        </div>
    </form>
    <h3 class="h3" id="index">返回主页</h3>
    <script>
        $(() => {
            $('#index').click(() => {
                location.href = './'
            })
            $('#img_vercode').on('click',function(){
                this.src="/TianTianTao/vercode?d="+Math.random();
            })
            $('#loginBtn').click(() => {
                let name = $('#name').val();
                let password = $('#password').val();
                let vercode = $('#vercode').val();
                $.post('./login',{name,password,vercode},function(data){
                    if(data.code === 1){
                        setTimeout(() => {
                            $('#img_vercode').trigger('click');
                            $('#vercode').val('').focus();
                        },60)
                        alert(data.state)
                    } else if(data.code === 2 || data.code === 3) {
                        alert(data.state)
                    } else {
                        location.href = './';
                    }
                })
            })
        })
    </script>
</body>
</html>