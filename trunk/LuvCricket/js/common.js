/*function fnShowMessage(msgId) {
    var retValue = window.showModalDialog("/LuvCricket/jsp/message.jsp?msgid="+msgId,"message","dialogWidth:450px;dialogHeight:200px;status:no");
    return retValue;
}*/
/**
 * This function is calls the message window to show the message based on message id.
 * 
 * @param {String} msgid              This should be a valid message id in the message file
 * @param {String []/String } arglist This is a argument list. It can be array of String or String  
 *                              
 * @return boolean value return by message window.
 * @author Narul Siddik
 * @see #showTextMessage showTextMessage
 */

function fnShowMessage(msgid,arglist) {
    var argurl = "";
    if(!isEmptyOrNull(arglist)) {
        argurl = "&&arglist="+ argumentListCreater(arglist);
    }    
    var msgurl = "/LuvCricket/jsp/message.jsp?msgid="+msgid+argurl;
    var retValue = window.showModalDialog(msgurl,"msg","dialogWidth:450px;dialogHeight:200px; status: no; titlebar: no; "); 
    return retValue;
}

/**
 * This function display message with the text that is supplied.
 * 
 * @param {String} msgText Message text to be displayed.   
 * @param {String} msgType Can be "E","I","Q","W" - if not supplied "I" will be taken(code in message window)
 *
 * @return boolean value return by the message window.
 * @author Narul Siddik
 * @see #showMessage showMessage
 */
function fnShowTextMessage(msgText,msgType) {
    var msgurl = "/LuvCricket/jsp/message.jsp?msgtext="+msgText;
    if(!isEmptyOrNull(msgType)) {
        msgurl = msgurl +"&msgtype="+msgType
    }    
    var retValue = window.showModalDialog(msgurl,"msg","dialogWidth: 500px;dialogHeight: 192px; status: no; titlebar: no; "); 
    //window.open(msgurl);
    return retValue;
}

function fnShowSQLMessage(msgId) {
    var retValue = window.showModalDialog("/LuvCricket/jsp/message.jsp?sqlerror="+msgId,"message","dialogWidth:450px;dialogHeight:200px;status:no");
    return retValue;
}

/**
 * This function is an argument list creater. It converts the String array into a single
 * String concatenated by the delimeter supplied.If delimeter is not supplied then default
 * ^(carat) is taken. 
 * 
 * @param {String []/String } arglist This is a argument list. It can be array of String or String  
 * @param {String} delimeter                             
 * @return {String} Concatenated String from array
 * 
 * @author Narul Siddik
 */
function argumentListCreater(arglist,delim) {
    if(isEmptyOrNull(delim)) {
        delim = "^";
    }
    
    var retArgString = "";
    if(typeof(arglist) == 'string') {
        retArgString = arglist;
    }
    else {
        var argLength = arglist.length;
        if(argLength > 0) {
            retArgString = arglist[0];
        }
        for(var i = 1; i < argLength; ++i) {
            retArgString += delim+arglist[i];
        }    
    }
    return retArgString;
}

/**
 * This function checks whether the value supplied is null or empty.
 *
 * @param {String} Value  
 * @return {boolean} true   - if value is null,undefined or empty ("")
 *                   false  - otherwise
 *
 * @author Narul Siddik
 */
function isEmptyOrNull(objValue) {
    if(objValue == null || objValue == 'undefined' || objValue == undefined || objValue == "") {
        return true;
    }
    else {
        return false;
    }    
}


function fnCheckError(msgid,sqlerror) {
    if(!fnIsEmptyOrNull(msgid)) {
        fnShowMessage(msgid);
    }
    else if(!fnIsEmptyOrNull(sqlerror)) {
        fnShowSQLMessage(sqlerror);
    }
}

function fnMessageReturn(whichButton) {
    if(whichButton == 'OK' || whichButton == 'YES') {
        window.returnValue = true;
    }
    else if (whichButton == 'NO') {
        window.returnValue = false;
    }
    window.close();
}

function fnCheckForError(){
    var msgid = document.forms[0].elements['msgid'];
    var sqlerror = document.forms[0].elements['sqlerror'];
    var error = false;
    if(!fnIsEmptyOrNull(msgid)) {
        fnShowMessage(msgid.value);
        error = false;
    }
    else if (!fnIsEmptyOrNull(sqlerror)){
        fnShowSQLMessage(sqlerror.value);
        error = false;
    }
    return error;
}

function fnOpenScreen(screendo) {
    //alert(screendo);
    top.main.location= "/LuvCricket/"+screendo;
    //document.forms[0].action="/LuvCricket/"+screendo+".do";
    //alert(document.forms[0].action);
    //document.forms[0].submit();
}
function fnDummy() {
    
}

function fnTrim(pstr) {
    pstr = pstr.replace(/^\s+|\s+$/ig, ''); //trim function
    return pstr;
}

function fnRequiredCheck(obj,fldName) {
    var retValue = true;
    if (isEmptyOrNull(fnTrim(obj.value))) {
        fnShowMessage("required.field",fldName+" ");
        obj.focus();
        retValue = false;
    }    
    return retValue;
}    

function fnSetButtonAttrib(objBut,attrib)
{
    if (attrib == "ENABLE") {
        objBut.disabled = false;
    }
    else if (attrib = "DISABLE") {
        objBut.disabled = true;
    }    
}

/**
 * This function is sets the text field attributes:
 * 
 * @param {Object} objFld   
 * @param {String} strAttrib This can be ENABLE,DISABLE
 *                            
 * @return void 
 * @author Narul Siddik
 * @see #functionlink functionname
 */
function setFieldAttribute(objFld, strAttrib)
{
    if(objFld != null && objFld != "undefined" && objFld != undefined) 
    {
        if(strAttrib == undefined || strAttrib == "undefined" || strAttrib == "") 
        {
            strAttrib == "ENABLE";
        }
        if(strAttrib == "ENABLE") 
        {
            objFld.className = "textbox";
            objFld.readOnly = false;
            objFld.disabled = false;
        }
        else if(strAttrib == "DISABLE")
        {
            objFld.className = "textboxdisable";
            objFld.readOnly = true;
            objFld.disabled = true;
        }    
    }    
}    

/**
  * This function filters only digits for input in particular text box. You should attach this 
  * in keydown event of the text box.
  * @author Jatan Porecha
  */
function allowOnlyDigits()
{
    //alert(event.keyCode)
    if ((event.keyCode >= 48 && event.keyCode <= 57))
    {
        event.returnValue = true;
    }
    else
    {
        if(event.keyCode == 9 || event.keyCode == 13 || event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39)
        {
            event.returnValue = true;
        }
        
        event.returnValue = false;
    }
}

function fnLogOut()
{
    //alert("logging out")
    top.location = "/LuvCricket/login.do?appEvent=logoutApplication";
}    

function getObj(id)
{
    return document.getElementById(id);   
}
function fnOpenModelScreen(url)
{
    window.showModalDialog(url, "","dialogWidth:700px;dialogHeight:580px;status:off");
}    

function fnReportError()
{
    fnShowTextMessage('Thanks for your interest. Shortly will allow you to comment. But let this launched as full release.','I');
}    

function fnShowWhy()
{
    window.showModalDialog("/LuvCricket/jsp/whyshouldi.jsp", "","dialogWidth:400px;dialogHeight:280px;status:off");
}    

function validateEmailFormat(email)
{
    var atIndex = email.indexOf("@");
    var dotIndex = email.lastIndexOf(".");
    if (atIndex < 0 || dotIndex < 0 || atIndex > dotIndex) 
    {
        alert("Invalid email format");
        return false;
    }
    return true;
}    

function onclickFaq()
{
    window.open("/LuvCricket/jsp/faq.jsp", "reset","status:off");
}    

function fnShowPlayerContribution(country_id,player_id)
{
    var url = "/LuvCricket/playertournamentcontribution.do?appEvent=getPlayerContributionForTournament"
    if(!isEmptyOrNull(country_id))
    {
        url = url+"&&country_id="+country_id;
    }    
    
    if(!isEmptyOrNull(player_id))
    {
        url = url+"&&player_id="+player_id;
    }    
    window.open(url,"playerdisplay",'height=520, width=700');
}

/**
* This function gives the value of an HTML input element based on the passed name.
* 
* @param {String} name This should be the name of an HTML input element.
* @return The value entered into particular HTML input element. If there are multiple 
*         elements with same name, only first element's value will be given. If HTML input element does not exists, it will return null.
* 
* @author Jatan Porecha 
*/
function getValueByName(name)
{
    var obj = document.getElementsByName(name);
    
    
    if(obj.length > 0)
        return obj[0].value;
    
    return null;
}

 
/**
* This function sets the value of an HTML input element based on the passed name.
* 
* @param {String} name This should be the name of an HTML input element.
* @param {String} value The value to be set to HTML input element.
* @return The value will be set into particular HTML input element. If there are multiple 
*         elements with same name, only first element's value will be set. 
* 
* @author Jatan Porecha 
*/
function setValueByName(name,value)
{
    var obj = document.getElementsByName(name);
    
    if(obj.length > 0)
        obj[0].value = value;
    
}
