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
        <link rel="stylesheet" type="text/css" href="/LuvCricket/css/stylesheet.css" title="style"/>
        <script type="text/javascript" src="/LuvCricket/js/common.js"></script> 
        <script type="text/javascript" src="/LuvCricket/js/userteam.js"></script> 
    </head>
    <%
        int flgPredStage = 0; // if 0 then allow to change
        
        Calendar cal_sf = Calendar.getInstance();
        cal_sf.set(2007,3,4,18,30); //4th April, 06:30
        long date_sf = cal_sf.getTimeInMillis();
        
        Calendar cal_f = Calendar.getInstance();
        cal_f.set(2007,3,23,18,30); //23rd April, 06:30
        long date_f = cal_f.getTimeInMillis();
        
        Calendar cal_winner = Calendar.getInstance();
        cal_winner.set(2007,3,27,18,30); //27th April, 06:30
        long date_winner = cal_winner.getTimeInMillis();
        
        long date_curr = new Date().getTime();
        
        if(date_curr > date_sf)
        {
            flgPredStage = 1;   //Lock semi final teams
        }
        if(date_curr > date_f)
        {
            flgPredStage = 2;   //Lock final teams
        }
        if(date_curr > date_winner)
        {
            flgPredStage = 3;   //Lock tournament winner
        }    
        
    %>
    <body class="backgroundbase" onload="onLoadPredictTeam();">
        <html:form action="/userteamcountries">
            <table border="0" ALIGN="center" WIDTH="100%">
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="border: 1px solid #666;">
                            <!-- WRITE YOUR CODE HERE -->
                            <table border="0" width="80%">
                                <tr align="center">
                                    <td class="labelonly" align="center"  colspan="2"><b>Team Id</b>
                                        <lc:dropdownbox name="user_team_id"  emptyoption="false" refxlist="opt_user_team" onchange="onChangeUserTeamPredictTeam();" />
                                    </td>
                                </tr>
                                <tr><td colspan="2"><hr>&nbsp;</td></tr>
                                <tr align="center">
                                    <td colspan="2" align="center">
                                        <div id="idDivSemiFinal">
                                            <font class="textlable" style="color:blue">Select Semi Finalist Teams:<b style="color:red">&nbsp;(Changes allowed till 4th April 6:30 PM)</b></font>
                                            <table border="0" width="80%">
                                                <tr>
                                                    <td class="textlable">Semifinalist 1:</td>
                                                    <td><lc:dropdownbox name="sf_team_1" emptyoption="true" refxlist="opt_nations" onchange="onChangePredictTeam(1);"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="textlable">Semifinalist 2:</td>
                                                    <td><lc:dropdownbox name="sf_team_2" emptyoption="true" refxlist="opt_nations" onchange="onChangePredictTeam(1);"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="textlable">Semifinalist 3:</td>
                                                    <td><lc:dropdownbox name="sf_team_3" emptyoption="true" refxlist="opt_nations" onchange="onChangePredictTeam(1);"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="textlable">Semifinalist 4:</td>
                                                    <td><lc:dropdownbox name="sf_team_4" emptyoption="true" refxlist="opt_nations" onchange="onChangePredictTeam(1);"/></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr><td colspan="2"><hr>&nbsp;</td></tr>
                                <tr align="center">
                                    <td colspan="2" align="center">
                                        <div id="idDivFinal">
                                            <font class="textlable" style="color:blue">Select Finalist Teams:<b style="color:red">&nbsp;(Changes allowed till 23rd April 6:30 PM)</b></font>
                                            <table border="0" width="80%">
                                                <tr>
                                                    <td class="textlable">Finalist 1:</td>
                                                    <td><lc:dropdownbox name="f_team_1" emptyoption="true" refxlist="opt_nations" onchange="onChangePredictTeam(2);"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="textlable">Finalist 2:</td>
                                                    <td><lc:dropdownbox name="f_team_2" emptyoption="true" refxlist="opt_nations" onchange="onChangePredictTeam(2);"/></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr><td colspan="2"><hr>&nbsp;</td></tr>
                                
                                <tr align="center">
                                    <td colspan="2" align="center">
                                        <div id="idDivWinner">
                                            <font class="textlable" style="color:blue">Select Tournament Winner:<b style="color:red">&nbsp;(Changes allowed till 27th April 6:30 PM)</b></font>
                                            <table border="0" width="80%">
                                                <tr>
                                                    <td class="textlable">Winner :</td>
                                                    <td><lc:dropdownbox name="winner_team" emptyoption="true" refxlist="opt_nations" onchange="onChangePredictTeam(3);"/></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr><td colspan="2"><hr>&nbsp;</td></tr>
                                <tr align="center">
                                    <td colspan="2">
                                        <input type="button" name="butSave" value=" SAVE " onclick="savePredictTeam();">&nbsp;&nbsp;
                                        <input type="button" name="butClose" value=" CLOSE " onclick="window.close();">
                                    </td>
                                </tr>
                                <tr><td colspan="2" style="color:green;font-weight:bold;font-size:12;font-family:sans-serif;">*Note: All the points scored will be updated at the end of tournaments.</td></tr>
                            </table>
                        </div>
                    </td>
                </tr>
                
            </table>
        <input type="hidden" name="flagLockPrediction" id="flagLockPrediction" value="<%=flgPredStage%>"/>
        </html:form>
        <lc:msg_error/>
        
    </body>
</html>
