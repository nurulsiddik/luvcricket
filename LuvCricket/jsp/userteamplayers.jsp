<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="wow.play.cricket.common.XMLMenuParser" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/lc-tags.tld" prefix="lc" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>

<!--
    --COMMENT ON THIS JSP
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="Page-Enter" content="revealTrans(Duration=1.0,Transition=23)">
        <META HTTP-EQUIV="Page-Exit" content="revealTrans(Duration=1.0,Transition=23)"> 
        
        <link rel="stylesheet" type="text/css" href="/LuvCricket/css/stylesheet.css" title="style"/>
        <script type="text/javascript" src="/LuvCricket/js/common.js"></script> 
        <script type="text/javascript" src="/LuvCricket/js/userteam.js"></script>
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        
        
        int flgPredStage = 0; // if 0 then allow to change

        Calendar cal_winner = Calendar.getInstance();
        cal_winner.set(2007,3,24,18,29); //24th April, 06:29
        long date_winner = cal_winner.getTimeInMillis();

        long date_curr = new Date().getTime();

        if(date_curr > date_winner)
        {
            flgPredStage = 1;   //Lock lc tournament winner
        }            
        
        %>
    </head>
    <body class="backgroundbase" onload="fnLoadUserTeamPlayer()">
        <html:form action="/userteamplayers">
            <table border="0" ALIGN="center" WIDTH="100%">
                <lc:title menubar="true" title="User Team Creation" username="true"/>
                <tr height="100%">
                    <td align="left" colspan="3">
                        <table align="center" border="4" width="100%" >
                            <tr>
                                <td align="left" width="53%" valign="top">
                                    <div>
                                        <!-- WRITE YOUR CODE HERE -->
                                        <table border="0" width="98%">
                                            <tr>
                                                <td class="labelonly" align="center"  colspan="2"><b>Team Id</b>
                                                    <lc:dropdownbox name="objUserTeam.user_team_id"  emptyoption="false" refxlist="opt_user_team" onchange="onChangeUserTeam();" />&nbsp;&nbsp;<a href="javascript:fnOpenPredictTeam()">Predict Winner</a> &nbsp;&nbsp;&nbsp;<a href="javascript:fnOpenPredictLCTeamWinner()">Win T-Shirt</a><img alt="New" src="/LuvCricket/images/new.gif"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="rightlabel" style="font-weight:bold" colspan="2">Description &nbsp;&nbsp;<html:text property="objUserTeam.user_team_descr" size="40" maxlength="40" styleClass="textbox" /> 
                                                    &nbsp;&nbsp;&nbsp; <label style="font-weight: bold; font-size: 12px; color: darkgreen">Total Points:&nbsp;</label>&nbsp;
                                                    <label style="font-weight: bold; font-size: 12px; color: red"><%=session.getAttribute("team_points")%></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="rightlabel" align="left">
                                                    <font colspan="2" class="rightlabel" align="left" style="color: darkblue"><b>Players Associated with this team:</b></font>&nbsp;&nbsp;
                                                    <b>Next CutOff Date:&nbsp; 
                                                        <!--display:none;--><label id="next_effective_date" style="color: red"><%=(String)request.getAttribute("next_effective_date") %></label>&nbsp;<label style="color: darkred">06:30 PM</label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <!-- User Players Table -->
                                                    <div class="divGridHeaderTab" >
                                                        <table class="divGridHeaderTab" border="0" width="100%">
                                                            <thead>
                                                                <tr>
                                                                    <td align="center" width="25%">Country Name</td>
                                                                    <td align="center" width="25%">Player Type</td>
                                                                    <td align="center" width="35%">Player Name</td>
                                                                    <td align="center" width="15%">Value</td>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </div>    
                                                    <div class="divGridArea" style="height: 204px;">
                                                        <table border="1" width="100%" id="userteam_players">
                                                            <tbody>
                                                                <logic:notEmpty name = "userteam_players_list" scope = "session">
                                                                    <logic:iterate id="userteam_players" indexId="i" scope="session" name="userteam_players_list" type="wow.play.cricket.vo.PlayingNationsTeamVO">
                                                                        <tr class="divGridArea" style="height: 12px; cursor: default" valign = "top" >
                                                                            <td width="25%" id = "<%= i %>" ><bean:write name="userteam_players" property="country_id"/>&nbsp;</td>
                                                                            <td width="25%"><bean:write name="userteam_players" property="player_type"/>&nbsp;</td>
                                                                            <td width="35%" flash="false"><bean:write name="userteam_players" property="player_name"/>&nbsp;</td>
                                                                            <td width="15%"><bean:write name="userteam_players" property="player_value"/>&nbsp;</td>
                                                                            <td style="display:none" ><bean:write name="userteam_players" property="player_id"/></td>
                                                                            <html:hidden indexed="true" name="userteam_players" property="player_id"/>
                                                                        </tr>
                                                                    </logic:iterate> 
                                                                </logic:notEmpty>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    
                                                    
                                                    <!-- User Player Table complete -->
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="textlable">Tournament Value: <input type="hidden" name="tournament_value" readOnly="true" size="5" value="<%=(String) request.getAttribute("TOURNAMENT_VALUES")%>" class="textbox"/><b style="color:red"> UNLIMITED</b></td>
                                                <td class="textlable"><!--User Team Value: -->&nbsp;<input type="hidden" name="userteam_value" readOnly="true" size="5" class="textbox"/></td>
                                            </tr>
                                            <tr>
                                                <td class="textlable" align="left" style="display:none">Changes left:
                                                    <label id="number_of_changes_left" style="color:red"></label>&nbsp; out of&nbsp;
                                                    <label id="tournament_changes_allowed" style="color: blue"><%=(String)request.getAttribute("TOURNAMENT_CHANGES")%></label>
                                                </td>
                                                <td class="textlable"><!--Difference in Value: -->&nbsp;<input type="hidden" name="difference_value" readOnly="true" size="5" class="textbox"/></td>
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <% if(flgPredStage == 0) {%>
                                                    <input type="button" value=" Save " name="butSave" onclick="fnSaveUserTeamPlayers();"/>
                                                    <% } else {%>
                                                    <font style="font-weight: bold; font-size: 12px; color: red">Team Selection Over. SAME TEAM WILL BE CARRIED OUT TILL TOURNAMENT FINAL.</font>
                                                    <%}%>
                                                </td>
                                            </tr>
                                            
                                        </table>
                                    </div>
                                </td>
                                <td align="center" width="47%" valign="top">
                                    <table border="0" width="98%">
                                        <tr>
                                            <td colspan="2" class="rightlabel" align="left"><b>Filter Crieteria</b>&nbsp;
                                                <label style="color: red; font-family: Verdana; font-size:10px; vertical-align: top;">(<b>Select/Deselect</b> below players for your team)</label>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="textlable">Player Type</td>
                                            <td>
                                                <lc:dropdownbox refx="PLAYER_TYPE" name="lstPlayerType" emptyoption="true"/>
                                                &nbsp;&nbsp;<a href="javascript:showSchedule();" style="font-color:#FFD9F2; font-family: Verdana; font-size: 10px; font-weight: bold;">Match Schedule</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="textlable">Country</td>
                                            <td>
                                                <lc:dropdownbox refxlist="opt_nations" name="lstCountries" emptyoption="true"/>
                                                &nbsp;&nbsp;<label class="textlable">Select My Players</label> <input type="checkbox" name="chk_select_myplayer" onclick="filterSelectedPlayers()">
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="textlable" colspan="2" style="text-align: left;">Value From:&nbsp;<input type="text" id="valueFrom" name="valueFrom" size="5" maxlength="3" onkeypress="allowOnlyDigits();"/>
                                                &nbsp;&nbsp;Value To:&nbsp;<input type="text" id="valueTo" name="valueTo" size="5" maxlength="3" onkeypress="allowOnlyDigits();"/>
                                                &nbsp;&nbsp;<input type="button" value=" Filter " name="butFilter" onclick="fnFilterPlayer();"/>
                                            </td>
                                        </tr>
                                        <!-- All Players -->
                                        <tr>
                                            <td colspan="2">
                                                <div class="divGridHeaderTab" >
                                                    <table class="divGridHeaderTab" border="0" width="100%">
                                                        <thead>
                                                            <tr>
                                                                <td align="center" width="7%"></td>
                                                                <td align="center" width="25%">Country Name</td>
                                                                <td align="center" width="25%">Player Type</td>
                                                                <td align="center" width="30%">Player Name</td>
                                                                <td align="center" width="13%">Value</td>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                </div>    
                                                <div class="divGridArea" style="height: 311px;">
                                                    <table border="1" width="100%"  class="fixedDataTable" id="tournament_players">
                                                        <tbody>
                                                            <logic:notEmpty name = "all_tournamentplayers_list" scope = "session">
                                                                <logic:iterate id="tournament_players" indexId="i" scope="session" name="all_tournamentplayers_list" type="wow.play.cricket.vo.PlayingNationsTeamVO">
                                                                    <tr class="divGridArea" style="height: 20px; cursor: default" valign = "top">
                                                                        <td width="7%"><span title="Select to add this player to your team/ Deselect to remove"><input type="checkbox"  id="chk_<%=i%>" value="<%=i%>" onclick="fnSelectThisPlayer(this)"/></span> </td>
                                                                        <td width="25%" class="fixedDataCell" id = "<%= i%>" ><bean:write name="tournament_players" property="country_id"/>&nbsp;</td>
                                                                        <td width="25%" class="fixedDataCell"><bean:write name="tournament_players" property="player_type"/>&nbsp;</td>
                                                                        <td width="30%" class="fixedDataCell"><a href="javascript:fnShowPlayerContribution('','<bean:write name="tournament_players" property="player_id"/>')"><bean:write name="tournament_players" property="player_name"/></a>&nbsp;</td>
                                                                        <td width="13%"><bean:write name="tournament_players" property="player_value"/>&nbsp;</td>
                                                                        <html:hidden indexed="true" name="tournament_players" property="player_id"/>
                                                                    </tr>
                                                                </logic:iterate> 
                                                            </logic:notEmpty>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                
                                            </td>
                                        </tr>
                                        <!-- All Players -->
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
            </table>
            <input type="hidden" name="screen_mode" id="screen_mode" value="<%=request.getParameter("screen_mode")%>"/>
            <input type="hidden" name="batsmanCount" id="batsmanCount" value="0"/>
            <input type="hidden" name="bowlerCount" id="bowlerCount" value="0"/>
            <input type="hidden" name="wkCount" id="wkCount" value="0"/>
            <input type="hidden" name="allrounderCount" id="allrounderCount" value="0"/>
            <input type="hidden" name="NOTE_CHANGES" value="<%=(String)request.getAttribute("NOTE_CHANGES")%>"/>
            <input type="hidden" name="compare_team" value="<%=(String)request.getAttribute("compare_team")%>"/>
            <input type="hidden" name="number_of_changes" value="<%=(String)request.getAttribute("number_of_changes")%>"/>
        </html:form>
        
        <div id="divTournMatches" style="height:215px; width:356px; overflow:auto;border: 1px 1px 1px 1px solid; background-image:url('/LuvCricket/images/wc_small_2007.jpg'); left:550px; top: 150px; position:absolute; visibility:hidden;">
            <img alt="close" src="/LuvCricket/images/door_exit.gif" style="cursor:hand;" onclick="hideSchedule()"/>
            <div style="height:175px; width:346px; overflow:auto;">
                <table width="100%">
                    <logic:notEmpty name = "tournament_matches" scope = "session">
                        <logic:iterate id="id_tourn_matches" indexId="i" scope="session" name="tournament_matches" type="wow.play.cricket.vo.TournamentMatchesVO">
                            <tr>
                                <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;"><bean:write name="id_tourn_matches" property="match_date"/></td>
                            </tr>
                            <tr>
                                <td style="font-family:Verdana;font-weight: bold; font-size: 11px; color:darkred;"><bean:write name="id_tourn_matches" property="country_id1"/> vs <bean:write name="id_tourn_matches" property="country_id2"/></td>
                            </tr>
                            <tr><td><hr></td></tr>
                        </logic:iterate>
                    </logic:notEmpty>
                </table>
            </div>
            
        </div>
        
        <lc:msg_error/>
    </body>
</html>
