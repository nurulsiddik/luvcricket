<%@page contentType="text/html"%>
<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>
<%@taglib uri='/WEB-INF/lc-tags.tld' prefix='lc' %>
<%@taglib uri='/WEB-INF/struts-logic.tld' prefix='logic' %>
<%@taglib uri='/WEB-INF/struts-nested.tld' prefix='nested' %>
<%@taglib uri='/WEB-INF/struts-bean.tld' prefix='bean' %>
<%@ page import="wow.play.cricket.common.XMLMenuParser" %>


<HTML>
    <HEAD>
        <TITLE>Analytics</TITLE>
        <link rel="stylesheet" type="text/css" href="/LuvCricket/css/stylesheet.css">
        <script type="text/javascript" src="/LuvCricket/js/common.js"></script>
        <%
            String menu_name = (String)request.getSession().getAttribute("MENU_NAME");
            XMLMenuParser parser = new XMLMenuParser(menu_name);
            out.print(parser.parseScreenMenu());
        %>
	<script>
		function countIt(obj)
		{
			if(obj.checked)
				document.checkbox_ticked = document.checkbox_ticked + 1;
			else
				document.checkbox_ticked= document.checkbox_ticked - 1;
		}

		function submitForm()
		{
			if(document.checkbox_ticked == 0)
			{
				fnShowMessage("no_team_selected");
				return;
			}

			document.forms[0].submit();
		}

	</script>

    </HEAD>
    <BODY class="backgroundbase" onload="document.checkbox_ticked = 0;">
        <table border="0" ALIGN="center" WIDTH="100%">
    
            <lc:title menubar="true" title="LuvCricket Team Analysis" username="true"/>
        </table>
        <form method="POST" action="/LuvCricket/analytics/topteams.do?appEvent=showTopTeamsChart">
            <table border="0" cellspacing="1" cellpadding="1">
                <tbody>
                    <tr>
                        <td style="font-family: Tahoma; font-weight:bold; font-size:11px;text-align:right">Select Tournament</td>
                        <td><lc:dropdownbox refxlist="act_tournas" name="tournaments" /></td>
                    </tr>
                    <tr>
                        <td style="font-family: Tahoma; font-weight:bold; font-size:11px;text-align:right">Select Stage</td>
                        <td><lc:dropdownbox refxlist="tourna_stages" name="tourna_stages" /></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="font-family: Tahoma; font-weight:bold; font-size:11px;text-align:center" >Select Teams to compare</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="font-family: Tahoma; font-weight:bold; font-size:11px;text-align:center" >
                            <table border="0" cellpadding="1" style="font-family: Tahoma; font-weight:bold; font-size:11px;" width="100%">
                                <tbody>
                                    <tr width="100%" style="background-color:darkblue;color:white;text-align:center">
                                        <td>Teams</td>
                                    </tr>
                                </tbody>
                            </table>

                        </td>
                    </tr>
                    <tr>                    
                        <td>&nbsp;</td>
                        <td style="text-align:center">
                            <div style="position:relative;width:150px;height:185px;overflow:auto">
                                <table border="1"  cellspacing="0" width="100%">
                                    <tbody>
                                        <logic:iterate scope="request" id="tourna_team" name="tourna_teams" type="wow.play.cricket.vo.RefxVO">
                                            <tr class="firstPageGridArea" style="height: 10px; cursor: default">
                                                <td ><input type="checkbox" name='team_<bean:write name="tourna_team" property="refx_value" />' onclick="countIt(this);" value="OFF" />&nbsp;<bean:write name="tourna_team" property="refx_label" /></td>
                                            </tr>
                                        </logic:iterate>                                        
                                    </tbody>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center" colspan="2">
                            <input type="button" onclick="submitForm();" value="Generate Chart" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <% String chart_to_show = (String)request.getAttribute("showChart");
            if("1".equals(chart_to_show))
            { %>
        <HR>
        <H2>Luv Cricket Team Performance</H2>
        
        <jsp:useBean id="TopTeamChart" scope="page" class="wow.play.cricket.analytics.graph.comparators.TopTeamPeformance"/>

        <jsp:useBean id="rotater" scope="page" class="de.laures.cewolf.cpp.RotatedAxisLabels"/>

        <cewolf:chart 
            id="TopTeamChart" 
            title="Luv Cricket Teams Performance" 
            type="line"
            xaxislabel="Days" 
            yaxislabel="Team Points"     
            >
            
    
            <cewolf:data>
                <cewolf:producer id="TopTeamChart">
                    <cewolf:param name="tournament_id" value="<%=request.getParameter("tournaments")%>" />
                    <cewolf:param name="tournament_stage" value="<%=request.getParameter("tourna_stages")%>" />
                    <cewolf:param name="teams_to_show" value="<%=(String)request.getAttribute("teams_to_show")%>" />
                </cewolf:producer>
            </cewolf:data>

            <cewolf:chartpostprocessor id="rotater" > 
                <cewolf:param name="rotate_at"  value='<%= new Integer(0) %>' />
                <cewolf:param name="remove_at" value='<%= new Integer(100) %>'/>
            </cewolf:chartpostprocessor>
    
        </cewolf:chart>
    
        <p>
        <cewolf:img chartid="TopTeamChart" renderer="cewolf" width="700" height="500"/>
        <P>
        
        <% } %>
            
    </BODY>
</HTML>