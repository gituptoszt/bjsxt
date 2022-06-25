<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="../css/style.css" />
        <script type="text/javascript" src="../js/jquery-1.11.3.min.js" ></script>
    </head>
    <script>
    $(function() {
        $("tr:odd").addClass("odd");
        $("tr:even").addClass("even");
    });
</script>
    <body>
        <table id="tab1" border="1" width="80%" align="center">
            <tr>
                <td>分类的ID</td>
                <td>分类的名称</td>
                <td>分类的描述</td>
                <td>操作</td>
            </tr>
            <tr>
                <td>1</td>
                <td>手机数码</td>
                <td>手机数码</td>
                <td><a href="">修改</a>|<a href="">删除</a></td>
            </tr>
            <tr>
                <td>2</td>
                <td>电脑办公</td>
                <td>电脑办公</td>
                <td><a href="">修改</a>|<a href="">删除</a></td>
            </tr>
            <tr>
                <td>3</td>
                <td>烟酒糖茶</td>
                <td>烟酒糖茶</td>
                <td><a href="">修改</a>|<a href="">删除</a></td>
            </tr>
            <tr>
                <td>4</td>
                <td>鞋靴箱包</td>
                <td>鞋靴箱包</td>
                <td><a href="">修改</a>|<a href="">删除</a></td>
            </tr>
            <tr>
                <td>5</td>
                <td>汽车用品</td>
                <td>汽车用品</td>
                <td><a href="">修改</a>|<a href="">删除</a></td>
            </tr>
        </table>
    </body>
</html>
