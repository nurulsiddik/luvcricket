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
        <script type="text/javascript" src="/LuvCricket/js/userteam.js"></script>
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
    </head>
    <body class="backgroundbase">
        <html:form action="/userteam">
            <table border="0" ALIGN="center" WIDTH="100%">
                <tr>
                    <td><font class="userwelcomelabel">Welcome <%= (String)session.getAttribute("username")%> </font></td>
                    <td ALIGN="right">
                        <script language="JavaScript1.2" type="text/javascript">
                        screenMenu.writeMenuBar();
                        </script>
                    </td>
                    <td align="center"><img alt="LogOut" src="/LuvCricket/images/logout.gif" name="imgLogOut" onclick="fnLogOut()" style="cursor: Hand;"></td>
                </tr>
                
                <tr><td colspan="3" class="pageheader"><label>User Team Creation</label></td></tr>
                
                <tr height="100%">
                    <td align="center" colspan="3" width="100%">
                        <div>
                            <!-- WRITE YOUR CODE HERE -->
                                        
                            <table border="0" align="center" width="100%">
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr>
                                    <td align="left" class="textlable" width="50%">Tournament Id</td>
                                    <td width="50%"><lc:dropdownbox name="objUserTeam.tournament_id"  emptyoption="false" refxlist="opt_tournament_id" /></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Team Name</td>
                                    <td>
                                        <html:text property="objUserTeam.user_team_id" size="20" maxlength="30" styleClass="textbox"  />&nbsp; 
                                        <label style="color: red; font-family: Verdana; font-size:10px; vertical-align: top;">(<b>hint</b> Name you want to display)</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Description </td>
                                    <td><html:text property="objUserTeam.user_team_descr" size="40" maxlength="40" styleClass="textbox"  /> </td>
                                </tr>
                                
                                <tr><td colspan="2">&nbsp;</td></tr>
                                
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="button" value=" Save " name="butSave" onclick="fnSaveUserTeam();"/>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"> &nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="screen_mode" id="screen_mode" value="<%=request.getParameter("screen_mode")%>"/>
        </html:form>
        <lc:msg_error/>
    </body>
</html>
