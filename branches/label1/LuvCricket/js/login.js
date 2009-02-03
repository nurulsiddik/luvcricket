function submitPage() {
    setCookie('lc_user_cookie','5000');
    
    document.forms[0].action = "/LuvCricket/login.do?appEvent=validatelogin";
    document.forms[0].submit();
}
function fnRegUser() {
    document.forms[0].action = "/LuvCricket/registernewuser.do?appEvent=initRegisterUser";
    document.forms[0].submit();
    
}    

function fnInitLogin() {
    var userId = getObj("userId");
    //userId.focus();
    //userId.select();
    //getObj("password").focus();
    
}    
function trackEnter() {                
    if(window.event.keyCode == 13) {
        submitPage();
    }
}

function fnForgotPassword() {
    window.open("/LuvCricket/jsp/resetpassword.jsp", "reset","width=600,height=380,status:off");
}    


function checkCookie(name) {
    getObj('userId').focus();
    if(document.cookie.indexOf(name) != -1) {
        var aCookie = document.cookie.split("; ");
        for (var i=0; i < aCookie.length; i++) {
            var aCrumb = aCookie[i].split("=");
            if (name == aCrumb[0]) {
                setValueByName('userId',unescape(aCrumb[1]));
                getObj("password").focus();
            }
        }
    }
}

function setCookie(cookiename,expireson) {
    
    var exdate=new Date();                    
    exdate.setDate(exdate.getDate()+expireson);
    
    document.cookie=cookiename+ "=" +getValueByName('userId')+((expireson==null) ? "" : ";expires="+exdate.toGMTString());
}

