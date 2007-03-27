<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="wow.play.cricket.common.XMLMenuParser" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/lc-tags.tld" prefix="lc" %>

<!--
    --COMMENT ON THIS JSP
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/LuvCricket/css/stylesheet.css" title="style"/>
        <script type="text/javascript" src="/LuvCricket/js/common.js"></script> 
        <title>Rules</title>
    </head>
    <body>
            <table border="0" ALIGN="center" WIDTH="100%">
                <tr><td colspan="3" ><h2 align="center" style="font-style: Courier">Frequently Asked Questions</h2></td></tr>
                <tr height="100%">
                    <td  colspan="3" align="center">
                            <!-- WRITE YOUR CODE HERE -->
                            <table width="90%" border="0" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td>
                                        <b>How to play?</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        To play this game you need to create a team of your choice.
                                        Its as if you are a selector of Cricket team and you are allowed to select your players from all the available countries participating in the tournament.
                                        For e.g in your team you can have Sachin and Ricky Pointing in same team although they are from different countries.
                                        You need to select <b>11 players ( 4 Batsman, 4 Bowler, 2 Allrounder, 1 Wicket keeper).</b>
                                        Each player is having a value depending on his performance in the one day cricket. You need to select players in such a way that
                                        total value of all players selected in your team should not be greater than    
                                    </td>
                                </tr>
                                
                            </table>
                    </td>
                </tr>
            </table>
    </body>
</html>
