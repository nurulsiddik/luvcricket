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
        <html:form action="/tournamentplayers">
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
                <tr><td colspan="3" class="pageheader"><label>TOURNAMENT PLAYER ASSOCIATION</label></td></tr>
                
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="border: 0px solid #666;">
                            <!-- WRITE YOUR CODE HERE -->
                            <table border="0" width="400px">
                                <tr>
                                    <td colspan="2"> &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Tournament Id</td>
                                    <td><lc:dropdownbox name="objTournamentPlayer.tournament_id"  emptyoption="true" refxlist="opt_tournament_id" onchange="onChangeTournament()"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Country Name</td>
                                    <td><lc:dropdownbox name="objTournamentPlayer.country_id"  emptyoption="true" refxlist= "opt_country_id" onchange="onChangeTourCountry()"/></td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2">
                                        <!-- Table -->
                                        <div class="divGridHeaderTab" >
                                            <table class="divGridHeaderTab" border="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <td align="center" width="30%">Country Name</td>
                                                        <td align="center" width="50%">Player Name</td>
                                                        <td align="center" width="20%">Value</td>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>    
                                        <div class="divGridArea">
                                            <table border="1" width="100%" id="tournament_player">
                                                <tbody>
                                                    <logic:notEmpty name = "tournament_player_list" scope = "session">
                                                        <logic:iterate id="tournament_player" indexId="i" scope="session" name="tournament_player_list" type="wow.play.cricket.vo.TournamentPlayerVO">
                                                            <logic:equal name="tournament_player" property="country_id" value="<%=request.getParameter("objTournamentPlayer.country_id")%>">
                                                                <tr class="divGridArea" style="height: 12px; cursor: default" valign = "top" onclick="fnSelectPlayerLine(this)">
                                                                    <td width="30%" id = "<%= i %>" ><bean:write name="tournament_player" property="country_id"/></td>
                                                                    <td width="50%"><bean:write name="tournament_player" property="player_name"/></td>
                                                                    <td width="20%"><bean:write name="tournament_player" property="player_value"/></td>
                                                                    <html:hidden indexed="true" name="tournament_player" property="player_id"/>
                                                                </tr>
                                                            </logic:equal>
                                                        </logic:iterate> 
                                                    </logic:notEmpty>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"> &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Player Name</td>
                                    <td><lc:dropdownbox name="objTournamentPlayer.player_id"  emptyoption="true" refxlist="opt_player_id"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Player Value</td>
                                    <td><html:text property="objTournamentPlayer.player_value" size="4" maxlength="3"/></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="button" value="Save Line" name="butLineSave" onclick="fnSavePlayerLine();"/>
                                        &nbsp;
                                        <input type="button" value="Delete Line" name="butLineDelete" onclick="fnDeletePlayerLine();"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"> &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="button" value="Associate Players" name="butAssociatedPlayer" onclick="fnAssociatePlayers();"/>
                                    </td>
                                </tr>

                            </table>
                        </div>
                    </td>
                </tr>
                
            </table>
        </html:form>
        <lc:msg_error/>
    </body>
</html>
