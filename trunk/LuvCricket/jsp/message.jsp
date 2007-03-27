<%@page import="wow.play.cricket.common.LCMessageManager"%>
<%@page import="wow.play.cricket.vo.LCMessageVO" %>
<%@taglib uri="/WEB-INF/lc-tags.tld" prefix="lc"%>

<!--
message.jsp
This jsp displays the message with message icon depending on message type. It also can handle the message which are not
from the message file.
    @author Narul Siddik
    @version $Revision$
    Last changed by $Author$ on $Date$ as $Revision$
    
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <title>Message</title>  
        <link href="/LuvCricket/css/stylesheet.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="/LuvCricket/js/common.js" > </script>
        
        <script type="text/javascript">
            /*
            This function is called onload of the page.
            This function adjust the height inside the message window
            */
            function fnMessageLoad()
            {
            var tabHeight = ((parseInt(dialogHeight) * 88)/100)+ "px";
            alert(tabHeight);
            document.getElementById("maintable").height = tabHeight;
            }
            
            /*
            This function is called on click of the button.
            it sets the return value depending on the button click.
            @return boolean  true - Always for message type ERROR,INFO/ 
            For message type QUESTION if OK button clicked
            For message type WARNING  if YES button clicked
 
            false - For message type QUESTION if CANCEL button clicked
            For message type WARNING if NO button clicked.
             
            */
            function fnMessageBoxReturn(butClicked)
            {
            
            var retValue = true;
            
            if(butClicked == "TWO")
            {
                retValue = false;
            }
            window.returnValue = retValue;
            self.close();
            }
            
            /*
            This function is called on unload of the page
            it checks that if the user close the message window using ( X ) then
            handle such case and return proper value according to the message 
            type.           
            
            */
            function fnMessageUnload(msgType)
            {
            if(window.returnValue == 'undefined' || window.returnValue == undefined)
            {
            if(msgType == "W" || msgType == "Q")
            {
            window.returnValue = false;
            }   
            else
            {
            window.returnValue = true;
            }    
            }
            }    
            
        </script>    
    </head>
    <%
    
    String msgType = "";
    String msgText = "";
    String msgIcon = "";
    String msgTypeText = "";
    
    String msgid = request.getParameter("msgid");
    String msgtext = request.getParameter("msgtext");
    
    if(msgid != null && !"".equals(msgid) && !"null".equals(msgid))
    {
        String msgArgList = request.getParameter("arglist");
        LCMessageManager objMsg = LCMessageManager.getInstance();
        LCMessageVO objMsgVo = objMsg.getMessageVo(msgid);
        msgType = objMsgVo.getMessageType();
        if(msgArgList != null && msgArgList != "null")
        {
            String[] msgArgArray = msgArgList.split("\\^");
            msgText = objMsg.getMessage(msgid,msgArgArray);
        }
        else
        {
            msgText = objMsgVo.getMessageString();
        }
    }
    else if (msgtext != null && !"".equals(msgtext) && !"null".equals(msgtext))
    {
        msgText = msgtext;
        msgType = request.getParameter("msgtype");
        if(msgType == null || "null".equals(msgType) || "".equals(msgType))
        {
            msgType = "I";
        }
    }
    
    String msgButOneLable = "OK";
    String msgButTwoLable = "CANCEL";
    
    if("I".endsWith(msgType))
    {
        msgIcon = "information.jpg";
        msgTypeText = "INFORMATION : ";
    }
    else if("E".endsWith(msgType))
    {
        msgIcon = "error_big.gif";
        msgTypeText = "ERROR: ";
    }
    else if("W".endsWith(msgType))
    {
        msgIcon = "warning_big.jpg";
        msgTypeText = "WARNING : ";
    }
    else if("Q".endsWith(msgType))
    {
        msgIcon = "question.gif";
        msgTypeText = "QUESTION : ";
        msgButOneLable = "YES";
        msgButTwoLable = "NO";
    }
    %>
    
    <body bgcolor="#ffffff" scroll = no   onunload="fnMessageUnload('<%=msgType%>')"  >
        <br>
        <h2 style="font-family:arial;font-size:16px;font-weight:bold;color:black; background: lightgreen"><%=msgTypeText%></h3>
        <br>
        <div align="center" style="font-family:verdana;font-size:12px;font-weight:bold;color:darkgreen; vertical-align:middle">
            <img src="/LuvCricket/images/<%=msgIcon%>" alt="" border="0" />&nbsp;&nbsp;<%=msgText%>
        </div>
        <br>
        <div align="center">
            <input name="buttonOne" type="button" value="    <%=msgButOneLable%>    " size="50" onclick="fnMessageBoxReturn('ONE')" ></input>
            <% if("W".equals(msgType) || "Q".equals(msgType))
            {
            %>   
            <input name="buttonTwo" type="button" value="    <%=msgButTwoLable%>    " size="50" onclick="fnMessageBoxReturn('TWO')" ></input>
            <%
            }
            %> 
        </div>
        <br>
    </body>
    
</html>