<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="wow.play.cricket.common.XMLMenuParser" %>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
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
        <link rel="stylesheet" type="text/css" href="/LuvCricket/css/stylesheet.css" title="style"/>
        <script type="text/javascript" src="/LuvCricket/js/common.js"></script>
        <script type="text/javascript" src="/LuvCricket/js/tournament.js"></script>
        <title>Tournament Management</title>
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
        
    </head>
    <body class="backgroundbase" style="background-image: url('/LuvCricket/images/bkgrd_2.gif')">
        <TABLE border="0" ALIGN="center" WIDTH="100%">
            <TR>
                <td><font class="userwelcomelabel">Welcome <%= (String)session.getAttribute("username")%> </font></td>
                <TD ALIGN="right">
                    <script language="JavaScript1.2" type="text/javascript">
                        try
                        {
                            screenMenu.writeMenuBar();
                        }
                        catch(ex)
                        {
                        }
                    </script>
                </TD>
                <td align="center"><img alt="LogOut" src="/LuvCricket/images/logout.gif" name="imgLogOut" onclick="fnLogOut()" style="cursor: Hand;"></td>
            </TR>
            <tr><td colspan="3" class="pageheader"><label>Tournament Management</label></td></tr>
        </TABLE>
        <html:form action="/tournament">
            <div align="center">
                <table>
                    <tr>
                        <td align="left" class="textlable">Tournament Name</td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td align="left" ><html:text property="objTournament.tournament_name" styleClass="textbox"/></td>
                    </tr>
                    <tr>
                        <td align="left" class="textlable">Tournament Description</td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td align="left" ><html:text property="objTournament.tournament_description" size="40" styleClass="textbox"/></td>
                    </tr>
                    <tr>
                        <td align="left" class="textlable">Tournament Status</td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td align="left" ><lc:dropdownbox name="objTournament.tournament_status" refx="TOURNAMENT_STATUS" onchange="javascript:alert('hi');"/></td>
                    </tr>
                    <tr>
                        <td align="left" class="textlable">Current Stage</td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td align="left"><html:text property="objTournament.current_stage" size="3" styleClass="textbox"/></td>
                        
                    </tr>
                </table>
            </div>
            <br>
            <table align="center" >
                <tr>
                    <td width="40%"><label align="left" class="textlable">Tournament Changes</label></td>
                    <td width="30%">&nbsp;</td>
                    <td width="30%">&nbsp;</td>
                </tr>
            </table>
            <!-- Grid Start -->
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style = "border:1;width:100%;height:102px; overflow-y:scroll; background-color:#CCCCFF;" >
                            <table id = "tournamentchange" border = "2" width = "30%" align="center" cellpadding = "1" cellspacing = "0" >
                                <thead style="overflow-y:auto;">
                                    <tr class = "tableheader" align = "center" valign = "bottom">
                                        <td height = "24" class = "tableheader" style = "width:10%">Stage</td>
                                        <td class = "tableheader" style = "width:60%" nowrap>Changes Permitted</td>
                                        <td class = "tableheader" style = "width:30%" nowrap>Stage Description</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <logic:notEmpty name = "tournament_changes" scope = "session">
                                        <logic:iterate id = "tournament" name = "tournament_changes" indexId = "i"  type = "wow.play.cricket.vo.TournamentChangesVO" scope = "session">
                                            <tr class = "TableDataRowDisabled" valign = "top" style="" align = "left" onClick = "javascript:fnRowEntry(this);">
                                                <td class = "tableDataRowDisabled" id = "<%= i %>" style = "width:10%" nowrap>
                                                    <bean:write name = "tournament" property = "tournament_stage"/>
                                                    </td>
                                                <td class = "tableDataRowDisabled" style = "width:60%">
                                                    <bean:write name = "tournament" property = "changes_permitted"/>&nbsp;
                                                </td>
                                                <td class = "tableDataRowDisabled" style = "width:30">
                                                    <bean:write name = "tournament" property = "stage_description"/>&nbsp;
                                                </td>
                                            </tr>
                                        </logic:iterate>
                                    </logic:notEmpty>
                                    <logic:empty name = "tournament_changes"  scope = "session">
                                        <tr class = "TableSelectedRow">
                                            <td class = "tdFixedCell" style = "width:10%" nowrap>&nbsp;</td>
                                            <td class = "tdFixedCell" style = "width:60%">&nbsp;</td>
                                            <td class = "tdFixedCell" style = "width:30%">&nbsp;</td>
                                        </tr>
                                    </logic:empty>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
            <!-- Grid Ends -->
            <div align="center">
                <table >
                    <tr>
                        <td align="left" class="textlable">Tournament Stage</td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td align="left" ><html:text property="objTournamentChanges.tournament_stage" size="4" styleClass="textbox"/></td>
                    </tr>
                    <tr>
                        <td align="left" class="textlable">Changes Permitted</td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td align="left" ><html:text property="objTournamentChanges.changes_permitted" size="4" styleClass="textbox"/></td>
                    </tr>
                    <tr>
                        <td align="left" class="textlable">Stage Description</td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td align="left" ><html:text property="objTournamentChanges.stage_description" size="30" styleClass="textbox"/></td>
                    </tr>
                    <tr><td colspan="3"></td></tr>
                    <tr>
                        <td colspan="3">
                            <input type="button" value="Save Line" name="butLineSave" onclick="fnSaveLine();"/>
                            &nbsp;
                            <input type="button" value="Delete Line" name="butLineDelete" onclick="fnDeleteLine();"/>
                            &nbsp;
                            <input type="button" value="Clear Line" name="butLineClear" onclick="fnClearLine();"/>
                        </td>
                    </tr>
                </table>
                <table align="center">
                    <tr><td colspan="3">&nbsp;</td></tr>
                    <tr>
                        <td colspan="3"><input type="button" value="SAVE TOURNAMENT" name="butSaveTournament" onclick="fnSaveTournament();"/></td>
                    </tr>
                </table>
            </div>
        </html:form>
        <lc:msg_error/>
    </body>
</html>
