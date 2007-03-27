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
    
    <body topmargin="0" leftmargin="0"  onload="onFormLoad();" alink="blue" vlink="green" style="background-image: url('images/playcricket.jpg'); background-repeat: no-repeat; background-position: right;">
        <html:form action="/registernewuser">
            <table border="0" ALIGN="center" WIDTH="100%">
                <tr><td colspan="3" class="CricHeading"><label>Please Register Yourself....</label></td></tr>
                
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div >
                            <!-- WRITE YOUR CODE HERE -->
                            <table>
                                <tr><td>&nbsp;</td></tr>
                                <tr>
                                    <td align="left" class="textlable" style="color: black;">User Id (Employee Id):</td>
                                    <td><html:text property="objUserData.user_id" size="5" maxlength="4"  styleClass="textbox" onkeypress="allowOnlyDigits();"/>&nbsp;
                                    <label style="color: red; font-family: Verdana; font-size:10px; vertical-align: top;">(<b>Non Trigynites</b>, Please register from 9000)</label></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable" style="color: black">Login Name(Employee login):</td>
                                    <td>
                                        <html:text property="objUserData.login_name" size="30" maxlength="45"  styleClass="textbox"/>&nbsp;
                                        <label style="color: red; font-family: Verdana; font-size:10px; vertical-align: top;">(<b>e.g</b> brian.lara)</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable" style="color: black">Your Name:</td>
                                    <td><html:text property="objUserData.user_name" size="40" maxlength="128"  styleClass="textbox"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable" style="color: black">Password:</td>
                                    <td>
                                        <html:password property="objUserData.password" size="20" maxlength="20"  styleClass="textbox"/>                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable" style="color: black">Re Enter Password:</td>
                                    <td><input name="txtRePassword" type="password" size="20" maxlength="20"  class="textbox"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable" style="color: black">Email:</td>
                                    <td><html:text property="objUserData.email" size="40" maxlength="100"  styleClass="textbox"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable" style="color: black">Apni Taarif:</td>
                                    <td><html:text property="objUserData.description" size="40" maxlength="45"  styleClass="textbox"/></td>
                                </tr>
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr>
                                    <td colspan="2" align="right">
                                        <input name="butSubmit" value=" Register " type="button" onclick="submitDataForInsertion()">&nbsp;
                                        <label style="font-size: 16pt; font-weight: bold; color: white"> 
                                            <a href="./login.do?appEvent=welcome" >Already a register member?</a>
                                        </label>
                                        
                                    </td>
                                </tr>
                                <!--<tr>
                                    <td colspan="2" align="center">
                                        <p style="font-size: 16pt; font-weight: bold; color: white"> 
                                            <a href="./login.do?appEvent=welcome" >Already a register member?</a>
                                        </p>
                                    </td>
                                </tr>-->
                            </table>
                        </div>
                    </td>
                </tr>
                
            </table>
            <input name="msgid" type="hidden" value="<%=msgid%>"/>
            <input name="sqlerror" type="hidden" value="<%=sqlerror%>"/>
            
        </html:form>
        <lc:msg_error/>
    </body>
</html>
