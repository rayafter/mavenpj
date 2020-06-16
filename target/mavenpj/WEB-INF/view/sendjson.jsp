<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请求json数据</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        //创建javascript对象
        var dataJson = {
            'id':1,
            'name':'qin',
            'pass':'qin'
        };
        //jquery程序入口
        $(function () {
            //单击id等于rjson按钮时引发事件
            $("#rjson").click(function () {
                $.ajax( //采用异步通讯向后台的json控制器的requestJson方法发送json数据
                    {
                        type:"POST", //发出请求方式
                        url:"${pageContext.request.contextPath}/json/requestJson", //控制器
                        //指定数据格式为 json
                        contentType:"application/json;charset=UTF-8",
                        data:JSON.stringify(dataJson),//发送json数据
                        dataType:"json",//后台控制器返回的数据类型
                        success:function(data){ //发送成功后进行处理
                            alert(data.id);
                            alert(data.name);
                        }
                    }
                );
            });
        });
    </script>
</head>
<body>
<button id="rjson" value="请求是json,返回json">请求是json,返回json</button>
</body>
</html>