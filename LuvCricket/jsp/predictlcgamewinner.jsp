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
        <script type="text/javascript">
            function savePredictedLcGameWinner()
            {
                var user_team_id = fnTrim(getObj("idUserTeam").innerText);

                var pred_user_team = getObj("predicted_team_id");
                var predicted_team_id = pred_user_team.options[pred_user_team.selectedIndex].value; 
                if(predicted_team_id == "")
                {
                    fnShowMessage("no_team_selected");
                    return;
                }
                var url ="/LuvCricket/predictlcwinner.do?appEvent=savePredictedGameWinner&&user_team_id="+user_team_id+"&&predicted_team_id="+predicted_team_id;
                //alert(url);
                document.forms[0].action = url;
                document.forms[0].submit();
            }
        </script>
    </head>
    <%
    int flgPredStage = 0; // if 0 then allow to change
    
    Calendar cal_winner = Calendar.getInstance();
    cal_winner.set(2007,3,17,18,30); //27th April, 06:30
    long date_winner = cal_winner.getTimeInMillis();
    
    long date_curr = new Date().getTime();
    
    if(date_curr > date_winner)
    {
        flgPredStage = 1;   //Lock lc tournament winner
    }    
    
    %>
    <body class="backgroundbase" onload="window.focus();">
        <html:form action="/predictlcwinner">
            <table border="0" ALIGN="center" WIDTH="100%">
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="border: 1px solid #666;">
                            <!-- WRITE YOUR CODE HERE -->
                            <table border="0" width="80%">
                                <tr align="center">
                                    <td class="labelonly" align="center"  colspan="2" style="color:blue"><b>Predict the LuvCricket Game winner(2nd round) and you can win an Indian Team T-Shirt. </b>
                                    </td>
                                </tr>
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr align="center">
                                    <td class="labelonly" align="center"  colspan="2"><b>Team Id: </b>
                                        <font id="idUserTeam"><%=request.getParameter("user_team_id")%></font>
                                    </td>
                                </tr>
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr align="center">
                                    <td class="labelonly" align="center"  colspan="2"><b>Your Predicted Team Id</b>
                                        <lc:dropdownbox name="predicted_team_id"  emptyoption="true" refxlist="lst_user_teams" />
                                    </td>
                                </tr>
                                <tr><td colspan="2"><hr>&nbsp;</td></tr>
                                <tr align="center">
                                    <td colspan="2">
                                        <% if(flgPredStage == 0)
                                        {%>
                                        <input type="button" name="butSave" value=" SAVE " onclick="savePredictedLcGameWinner();">&nbsp;&nbsp;
                                        <%}else{%>
                                        <font style="color:darkred;font-weight:bold;font-size:14;font-family:sans-serif;background-color:yellow">Updation Closed.</font>
                                        <%}%>
                                        <input type="button" name="butClose" value=" CLOSE " onclick="window.close();">
                                    </td>
                                </tr>
                                <tr><td colspan="2"><hr>&nbsp;</td></tr>
                                <tr style="color:red;font-weight:bold;font-size:12;font-family:sans-serif;background-color:lightyellow">
                                    <td colspan="2">*Note:<br> Updation allowed till 17th April 2007 6:30 PM.</td>
                                </tr>
                                <tr style="color:red;font-weight:bold;font-size:12;font-family:sans-serif;background-color:lightyellow">
                                    <td colspan="2">If there more than one team who predicted correctly then winner will be decided by lottery.</td>
                                </tr>
                                <tr style="color:blue;font-weight:bold;font-size:13;font-family:sans-serif;background-color:white">
                                    <td colspan="2"><marquee BEHAVIOR=ALTERNATE >Winners responsibility to collect the T-shirt from Trigyn Office.</marquee></td>
                                </tr>
                                <tr style="color:red;font-weight:bold;font-size:16;font-family:sans-serif;background-color:lightyellow">
                                    <td colspan="2">T-shirt sponsered by: Ashwin Utagikar.</td>
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
