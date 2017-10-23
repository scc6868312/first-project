<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <style type="text/css">
        table,td{
            border:1px solid black;
        }
        table{
            width:500px;
            margin:200px auto 0;
        }
        td{
            width:50px;
            height:40px;
            text-align:center;
        }
        input{
            width:250px;
            height:40px;
        }
        div{
            width:150px;
            height:50px;
            margin:20px auto;
            font-size:13px;
        }
        a{
            color:red;
            text-decoration:none;
        }
    </style>
    <script src="../static/jQuery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#yhm').blur(function(){
                var acc=$(this).val();
                $.ajax({
                    url:"valReg",
                    type:"post",
                    data:{"acc":acc},
                    dataType:"JSON",
                    success:function(content){
                        if(content){
                            $('#yhm').next().remove();
                            $('#yhm').after("<span>账号已存在</span>");
                            $('#yhm').next().css("color","red");
                        } else{
                            $('#yhm').next().remove();
                            $('#yhm').after("<span>√</span>");
                            $('#yhm').next().css("color","green");
                        }
                    }
                });
            });
        })
    </script>
</head>
<body>
<form action="Controller" method="post">
    <table>
        <tr>
            <td colspan="2">注册页面</td>
        </tr>
        <tr>
            <td>账号</td><td><input id="yhm" type="text" name="acc"></td>
        </tr>
        <tr>
            <td>密码</td><td><input type="password" name="pwd"></td>
        </tr>
        <tr>
            <td style="width:248px;"><input type="submit" id="reg" value="注册"  style="width:100px;"></td><td style="width:248px;"><input type="reset" value="重置" style="width:100px;"></td>
        </tr>
    </table>
    <div><a href="login.ftl">已有账号？请登录</a></div>
</form>
</body>
</html>