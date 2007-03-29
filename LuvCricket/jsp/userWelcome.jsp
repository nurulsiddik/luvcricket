<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="wow.play.cricket.common.XMLMenuParser" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/lc-tags.tld" prefix="lc" %>

<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" type="text/css" href="/LuvCricket/css/stylesheet.css">
        <script type="text/javascript" src="/LuvCricket/js/common.js"></script>
        <script type="text/javascript" src="/LuvCricket/js/userwelcome.js"></script>
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
        
    </head>
    
    <body class="backgroundbase" onload="fnFilterTopPlayers('overall')">
        
        <TABLE border="0" ALIGN="center" WIDTH="100%">
            <tr>
                <td width="25%">
                    <font class="userwelcomelabel">Welcome <%=(String)session.getAttribute("username")%> </font>
                </td>
                <td ALIGN="right" width="60%">
                    <script language="JavaScript1.2" type="text/javascript">
                        screenMenu.writeMenuBar();
                    </script>
                </td>
                <td align="center" width="15%" valign="top" style="font-weight: bold; font-style:Verdana; font-size: 18; color:red"><a href="javascript:onclickFaq()">FAQ</a>&nbsp;&nbsp;<img alt="LogOut" src="/LuvCricket/images/logout.gif" name="imgLogOut" onclick="fnLogOut()" style="cursor: Hand;"></td>
            </tr>
            <tr>
                <td style="font-family: Tahoma; font-weight:bold; font-size:11px; color:blue"><%=session.getAttribute("tournament_name")%> </td>
                <td style="font-family: Tahoma; font-weight:bold; font-size:11px;" >Current Stage:&nbsp; <font style="color:blue"><%=session.getAttribute("tournament_stage")%> </font> &nbsp; &nbsp; <a href="javascript:fnShuffleLeaderBoard();" ><font id="idTextShuffleLeaderBoard" stagedisplay="1">Previous Round Leader</font></a></td>
                <td>&nbsp;</td>
                
            </tr>
            <tr>
                <td colspan="3">
                    
                    <!-- code here -->
                    <table border="0" width="100%">
                        <tr>
                            <div>                            
                            <td width="35%" valign="top">
                                <div class="firstPageGridHeaderTab" >
                                    <table class="firstPageGridHeaderTab" border="0" width="100%">
                                        <thead>
                                            <tr>
                                                <td colspan="3" style="color: darkblue" align="left">Team Name:&nbsp; <%=session.getAttribute("team_id")%></td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="30%">Country Name</td>
                                                <td align="center" width="30%">Player Type</td>
                                                <td align="center" width="40%">Player Name</td>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>    
                                <logic:notEmpty name = "userteam_players_list" scope = "session">
                                    
                                    <div class="firstPageGridArea" style="height: 204px;">
                                        <table border="1" width="100%" id="userteam_players" class="fixedDataTable">
                                            <tbody>
                                                <logic:iterate id="userteam_players" indexId="i" scope="session" name="userteam_players_list" type="wow.play.cricket.vo.PlayingNationsTeamVO">
                                                    <tr class="firstPageGridArea" style="height: 12px; cursor: default" valign = "top" >
                                                        <td width="30%" ><bean:write name="userteam_players" property="country_id"/>&nbsp;</td>
                                                        <td width="30%"><bean:write name="userteam_players" property="player_type"/>&nbsp;</td>
                                                        <td width="40%" class="fixedDataCell"><bean:write name="userteam_players" property="player_name"/>&nbsp;</td>
                                                    </tr>
                                                </logic:iterate> 
                                            </tbody>
                                        </table>
                                    </div>
                                    <table>
                                        <tr>
                                            <td style="font-weight: bold; font-size: 16px; color: darkgreen">Total Points:&nbsp;</td>
                                            <td style="font-weight: bold; font-size: 18px; color: red"><%=session.getAttribute("team_points")%></td>
                                        </tr>
                                        <tr>                                            
                                            <td style="font-weight: bold; font-size: 18px; color: darkblue" colspan="2"><a href="/LuvCricket/analytics/topteams.do?appEvent=topTeams"> Click here for analytics</a></td>
                                        </tr>
                                        
                                    </table>
                                </logic:notEmpty>
                                <logic:empty name = "userteam_players_list" scope = "session">
                                    <div style="height: 204px;">
                                        <label style="font-weight: bold; font-size: 18px;">No teams created or incomplete team. Please create your team or complete your team</label>
                                    </div>
                                </logic:empty>
                            </td>
                            
                            <!-- Top teams -->
                            <td width="35%" valign="top">
                                <div class="firstPageGridHeaderTab">
                                    <label id="headerCurrLabel" style="font-weight: bold;font-style:Verdana; font-size: 11px; color:red">Leader Board: -Points updated till <%= session.getAttribute("last_updated_date")%></label>
                                    <label id="headerPrevLabel" style="font-weight: bold;font-style:Verdana; font-size: 11px; color:red; display:none">Leader Board: - FINAL RESULT - FIRST ROUND</label>
                                    <table class="firstPageGridHeaderTab" width="95%">
                                        <thead>
                                            <tr>
                                                <td align="center" width="40%">Team Name</td>
                                                <td align="center" width="40%">Team Manager Name</td>
                                                <td align="center" width="15%">Points</td>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>    
                                <logic:notEmpty name = "top_user_teams" scope = "session">
                                    <div id="idCurrStageLeader" class="firstPageGridArea" style="height: 204px;">
                                        <table border="1" width="95%" id="curr_userteam_players">
                                            <tbody>
                                                <logic:iterate id="top_teams" indexId="i" scope="session" name="top_user_teams" type="wow.play.cricket.vo.LCCommonVO">
                                                    <tr class="firstPageGridArea" style="height: 12px; cursor: default" valign = "top" >
                                                        <td width="40%" ><bean:write name="top_teams" property="field1"/>&nbsp;</td>
                                                        <td width="40%"><bean:write name="top_teams" property="field2"/>&nbsp;</td>
                                                        <td width="15%"><bean:write name="top_teams" property="field3"/>&nbsp;</td>
                                                    </tr>
                                                </logic:iterate> 
                                            </tbody>
                                        </table>
                                    </div>
                                </logic:notEmpty>
                                <!-- Previous round leader -->
                                <logic:notEmpty name = "top_user_teams_prev" scope = "session">
                                    <div id="idPreviousStageLeader" class="firstPageGridArea" style="height: 204px; display:none">
                                        <table border="1" width="95%" id="prev_userteam_players">
                                            <tbody>
                                                <logic:iterate id="top_teams_prev" indexId="i" scope="session" name="top_user_teams_prev" type="wow.play.cricket.vo.LCCommonVO">
                                                    <tr class="firstPageGridArea" style="height: 12px; cursor: default" valign = "top" >
                                                        <td width="40%" ><bean:write name="top_teams_prev" property="field1"/>&nbsp;</td>
                                                        <td width="40%"><bean:write name="top_teams_prev" property="field2"/>&nbsp;</td>
                                                        <td width="15%"><bean:write name="top_teams_prev" property="field3"/>&nbsp;</td>
                                                    </tr>
                                                </logic:iterate> 
                                            </tbody>
                                        </table>
                                    </div>
                                </logic:notEmpty>
                                
                                <div style="height: 204px">
                                    <table border="0" width="100%">
                                        <tr style="color: darkred;font-size: 12px;font-weight: bold;font-family: sans-serif; background-color:lightyellow;">
                                            <td colspan="3" align="center"> <marquee>Top Players Board</marquee></td>
                                        </tr>
                                        <!-- Header Row-->
                                        <tr>
                                            <td colspan="3">
                                                <table border="0" width="100%">
                                                    <tr style="border: 1px 1px 1px 1px solid darkblue; color: darkblue;font-size: 11px;font-weight: bold;font-family: sans-serif; cursor:hand; text-align:center;">
                                                        <td id="idTopOverall" onclick="fnFilterTopPlayers('overall');">Overall</td>
                                                        <td id="idTopBatsman" onclick="fnFilterTopPlayers('batsman');">Batsman</td>
                                                        <td id="idTopBowler" onclick="fnFilterTopPlayers('bowler');" >Bowler</td>
                                                        <td id="idTopAllRounder" onclick="fnFilterTopPlayers('allrounder');">All Rounder</td>
                                                        <td id="idTopWk" onclick="fnFilterTopPlayers('wicketkeeper');">Wicket keeper</td>
                                                        <td id="idTopCostEff" onclick="fnFilterTopPlayers('costeffective');">Cost effective</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6">
                                                            <div class="firstPageGridHeaderTab">
                                                                <table class="firstPageGridHeaderTab" width="100%">
                                                                    <thead>
                                                                        <tr>
                                                                            <td align="center" width="40%">Country Name</td>
                                                                            <td id="id_player_name_header" align="center" width="40%">Player Name</td>
                                                                            <td align="center" width="20%">Points</td>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </div>    
                                                            <logic:notEmpty name = "top_players" scope = "session">
                                                                <div class="firstPageGridArea" style="height: 128px;" id="idDivGridTopPlayers">
                                                                    <table border="1" width="100%" id="table_top_players">
                                                                        <tbody>
                                                                            <logic:iterate id="id_top_players" indexId="i" scope="session" name="top_players" type="wow.play.cricket.vo.LCCommonVO">
                                                                                <tr class="firstPageGridArea" style="height: 12px;" >
                                                                                    <td width="40%" ><bean:write name="id_top_players" property="field1"/>&nbsp;</td>
                                                                                    <td width="40%"><a href="javascript:fnShowPlayerContribution('','<bean:write name="id_top_players" property="field5"/>')"><bean:write name="id_top_players" property="field2"/></a>&nbsp;</td>
                                                                                    <td width="20%"><bean:write name="id_top_players" property="field3"/>&nbsp;</td>
                                                                                    <td style="display:none" ><bean:write name="id_top_players" property="field4"/></td>
                                                                                </tr>
                                                                            </logic:iterate> 
                                                                            
                                                                        </tbody>
                                                                    </table>
                                                                    <a href="javascript:displayFullList();">Full List</a>
                                                                </div>
                                                            </logic:notEmpty>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </div>
                                
                            </td>
                            
                            <td width="30%" valign="top">
                                <table>
                                    <tr align="center">
                                        <td colspan="2" rowspan="8" style="font-style:Verdana" valign="top">
                                            <h3>STILL TO COME</h3>
                                            <script type="text/javascript">
                                                /***********************************************
                                                * IFRAME Scroller script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
                                                * This notice MUST stay intact for legal use
                                                * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
                                                ***********************************************/

                                                //specify path to your external page:
                                                var iframesrc="/LuvCricket/jsp/external.htm"

                                                //You may change most attributes of iframe tag below, such as width and height:
                                                document.write('<iframe id="datamain" src="'+iframesrc+'" width="280px" height="200px" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no"></iframe>')
                                            </script>                                        
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <!-- table for team player -->
                    <!-- User Players Table -->
                </td>    
            </tr>
        </TABLE>        
        <logic:notEmpty name = "top_players" scope = "session">
            <div id="idDivFullListMain" style="border: 2px 2px 2px 2px solid black; height: 281px; width: 400px; left:200px; top: 150px; position:absolute; background-color:#99FFFF;visibility:hidden; filter:progid:DXImageTransform.Microsoft.RandomDissolve()" >
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr style="font-color:#FFD9F2; font-family: Verdana; font-size: 12px; font-weight: bold; background-color:#99CCCC">
                            <td align="left"><u id="idTitleDivPlayer">Top Batsman</u></td>
                            <td colspan="2" align="right"><img alt="close" src="/LuvCricket/images/door_exit.gif" style="cursor:hand;" onclick="closeTheFullList()"/></td>
                        </tr>
                        <tr style="font-family: Verdana; font-size: 11px; font-weight: bold;">
                            <td align="center" width="40%">Country Name</td>
                            <td id="id_player_name_header" align="center" width="40%">Player Name</td>
                            <td align="center" width="20%">Points</td>
                        </tr>
                    </thead>
                </table>
                <div style="height: 234px; width: 400px; background-color:#FFF9FD;overflow: auto; background-image:url('/LuvCricket/images/wc_small_2007.jpg');" >
                    <table border="0" width="95%" id="table_top_players_full_list" cellpadding="2" cellspacing="2">
                        <tbody>
                            <logic:iterate id="id_top_players" indexId="i" scope="session" name="top_players" type="wow.play.cricket.vo.LCCommonVO">
                                <tr class="firstPageGridArea" style="height: 12px;" >
                                    <td width="40%" ><bean:write name="id_top_players" property="field1"/>&nbsp;</td>
                                    <td width="40%"><a href="javascript:fnShowPlayerContribution('','<bean:write name="id_top_players" property="field5"/>')"><bean:write name="id_top_players" property="field2"/>&nbsp;</a></td>
                                    <td width="20%" align="center"><bean:write name="id_top_players" property="field3"/>&nbsp;</td>
                                    <td style="display:none" ><bean:write name="id_top_players" property="field4"/></td>
                                </tr>
                            </logic:iterate> 
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </logic:notEmpty>
        <p>        
        
    </body>
</html>
