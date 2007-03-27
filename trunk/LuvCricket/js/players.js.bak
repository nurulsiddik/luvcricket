function fnOnScreenLoad()
{
    var screen_mode = document.forms[0].elements['screen_mode'];
    if (document.status_message_return == true) {
        if (screen_mode.value == 'create') {
            screen_mode.value = 'modify';
        }    
              
    }    
    fnShowPhoto();
}
function fnShowPhoto()
{
    var player_image_id = document.getElementById("id_player_image");
    var player_photolink = document.forms[0].elements['objPlayingNationsTeam.player_photolink']; 
    if (!isEmptyOrNull(player_photolink.value)) {
      player_image_id.src =  player_photolink.value; 
    }    
      
}

function fnOnFormLoad()
{
    var screen_mode = document.forms[0].elements['screen_mode'];
    if (screen_mode.value == "create") {
        fnSetButtonAttrib(document.forms[0].elements['butDelete'],"DISABLE");
    }    
}

function fnSavePlayer()
{
    var screen_mode = document.forms[0].elements['screen_mode'];
    if (validateForm()) {
        if (screen_mode.value == "create") {
            document.forms[0].action = "/LuvCricket/playingnationsteam.do?appEvent=createPlayer";
            document.forms[0].submit();
        }
        else if (screen_mode.value == 'modify') {
            document.forms[0].action = "/LuvCricket/playingnationsteam.do?appEvent=updatePlayer";
            document.forms[0].submit();
        }    
    }    
}

function fnDeletePlayer()
{
    var screen_mode = document.forms[0].elements['screen_mode'];
    if (screen_mode.value == 'modify') {
        document.forms[0].action = "/LuvCricket/playingnationsteam.do?appEvent=deletePlayer";
        document.forms[0].submit();
    }    
}

function validateForm()
{
    var screen_mode = document.forms[0].elements['screen_mode'];
    var player_name = document.forms[0].elements['objPlayingNationsTeam.player_name'];
    
    var player_welknown_name = document.forms[0].elements['objPlayingNationsTeam.player_welknown_name'];

    if(screen_mode.value == "create" && isEmptyOrNull(player_name.value)) 
    {
        fnShowMessage("required.field","Player Name ");
        player_name.focus();
        return false;
    }
    else if (isEmptyOrNull(player_welknown_name.value)) {
        fnShowMessage("required.field","Player Welknown Name ");
        player_welknown_name.focus();
        return false;
        
    }    
    return true;
}    

function fnOnChangeCountry()
{
    var screen_mode = document.forms[0].elements['screen_mode'];
    if (screen_mode.value == 'modify') {
        document.forms[0].action = "/LuvCricket/playingnationsteam.do?appEvent=onChangeCountry";
        document.forms[0].submit();
    }    
}    

function fnOnChangePlayers()
{
    document.forms[0].action = "/LuvCricket/playingnationsteam.do?appEvent=onChangePlayer";
    document.forms[0].submit();
    
}