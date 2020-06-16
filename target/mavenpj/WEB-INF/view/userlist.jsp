<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        function del(rows) {
            var delid={};
            var id="";
            $.each(rows,function (i,item) {
                id+=item["id"]+",";
            })
            delid.id=id.substr(0,id.length-1);
            $.ajax( //采用异步通讯向后台的json控制器的requestJson方法发送json数据
                {
                    type:"POST", //发出请求方式
                    url:"${pageContext.request.contextPath}/deluser", //控制器
                    //指定数据格式为 json
                    contentType:"application/json;charset=UTF-8",
                    data:JSON.stringify(delid),//发送json数据
                    dataType:"json",//后台控制器返回的数据类型
                    success:function(data){ //发送成功后进行处理
                        if(data.success){
                            alert("删除成功");
                            $('#dg').datagrid("reload");
                        }else{
                            alert("删除失败");
                        }
                    }}
            )

        }
        function update(row) {
            if($('#dd') != null){
                $('#dd').remove();
            }
            $("body").append("<div id='dd'></div>");
            $('#dd').dialog({
                title: '更新用户信息',
                width: 400,
                height: 200,
                closed: false,
                cache: false,
                modal: true,
                buttons:[{
                    text:'更新',
                    handler:function(){
                        var user={};
                        user.name=$("#name").val();
                        user.pass=$("#pass").val();
                        $.ajax( //采用异步通讯向后台的json控制器的requestJson方法发送json数据
                            {
                                type:"POST", //发出请求方式
                                url:"${pageContext.request.contextPath}/updateuser", //控制器
                                //指定数据格式为 json
                                contentType:"application/json;charset=UTF-8",
                                data:JSON.stringify(user),//发送json数据
                                dataType:"json",//后台控制器返回的数据类型
                                success:function(data){ //发送成功后进行处理
                                    if(data.success){
                                        alert("更新成功");
                                        $('#dd').dialog("close");//关闭对话框
                                        $('#dg').datagrid("reload");
                                    }else{
                                        alert("更新失败");
                                    }
                                }}
                        )
                    }
                },{
                    text:'关闭',
                    handler:function(){
                        $('#dd').dialog("close");//关闭对话框
                    }
                }]
            });
            var str="";
            str+='<form id="ff" method="post">\n' +
                '        <table>\n' +
                '            <tr>\n' +
                '                <td>用户名：</td>\n' +
                '                <td><input type="text" id="name" name="name" /></td>\n' +
                '            </tr>\n' +
                '            <tr>\n' +
                '                <td>密  码：</td>\n' +
                '                <td><input type="password" id="pass" name="pass" /><input type="hidden" id="id" name="id" /></td>\n' +
                '            </tr>\n' +
                '        </table>\n' +
                '    </form>';
            $('#dd').html(str);
            $('#ff').form('load',row[0]);//为表单加载数据。

        }
        function add(){
            if($('#dd') != null){
                $('#dd').remove();
            }
            $("body").append("<div id='dd'></div>");
            $('#dd').dialog({
                title: '添加用户信息',
                width: 400,
                height: 200,
                closed: false,
                cache: false,
                modal: true,
                buttons:[{
                    text:'添加',
                    handler:function(){
                        var user={};
                        user.name=$("#name").val();
                        user.pass=$("#pass").val();
                        $.ajax( //采用异步通讯向后台的json控制器的requestJson方法发送json数据
                            {
                                type:"POST", //发出请求方式
                                url:"${pageContext.request.contextPath}/adduser", //控制器
                                //指定数据格式为 json
                                contentType:"application/json;charset=UTF-8",
                                data:JSON.stringify(user),//发送json数据
                                dataType:"json",//后台控制器返回的数据类型
                                success:function(data){ //发送成功后进行处理
                                    if(data.success){
                                        alert("添加成功");
                                        $('#dd').dialog("close");//关闭对话框
                                        $('#dg').datagrid("reload");
                                    }else{
                                        alert("添加失败");
                                    }
                                }})
                    }
                },{
                    text:'关闭',
                    handler:function(){
                        $('#dd').dialog("close");//关闭对话框
                    }
                }]
            });
            var str="";
            str+='<form id="ff" method="post">\n' +
                '        <table>\n' +
                '            <tr>\n' +
                '                <td>用户名：</td>\n' +
                '                <td><input type="text" id="name" name="name" /></td>\n' +
                '            </tr>\n' +
                '            <tr>\n' +
                '                <td>密  码：</td>\n' +
                '                <td><input type="password" id="pass" name="pass" /></td>\n' +
                '            </tr>\n' +
                '        </table>\n' +
                '    </form>';
            $('#dd').html(str);
        }
        $(function () {
            if($('#dg') != null){ //判断页面中是否存在id=dg的元素，若存在删除它
                $('#dg').remove();
            }
            $("body").append("<div id='dg'></div>");//在页面中添加一个id为dg的div元素
            $('#dg').datagrid({
                url:'${pageContext.request.contextPath}/getuserdata',
                columns:[[
                    {field:'id',title:'编号',width:100},
                    {field:'name',title:'姓名',width:100},
                    {field:'pass',title:'密码',width:100}
                ]],
                pagination:true,
                pageNumber:1,
                pageSize:2,
                pageList:[2,4,10,20,30,40,50],
                toolbar: [{
                    iconCls: 'icon-add',
                    text:'添加',
                    handler: function(){
                        add();
                    }
                },'-',{
                    iconCls: 'icon-edit',
                    text:'更新',
                    handler: function(){
                        var row=$('#dg').datagrid("getSelections");
                        if(row && row.length>0){
                            if(row.length>1){
                                alert("一次只能更新一条记录");
                                return false;
                            }else{
                                update(row);
                            }
                        }else{
                            alert("请选择你要更新数据行，才能进行更新操作");
                        }
                    }
                },'-',{
                    iconCls: 'icon-cancel',
                    text:'删除',
                    handler: function(){
                        //返回所有被选中的行，当没有记录被选中的时候将返回一个空数组
                        var rows=$("#dg").datagrid("getSelections");
                        if(rows && rows.length>0){
                            del(rows);
                        }else{
                            $.messager.alert('警告','请选择要删除数据行，才能进行删除操作');
                        }

                    }
                },'-',{
                    iconCls: 'icon-help',
                    text:'帮助',
                    handler: function(){alert('帮助按钮')}
                }]

            });
        });
    </script>
</head>
<body>

</body>
</html>
