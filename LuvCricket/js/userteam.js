var playerArray = new Array();
var comparePlayerArray = new Array();
var SUBTRACT_PLAYER_CHANGES = 0;

function fnLoadUserTeamPlayer()
{
    var compare_team = getObj("compare_team");
    if (compare_team.value != null && compare_team.value != "null" && compare_team.value != "") 
    {
        var aryTeam = compare_team.value.split(",");
        for(var i=0; i< aryTeam.length; i++)
        {
            if(aryTeam[i] != "")
            {
                comparePlayerArray[aryTeam[i]] = aryTeam[i];
            }    
        }    
    }
    else
    {
        var NOTE_CHANGES = getObj("NOTE_CHANGES");
        NOTE_CHANGES.value = "no";
    }    
    fnSelectCheckedPlayer();
    fnCountChangesLeft();
}    

function fnSelectCheckedPlayer()
{
    var tableUserPlayer = getObj("userteam_players");
    var lengthRow = tableUserPlayer.rows.length;
    var userPlayerCount=0;
    var batsmanCount = document.forms[0].elements['batsmanCount'];
    var bowlerCount = document.forms[0].elements['bowlerCount'];
    var wkCount = document.forms[0].elements['wkCount'];
    var allrounderCount = document.forms[0].elements['allrounderCount'];
    
    for(var i=0; i<lengthRow; i++)
    {
        var rowObj = tableUserPlayer.rows[i];
        var rowId = rowObj.cells[0].id;
        var strRowPlayer = "userteam_players["+rowId+"].player_id";
        var rowPlayerId = document.forms[0].elements[strRowPlayer];
        if(rowPlayerId.value != "")
        {
            //Count player changes
            if(comparePlayerArray[rowPlayerId.value] == undefined)
            {
                SUBTRACT_PLAYER_CHANGES++;
            }
            
            //Select checked player
            userPlayerCount++;
            playerArray[rowPlayerId.value] = rowObj;
            var playerType = fnTrim(rowObj.cells[1].innerText);
            if(playerType == "Batsman")
            {
                batsmanCount.value = parseInt(batsmanCount.value) + 1; 
            }    
            else if(playerType == "Bowler")
            {
                bowlerCount.value = parseInt(bowlerCount.value)+1;
            }    
            else if(playerType == "Wicket keeper")
            {
                wkCount.value = parseInt(wkCount.value)+1;
            }    
            else if(playerType == "All rounder")
            {
                allrounderCount.value = parseInt(allrounderCount.value)+1;
            }    
            
        }
        else
        {            
            rowObj.cells[2].flash = "true";
            
        }    

    }    
        
    var tableAllPlayer = getObj("tournament_players");
    lengthRow = tableAllPlayer.rows.length;
    var tourPlayerMatch = 0;
    for(var i=0; i<lengthRow; i++)
    {
        var rowObj = tableAllPlayer.rows[i];
        var rowId = rowObj.cells[1].id;

        var strRowPlayer = "tournament_players["+rowId+"].player_id";
        var playerId = document.forms[0].elements[strRowPlayer];
        
        if(playerArray[playerId.value] != undefined)
        {
            tourPlayerMatch++;
            var chkBox = document.forms[0].elements["chk_"+rowId];
            chkBox.checked = true;
            if (tourPlayerMatch == userPlayerCount) 
            {
                break;
            }    
        }    
    }
    fnSumUserTeam();
}

function fnCountChangesLeft()
{
    var tournament_changes_lab = getObj("tournament_changes_allowed");
    var number_of_changes = getObj("number_of_changes");
    var number_of_changes_left_lab = getObj("number_of_changes_left");
    var NOTE_CHANGES = getObj("NOTE_CHANGES");
    var tableUserPlayer = getObj("userteam_players");
    var lengthRow = tableUserPlayer.rows.length;
    var playerDiff = 0;
    if(NOTE_CHANGES.value != "no")
    {   
        for(var i=0; i<lengthRow; i++)
        {
            var rowObj = tableUserPlayer.rows[i];
            var rowId = rowObj.cells[0].id;
            var strRowPlayer = "userteam_players["+rowId+"].player_id";
            var rowPlayerId = document.forms[0].elements[strRowPlayer];
            if(comparePlayerArray[rowPlayerId.value] == undefined)
            {
                playerDiff =  playerDiff+1;
            }    
        }
    }
    else
    {
        SUBTRACT_PLAYER_CHANGES = 0;
    }    
    var noc_left = parseInt(fnTrim(tournament_changes_lab.innerText)) - (parseInt(fnTrim(number_of_changes.value)) + (parseInt(playerDiff) - parseInt(SUBTRACT_PLAYER_CHANGES)));
    number_of_changes_left_lab.innerText = noc_left;
}    
function fnSaveUserTeam()
{
    var screen_mode = document.forms[0].elements['screen_mode'];
    var user_team_id = getObj("objUserTeam.user_team_id");
    if(isEmptyOrNull(fnTrim(user_team_id.value)))
    {
        fnShowMessage("required.field"," Team Id")
        user_team_id.focus();
        return false;
    }    
    if (screen_mode.value == 'create') 
    {
      document.forms[0].action = "/LuvCricket/userteam.do?appEvent=createUserTeam";
      document.forms[0].submit();
    }    
    else if (screen_mode.value == "modify") 
    {
      document.forms[0].action = "/LuvCricket/userteam.do?appEvent=updateUserTeam";
      document.forms[0].submit();
    }    
      
}    

function onChangeUserTeam()
{
      document.forms[0].action = "/LuvCricket/userteamplayers.do?appEvent=onChangeUserTeam";
      document.forms[0].submit();
}    

function fnFilterPlayer()
{
    var chk_select_myplayer = getObj("chk_select_myplayer");
    chk_select_myplayer.checked = false;
    
    var player_selected_index =  document.forms[0].elements['lstPlayerType'].selectedIndex;
    var player_type_criteria = document.forms[0].elements['lstPlayerType'].options[player_selected_index];

    var country_criteria_index =  document.forms[0].elements['lstCountries'].selectedIndex;
    var country_criteria = document.forms[0].elements['lstCountries'].options[country_criteria_index];

    var valueFrom = document.forms[0].elements['valueFrom'];
    var valueTo = document.forms[0].elements['valueTo'];

    var playerTypeFlag = true;
    var countryFlag = true;
    var valueFromFlag = true;
    var valueToFlag = true;
    
    if (player_selected_index == 0) 
    {
        playerTypeFlag = false;
    }    
    if (country_criteria_index == 0) 
    {
        countryFlag = false;
    }    
    if (fnTrim(valueFrom.value) == "")
    {
        valueFromFlag = false;
    }    
    if (fnTrim(valueTo.value) == "")
    {
        valueToFlag = false;
    }    

    var player_type = player_type_criteria.text;
    var country = country_criteria.text;
    
    var tablePlayers = getObj("tournament_players");
    var lengthRows = tablePlayers.rows.length;
    
    for(var i=0; i<lengthRows; i++)
    {
        var rowCountryName = tablePlayers.rows[i].cells[1].innerText;
        var rowPlayerType = tablePlayers.rows[i].cells[2].innerText;
        var rowValue = tablePlayers.rows[i].cells[4].innerText;
        
        var displayRow = true;
        
        if (playerTypeFlag)
        {
            if(fnTrim(rowPlayerType) != fnTrim(player_type))
            {
                displayRow = false;
            }    
        }
        if (displayRow && countryFlag) 
        {
            if(fnTrim(rowCountryName) != fnTrim(country))
            {
                displayRow = false;
            }    
        }    
        
        if (displayRow && valueFromFlag) 
        {
            if(parseInt(fnTrim(rowValue)) < parseInt(fnTrim(valueFrom.value)))
            {
                displayRow = false;
            }    
        }    
        
        if (displayRow && valueToFlag) 
        {
            if(parseInt(fnTrim(rowValue)) > parseInt(fnTrim(valueTo.value)))
            {
                displayRow = false;
            }    
        }    
                          //
        if (displayRow) 
        {
            tablePlayers.rows[i].style.display = "";
        }    
        else
        {
            tablePlayers.rows[i].style.display = "none";
        }
                    
    }
}    

function fnSelectThisPlayer(chkBox)
{
    
    var batsmanCount = document.forms[0].elements['batsmanCount'];
    var bowlerCount = document.forms[0].elements['bowlerCount'];
    var wkCount = document.forms[0].elements['wkCount'];
    var allrounderCount = document.forms[0].elements['allrounderCount'];
    
    var rowId = chkBox.value;
    var tableAllPlayer = getObj("tournament_players");
    var rowObj = tableAllPlayer.rows[rowId];
    var strRowPlayer = "tournament_players["+rowId+"].player_id";
    var playerIdTourn = document.forms[0].elements[strRowPlayer];
    
    var countryName = fnTrim(rowObj.cells[1].innerText);
    var playerTournType = fnTrim(rowObj.cells[2].innerText);
    var playerName = fnTrim(rowObj.cells[3].innerText);
    var playerValue = fnTrim(rowObj.cells[4].innerText);
    
    var tableUserPlayer = getObj("userteam_players");
    if (chkBox.checked)
    {
        if(playerTournType == "Batsman")
        {
            if (parseInt(batsmanCount.value) >= 4)
            {
                fnShowMessage("max_batsman");
                chkBox.checked = false;
                return false
            }    
            var batsmanNextIndex = getNextIndexFor(playerTournType);
            
            tableUserPlayer.rows[batsmanNextIndex].cells[0].innerText = countryName;
            tableUserPlayer.rows[batsmanNextIndex].cells[1].innerText = playerTournType;
            tableUserPlayer.rows[batsmanNextIndex].cells[2].innerText = playerName;
            tableUserPlayer.rows[batsmanNextIndex].cells[3].innerText = playerValue;

            var strRowPlayer = "userteam_players["+batsmanNextIndex+"].player_id";
            var rowPlayerId = document.forms[0].elements[strRowPlayer];
            rowPlayerId.value = playerIdTourn.value;
            batsmanCount.value = parseInt(batsmanCount.value) + 1;
            playerArray[rowPlayerId.value]= tableUserPlayer.rows[batsmanNextIndex];
            tableUserPlayer.rows[batsmanNextIndex].cells[2].flash = "false";
            tableUserPlayer.rows[batsmanNextIndex].cells[2].style.color = "";
        }    
        else if(playerTournType == "Bowler")
        {
            if (parseInt(bowlerCount.value) >= 4)
            {
                fnShowMessage("max_bowler");
                chkBox.checked = false;
                return false
            }    
            var bowlerNextIndex = getNextIndexFor(playerTournType);
            
            tableUserPlayer.rows[bowlerNextIndex].cells[0].innerText = countryName;
            tableUserPlayer.rows[bowlerNextIndex].cells[1].innerText = playerTournType;
            tableUserPlayer.rows[bowlerNextIndex].cells[2].innerText = playerName;
            tableUserPlayer.rows[bowlerNextIndex].cells[3].innerText = playerValue;

            var strRowPlayer = "userteam_players["+bowlerNextIndex+"].player_id";
            var rowPlayerId = document.forms[0].elements[strRowPlayer];
            rowPlayerId.value = playerIdTourn.value;
            bowlerCount.value = parseInt(bowlerCount.value) + 1;
            playerArray[rowPlayerId.value]= tableUserPlayer.rows[bowlerNextIndex];
            
            tableUserPlayer.rows[bowlerNextIndex].cells[2].flash = "false";
            tableUserPlayer.rows[bowlerNextIndex].cells[2].style.color = "";
        }    
        else if(playerTournType == "Wicket keeper")
        {
            if (parseInt(wkCount.value) >= 1)
            {
                fnShowMessage("max_wicket_keeper");
                chkBox.checked = false;
                return false
            }    
            var wkNextIndex = getNextIndexFor(playerTournType);
            
            tableUserPlayer.rows[wkNextIndex].cells[0].innerText = countryName;
            tableUserPlayer.rows[wkNextIndex].cells[1].innerText = playerTournType;
            tableUserPlayer.rows[wkNextIndex].cells[2].innerText = playerName;
            tableUserPlayer.rows[wkNextIndex].cells[3].innerText = playerValue;

            tableUserPlayer.rows[wkNextIndex].cells[2].flash = "false";
            tableUserPlayer.rows[wkNextIndex].cells[2].style.color = "";
            
            var strRowPlayer = "userteam_players["+wkNextIndex+"].player_id";
            var rowPlayerId = document.forms[0].elements[strRowPlayer];
            rowPlayerId.value = playerIdTourn.value;
            wkNextIndex = wkNextIndex + 1;
            wkCount.value = parseInt(wkCount.value) + 1;
            playerArray[rowPlayerId.value]= tableUserPlayer.rows[wkNextIndex];
            
        }    
        else if(playerTournType == "All rounder")
        {
            if (parseInt(allrounderCount.value) >= 2)
            {
                 fnShowMessage("max_all_rounder");
                chkBox.checked = false;
                return false
            }    
            var allrounderNextIndex = getNextIndexFor(playerTournType);
            
            tableUserPlayer.rows[allrounderNextIndex].cells[0].innerText = countryName;
            tableUserPlayer.rows[allrounderNextIndex].cells[1].innerText = playerTournType;
            tableUserPlayer.rows[allrounderNextIndex].cells[2].innerText = playerName;
            tableUserPlayer.rows[allrounderNextIndex].cells[3].innerText = playerValue;

            var strRowPlayer = "userteam_players["+allrounderNextIndex+"].player_id";
            var rowPlayerId = document.forms[0].elements[strRowPlayer];
            rowPlayerId.value = playerIdTourn.value;
            allrounderCount.value = parseInt(allrounderCount.value) + 1;
            playerArray[rowPlayerId.value]= tableUserPlayer.rows[allrounderNextIndex];
            
            tableUserPlayer.rows[allrounderNextIndex].cells[2].flash = "false";
            tableUserPlayer.rows[allrounderNextIndex].cells[2].style.color = "";
        }
        fnCountChangesLeft();
    }
    else
    {
        var lengthRows = tableUserPlayer.rows.length;
        for(var i=0; i<lengthRows; i++)
        {
            var rowId = tableUserPlayer.rows[i].cells[0].id;
            var strRowPlayer = "userteam_players["+rowId+"].player_id";
            var rowPlayerId = document.forms[0].elements[strRowPlayer];
            
            if (rowPlayerId.value != "" && playerIdTourn.value == rowPlayerId.value) 
            {
                var playerType = fnTrim(tableUserPlayer.rows[i].cells[1].innerText);
                tableUserPlayer.rows[i].cells[0].innerText = " ";
                tableUserPlayer.rows[i].cells[2].innerText = "Select "+playerType;
                tableUserPlayer.rows[i].cells[3].innerText = "0";
                
                tableUserPlayer.rows[i].cells[2].flash = "true";
                
                rowPlayerId.value = "";
                if(playerType == "Batsman")
                {
                    batsmanCount.value = parseInt(batsmanCount.value) - 1;
                }
                else if(playerType == "Bowler")
                {
                    bowlerCount.value = parseInt(bowlerCount.value) - 1;
                }
                else if(playerType == "All rounder")
                {
                    allrounderCount.value = parseInt(allrounderCount.value) - 1;
                }
                else if(playerType == "Wicket keeper")
                {
                    wkCount.value = parseInt(wkCount.value) - 1;
                }    
                break;        
            }    
                      
        }    
    }
    fnSumUserTeam();
}    

function getNextIndexFor(player_type)
{
    var tableUserPlayer = getObj("userteam_players");
    if (player_type == "Batsman") 
    {
        for(var i=0; i<4; i++)
        {
            var rowId = tableUserPlayer.rows[i].cells[0].id;
            var strRowPlayer = "userteam_players["+rowId+"].player_id";
            var rowPlayerId = document.forms[0].elements[strRowPlayer];
            if(fnTrim(rowPlayerId.value) == "")
            {
                return i;
            }    
        }
    }    
    else if (player_type == "Bowler") 
    {
        for(var i=7; i<11; i++)
        {
            var rowId = tableUserPlayer.rows[i].cells[0].id;
            var strRowPlayer = "userteam_players["+rowId+"].player_id";
            var rowPlayerId = document.forms[0].elements[strRowPlayer];
            if(fnTrim(rowPlayerId.value) == "")
            {
                return i;
            }    
        }
    }    
    else if(player_type == "All rounder")
    {
        for(var i=4; i<6; i++)
        {
            var rowId = tableUserPlayer.rows[i].cells[0].id;
            var strRowPlayer = "userteam_players["+rowId+"].player_id";
            var rowPlayerId = document.forms[0].elements[strRowPlayer];
            if(fnTrim(rowPlayerId.value) == "")
            {
                return i;
            }    
        }

       // return 5;
    }    
    else if(player_type == "Wicket keeper")
    {
        return 6;
    }    
}    

function fnSumUserTeam()
{
    var tournament_value = document.forms[0].elements['tournament_value'];
    var userteam_value = document.forms[0].elements['userteam_value'];
    var difference_value = document.forms[0].elements['difference_value'];
    
    var table = getObj("userteam_players");
    var rowLength = table.rows.length;
    userteam_value.value = 0;
    for(var i=0; i<rowLength; i++)
    {
        var player_value = table.rows[i].cells[3].innerText;
        userteam_value.value = parseInt(userteam_value.value) + parseInt(fnTrim(player_value));
    }    
    
    difference_value.value = parseInt(fnTrim(tournament_value.value+"")) - parseInt(fnTrim(userteam_value.value+""));
}    

function fnSaveUserTeamPlayers()
{
    //objUserTeam.user_team_id
    var obj_user_team = getObj("objUserTeam.user_team_id");
    var user_team_id = obj_user_team.options[obj_user_team.selectedIndex].value; 

    var effective_date =  getObj("next_effective_date");
    var effective_date_value = fnTrim(effective_date.innerText);

    //Check allowed value
    var difference_value = getObj("difference_value");
    if(parseInt(difference_value.value) < 0)
    {
        fnShowMessage("player_value_incr");
        return;
    }    
    
    //Check User players selected properly.
    var table = getObj("userteam_players");
    var rowLength = table.rows.length;
    var url = "/LuvCricket/userteamplayers.do?appEvent=insertUserTeamPlayers&&user_team_id="+escape(fnTrim(user_team_id))+"&&effective_date="+fnTrim(effective_date_value)+"&&player_ids=";
    var selectedPlayerCount = 0;
    for(var i=0; i<rowLength; i++)
    {
        var rowId = table.rows[i].cells[0].id;
        var strRowPlayer = "userteam_players["+rowId+"].player_id";
        var rowPlayerId = document.forms[0].elements[strRowPlayer];
        if(fnTrim(rowPlayerId.value) != "")
        {
            url = url + rowPlayerId.value;
            if(i < rowLength -1)
            {
                url = url+",";
            }   
        }
        else
        {
            fnShowMessage("player_select");
            return;
        }    
    }    
    var number_of_changes_left_lab = getObj("number_of_changes_left");
    var no_of_changes = parseInt(fnTrim(number_of_changes_left_lab.innerText));
    if (no_of_changes < 0) 
    {
        fnShowMessage("number_of_changes_exceeds");
        return;
    }    
      //alert("submitting: "+url);
    document.forms[0].action= url;
    document.forms[0].submit();
}    

function filterSelectedPlayers()
{
    //initialize other filter crieteria.
    var lstPlayerType = getObj("lstPlayerType");
    var lstCountries = getObj("lstCountries");
    var valueFrom = getObj("valueFrom");
    var valueTo = getObj("valueTo");
    lstPlayerType.value = "";
    lstCountries.value="";
    valueTo.value = "";
    valueFrom.value = "";
    
    
    var tableUserPlayer = getObj("userteam_players");
    var tabUPLen = tableUserPlayer.rows.length;
    var userPlayerAry = new Array();
    //Cache it for faster search.
    for(var i=0; i<tabUPLen; i++)
    {
        var rowId = tableUserPlayer.rows[i].cells[0].id;
        var strRowPlayer = "userteam_players["+rowId+"].player_id";
        var rowPlayerId = document.forms[0].elements[strRowPlayer];
        if("" != fnTrim(rowPlayerId.value))
        {
            userPlayerAry[rowPlayerId.value] = rowPlayerId.value;
        }    
    }    
    //Now iterate through all the players to 
    var tablePlayers = getObj("tournament_players");
    var lengthRows = tablePlayers.rows.length;
    
    for(var i=0; i<lengthRows; i++)
    {
        var rowId = tablePlayers.rows[i].cells[1].id;
        var strRowPlayer = "tournament_players["+rowId+"].player_id";
        var playerId = document.forms[0].elements[strRowPlayer];
        if(userPlayerAry[playerId.value] != undefined)
        {
            tablePlayers.rows[i].style.display = "";
        }    
        else
        {
            tablePlayers.rows[i].style.display = "none"; 
        }    
    }
}    

function flashCells()
{
    var tableUserPlayer = getObj("userteam_players");
    if(tableUserPlayer == null || tableUserPlayer == undefined)
    {
        return;
    }    
    var lengthRow = tableUserPlayer.rows.length;
    if(flashcolor == "red")
    {
        flashcolor = "";
    }
    else
    {
        flashcolor = "red";
    }    
    for(var i=0; i<lengthRow; i++)
    {
        var rowObj = tableUserPlayer.rows[i];
        var flashCells = rowObj.cells[2];
        if(flashCells.flash == "true")
        {
            flashCells.style.color = flashcolor;
        }    
    }    
}    

var flashcolor = "red";
setInterval("flashCells()",1000);


function fnOpenPredictTeam()
{
    var obj_user_team = getObj("objUserTeam.user_team_id");
    var user_team_id = obj_user_team.options[obj_user_team.selectedIndex].value; 
    var url ="/LuvCricket/userteamcountries.do?appEvent=initPredictCountries&&user_team_id="+user_team_id;
    window.open(url,"predictteam","height=520,width=800,status=yes,toolbar=no,menubar=no,location=no");
    //alert("Predict your choice of teams for Semifinals,Finals and Winner.Opens from 28th March, 2006.");
}    


var old_val_sf1;
var old_val_sf2;
var old_val_sf3;
var old_val_sf4;
var old_val_f1;
var old_val_f2;
var old_val_win;


function onLoadPredictTeam()
{
    window.focus();
    if(document.status_message_code == "record.updated")
    {
        window.close();
    }
    //Initialize the drop down values.
    var obj_sf1 = getObj("sf_team_1");
    old_val_sf1 = obj_sf1.options[obj_sf1.selectedIndex].value;
    
    var obj_sf2 = getObj("sf_team_2");
    old_val_sf2 = obj_sf1.options[obj_sf2.selectedIndex].value;
    
    var obj_sf3 = getObj("sf_team_3");
    old_val_sf3 = obj_sf1.options[obj_sf3.selectedIndex].value;
    
    var obj_sf4 = getObj("sf_team_4");
    old_val_sf4 = obj_sf1.options[obj_sf4.selectedIndex].value;
    
    
    var obj_f1 = getObj("f_team_1");
    old_val_f1 = obj_f1.options[obj_f1.selectedIndex].value;
    
    var obj_f2 = getObj("f_team_2");
    old_val_f2 = obj_f2.options[obj_f2.selectedIndex].value;

    var obj_winner = getObj("winner_team");
    old_val_win = obj_winner.options[obj_winner.selectedIndex].value;
    
    
    //
    var divSemi = getObj("idDivSemiFinal");
    var divFinal = getObj("idDivFinal");
    var divWinner = getObj("idDivWinner");
    
    var objLockPrediction = getObj("flagLockPrediction");
    flagLockPrediction = objLockPrediction.value;

    if(parseInt(flagLockPrediction) >= 1)
    {
        divSemi.style.backgroundColor = "#9B9B9B";
    }    
    if(parseInt(flagLockPrediction) >= 2)
    {
        divFinal.style.backgroundColor = "#9B9B9B";
    }    
    if(parseInt(flagLockPrediction) >= 3)
    {
        divWinner.style.backgroundColor = "#9B9B9B";
    }    
    
    
}    

function onChangeUserTeamPredictTeam()
{
    var obj_user_team = getObj("user_team_id");
    var user_team_id = obj_user_team.options[obj_user_team.selectedIndex].value; 
    var url ="/LuvCricket/userteamcountries.do?appEvent=initPredictCountries&&user_team_id="+user_team_id;
    document.forms[0].action = url;
    document.forms[0].submit();
}    

function savePredictTeam()
{
    var obj_sf1 = getObj("sf_team_1");
    var sf1_value = obj_sf1.options[obj_sf1.selectedIndex].value;
    
    var obj_sf2 = getObj("sf_team_2");
    var sf2_value = obj_sf1.options[obj_sf2.selectedIndex].value;
    
    var obj_sf3 = getObj("sf_team_3");
    var sf3_value = obj_sf1.options[obj_sf3.selectedIndex].value;
    
    var obj_sf4 = getObj("sf_team_4");
    var sf4_value = obj_sf1.options[obj_sf4.selectedIndex].value;
    
    if(isEmptyOrNull(sf1_value) || isEmptyOrNull(sf2_value) || isEmptyOrNull(sf3_value) || isEmptyOrNull(sf4_value))
    {
        fnShowMessage("complete_team"," Semi finals");
        return;
    }    
    
    var arySfTeam = new Array();
    arySfTeam[1] = sf1_value;
    arySfTeam[2] = sf2_value;
    arySfTeam[3] = sf3_value;
    arySfTeam[4] = sf4_value;
    
    //validate if equal team selected.
    for(var i=1; i<5; i++)
    {
        for(var j=i+1; j<5;j++)
        {
            if(arySfTeam[i]==arySfTeam[j])
            {
                fnShowMessage("same_team"," Semi finals");
                return;
            }    
            for(var k=j+1; k<5; k++)
            {
                if(arySfTeam[j]==arySfTeam[k])
                {
                    fnShowMessage("same_team"," Semi finals");
                    return;
                }    
                for(var l=k+1; l<5; l++)
                {
                    if(arySfTeam[k]==arySfTeam[l])
                    {
                        fnShowMessage("same_team"," Semi finals");
                        return;
                    }    
                }    
            }    
        }    
    }    
    
    
    
    var obj_f1 = getObj("f_team_1");
    var f1_value = obj_f1.options[obj_f1.selectedIndex].value;
    
    var obj_f2 = getObj("f_team_2");
    var f2_value = obj_f2.options[obj_f2.selectedIndex].value;
    if(isEmptyOrNull(f1_value) || isEmptyOrNull(f2_value) )
    {
        fnShowMessage("complete_team"," Finals");
        return;
    }    

    if(f2_value == f1_value)
    {
        fnShowMessage("same_team"," Finals");
        return;
    }    

    
    var obj_winner = getObj("winner_team");
    var winner_value = obj_winner.options[obj_winner.selectedIndex].value;
    if(isEmptyOrNull(winner_value))
    {
        fnShowMessage("complete_team"," Tournament Winner");
        return;
    }    
    var url ="/LuvCricket/userteamcountries.do?appEvent=savePredictCountries";
    document.forms[0].action = url;
    document.forms[0].submit();
}    

function onChangePredictTeam(stage_value)
{
    var objLockPrediction = getObj("flagLockPrediction");
    flagLockPrediction = objLockPrediction.value;

    var obj_sf1 = getObj("sf_team_1");
    var obj_sf2 = getObj("sf_team_2");
    var obj_sf3 = getObj("sf_team_3");
    var obj_sf4 = getObj("sf_team_4");
    var obj_f1 = getObj("f_team_1");
    var obj_f2 = getObj("f_team_2");
    var obj_winner = getObj("winner_team");
    
    if(parseInt(flagLockPrediction) >= parseInt(stage_value))
    {
        fnShowMessage("time_over");
        if(parseInt(stage_value) == 1)
        {
            obj_sf1.value = old_val_sf1;
            obj_sf2.value = old_val_sf2;
            obj_sf3.value = old_val_sf3;
            obj_sf4.value = old_val_sf4;
        }    
        else if(parseInt(stage_value) == 2)
        {
            obj_f1.value = old_val_f1;
            obj_f2.value = old_val_f2;
        }
        else if(parseInt(stage_value) == 3)
        {
            obj_winner.value = old_val_win;
        }
        return;
    }    
}    

function showSchedule()
{
    var divTournMatches = getObj("divTournMatches");
    divTournMatches.style.visibility = "visible";
}    
function hideSchedule()
{
    var divTournMatches = getObj("divTournMatches");
    divTournMatches.style.visibility = "hidden";

}    

function fnOpenPredictLCTeamWinner()
{
    var obj_user_team = getObj("objUserTeam.user_team_id");
    var user_team_id = obj_user_team.options[obj_user_team.selectedIndex].value; 
    var url ="/LuvCricket/predictlcwinner.do?appEvent=initPredictGameWinner&&user_team_id="+user_team_id;
    window.open(url,"predictteam","height=400,width=600,status=yes,toolbar=no,menubar=no,location=no");
    //alert("Predict your choice of teams for Semifinals,Finals and Winner.Opens from 28th March, 2006.");
}    
