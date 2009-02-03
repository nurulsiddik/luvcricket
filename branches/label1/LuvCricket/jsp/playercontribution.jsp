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
        <script type="text/javascript" src="/LuvCricket/js/scorecard.js"></script>
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
    </head>
    <body class="backgroundbase">
        <html:form action="/playercontribution">
            <table border="0" ALIGN="center" WIDTH="100%">
                <lc:title menubar="true" title="Player Contribution" username="true"/>                
                <tr height="100%">
                    <td  colspan="3" align="center">
                        
                        <!-- WRITE YOUR CODE HERE -->
                        <table>
                            <tr>
                                <td width="50%" align="left" class="textlable">Tournament Id:</td>
                                <td width="50%"><lc:dropdownbox name="objTournMatches.tournament_id" refxlist="opt_tournaments" emptyoption="true" onchange="onChangeTournamentPl();"/></td>
                            </tr>
                            <tr>
                                <td align="left" class="textlable">Select Match:</td>
                                <td><lc:dropdownbox name="objTournMatches.match_id" refxlist="opt_tournament_matches" emptyoption="true" onchange="calculatePlayerContribution()"/></td>
                            </tr>
                            
                        </table>
                        <logic:notEmpty name="player_contribution" scope="session">
                            
                            <table border="1" width="60%">
                                <thead >
                                    <tr style="color:blue; font-weight:bold; font-family: sans-serif; text-align: center; position:relative;">
                                        <td width="15%">Country</td>
                                        <td width="25%">Player Name</td>
                                        <td width="8%">Runs </td>
                                        <td width="15%">Wickets</td>
                                        <td width="15%">Catches</td>
                                        <td width="8%">Stumps</td>
                                        <td width="8%">runout</td>
                                        <td width="6%">Points</td>
                                    </tr>
                                </thead>
                            </table>
                            <div style="border: 1px solid #666; height: 350px; overflow: auto;">
                                <table border="1" width="60%">
                                    <tbody>
                                        <logic:iterate id="id_player_contribution" indexId="i" name="player_contribution" scope="session" type="wow.play.cricket.vo.PlayerContributionVO">
                                            <tr style="color:black; font-family: verdana; text-align: left;" >
                                                <td width="15%"><bean:write name="id_player_contribution" property="country_id"/></td>
                                                <td width="25%"><bean:write name="id_player_contribution" property="player_name"/></td>
                                                <td width="8%"><bean:write name="id_player_contribution" property="runs_scored"/></td>
                                                <td width="15%"><bean:write name="id_player_contribution" property="wickets_taken"/></td>
                                                <td width="15%"><bean:write name="id_player_contribution" property="catches"/></td>
                                                <td width="8%"><bean:write name="id_player_contribution" property="stumps"/></td>
                                                <td width="8%"><bean:write name="id_player_contribution" property="runout"/></td>
                                                <td width="8%"><bean:write name="id_player_contribution" property="player_points"/></td>
                                            </tr>
                                        </logic:iterate>
                                    </tbody>
                                </table>
                            </div>
                            <table>
                                <tr>
                                    <td colspan="2" align="center"><input type="button" name="butSave" value=" Save " onclick="savePlayerContribution();"/></td>
                                </tr>
                            </table>
                        </logic:notEmpty>
                        
                    </td>
                </tr>
                
            </table>
        </html:form>
    </body>
</html>
