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
        <title>Rules</title>
    </head>
    <body style="background-image: url('/LuvCricket/images/india-wp.jpg')">
            <table border="0" ALIGN="center" WIDTH="100%">
                <tr><td colspan="3" ><h2 align="center" style="font-style: Courier">Tournament Points Rules</h2></td></tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                <tr height="100%">
                    <td  colspan="3" align="center">
                        <div style="height: 400px">
                            <!-- WRITE YOUR CODE HERE -->
                            <table width="80%" border="1" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="ruleslabel">Points for playing in a match </td>
                                    <td class="rulestext">&nbsp; 1</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Minimum runs required to start points counting </td>
                                    <td class="rulestext">&nbsp; 0</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Points for each runs scored </td>
                                    <td class="rulestext">&nbsp; 1</td>
                                </tr>

                                <tr>
                                    <td class="ruleslabel">Bonus Points for 25 runs scored </td>
                                    <td class="rulestext">&nbsp; 0</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Bonus Points for scoring half century or more</td>
                                    <td class="rulestext">&nbsp; 10</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Bonus Points for scoring century or more</td>
                                    <td class="rulestext">&nbsp; 25</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Points for each wicket taken </td>
                                    <td class="rulestext">&nbsp; 25</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Bonus Points for 3 wickets or more</td>
                                    <td class="rulestext">&nbsp; 10</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Bonus Points for 5 wickets or more </td>
                                    <td class="rulestext">&nbsp; 25</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Points for stumping </td>
                                    <td class="rulestext">&nbsp; 5</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Points for a catch </td>
                                    <td class="rulestext">&nbsp; 5</td>
                                </tr>
                                <tr>
                                    <td class="ruleslabel">Points for runout </td>
                                    <td class="rulestext">&nbsp; 5</td>
                                </tr>

                            </table>
                        </div>
                    </td>
                </tr>
                
            </table>
    </body>
</html>
