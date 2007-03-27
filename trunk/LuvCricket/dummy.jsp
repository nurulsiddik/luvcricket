<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page language="java" import="wow.play.cricket.Welcome" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="struts-html" %>

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Luv Cricket..... Dont you just love it..</title>
    </head>
    <script type="text/javascript">
        function submitToMain()
        {
            var popup = window.open("popuptester.html",null,"height=1,width=1");
            if(popup == null)
            {
                alert("Popup blocker found. Please allow popup for this site else the site wont work");
                return;
            }
            else
            {
                popup.close();
            }
            //window.close();
            document.forms[0].action = "/LuvCricket/login.do?appEvent=welcome";
            document.forms[0].submit();
        }
    </script>
    <body onload="submitToMain()">
        <form method="POST">
            <p>Redirecting......................</p>
        </form>
    </body>
</html>
