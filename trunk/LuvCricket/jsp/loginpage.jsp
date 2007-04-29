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
      <!--  <META HTTP-EQUIV="Page-Enter" content="revealTrans(Duration=1.0,Transition=23)">
        <META HTTP-EQUIV="Page-Exit" content="revealTrans(Duration=1.0,Transition=23)"> 

		<xml:namespace ns="urn:schemas-microsoft-com:vml" prefix="v"/>
		<style type="text/css">
		v\:* { behavior: url(#default#VML); }
		</style>
-->        
        <link rel="stylesheet" type="text/css" href="/LuvCricket/css/stylesheet.css" title="style"/>
        <script type="text/javascript" src="/LuvCricket/js/common.js"></script> 
        <script type="text/javascript" src="/LuvCricket/js/login.js"></script>
        
    </head>
    <body style="filter:progid:DXImageTransform.Microsoft.Gradient(endColorstr='#C0CFE2', startColorstr='#FFFFFF', gradientType='0');" onload="checkCookie('lc_user_cookie');fnInitLogin();">


<script type="text/javascript">

/***********************************************
* 3D Spinning Message Script- By Copyright (c) 2003 Peter Gehrig
* Website: http://www.24fun.com
* Script available at/modified by Dynamic Drive (http://www.dynamicdrive.com)
* This notice must stay intact for use
***********************************************/


// Add as many messages as you like
var message=new Array("Winner- Vivek", "2nd Jatan", "3rd Narendra", "Final lag- Gaurang")

// Set the outline-color. Add as many colors as you like
var outlinecolor=new Array("black", "black")

// Set fillcolors 1. Add as many colors as you like
var fillcolor1=new Array("gray", "green", "white", "green")

// Set fillcolors 2. Add as many colors as you like
var fillcolor2=new Array("blue", "olive", "black", "lime")

// Set the letter marking the circle
var circlemark=new Array("-")

// Set the width of the outline
var strkweight=2

// Set the waiting time between the messages (seconds)
var pause=2

// Set the strength of the opacity (transparency of letters)
var strengthopacity="60%"

// Set the size of the circle (values range from 0.1 to 1)
var circlesize=0.3

// Always keep messages in view even if page is scrolled? (DD added option)
var keepinview="yes"

// Do not edit below this line

mytruebody=(!window.opera && document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body //Dynamicdrive added object

var outerwidth=mytruebody.clientWidth
var outerheight=mytruebody.clientHeight

var innerwidth=Math.floor(circlesize*outerwidth)
var innerheight=Math.floor(circlesize*outerheight)

var posleft=(outerwidth-innerwidth)/2
var postop=(outerheight-innerheight)/2

var path=new Array()
var i_message=0
var i_outlinecolor=0
var i_fillcolor1=0
var i_fillcolor2=0
var i_messagelength=0
var longestmessage=0
pause*=1000

var ie=document.getElementById&&document.all?1:0 

for (i=0;i<=message.length-1;i++) {
	if (message[i].length>longestmessage) {
		longestmessage=message[i].length
	}
	longestmessage+=4
}

for (i=0;i<=message.length-1;i++) {

	var emptyspace=""
	var i_emptyspace=(longestmessage-message[i].length)/2
	for (ii=0;ii<=i_emptyspace;ii++) {
		emptyspace+=circlemark
	}
	message[i]=emptyspace+" "+message[i]+" "+emptyspace
}

function changeform() {
	if (keepinview=="yes") //DD added
	document.getElementById("roofid").style.top=mytruebody.scrollTop //DD added
	if (i_outlinecolor >= outlinecolor.length) {i_outlinecolor=0}
	if (i_fillcolor1 >= fillcolor1.length) {i_fillcolor1=0}
	if (i_fillcolor2 >= fillcolor2.length) {i_fillcolor2=0}
	document.getElementById('strokeid').color=outlinecolor[i_outlinecolor]
	document.getElementById('fillid').color=fillcolor1[i_fillcolor1]
	document.getElementById('fillid').color2=fillcolor2[i_fillcolor2]
	if (i_message < message.length) {tick()}
	else {document.getElementById('textpathid').string=""
	document.getElementById("roofid").style.display="none" //DD added
	}
}

function tick() {
	if (i_messagelength <= message[i_message].length) {
		var messagestringend=""
		var messagestring=message[i_message].substring(0, i_messagelength)+messagestringend
		document.getElementById('textpathid').string=messagestring
		var timer=setTimeout("tick()",50)
		i_messagelength++
	}
	else {
		clearTimeout(timer)
		i_messagelength=0
		i_message++
		i_outlinecolor++	
		i_fillcolor1++	
		i_fillcolor2++	
		var timer=setTimeout("changeform()",pause)
	}
	
}

if (ie) {
	document.write('<div id="roofid" style="position:absolute;left:0px;top:0px;width:'+outerwidth+'px;height:'+outerheight+'px;overflow:hidden;">')
	document.write('<v:oval id="tc" style="position:absolute;top:'+postop+'px;left:'+posleft+'px;width:'+innerwidth+'px;height:'+innerheight+'px">')
	document.write('<v:shadow on="t" opacity="'+strengthopacity+'"/>')
	document.write('<v:stroke id="strokeid" weight="'+strkweight+'pt" color="blue"/>')
	document.write('<v:fill id="fillid" on="True" color="'+fillcolor1[0]+'" color2="'+fillcolor2[0]+'" opacity="'+strengthopacity+'" opacity2="'+strengthopacity+'" type="gradient"/>')
	document.write('<v:path textpathok="t"/>')
	document.write('<v:textpath id="textpathid" on="t" id="mytp" style="font-family:\'Arial Black\'; " fitpath="t" string=""/>')
	document.write('</v:oval></div>')
	if (window.attachEvent) //DD added code
	window.attachEvent("onload", changeform) //DD added code
	else
	window.onload=changeform
}
</script>


        <html:form action="/login" method="POST">
            <table border="0" ALIGN="center" WIDTH="80%" onkeypress="trackEnter();">
                <tr>
                    <td >
                        <img style="border-color:white" alt="icc" src="/LuvCricket/images/cricket_back.gif"> 
                    </td>
                    <td align="center">
                        <img height="100px" width="150px" alt="icc" src="/LuvCricket/images/icc_wc.jpg">&nbsp;&nbsp;
                    </td>
                </tr>
                <tr >
                    <td width="100%" colspan="2" align="left">
                        <div style="background-image: url('/LuvCricket/images/top_border.jpg'); height:50px;">
                            <p>&nbsp;</p>
                        </div>
                    </td>
                    <!--<td>&nbsp;2</td>-->
                </tr>
                <tr valign="top">
                    <!--<td width="40%">&nbsp;3</td>-->
                    <td width="50%">
                        <!-- User Login -->
                        <table border="0" width="100%">
                            <tr >
                                <td colspan="2" style="font-family:sans-serif;font-weight: bold; font-size: 12px;"><u>Already Registered Login Below:</u></td>
                            </tr>
                            <tr>
                                <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;">User Id or Login Name</td>
                                <td><html:text property="userId" size="20" maxlength="45" styleClass="c5" value="Enter User Id/Login Name"/></td>
                            </tr>
                            <tr>
                                <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;">Password</td>
                                <td><html:password property="password" size="20" maxlength="128" styleClass="c5" value=""/></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <img name="imgSubmitLogin" alt="Submit" src="/LuvCricket/images/trophy_WC.gif" style="cursor: hand;" width="65" height="65" border="0" onclick="submitPage()">
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="font-family:sans-serif;font-weight: bold; font-size: 12px;"><a href="javascript:fnForgotPassword()">Forgot Password?</a></td>
                                <td align="left" style="font-family:sans-serif;font-weight: bold; font-size: 12px;"><a href="javascript:fnRegUser()">New User Sign Up.</a></td>                                
                            </tr>
                        </table>
                    </td>
                    <td width="50%">
                        <table width="50%">
                            <tr>
                                <td style="color:darkblue;font-family:sans-serif;font-weight: bold; font-size: 13px;">
                                    Tournament - World Cup 2007 Final Result 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="height:225px; width:350px; overflow:auto;border: 1px 1px 1px 1px solid;">
                                        <table width="100%">
                                            <logic:notEmpty name = "tournament_matches" scope = "session">
                                                <logic:iterate id="id_tourn_matches" indexId="i" scope="session" name="tournament_matches" type="wow.play.cricket.vo.TournamentMatchesVO">
                                                    <tr>
                                                        <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;"><bean:write name="id_tourn_matches" property="match_date"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-family:Verdana;font-weight: bold; font-size: 11px; color:darkred;"><bean:write name="id_tourn_matches" property="country_id1"/> vs <bean:write name="id_tourn_matches" property="country_id2"/></td>
                                                    </tr>
                                                    <tr><td><hr></td></tr>
                                                </logic:iterate>


                                                    <tr>
                                                        <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;">Winner</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-family:Verdana;font-weight: bold; font-size: 11px; color:darkred;">My Team - Vivek Kedare</td>
                                                    </tr>
                                                    <tr><td><hr></td></tr>

                                                    <tr>
                                                        <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;">Runners Up</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-family:Verdana;font-weight: bold; font-size: 11px; color:darkred;">JP_SUP_8_11 - Jatan Porecha</td>
                                                    </tr>
                                                    <tr><td><hr></td></tr>

                                                    <tr>
                                                        <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;">2nd Runners Up</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-family:Verdana;font-weight: bold; font-size: 11px; color:darkred;">NARU - Narendra Gaware</td>
                                                    </tr>
                                                    <tr><td><hr></td></tr>

                                                    <tr>
                                                        <td style="font-family:sans-serif;font-weight: bold; font-size: 12px;">Final Lag Winner</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-family:Verdana;font-weight: bold; font-size: 11px; color:darkred;">Beat the World - Gaurang Vyas</td>
                                                    </tr>
                                                    <tr><td><hr></td></tr>
                                            </logic:notEmpty>
										</table>
                                    </div>
                                </td>
                            </tr>
                            
                        </table>
                        
                        
                    </td>
                </tr>
                
                <tr>
                    <!--<td width="40%">&nbsp;</td>-->
                    <td>
                        <!-- User Login 
                        <table border="0" width="100%">
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr >
                                <td colspan="2" style="font-family:sans-serif;font-weight: bold; font-size: 12px;">Want to be a part of it! Click Below:&nbsp;&nbsp; &nbsp;&nbsp; <a href="javascript:fnShowWhy()">Why should I? </a></td>
                            </tr>
                            <tr>
                                <td colspan="2">           
                                    <img name="imgNewRegistration" src="/LuvCricket/images/FAN_HD.jpg" onclick="fnRegUser();" width="334" height="146" border="0" style="cursor : hand">
                                </td>
                            </tr>
                        </table>-->
                    </td>
                </tr>
                
                
            </table>
        </html:form>
        <lc:msg_error/>
    </body>
</html>
