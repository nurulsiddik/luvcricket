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
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
    </head>
    <body class="backgroundbase" onload="onFormLoadEdit()">
        <html:form action="/editmydetails">
            <table border="0" ALIGN="center" WIDTH="100%">
                <lc:title menubar="true" title="Update my details" username="true"/>                
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="border: 1px solid #666;">
                            <!-- WRITE YOUR CODE HERE -->
                            <table>
                                <tr>
                                    <td align="left" class="textlable">Your Name </td>
                                    <td><html:text property="objUserData.user_name" size="30" maxlength="80" styleClass="textbox"  /> </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Password </td>
                                    <td><html:password property="objUserData.password" size="20" maxlength="20" styleClass="textbox"  /> </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Re-Password </td>
                                    <td><input type="password" name="txtRePassword" size="20" maxlength="20" class="textbox"  /> </td>
                                </tr>
                                
                                
                                <tr>
                                    <td align="left" class="textlable">Description </td>
                                    <td><html:text property="objUserData.description" size="40" maxlength="40" styleClass="textbox"  /> </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Email </td>
                                    <td><html:text property="objUserData.email" size="50" maxlength="100" styleClass="textbox"  /> </td>
                                </tr>
                                
                                <tr>
                                    <td align="left" class="textlable">My Default team</td>
                                    <td>
                                        <lc:dropdownbox name="objUserData.default_user_team"  emptyoption="true" refxlist="opt_user_team"  />&nbsp;
                                        <label style="color: red; font-family: Verdana; font-size:10px; vertical-align: middle;">This team detail will appear on home page.</label>
                                    </td>
                                </tr>
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr>
                                    <td align="center" colspan="2"><input type="button" value=" Save " onclick="submitForChange()"/> </td>
                                </tr>
                                
                            </table>    
                        </div>
                    </td>
                </tr>
                
            </table>
            <lc:hidden name="original_password" />
        </html:form>
        <lc:msg_error/>
    </body>
</html>
