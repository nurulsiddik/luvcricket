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
        <script type="text/javascript">
            function setValue(fldName)
            {
                var obj = getObj(fldName);
                var value = obj.value;
                if(isEmptyOrNull(value))
                {
                    value = "0";
                }
                document.write("&nbsp;"+value);
            }
            function setPlayerType(player_type_fld)
            {
                var obj = getObj(player_type_fld);
                var value = obj.value;

                if(fnTrim(value) == "1")
                {
                    document.write("Batsman");
                }
                else if (fnTrim(value) == "2")
                {
                    document.write("Bowler");
                }
                else if (fnTrim(value) == "3")
                {
                    document.write("All rounder");
                }
                else if (fnTrim(value) == "4")
                {
                    document.write("Wicket keeper");
                }

            }
            function setImage()
            {
                var imgObj = getObj("id_player_image");
                var imgHidValueObj = getObj("objPlayerDetail.player_photolink");
                if(isEmptyOrNull(imgHidValueObj.value))
                {
                    imgObj.src = "/LuvCricket/images/noimage.gif";
                }
                else
                {
                    imgObj.src = imgHidValueObj.value;
                }
                //alert("id");
                //document.write("/LuvCricket/images/noimage.gif");
            }
            function openMoreInfo(url)
            {
                window.open(url,"","");
            }    
          
        </script>
        <style type="text/css">
            .statvalue
            {
                font-family: Tahoma;
                font-size: 12px;
                font-weight: bold;
                color: blue;
            }
        </style>
    </head>
    <body class="backgroundbase" onload="self.focus();setImage();">
        <html:form  action="/playertournamentcontribution" >
            <h3 align="center">Player Achievement current tournament</h3>
            <html:hidden property="objPlayerDetail.player_role" />
            <html:hidden property="objPlayerDetail.player_type" />
            <html:hidden property="objPlayerDetail.player_link" />
            <html:hidden property="objPlayerDetail.player_photolink" />
            
            <html:hidden property="objPlayerTournContribution.runs_scored" />
            <html:hidden property="objPlayerTournContribution.wickets_taken" />
            <html:hidden property="objPlayerTournContribution.catches" />
            <html:hidden property="objPlayerTournContribution.stumps" />
            <html:hidden property="objPlayerTournContribution.runout" />
            <html:hidden property="objPlayerTournContribution.player_points" />
            <html:hidden property="objPlayerTournContribution.half_centuries" />
            <html:hidden property="objPlayerTournContribution.centuries" />
            <html:hidden property="objPlayerTournContribution.three_wickets" />
            <html:hidden property="objPlayerTournContribution.five_wickets" />
            <html:hidden property="objPlayerTournContribution.no_of_games" />
            
            <table border="0" ALIGN="center" WIDTH="100%">
                <tr height="100%">
                    <td  colspan="3" align="left">
                        <div style="border: 1px solid #666;" id="mainDiv">
                            <!-- WRITE YOUR CODE HERE -->
                            <table border="0" width="100%">
                                <tr>
                                    <td align="left" class="textlable">Country Name: </td>
                                    <td><lc:dropdownbox refxlist="opt_nations" name="objPlayerDetail.country_id" onchange="fnShowPlayerContribution(this.value,'')"/> </td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Player Name: </td>
                                    <td><lc:dropdownbox name="objPlayerDetail.player_id" refxlist="opt_players" onchange="fnShowPlayerContribution('',this.value)"/></td>
                                </tr>
                                <tr>
                                    <td align="left" class="textlable">Player Type: </td>
                                    <td><label class="statvalue"><script>setPlayerType("objPlayerDetail.player_type");</script></label></td>
                                </tr>
                            </table>
                            <hr>
                            <table width="100%">
                                <tr>
                                    <td align="center" colspan="3"><h3>Performance this tournament</h3></td>
                                </tr>
                                <tr>
                                    <td class="textlable">Total Points:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.player_points");</script></label></td>
                                    <td rowspan="8" align="center">&nbsp;&nbsp;<img style="border: 2px 2px 2px 2px solid #000000" id="id_player_image" alt="player" src="/LuvCricket/images/loading.gif" height="210px" width="160px"></td>
                                </tr>
                                <tr>
                                    <td class="textlable">No. of matches played:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.no_of_games");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable">Runs Scored:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.runs_scored");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable">No. of Half-Centuries:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.half_centuries");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable">No. of Centuries:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.centuries");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable">Wickets taken:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.wickets_taken");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable">No. of times 3 wickets:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.three_wickets");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable">No. of times 5 wickets:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.five_wickets");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable">No. of catches:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.catches");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable">No. of runouts contributed:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.runout");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable">No. of stumpings done:</td>
                                    <td><label class="statvalue"><script>setValue("objPlayerTournContribution.stumps");</script></label></td>
                                </tr>
                                <tr>
                                    <td class="textlable"><a href=javascript:openMoreInfo(getObj('objPlayerDetail.player_link').value,"",""); >More Information</a></td>
                                </tr>
                                <tr><td colspan="3" align="center"><input type="button" name="butClose" value=" Close " onclick="window.close()" /></td></tr>
                            </table>
                        </div>
                    </td>
                </tr>
                
            </table>
            
        </html:form>
    </body>
</html>
