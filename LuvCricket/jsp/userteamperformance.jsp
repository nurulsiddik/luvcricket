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
        
        <script type="text/javascript">
            function fetchUserTeamPerformance()
            {
                var objUserTeam = getObj("opt_user_team");
                var user_team_id = objUserTeam.options[objUserTeam.selectedIndex].value;

                var objEffDate = getObj("opt_eff_date");
                var eff_date = objEffDate.options[objEffDate.selectedIndex].value;
                if(eff_date != "")
                {
                    document.forms[0].action = "/LuvCricket/userteamperformance.do?appEvent=showTeamPerformance&&user_team_id="+user_team_id+"&&eff_date="+eff_date;
                    document.forms[0].submit();
                }    
            }
        </script>
        
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
    </head>
    <body class="backgroundbase">
        <html:form action="/tournament">
            <table border="0" ALIGN="center" WIDTH="100%">
                <lc:title menubar="true" title="View How Points earned by teams" username="true"/>                
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="border: 1px solid #666;">
                            <!-- WRITE YOUR CODE HERE -->
                            <table border="0" align="center" width="80%">
                                <tr>
                                    <td  class="textlable" width="50%">User Team Id:</td>
                                    <td width="50%"><lc:dropdownbox name="opt_user_team" refxlist="lst_user_team"  onchange="fetchUserTeamPerformance()" /></td>
                                </tr>
                                <tr>
                                    <td  class="textlable">Match Dates:</td>
                                    <td>
                                        <lc:dropdownbox name="opt_eff_date" refxlist="lst_effective_dates" emptyoption="true" onchange="fetchUserTeamPerformance()"/>
                                    </td>
                                </tr>
                                <logic:notEmpty name="match_list" scope="request">
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <lc:dropdownbox name="opt_match_list" refxlist="match_list" size="2"/>                                        
                                        </td>
                                    </tr>
                                </logic:notEmpty>
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr align="center">
                                    <td colspan="2" align="center">
                                        <logic:notEmpty name = "lst_player_perf" scope = "request">
                                            <table border="1" width="80%" id="player_perf" class="fixedDataTable" align="center" cellpadding="1" cellspacing="1">
                                                <thead>
                                                    <tr class="firstPageGridHeaderTab" style="font-size: 12px">
                                                        <td width="20%">Country</td>
                                                        <td width="20%">Player Name</td>
                                                        <td width="10%">Runs Scored</td>
                                                        <td width="10%">Wickets</td>
                                                        <td width="10%">Catches</td>
                                                        <td width="10%">Stumping</td>
                                                        <td width="10%">Run Out</td>
                                                        <td width="10%">Points Gathered</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <logic:iterate id="id_player_perf" indexId="i" scope="request" name="lst_player_perf" type="wow.play.cricket.vo.PlayerContributionVO">
                                                        <tr class="divGridArea" style="height: 16px; cursor: default" valign = "top" >
                                                            <td ><bean:write name="id_player_perf" property="country_id"/>&nbsp;</td>
                                                            <td class="fixedDataCell"><bean:write name="id_player_perf" property="player_name"/>&nbsp;</td>
                                                            <td ><bean:write name="id_player_perf" property="runs_scored"/>&nbsp;</td>
                                                            <td ><bean:write name="id_player_perf" property="wickets_taken"/>&nbsp;</td>
                                                            <td ><bean:write name="id_player_perf" property="catches"/>&nbsp;</td>
                                                            <td ><bean:write name="id_player_perf" property="stumps"/>&nbsp;</td>
                                                            <td ><bean:write name="id_player_perf" property="runout"/>&nbsp;</td>
                                                            <td ><bean:write name="id_player_perf" property="player_points"/>&nbsp;</td>
                                                        </tr>
                                                    </logic:iterate> 
                                                </tbody>
                                            </table>
                                            <font class="textlable">Total Points acquired this day: </font><b style="font-size:18px;color:darkblue;background-color:yellow"><%=request.getAttribute("total_points")%></b>
                                        </logic:notEmpty>
                                        <logic:notEmpty name="no_players" scope="request">
                                            <font style="font-size:20px; font-style:Verdana;">No Players Have been selected for this date for this team.</font>
                                        </logic:notEmpty>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <logic:notEmpty name = "lst_player_perf" scope = "request">
                    <tr>
                        <td colspan="2" class="textlable" style="color:red">Note: Refer to tournament rules for points calculation logic.</td>
                    </tr>
                </logic:notEmpty>    
            </table>
        </html:form>
    </body>
</html>
