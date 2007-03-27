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
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
    </head>
    <body class="backgroundbase">
        <html:form action="/playingnations">
            <table border="1" ALIGN="center" WIDTH="100%">
                <tr>
                    <td><font class="userwelcomelabel">Welcome <%= (String)session.getAttribute("username")%> </font></td>
                    <td ALIGN="right">
                        <script language="JavaScript1.2" type="text/javascript">
                        screenMenu.writeMenuBar();
                        </script>
                    </td>
                    <td align="center"><img alt="LogOut" src="/LuvCricket/images/logout.gif" name="imgLogOut" onclick="fnLogOut()" style="cursor: Hand;"></td>
                </tr>
                <tr><td colspan="3" class="pageheader"><label>PLAYING NATIONS </label></td></tr>
                
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="border: 0px solid #666;">
                            <table border="0">
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr>
                                    <td align="left" class="textlable">Country Name</td>
                                    <td align="left"><html:text property="objPlayingNations.country_name" size="20" styleClass="textbox"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Country Status</td>
                                    <td align="left" ><lc:dropdownbox name="objPlayingNations.country_active" refx="TOURNAMENT_STATUS" onchange="javascript:alert('hi');"/></td>
                                </tr>
                                
                            </table>
                            
                        </div>
                    </td>
                </tr>
                
            </table>
        </html:form>
    </body>
</html>
