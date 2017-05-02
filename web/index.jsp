<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>robot</title>
    <style type="text/css">
      .main{
        margin:0 auto;
        width: 340px;
        height: 400px;
        background: url("img/bg.jpg")no-repeat;
      }
      #btn{
        width: 40px;
        height: 25px;
        text-align: center;
        line-height: 25px;
        font-size: 12px;
        background: blue;
        color: white;
        vertical-align: middle;
        float: left;
      }
      #btn:hover{
        cursor: pointer;
      }
      input{
        float: left;
        height: 25px;
        width: 170px;
        background: cornsilk;
        vertical-align: middle;
      }
      .chat{
        height: 275px;
        width: 200px;
        font-size: 11px;
      }
      #robot{
       margin-left: 0;
        color: red;
      }
      #man{

      }
    </style>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript">
      $(function () {
        $('#btn').click(function () {
          var content = $("input").val();
          content = content.trim();
          if(content!=null && content!="") {
              $("input").val("");
              $("#man").html(content);
              $.ajax({
                url:'/getResult',
                type:'post',
                dataType:'text',
                data:{'content':content},
                success:function (data) {
                  $("#robot").html(data);
                }
              })
          }
        });
      });
    </script>
  </head>
  <body>
    <div class="main">
      <div class="chat">
        <p id="robot"></p>
        <p id="man"></p>
      </div>
      <div class="bottom">
        <input type="text" name="content">
        <div id="btn">发送</div>
      </div>
    </div>
  </body>
</html>
