<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>
<%@taglib uri='/WEB-INF/lc-tags.tld' prefix='lc' %>
<%@taglib uri='/WEB-INF/struts-logic.tld' prefix='logic' %>
<%@taglib uri='/WEB-INF/struts-nested.tld' prefix='nested' %>
<%@taglib uri='/WEB-INF/struts-bean.tld' prefix='bean' %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Competency Analysis--<%=request.getParameter("player_name")%></title>
    </head>
    <body>

        <H2>Competency Analysis</H2>
        <hr>
        
        <jsp:useBean id="CompetencyChart" scope="page" class="wow.play.cricket.analytics.graph.comparators.CompetencyAnalysis"/>

        <jsp:useBean id="rotater" scope="page" class="de.laures.cewolf.cpp.RotatedAxisLabels"/>

        <cewolf:chart 
            id="CompetencyChart" 
            title = "<%=request.getParameter("player_name")%> "
            type="line"
            xaxislabel="Matches" 
            yaxislabel="Points Gained"     
            >
            
    
            <cewolf:data>
                <cewolf:producer id="CompetencyChart">
                    <cewolf:param name="tournament_id" value="<%=request.getParameter("tournament_id")%>" />
                    <cewolf:param name="player_id" value="<%=request.getParameter("player_id")%>" />
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
</html>
