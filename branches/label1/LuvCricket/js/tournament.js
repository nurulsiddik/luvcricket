var prevSelRow = "";
var selRow = "";
var selRowId = "";
var line_action = "create";

function fnRowEntry(objRow) {
    //var objTable = document.getElementsById('tournamentchange');
    selRowId = objRow.cells[0].id;
    fnSelRowValue(objRow);
    prevSelRow = selRow;
    selRow = objRow;
    prevSelRow.className = "tableSelectedRow";
    selRow.className = "tableSelectedRow";
}
function fnSelRowValue(objRow) {
    var tournament_stage = document.forms[0].elements['objTournamentChanges.tournament_stage'];
    var changes_permitted = document.forms[0].elements['objTournamentChanges.changes_permitted'];
    var stage_description = document.forms[0].elements['objTournamentChanges.stage_description'];
    tournament_stage.value = fnTrim(objRow.cells[0].innerText);
    changes_permitted.value = fnTrim(objRow.cells[1].innerText);
    stage_description.value = fnTrim(objRow.cells[2].innerText);
    line_action = "modify";
}
function fnClearLine() {
    var tournament_stage = document.forms[0].elements['objTournamentChanges.tournament_stage'];
    var changes_permitted = document.forms[0].elements['objTournamentChanges.changes_permitted'];
    var stage_description = document.forms[0].elements['objTournamentChanges.stage_description'];
    tournament_stage.value = "";
    changes_permitted.value = "";
    stage_description.value = "";
    
    line_action = "create";
    
}

function fnSaveLine() {
    if (!fnValidateLine()) {
        return;
    }    
    var actionurl = "/LuvCricket/tournament.do";
    if (line_action == "create") {
        actionurl = actionurl +"?appEvent=createTCLine";
    }    
    else if (line_action == "modify") {
        actionurl = actionurl +"?appEvent=modifyTCLine&&selectedrow="+selRowId;
    }    
    document.forms[0].elements['testhidden'].value = "SIDDU";
    document.forms[0].action = actionurl;
    document.forms[0].submit();
}
function fnDeleteLine() {
    var objTable = document.getElementById('tournamentchange');
    var length = objTable.rows.length;

    if (length <= 1) {
        fnShowMessage("atleast.online");
        return;
    }    
    if(line_action == "modify") {
        document.forms[0].action = "/LuvCricket/tournament.do?appEvent=deleteTCLine&&selectedrow="+selRowId;
        document.forms[0].submit();
    }    
}    
function fnValidateLine() {
    var retValue = true;
    var tournament_stage = document.forms[0].elements['objTournamentChanges.tournament_stage'];
    var changes_permitted = document.forms[0].elements['objTournamentChanges.changes_permitted'];
    var stage_description = document.forms[0].elements['objTournamentChanges.stage_description'];
    
    if (isEmptyOrNull(fnTrim(tournament_stage.value))) {
        fnShowMessage("required.field","Tournament Stage ");
        tournament_stage.focus();
        retValue = false;
    }    
    else if (isEmptyOrNull(fnTrim(changes_permitted.value))) {
        fnShowMessage("required.field","Changes permitted ");
        changes_permitted.focus();
        retValue = false;
    }    
    return retValue;
}
function fnSaveTournament() {
    var tournament_name = document.forms[0].elements['objTournament.tournament_name'];
    var current_stage = document.forms[0].elements['objTournament.current_stage'];
    if (!fnRequiredCheck(tournament_name,"Tournament Name ")) {
        return;
    }
    else if (!fnRequiredCheck(current_stage, "Current Stage ")) {
        return;
    }    
    if (!fnCheckCurrStageExist()) {
        fnShowMessage("invalid.value");
        return;
    }
    document.forms[0].action = "/LuvCricket/tournament.do?appEvent=createNewTournament";
    document.forms[0].submit();
}    

function fnCheckCurrStageExist() {
    var current_stage = document.forms[0].elements['objTournament.current_stage'];
    var objTable = document.getElementById('tournamentchange');
    var length = objTable.rows.length;
    for(var i=0; i < length; i++) {
        var cellValue = fnTrim(objTable.rows[i].cells[0].innerText);
        if (cellValue == fnTrim(current_stage.value)) {
            return true;
        }    
    }
    return false;
}    

function onChangeTournament(){
    document.forms[0].action = "/LuvCricket/tournamentplayers.do?appEvent=fetchTournamentCountry";
    document.forms[0].submit();
}

function onChangeTourCountry()
{
    document.forms[0].action = "/LuvCricket/tournamentplayers.do?appEvent=fetchTournamentCountryPlayer";
    document.forms[0].submit();
}

function fnSavePlayerLine()
{
    var selectedIndex =  document.forms[0].elements['objTournamentPlayer.player_id'].selectedIndex;
    if (selectedIndex > 0)
    {
        var selectedPlayer = document.forms[0].elements['objTournamentPlayer.player_id'].options[selectedIndex]; 
        if(fnCheckPlayerExist(selectedPlayer.value))
        {
            fnShowMessage("player_associated");
        }
        else
        {
            var player_name = selectedPlayer.innerText;
            document.forms[0].action = "/LuvCricket/tournamentplayers.do?appEvent=savePlayerLine&&player_name="+player_name;
            document.forms[0].submit();         
        }    
    }    
    return;
}    
function fnCheckPlayerExist(player_id)
{
    var objTable = document.getElementById('tournament_player');
    var length = objTable.rows.length;
    for(var i=0; i<length; i++)
    {
        var lst_player_id = document.forms[0].elements['tournament_player['+objTable.rows[i].cells[0].id+'].player_id'].value;
        if(lst_player_id == player_id)
        {
            return true;
        }
    }    
    return false;
}

function fnSelectPlayerLine(rowObj)
{
    document.forms[0].elements['objTournamentPlayer.player_id'].value = document.forms[0].elements['tournament_player['+rowObj.cells[0].id+'].player_id'].value;
    document.forms[0].elements['objTournamentPlayer.player_value'].value = fnTrim(rowObj.cells[2].innerText);
    selRowId = rowObj.cells[0].id;
}

function fnDeletePlayerLine()
{
    if (selRowId != "") 
    {
        document.forms[0].action = "/LuvCricket/tournamentplayers.do?appEvent=removePlayerLine&&selected_id="+selRowId;
        document.forms[0].submit();         
    }
    else
    {
        fnShowMessage("no_row_selected");
    }    
}

function fnAssociatePlayers()
{
    document.forms[0].action = "/LuvCricket/tournamentplayers.do?appEvent=associatePlayers";
    document.forms[0].submit();         
}    

function submitForTeamLock()
{
    var next_eff_day = getObj("next_effective_date");
    var url = "/LuvCricket/tournament.do?appEvent=lockTournamentDay"
    url = url+"&&next_effective_day="+fnTrim(next_eff_day.value);
    var tournament_id = getObj("objLCTournament.tournament_id");
    url = url+"&&tournament_id="+fnTrim(tournament_id.options[tournament_id.selectedIndex].value);
    document.forms[0].action = url;
    document.forms[0].submit();
}    

function onChangeLockTournament()
{
    var tournament_id = getObj("objLCTournament.tournament_id");
    var tournament_id_value = fnTrim(tournament_id.options[tournament_id.selectedIndex].value);
    document.forms[0].action = "/LuvCricket/tournament.do?appEvent=initLockProcess&&tournament_id="+tournament_id_value;
    document.forms[0].submit();
}    