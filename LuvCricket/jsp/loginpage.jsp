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
        <META HTTP-EQUIV="Page-Enter" content="revealTrans(Duration=1.0,Transition=23)">
        <META HTTP-EQUIV="Page-Exit" content="revealTrans(Duration=1.0,Transition=23)"> 

        <link rel="stylesheet" type="text/css" href="/LuvCricket/css/stylesheet.css" title="style"/>
        <script type="text/javascript" src="/LuvCricket/js/common.js"></script> 
        <script type="text/javascript" src="/LuvCricket/js/login.js"></script>
        
    </head>
    <body style="filter:progid:DXImageTransform.Microsoft.Gradient(endColorstr='#C0CFE2', startColorstr='#FFFFFF', gradientType='0');" onload="checkCookie('lc_user_cookie');fnInitLogin();">
        <html:form action="/login" method="POST">
            <p style="font-color:red; font-family:sans-serif;font-weight: bold; vertical-align: top; text-align: center; align:center" align="center">
                This is a beta release of website. Please act as an intelligent user to enter data. Released specially because of <img height="100px" width="150px" alt="icc" src="/LuvCricket/images/icc_wc.jpg"> 
            </p>
            <table border="0" ALIGN="center" WIDTH="100%" onkeypress="trackEnter();">
                <tr >
                    <td width="60%" rowspan="5">
                        <img alt="login image" src="/LuvCricket/images/login_image.jpg"/>
                    </td>
                    <!--<td>&nbsp;2</td>-->
                </tr>
                <tr valign="top">
                    <!--<td width="40%">&nbsp;3</td>-->
                    <td>
                        <!-- User Login -->
                        <table border="0" width="100%">
                            <tr >
                                <td colspan="2" style="font-family:sans-serif;font-weight: bold; font-size: 12px;"><u>Already Registered Login Below:</u></td>
                            </tr>
                            <tr>
                                <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;">User Id or Login Name</td>
                                <td><html:text property="userId" size="20" maxlength="45" styleClass="c5" value="Enter User Id/Login Name"/></td>
                            </tr>
                            <tr>
                                <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;">Password</td>
                                <td><html:password property="password" size="20" maxlength="128" styleClass="c5" value=""/></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <img name="imgSubmitLogin" alt="Submit" src="/LuvCricket/images/trophy_WC.gif" style="cursor: hand;" width="65" height="65" border="0" onclick="submitPage()">
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="font-family:sans-serif;font-weight: bold; font-size: 12px;"><a href="javascript:fnForgotPassword()">Forgot Password?</a></td>
                                <td align="left" style="font-family:sans-serif;font-weight: bold; font-size: 12px;"><a href="javascript:fnRegUser()">New User Sign Up.</a></td>                                
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr>
                    <!--<td width="40%">&nbsp;</td>-->
                    <td>
                        <!-- User Login 
                        <table border="0" width="100%">
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr >
                                <td colspan="2" style="font-family:sans-serif;font-weight: bold; font-size: 12px;">Want to be a part of it! Click Below:&nbsp;&nbsp; &nbsp;&nbsp; <a href="javascript:fnShowWhy()">Why should I? </a></td>
                            </tr>
                            <tr>
                                <td colspan="2">           
                                    <img name="imgNewRegistration" src="/LuvCricket/images/FAN_HD.jpg" onclick="fnRegUser();" width="334" height="146" border="0" style="cursor : hand">
                                </td>
                            </tr>
                        </table>-->
                    </td>
                </tr>
                
                
            </table>
        </html:form>
        <lc:msg_error/>
    </body>
</html>
