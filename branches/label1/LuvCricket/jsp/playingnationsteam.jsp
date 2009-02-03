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
        <script type="text/javascript" src="/LuvCricket/js/players.js"></script>
        <%
        String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
        XMLMenuParser parser = new XMLMenuParser(menu_name);
        out.print(parser.parseScreenMenu());
        %>
    </head>
    <body class="backgroundbase" onload="fnOnScreenLoad();">
        <html:form action="/playingnationsteam">
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
                <tr><td colspan="3" class="pageheader"><label>PLAYING NATIONS TEAM</label></td></tr>
                
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="border: 1px solid #666;">
                            <!-- WRITE YOUR CODE HERE -->
                            <table border="0">
                                <tr><td colspan="3">&nbsp;</td></tr>
                                <tr>
                                    <td align="left" class="textlable">Country Name</td>
                                    <td><lc:dropdownbox refxlist="opt_nations" name="objPlayingNationsTeam.country_id" onchange="fnOnChangeCountry()"/> </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Player Name</td>
                                    <% if("create".equals((String)request.getAttribute("screen_mode")))
                                    {
                                    %>       
                                    <td><html:text property="objPlayingNationsTeam.player_name" size="30" maxlength="128" styleClass="textbox" /> </td>
                                    <%    }
                                    else
                                    { %>
                                    <td><lc:dropdownbox name="objPlayingNationsTeam.player_id" refxlist="opt_players" emptyoption="true" onchange="fnOnChangePlayers()"/>
                                        <html:hidden property="objPlayingNationsTeam.player_name" /></td>
                                    <% }
                                    %>
                                    
                                    <td  rowspan="8">&nbsp;<img style="border: 2px 2px 2px 2px solid #000000" id="id_player_image" alt="player" src="/LuvCricket/images/noimage.gif" height="210px" width="160px"></td>
                                </tr>

                                <tr>
                                    <td align="left" class="textlable">Player Wellknown Name</td>
                                    <td><html:text property="objPlayingNationsTeam.player_welknown_name" size="30" maxlength="128" styleClass="textbox"  /> </td>
                                </tr>

                                
                                <tr>
                                    <td align="left" class="textlable">Player type</td>
                                    <td><lc:dropdownbox refx="PLAYER_TYPE" name="objPlayingNationsTeam.player_type"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Player Role</td>
                                    <td><html:text property="objPlayingNationsTeam.player_role" size="30" maxlength="128" styleClass="textbox" /> &nbsp;<label class="rightlabel"> (Informative: e.g Captain, Vice Captain)</label></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Player Details</td>
                                    <td><html:text property="objPlayingNationsTeam.player_link" size="30" maxlength="255" styleClass="textbox" />&nbsp; <label class="rightlabel"> (External hyperlink)</label> </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Player Photo Link</td>
                                    <td><html:text property="objPlayingNationsTeam.player_photolink" size="30" maxlength="255" styleClass="textbox" onchange="fnShowPhoto();" />&nbsp; <label class="rightlabel"> (External hyperlink)</label> </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Player Status</td>
                                    <td id="psid"><lc:dropdownbox refx="GENERAL_STATUS" name="objPlayingNationsTeam.player_status"/></td>
                                </tr>
                                
                                <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
                                <tr align="center">
                                    <td colspan="2">
                                        <input type="button" name="butSave" value="Save"  onclick="fnSavePlayer()"></input>
                                    <% if(!"create".equals((String)request.getAttribute("screen_mode")))
                                    {
                                    %>       
                                    &nbsp;&nbsp;<input type="button" name="butDelete" value="Delete" onclick="fnDeletePlayer()"></input>
                                    <%    }
                                    %>
                                </td>
                                </tr>
                                <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
                                <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
                            </table>    
                        </div>
                    </td>
                </tr>
            </table>
            <lc:hidden name="screen_mode" />
            <lc:msg_error/>
        </html:form>
    </body>
</html>
