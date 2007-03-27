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
        <script>
            function setDialogDimension()
            {
                //alert(this.dialogWidth);
                //alert(this.dialogHeight);
            }
        </script>
        <title>Reset Password Verification</title>
    </head>
    <body onload="setDialogDimension()" >
        <html:form action="/registernewuser">
            <table border="0" ALIGN="center" WIDTH="100%">
                <tr><td colspan="3" ><h2 align="center" style="font-style: Courier">Reset Password Verification</h2></td></tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <!-- WRITE YOUR CODE HERE -->
                        <table width="95%" border="1" cellpadding="2" cellspacing="2">
                            <tr>
                                <td align="left" class="textlable" style="color: black;">User Id (Employee Id):</td>
                                <td><input type="text" name="user_id" size="5" maxlength="4"  class="textbox" onkeypress="allowOnlyDigits();"/>
                            </tr>
                            <tr>
                                <td align="left" class="textlable" style="color: black">Login Name(Employee login):</td>
                                <td><input type="text" name="login_name" size="30" maxlength="45"  class="textbox"/></td>
                            </tr>
                            <tr>
                                <td align="left" class="textlable" style="color: black">Email:</td>
                                <td><input type="text" name="email" size="40" maxlength="100"  class="textbox"/></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="button" value=" Reset " name="butRest" onclick="resetPassword()"/>&nbsp;&nbsp;
                                    <input type="button" value=" Close " name="butClose" onclick="window.close()"/>
                                </td>
                            </tr>
                            <tr>
                                <logic:notEmpty name="pass_message" scope="request">
                                    <td colspan="2" class="rightlabel" style="color: red;"><b><bean:write name="pass_message" scope="request"/></b></td>
                                </logic:notEmpty>
                            </tr>
                        </table>
                        
                    </td>
                </tr>
                
            </table>
        </html:form>
    </body>
</html>
