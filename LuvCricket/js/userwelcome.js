var BATSMAN = "1";
var BOWLER = "2";
var ALLROUNDER = "3";
var WICKETKEEPER = "4";
var CURR_TAB = "overall";
function fnFilterTopPlayers(tabclick) {
    
    closeTheFullList();
    var id_player_name_header = getObj("id_player_name_header");
    if(tabclick == "costeffective") {
        alert("Coming soon...It means players with lesser value but better performance..");
        return;
    }    
    CURR_TAB = tabclick;
    
    id_player_name_header.innerText = "Player Name";
    var compare_type = "";
    if (tabclick == "batsman") {
        compare_type = BATSMAN;
        id_player_name_header.innerText = "Batsman Name";
    }
    else if(tabclick == "bowler") {
        compare_type = BOWLER;
        id_player_name_header.innerText = "Bowler Name";
    }    
    else if(tabclick == "allrounder") {
        compare_type = ALLROUNDER;
        id_player_name_header.innerText = "Allrounder Name";
    }    
    else if(tabclick == "wicketkeeper") {
        compare_type = WICKETKEEPER;
        id_player_name_header.innerText = "Wicketkeeper Name";
    }    
    
    var table_player = getObj("table_top_players");
    var length = table_player.rows.length;
    var countDisplay = 0;
    for(var i=0; i<length; i++) {
        var rowObj = table_player.rows[i];
        var player_type = fnTrim(rowObj.cells[3].innerText);
        if(compare_type != "" && compare_type != player_type) {
            rowObj.style.display = "none";
        }   
        else if(countDisplay < 6) {
            rowObj.style.display = "inline";
            countDisplay++;
        }
        else {
            rowObj.style.display = "none";
        }    
    }    
    setTabColours(tabclick);
    
    
    // On load called
    var textLB = getObj("idTextShuffleLeaderBoard");
    textLB.stagedisplay = "0";
    fnShuffleLeaderBoard();
    
}

function setTabColours(selectedtab) {
    var tabOverall = getObj("idTopOverall");
    var tabBatsman = getObj("idTopBatsman");
    var tabBowler = getObj("idTopBowler");
    var tabAllrounder = getObj("idTopAllRounder");
    var tabWicketkeeper = getObj("idTopWk");
    var tabCostEff = getObj("idTopCostEff");
    
    tabOverall.style.backgroundColor = "#FFFF99";
    tabOverall.style.fontWeight= "normal";
    
    tabBatsman.style.backgroundColor = "#FFFF99";
    tabBatsman.style.fontWeight= "normal";
    
    tabBowler.style.backgroundColor = "#FFFF99";
    tabBowler.style.fontWeight= "normal";
    
    tabAllrounder.style.backgroundColor = "#FFFF99";
    tabAllrounder.style.fontWeight= "normal";
    
    tabWicketkeeper.style.backgroundColor = "#FFFF99";
    tabWicketkeeper.style.fontWeight= "normal";
    
    tabCostEff.style.backgroundColor = "#FFFF99";
    tabCostEff.style.fontWeight= "normal";
    
    if (selectedtab == "overall") {
        tabOverall.style.backgroundColor = "#CCCC00";
        tabOverall.style.fontWeight= "bold";
    }   
    else if(selectedtab == "batsman") {
        tabBatsman.style.backgroundColor = "#CCCC00";
        tabBatsman.style.fontWeight= "bold";
    }    
    else if(selectedtab == "bowler") {
        tabBowler.style.backgroundColor = "#CCCC00";
        tabBowler.style.fontWeight= "bold";
    }    
    else if(selectedtab == "allrounder") {
        tabAllrounder.style.backgroundColor = "#CCCC00";
        tabAllrounder.style.fontWeight= "bold";
    }    
    else if(selectedtab == "wicketkeeper") {
        tabWicketkeeper.style.backgroundColor = "#CCCC00";
        tabWicketkeeper.style.fontWeight= "bold";
    }    
    else if(selectedtab == "costeffective") {
        tabCostEff.style.backgroundColor = "#CCCC00";
        tabCostEff.style.fontWeight= "bold";
    }    
    
}    

function closeTheFullList()
{
    var divFullList = getObj("idDivFullListMain");
    divFullList.style.visibility = "hidden";
}    

function displayFullList()
{
    var divFullList = getObj("idDivFullListMain");
    divFullList.filters[0].Apply();
	divFullList.style.visibility = "visible";
    divFullList.filters[0].Play();

    var titleObject = getObj("idTitleDivPlayer");
    titleObject.innerText = "Top Players";
    var compare_type = "";

    if (CURR_TAB == "batsman") {
        compare_type = BATSMAN;
        titleObject.innerText = "Top Batsmen";    
    }
    else if(CURR_TAB == "bowler") {
        compare_type = BOWLER;
        titleObject.innerText = "Top Bowlers";
    }    
    else if(CURR_TAB == "allrounder") {
        compare_type = ALLROUNDER;
        titleObject.innerText = "Top Allrounders";
    }    
    else if(CURR_TAB == "wicketkeeper") {
        compare_type = WICKETKEEPER;
        titleObject.innerText = "Top Wicket keepers";
    }    
    
    
    var table = getObj("table_top_players_full_list");
    var length = table.rows.length;
    table.scrollIntoView(true);
    for(var i=0; i<length; i++) {
        var rowObj = table.rows[i];
        var player_type = fnTrim(rowObj.cells[3].innerText);
        if(compare_type != "" && compare_type != player_type) {
            rowObj.style.display = "none";
        }   
        else {
            rowObj.style.display = "inline";
        }
    }    
}    

function fnShuffleLeaderBoard()
{
    var divCurrStage = getObj("idCurrStageLeader");
    var headerCurrStage = getObj("headerCurrLabel");
    
    var divPrevStage = getObj("idPreviousStageLeader");
    var headerPrevStage= getObj("headerPrevLabel");
    //alert(divPrevStage + " "+ divCurrStage)
    var textLB = getObj("idTextShuffleLeaderBoard");
    if(divPrevStage != undefined && divPrevStage != null && divPrevStage != "null" && divCurrStage != undefined && divCurrStage != null && divCurrStage != "null" )
    {
        if (textLB.stagedisplay == "1") 
        {
            divCurrStage.style.display = "none";
            headerCurrStage.style.display = "none";

            divPrevStage.style.display =  "inline-block";
            headerPrevStage.style.display = "inline-block";

            textLB.stagedisplay = "0";
            textLB.innerText = "Current Stage Leader";
        }    
        else if (textLB.stagedisplay == "0") 
        {
            divCurrStage.style.display = "inline-block";
            headerCurrStage.style.display = "inline-block";

            divPrevStage.style.display =  "none";
            headerPrevStage.style.display = "none";

            textLB.stagedisplay = "1";
            textLB.innerText = "Overall Round Leader";
        }   
   }     
}    

function fnOpenPredictTeam()
{
    var url ="/LuvCricket/userteamcountries.do?appEvent=initPredictCountries";
    window.open(url,"predictteam","height=520,width=800,status=yes,toolbar=no,menubar=no,location=no");
}    