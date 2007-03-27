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
        <script type="text/javascript" src="/LuvCricket/js/userpoints.js"></script>
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
    </head>
    <body class="backgroundbase">
        <html:form action="/userteampoints">
            <table border="0" ALIGN="center" WIDTH="100%">
                <lc:title menubar="true" title="UPDATE USER TEAM POINTS" username="true"/>                
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="border: 1px solid #666;">
                            <!-- WRITE YOUR CODE HERE -->
                            <table>
                                <tr>
                                    <td align="left" class="textlable">Tournament Id:</td>
                                    <td><lc:dropdownbox name="objTournMatches.tournament_id"  refxlist="opt_tournament_id" onchange="onChangeTournament();" emptyoption="true"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Select Match Dates:</td>
                                    <td><lc:dropdownbox name="objTournMatches.match_date"  refxlist="opt_match_dates" emptyoption="true"/></td>
                                </tr>
                                <logic:notEmpty name="opt_user_teams" scope="session">
                                    <tr>
                                        <td align="left" class="textlable">Select User Teams To Update:</td>
                                        <td><lc:dropdownbox name="opt_user_team"  refxlist="opt_user_teams" emptyoption="false" size="5" multiselect="true"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><input type="button" name="butSubmitForUpdate" value=" UPDATE USER POINTS " onclick="submitForUpdate();"/></td>
                                    </tr>
                                    
                                    
                                </logic:notEmpty>
                            </table>    
                        </div>
                    </td>
                </tr>
                
            </table>
        </html:form>
    </body>
</html>
