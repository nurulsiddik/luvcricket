function onFormLoad() 
{
    if(document.status_message_code != undefined && document.status_message_code == "record.updated")
    {
        document.forms[0].action = "/LuvCricket/login.do?appEvent=welcome";
        document.forms[0].submit();
    }
    else if (document.error_message_code != undefined)
    {
        var password = document.forms[0].elements['objUserData.password'];
        var repassword = document.forms[0].elements['txtRePassword'];
        password.value = "";
        repassword.value = "";
    }    
}
function allRequiredFieldOk()
{
    var retValue = true;
    var user_id =  document.forms[0].elements['objUserData.user_id'];
    var login_name =  document.forms[0].elements['objUserData.login_name'];
    var user_name =  document.forms[0].elements['objUserData.user_name'];
    var password =  document.forms[0].elements['objUserData.password'];
    var repassword =  document.forms[0].elements['txtRePassword'];
    var email = document.forms[0].elements['objUserData.email'];
    if(isEmptyOrNull(user_id.value))
    {
        fnShowMessage("required.field","User Id ");
        user_id.focus();
        retValue = false;
    }
    else if (isEmptyOrNull(login_name.value)) 
    {
        fnShowMessage("required.field","Login Name ");
        login_name.focus();
        retValue = false;
    }    
    else if (isEmptyOrNull(user_name.value)) 
    {
        fnShowMessage("required.field","User Name ");
        user_name.focus();
        retValue = false;
    }    
    else if (isEmptyOrNull(password.value)) 
    {
        fnShowMessage("required.field","Password ");
        password.focus();
        retValue = false;
    }    
    else if (isEmptyOrNull(repassword.value)) 
    {
        fnShowTextMessage("Please retype the password","E");
        repassword.focus();
        retValue = false;
    }    
    else if (isEmptyOrNull(email.value)) 
    {
        fnShowMessage("required.field","Email ");
        email.focus();
        retValue = false;
    }    
    else if (!validateEmailFormat(email.value))
    {
        return false;
    }
    return retValue;
}    
    
    
function submitDataForInsertion() {
    if(allRequiredFieldOk() && checkPasswordSame()) {
        document.forms[0].action = "/LuvCricket/registernewuser.do?appEvent=registerNewUser";
        document.forms[0].submit();
    }
}

function checkPasswordSame() {
    var password = document.forms[0].elements['objUserData.password'];
    var repassword = document.forms[0].elements['txtRePassword'];
    if(password.value != repassword.value) {
        fnShowMessage("password.mismatch");
        password.value = "";
        repassword.value = "";
        password.focus();
        return false;
    }
    return true;
}

function onFormLoadEdit()
{
    var password = getObj("objUserData.password");
    var rePassword = getObj("txtRePassword");
    rePassword.value = password.value;
}    

function submitForChange()
{
    var user_name =  document.forms[0].elements['objUserData.user_name'];
    var password =  document.forms[0].elements['objUserData.password'];
    var repassword =  document.forms[0].elements['txtRePassword'];
    
    if (isEmptyOrNull(user_name.value)) 
    {
        fnShowMessage("required.field","User Name ");
        user_name.focus();
        return false;
    }    
    else if (isEmptyOrNull(password.value)) 
    {
        fnShowMessage("required.field","Password ");
        password.focus();
        return false;
    }    
    else if (isEmptyOrNull(repassword.value)) 
    {
        fnShowTextMessage("Please retype the password","E");
        repassword.focus();
        return false;
    }        
    if(!checkPasswordSame())
    {
        return false;
    }    
    document.forms[0].action = "/LuvCricket/editmydetails.do?appEvent=editUserDetails"
    document.forms[0].submit();
}    

function resetPassword()
{
    var user_id = getObj("user_id");
    var login_name = getObj("login_name");
    var email = getObj("email");
    if(isEmptyOrNull(fnTrim(user_id.value)))
    {
        fnShowMessage("required.field"," User Id");
        return;
    }    
    if(isEmptyOrNull(fnTrim(login_name.value)))
    {
        fnShowMessage("required.field"," Login Name");
        return;
    }    
    
    document.forms[0].action = "/LuvCricket/registernewuser.do?appEvent=forgotPassword&&user_id="+user_id.value+"&&login_name="+login_name.value+"&&email="+email.value
    document.forms[0].submit();
            
}    