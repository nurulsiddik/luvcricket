var DNB = 1;
var NOTOUT = 2;
var BOWLED = 3;
var LBW = 4;
var CAUGHT = 5;
var STUMPED = 6;
var RUNOUT = 7;
var HITWICKET = 8;
var TIMEDOUT = 9;

function onChangeTournament()
{
    var objTournament_id = getObj("objTournMatches.tournament_id");
    var tournament_id = objTournament_id.options[objTournament_id.selectedIndex].value;
    document.forms[0].action = "/LuvCricket/matchscore.do?appEvent=fetchTournamentMatches&&tournament_id="+tournament_id;
    document.forms[0].submit();
}    


function onClickRadio(radObj)
{
    var divOne = getObj("idInningsOne");
    var divTwo = getObj("idInningsTwo");
    if(radObj.value == "1")
    {
        divTwo.style.display = "none";
        divOne.style.display = "inline";
    }
    else
    {
        divOne.style.display = "none";
        divTwo.style.display = "inline";
    }
    
}

function fetchMatchDetails()
{
    var objMatch_id = getObj("objTournMatches.match_id");
    var match_id = objMatch_id.options[objMatch_id.selectedIndex].value;
    document.forms[0].action = "/LuvCricket/matchscore.do?appEvent=fetchMatchDetails&&match_id="+match_id;
    document.forms[0].submit();
}    

function fetchFullScoreCard()
{
    var first_batting_team = getObj("objTournMatches.first_batting_team");
    var firstIndexTeam = fnTrim(first_batting_team.options[1].value);
    var secondIndexTeam = fnTrim(first_batting_team.options[2].value);
    
    var firstBattingTeam = fnTrim(first_batting_team.options[first_batting_team.selectedIndex].value);
    var anotherTeam = firstIndexTeam;
    if(firstBattingTeam == anotherTeam)
    {
        anotherTeam = secondIndexTeam;
    }    
    var objMatch_id = getObj("objTournMatches.match_id");
    var match_id = objMatch_id.options[objMatch_id.selectedIndex].value;
    
    document.forms[0].action = "/LuvCricket/matchscore.do?appEvent=fetchFullScoreCard&&match_id="+match_id+"&&first_batting_team="+firstBattingTeam+"&&second_batting_team="+anotherTeam;
    document.forms[0].submit();
    
}    

function saveScorecard()
{
    if(!validateDatafilled())
    {
        return;
    }    
    var table_first_innings  = getObj("table_first_innings");
    if(!validateScorefilled(table_first_innings))
    {
        return;
    }
    
    var table_second_innings  = getObj("table_second_innings");
    if(!validateScorefilled(table_second_innings))
    {
        return;
    }

    document.forms[0].action = "/LuvCricket/matchscore.do?appEvent=saveTournament"
    document.forms[0].submit();
}    

function validateDatafilled()
{
    var objMatch_result = getObj("objTournMatches.match_result");
    var match_result = objMatch_result.options[objMatch_result.selectedIndex].value;
    
    if(match_result == "")
    {
        fnShowMessage("required.field","Match Status ");
        return false;
    }    
    
    var objMatch_winner = getObj("objTournMatches.match_winner");
    var match_winner = objMatch_winner.options[objMatch_winner.selectedIndex].value;
    if(match_winner == "")
    {
        if(match_result == 1)
        {    
            fnShowMessage("required.field","Match Winner ");
            return false;
        }    
    }    
    return true;
}    

function validateScorefilled(tab_innings)
{
    var rowLength = tab_innings.rows.length;
    var playerArray = new Array();
    var notOutCount = 0;
    var adVal = 0;
    if(tab_innings.name == "table_second_innings")
    {
        adVal = 11;
    }    
    for(var i=0; i<rowLength; i++)
    {
        var optBatsman = getObj("batsman_id_"+(i+adVal));
        var batsman_id = optBatsman.options[optBatsman.selectedIndex].value;
        
        var optHowOut = getObj("howout_"+(i+adVal));
        var how_out = optHowOut.options[optHowOut.selectedIndex].value;
        
        var optContributer = getObj("helper_id_"+(i+adVal));
        var contributer_id = optContributer.options[optContributer.selectedIndex].value;
        
        var optBowler = getObj("bowler_id_"+(i+adVal));
        var bowler_id = optBowler.options[optBowler.selectedIndex].value;
        
        var txtRuns = getObj("runs_scored_"+(i+adVal));
        var runs = txtRuns.value;
        
        if (batsman_id == "") 
        {
            alert("Select Batsman required");
            setFocus(tab_innings,optBatsman);
            return false;
        }    
        if (contributer_id == "") 
        {
            if(how_out == CAUGHT || how_out == STUMPED || how_out == RUNOUT)
            {
                alert("Contributer player is required for this type of Out");
                setFocus(tab_innings,optContributer);
                return false;
            }    
        }
        else
        {
            if(how_out == DNB || how_out == NOTOUT || how_out == BOWLED || how_out == LBW || how_out == HITWICKET || how_out == TIMEDOUT)
            {    
                optContributer.value = "";
            }    
        }    
        
        if(bowler_id == "")
        {
            if(how_out == BOWLED || how_out == LBW || how_out == CAUGHT || how_out == STUMPED )
            {
                alert("Bowler is required for this type of Out");
                setFocus(tab_innings,optBowler);
                return false;
            }    
        }    
        else
        {
            if(how_out == DNB || how_out == NOTOUT || how_out == RUNOUT || how_out == TIMEDOUT)
            {
                optBowler.value = "";
            }    
        }    
        if(how_out == DNB)
        {
             txtRuns.value = "0";
             runs = "0";
        }
        
        if(fnTrim(runs) == "")
        {
            alert("Please enter runs");
            setFocus(tab_innings,txtRuns);
            return false;
        }
        
        if(playerArray[batsman_id] != undefined)
        {
            alert("Same Batsman cannot be selected twice");
            setFocus(tab_innings,optBatsman);
            return false;
        }
        else
        {
            playerArray[batsman_id] = batsman_id;
        }    
        
        if(how_out == NOTOUT) //NotOut
        {
            notOutCount++;
        }
        
        if(notOutCount > 2)
        {
            alert("Maximum two not out player can exist for team");
            setFocus(tab_innings,optHowOut);
            return false;
        }    
        
    }    
    return true;
 }

function setFocus(inningsTable,fldObj)
{
    var table_name = inningsTable.name;
    var chk_innings_1 = document.forms[0].chk_innings[0];
    var chk_innings_2 = document.forms[0].chk_innings[1];
    
    if(table_name == "table_first_innings")
    {
        if(chk_innings_2.checked)
        {
            chk_innings_1.checked = true;
            chk_innings_1.fireEvent("onclick");
        }
    }    
    else
    {
        if(chk_innings_1.checked)
        {
            chk_innings_2.checked = true;
            chk_innings_2.fireEvent("onclick");
        }
    }    
     fldObj.focus();

}    
function onChangeTournamentPl()
{
    var objTournament_id = getObj("objTournMatches.tournament_id");
    var tournament_id = objTournament_id.options[objTournament_id.selectedIndex].value;
    document.forms[0].action = "/LuvCricket/playercontribution.do?appEvent=fetchTournamentMatches&&tournament_id="+tournament_id;
    document.forms[0].submit();
}    

function calculatePlayerContribution()
{
    var tournament_id = getObj("objTournMatches.tournament_id");
    var match_id = getObj("objTournMatches.match_id");
    
    var valTourn = tournament_id.options[tournament_id.selectedIndex].value;
    var valMatchid = match_id.options[match_id.selectedIndex].value;
    
    document.forms[0].action = "/LuvCricket/playercontribution.do?appEvent=calculatePlayerContribution&&tournament_id="+valTourn+"&&match_id="+valMatchid;
    document.forms[0].submit();
}    

function savePlayerContribution()
{
    var tournament_id = getObj("objTournMatches.tournament_id");
    var match_id = getObj("objTournMatches.match_id");
    
    var valTourn = tournament_id.options[tournament_id.selectedIndex].value;
    var valMatchid = match_id.options[match_id.selectedIndex].value;

    document.forms[0].action = "/LuvCricket/playercontribution.do?appEvent=savePlayerContribution&&tournament_id="+valTourn+"&&match_id="+valMatchid;
    document.forms[0].submit();
}    