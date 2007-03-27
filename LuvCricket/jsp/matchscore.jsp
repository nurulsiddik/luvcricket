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
        <html:form action="/matchscore">
            <table border="0" ALIGN="center" WIDTH="100%">
                <lc:title menubar="true" title="Match Score " username="true"/>                
                <tr height="100%" align="center">
                    <td  colspan="3" align="center">
                        
                            <!-- WRITE YOUR CODE HERE -->
                            <table border="0" width="70%" align="center">
                                <tr>
                                    <td width="50%" align="left" class="textlable">Tournament Id:</td>
                                    <td width="50%"><lc:dropdownbox name="objTournMatches.tournament_id" refxlist="opt_tournaments" emptyoption="true" onchange="onChangeTournament();"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Select Match:</td>
                                    <td><lc:dropdownbox name="objTournMatches.match_id" refxlist="opt_tournament_matches" emptyoption="true" onchange="fetchMatchDetails()"/></td>
                                </tr>
                                <tr>
                                    <td colspan ="2" width="50%" align="left" class="textlable" style="text-align: center;">
                                        &nbsp;Match Status:&nbsp;<lc:dropdownbox name="objTournMatches.match_result" refx="MATCH_STATUS" sortby="value" emptyoption="true"/>&nbsp;&nbsp;
                                        &nbsp;First Batting Team:&nbsp;<lc:dropdownbox name="objTournMatches.first_batting_team" refxlist="opt_match_teams" emptyoption="true" onchange="fetchFullScoreCard()"/>&nbsp;&nbsp;
                                        &nbsp;Match Winner:&nbsp;<lc:dropdownbox name="objTournMatches.match_winner" refxlist="opt_match_teams"  emptyoption="true"/>&nbsp;&nbsp;
                                    </td>
                                </tr>
                                
                                <logic:notEmpty name="lst_scorecard_1" scope="request" >
                                    <tr>
                                        <td colspan="2" class="textlable" style="text-align: center;">
                                            Innings:&nbsp;<input type=radio name="chk_innings"  value="1" onclick="onClickRadio(this)" checked="true"/> 1st
                                            &nbsp;<input type=radio name="chk_innings"  value="2" onclick="onClickRadio(this)"/> 2nd
                                        </td>
                                    </tr>
                                    <!-- First Innings Table -->
                                    <tr id="idInningsOne">
                                        <td colspan="2">
                                            <table border="0" width="100%">
                                                <tr>
                                                    <td colspan="2" id="idInningsOneTitle" class="textlable" style="text-align: center;">First Innings : </td>
                                                </tr>
                                                <!-- Scorecard table -->
                                                <tr>
                                                    <td colspan="2" width="70%">
                                                        <div class="divGridHeaderTab" >
                                                            <table class="divGridHeaderTab" border="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <td align="center" width="27%">Batsman</td>
                                                                        <td align="center" width="12%">How Out</td>
                                                                        <td align="center" width="27%">Contributor</td>
                                                                        <td align="center" width="27%">Bowler</td>
                                                                        <td align="center" width="7%">Runs</td>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>    
                                                        <div class="divGridArea" style="height: 220px;">
                                                            <table border="1" width="100%" id="table_first_innings" name="table_first_innings">
                                                                <tbody>
                                                                    <logic:iterate id="first_innings" indexId="i" scope="request" name="lst_scorecard_1" type="wow.play.cricket.vo.ScorecardVO">
                                                                        <tr class="divGridArea" style="height: 11px; cursor: default" valign = "top">
                                                                            <td align="center" width="27%"><lc:dropdownbox  name="<%= "batsman_id_"+i %>" refxlist="opt_first_batting_team" sortby="value" emptyoption="true" forcedvalue="request"/></td>
                                                                            <td align="center" width="12%"><lc:dropdownbox name="<%= "howout_"+i%>" refx="OUT_TYPE" sortby="value" emptyoption="false" /></td>
                                                                            <td align="center" width="27%"><lc:dropdownbox name="<%= "helper_id_"+i%>" refxlist="opt_second_batting_team" sortby="value" emptyoption="true" forcedvalue="request"/></td>
                                                                            <td align="center" width="27%"><lc:dropdownbox name="<%="bowler_id_"+i%>" refxlist="opt_second_batting_team" sortby="value" emptyoption="true" forcedvalue="request"/></td>
                                                                            <td align="center" width="7%"><input type="text" name="<%="runs_scored_"+i%>" size="4" maxlength="3" class="textbox" value="<%= (request.getAttribute("runs_scored_"+(i))== null)?"": (String)request.getAttribute("runs_scored_"+(i))%>" /></td>
                                                                        </tr>
                                                                    </logic:iterate>   
                                                                    
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <!-- Second Innings Table -->
                                    <tr id="idInningsTwo" style="display: none;">
                                        <td colspan="2">
                                            <table border="0" width="100%">
                                                <tr>
                                                    <td colspan="2" id="idInningsTwoTitle" class="textlable" style="text-align: center;">Second Innings : </td>
                                                </tr>
                                                <!-- Scorecard table -->
                                                <tr>
                                                    <td colspan="2" width="70%">
                                                        <div class="divGridHeaderTab" >
                                                            <table class="divGridHeaderTab" border="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <td align="center" width="27%">Batsman</td>
                                                                        <td align="center" width="12%">How Out</td>
                                                                        <td align="center" width="27%">Contributor</td>
                                                                        <td align="center" width="27%">Bowler</td>
                                                                        <td align="center" width="7%">Runs</td>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>    
                                                        <div class="divGridArea" style="height: 220px;">
                                                            <table border="1" width="100%" id="table_second_innings" name="table_second_innings">
                                                                <tbody>
                                                                    <logic:iterate id="second_innings" indexId="i" scope="request" name="lst_scorecard_2" type="wow.play.cricket.vo.ScorecardVO">
                                                                        <tr class="divGridArea" style="height: 10px; cursor: default" valign = "top">
                                                                            <td align="center" width="27%"><lc:dropdownbox  name="<%="batsman_id_"+(i+11)%>" refxlist="opt_second_batting_team" sortby="value" emptyoption="true" forcedvalue="request"/></td>
                                                                            <td align="center" width="12%"><lc:dropdownbox name="<%="howout_"+(i+11)%>" refx="OUT_TYPE" sortby="value" emptyoption="false" /></td>
                                                                            <td align="center" width="27%"><lc:dropdownbox name="<%="helper_id_"+(i+11)%>" refxlist="opt_first_batting_team" sortby="value" emptyoption="true" forcedvalue="request"/></td>
                                                                            <td align="center" width="27%"><lc:dropdownbox name="<%="bowler_id_"+(i+11)%>" refxlist="opt_first_batting_team" sortby="value" emptyoption="true" forcedvalue="request"/></td>
                                                                            <td align="center" width="7%"><input type="text" name="<%="runs_scored_"+(i+11)%>" size="4" maxlength="3" class="textbox" value="<%= (request.getAttribute("runs_scored_"+(i+11))== null)?"": (String)request.getAttribute("runs_scored_"+(i+11))%>" /></td>
                                                                        </tr>
                                                                    </logic:iterate>   
                                                                    
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><input type="button" name="butSave" value=" SAVE " onclick="saveScorecard()"/></td>
                                    </tr>
                                    
                                </logic:notEmpty>
                            </table>
                            
                        
                    </td>
                </tr>
            </table>
        </html:form>
    </body>
</html>
