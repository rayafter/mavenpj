<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/default/easyui.css">
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        $(function(){ //jquery执行入口
            $("#ff").dialog({ //定义一个弹出一个窗口
                title: '登录窗口',    //窗口的标题
                width: 400,    //窗口的宽度
                height: 140,    //窗口的高度
                closed: false,    //窗口没有显示关闭按钮
                cache: false,  //没有设置缓冲
                modal: true  ,//设置窗口模式为真的,
                buttons:[{ //为窗口设置两个按钮，即登录和重置两个按钮
                    text:'登录',
                    handler:function(){//当单击登录按钮时，调用send（）方法进行处理表单
                        //serializeArray() 方法通过序列化表单值来创建对象数组（名称和值）。如：[{name: 'name', value: 'Hello'},{name: 'pass', value: 'World'} ]
                        var obj = $('#ff').serializeArray();
                        //创建一个空对象
                        var o={};
                        //遍历数组元素
                        $.each(obj,function () {
                            if (o[this.name]) { //o对象是否存在this.name这个属性，若存则添加该属性
                                if (!o[this.name].push) {
                                    o[this.name] = [o[this.name]];
                                }
                                o[this.name].push(this.value || '');//给对象的属性赋值
                            } else {
                                o[this.name] = this.value || '';
                            }
                        })
                        alert(JSON.stringify(o));
                        //采用异步方式向服务器提交数据（数据是json格式）
                        $.ajax({
                            type:"POST", //发出请求方式
                            url:"${pageContext.request.contextPath}/logincheck",//向服务提出请求的地址
                            contentType:"application/json;charset=UTF-8",
                            data:JSON.stringify(o),//发送json数据
                            dataType:"json",//后台控制器返回的数据类型
                            success:function(data){ //发送成功后进行处理
                                alert(data["success"]);
                                alert(data.url);
                                //跳转到相应的页面
                                if(data.success){
                                    window.location.href=data.url;
                                }
                            }
                        });
                    }
                },{
                    text:'重置',
                    handler:function(){//当单击重置按钮所要执行的任务
                        $("#name").val("");
                        $("#pass").val("");
                        $("#name").focus();
                    }
                }]
            });
        });
    </script>
</head>
<body>
<form id="ff" method="post">
    <table>
        <tr>
            <td>用户名:</td>
            <td><input name="name" id="name" type="text"></input></td>
        </tr>
        <tr>
            <td>密  码:</td>
            <td><input name="pass" id="pass" type="password"></input></td>
        </tr>
    </table>
</form>
</body>
</html>