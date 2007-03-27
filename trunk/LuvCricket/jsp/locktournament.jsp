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
        <script type="text/javascript" src="/LuvCricket/js/tournament.js"></script> 
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
    </head>
    <body class="backgroundbase">
        <html:form action="/tournament">
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
                <tr><td colspan="3" class="pageheader"><label>LOCK TOURNAMENT FOR DATE</label></td></tr>
                
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="border: 1px solid #666;">
                            <!-- WRITE YOUR CODE HERE -->
                            <table>
                                <tr>
                                    <td align="left" class="textlable">Tournament Id:</td>
                                    <td><lc:dropdownbox name="objLCTournament.tournament_id"  refxlist="opt_tournament_id" onchange="onChangeLockTournament()"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Tournament Status</td>
                                    <td align="left" ><lc:dropdownbox name="objLCTournament.tournament_status" refx="TOURNAMENT_STATUS" onchange="javascript:alert('hi');"/></td>
                                </tr>
                                
                                <tr>
                                    <td align="left" class="textlable">Current Effective Date:</td>
                                    <td><html:text property="objLCTournament.next_effective_date" size="12" readonly="true"  styleClass="textbox"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Next Effective Date:</td>
                                    <td><input id="next_effective_date" name="next_effective_date" size="12" class="textbox"/></td>
                                </tr>
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr>
                                    <td colspan="2" align="center"><input type="button" name="butSubmitForLock" value=" LOCK THE TOURNAMENT " onclick="submitForTeamLock();"/></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                
            </table>
        </html:form>
    </body>
</html>
