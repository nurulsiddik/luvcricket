function onChangeTournament()
{
    var opt_tournament_id = getObj("objTournMatches.tournament_id");
    var tournament_id = opt_tournament_id.options[opt_tournament_id.selectedIndex].value;
    document.forms[0].action = "/LuvCricket/userteampoints.do?appEvent=onSelectTournament&&tournament_id="+tournament_id;
    document.forms[0].submit();
}    

function submitForUpdate()
{
    var opt_tournament_id = getObj("objTournMatches.tournament_id");
    var tournament_id = opt_tournament_id.options[opt_tournament_id.selectedIndex].value;

    var opt_match_date = getObj("objTournMatches.match_date");
    var match_date = opt_match_date.options[opt_match_date.selectedIndex].value;
    
    document.forms[0].action = "/LuvCricket/userteampoints.do?appEvent=updateUserTeamPoints&&tournament_id="+tournament_id+"&&match_date="+match_date;
    alert(document.forms[0].action);
    document.forms[0].submit();
}    