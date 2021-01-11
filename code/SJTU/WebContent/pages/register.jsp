<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<title>注册的页面</title>
<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        //异步验证
        $("#account").blur(function(){
          var phone=$(this).val();
          $.ajax({
				url:'<%=basePath%>user/register',
				type:'POST',
				data:{phone:phone},
				dataType:'json',
				success:function(json){
					if(json.flag){
						 $("#errorAccount").html("账号已被注册，请重新输入!");
						 $("#register").attr("disabled",true);
					}else{
						 $("#errorAccount").empty();
						 $("#register").attr("disabled",false);
					}
				},
				error:function(){
					alert('请求超时或系统出错!');
				}
			});
           
        });
        
    });
           
    
</script>
</head>
<body  bgcolor="#CCFF00">

    <form action="<%=basePath%>" method="post">
        <table>
            <caption>注册的页面</caption>
            <tr>
                <td>账号：</td>
                <td>
                    <input type="text" name="account" id="account" />
                    <div id="errorAccount" style="color:red;display:inline;"></div>    
                </td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" name="password"/></td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="username"/></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><input type="text" name="sex"/></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input id="register" type="submit" value="注册">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>    
    </form>
</body>
</html>