<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/lc-tags.tld" prefix="lc" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User Registration</title>
        <script type="text/javascript" src="/LuvCricket/js/common.js"></script>
        <script type="text/javascript" src="/LuvCricket/js/regNewUser.js"></script>    
        
    </head>
    <%
    String fwdValue = request.getParameter("fwdvalue");
    if(fwdValue == null || "".equals(fwdValue))
    {
        fwdValue = (String)request.getAttribute("fwdvalue");
    }
    
    String msgid = request.getParameter("msgid");
    if(msgid == null || "".equals(msgid) || "null".equals(msgid))
    {
        msgid = (String)request.getAttribute("msgid");
    }
    String sqlerror = request.getParameter("sqlerror");
    if(sqlerror == null || "".equals(sqlerror) || "null".equals("sqlerror"))
    {
        sqlerror = (String)request.getAttribute("sqlerror");
    }
    
    %>
    <style type="text/css"> 
        a:link {color: #0000FF}
        a:visited {color: #800080}
        a:active {color: #FF0000}
        .c1   {background-image: url('images/playcricket.jpg');; margin: 0px; background-color: #99ffcc}
        .c2   {font-family: verdana; font-size: 10pt; text-align: left; color: #000000}
        .c3   {border-style: solid; border-width: 0; border-color: silver; padding: 0px 2px 0px 2px; color: lime}
        .c4   {width: 190px; font-family: verdana; font-size: 10pt; text-align: left; color: #000000}
        .c5   {width: 309px; height: 95px; font-family: verdana; font-size: 10pt; text-align: left; color: #000000}
        .c6   {width: 119px; font-family: verdana; font-size: 10pt; color: #000000}
    </style>
    
    
    <link rel="stylesheet" type="text/css" href="/LuvCricket/css/stylesheet.css" title="style"/>
    <body  topmargin="0" leftmargin="0"  onload="onFormLoad();" style="background-image: url('images/playcricket.jpg');filter: alpha (opacity=75)">
        <html:form method="POST" action="/registernewuser">  
            <h1 align="center" class="CricHeading">Please Register Yourself....</h1>
            <table cellspacing="0" cellpadding="0" width="100%" class="c2">
                <tr>
                    <td height="100" width="8%"/>
                    <td width="23%"/>
                    <td width="3%"/>
                    <td width="14%"/>
                    <td width="8%"/>
                    <td width="14%"/>
                    <td width="25%"/>
                </tr>
                <tr>
                    <td height="24"/>
                    <td width="23%" align="right" class="c3">User Id (Employee Id)</td>
                    <td/>
                    <td colspan="2" valign="top">
                        <html:text property="objUserData.user_id"  size="5" maxlength="4"/>
                    </td>
                    <td colspan="2"/>
                </tr>
                <tr>
                    <td height="5"/>
                    <td colspan="6"/>
                </tr>
                <tr>
                    <td height="24"/>
                    <td width="23%" align="right" class="c3">Login Name(Employee login)</td>
                    <td/>
                    <td colspan="2" valign="top">
                        <html:text property="objUserData.login_name" size="20" maxlength="128"/>
                    </td>
                    <td colspan="2"/>
                </tr>
                
                <tr>
                    <td height="5"/>
                    <td colspan="6"/>
                </tr>
                <tr>
                    <td height="24"/>
                    <td width="23%" align="right" class="c3">User Name</td>
                    <td/>
                    <td colspan="2" valign="top">
                        <html:text property="objUserData.user_name" size="20" maxlength="128"/>
                    </td>
                    <td colspan="2"/>
                </tr>
                <tr>
                    <td height="5"/>
                    <td colspan="6"/>
                </tr>
                <tr>
                    <td height="24"/>
                    <td width="23%" align="right" class="c3">Password</td>
                    <td/>
                    <td colspan="2" valign="top">
                        <html:password property="objUserData.password" size="20" maxlength="20"/>
                    </td>
                    <td colspan="2"/>
                </tr>
                <tr>
                    <td height="5"/>
                    <td colspan="6"/>
                </tr>
                <tr>
                    <td height="24"/>
                    <td width="23%" align="right" class="c3">Re Enter Password</td>
                    <td/>
                    <td colspan="2" valign="top"><input name="txtRePassword" type="password" class="c4"></td>
                    <td colspan="2"/>
                </tr>
                <tr>
                    <td height="5"/>
                    <td colspan="6"/>
                </tr>
                <tr>
                    <td height="4"/>
                    <td width="23%" rowspan="2" align="right" class="c3">Apni Taarif</td>
                    <td colspan="5"/>
                </tr>
                <tr>
                    <td height="20"/>
                    <td/>
                    <td rowspan="2" colspan="3" valign="top">
                        <html:textarea property="objUserData.description" cols="32" rows="4" />
                    </td>
                    <td rowspan="2"/>
                </tr>
                <tr>
                    <td height="75"/>
                    <td colspan="2"/>
                </tr>
                <tr>
                    <td height="25"/>
                    <td colspan="6"/>
                </tr>
                <tr>
                    <td height="24"/>
                    <td colspan="2"/>
                    <td valign="top">
                        <input name="butSubmit" value="Register" type="button" onclick="submitDataForInsertion()" class="c6">
                    </td>
                    <td colspan="2">
                        <p style="font-size: 10pt; font-weight: bold; color: #66FF00"> 
                            <a href="./login.do?appEvent=welcome" >Already a register member?</a>
                        </p>
                        
                    </td>
                    <td/>
                </tr>
            </table>
            <input name="msgid" type="hidden" value="<%=msgid%>"/>
            <input name="sqlerror" type="hidden" value="<%=sqlerror%>"/>
        </html:form>
        <lc:msg_error/>
    </body>
    
</html>
