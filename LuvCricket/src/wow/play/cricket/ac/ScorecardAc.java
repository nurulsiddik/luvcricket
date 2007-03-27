/*
 * ScorecardAc.java
 *
 * Created on March 1, 2007, 10:05 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.ac;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.DynaValidatorForm;
import wow.play.cricket.common.IAppEventHandler;
import wow.play.cricket.common.LCConstants;
import wow.play.cricket.common.LCLogger;
import wow.play.cricket.logic.Scorecard;
import wow.play.cricket.logic.Tournament;
import wow.play.cricket.vo.PlayerContributionVO;
import wow.play.cricket.vo.RefxVO;
import wow.play.cricket.vo.RulesVO;
import wow.play.cricket.vo.ScorecardVO;
import wow.play.cricket.vo.TournamentMatchesVO;

/**
 *
 * @author NURUL SIDDIK
 */
public class ScorecardAc extends LCCommonAc
{
    private static final String TOURNAMENTS = "opt_tournaments";
    private static final String TOURNAMENTS_MATCHES = "opt_tournament_matches";
    private static final String MATCH_TEAMS = "opt_match_teams";
    private static final String MATCH_DETAILS = "match_vo";
    private static final String PLAYER_CONTRIB = "player_contribution";
    /** Creates a new instance of ScorecardAc */
    public ScorecardAc()
    {
    }
    
    public ActionForward performAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="initMatchScore")
    public ActionForward  initMatchScore(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        Tournament logicTournament = new Tournament();
        session.setAttribute(TOURNAMENTS,logicTournament.fetchActiveTournament());
        session.setAttribute(TOURNAMENTS_MATCHES,new ArrayList());
        session.setAttribute(MATCH_TEAMS,new ArrayList());
        session.setAttribute(MATCH_DETAILS,new TournamentMatchesVO());
        
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="fetchTournamentMatches")
    public ActionForward  fetchTournamentMatches(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        String tournament_id = request.getParameter("tournament_id");
        Scorecard logicScore = Scorecard.getInstance();
        List lstTourMatches = logicScore.fetchAllTournamentsMatches(tournament_id);
        session.setAttribute(TOURNAMENTS_MATCHES,lstTourMatches);
        session.removeAttribute(PLAYER_CONTRIB);
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="fetchMatchDetails")
    public ActionForward  fetchMatchDetails(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        DynaValidatorForm objForm = (DynaValidatorForm) form;
        String match_id = request.getParameter("match_id");
        Scorecard logic = Scorecard.getInstance();
        TournamentMatchesVO objMatch = (TournamentMatchesVO) logic.selectMatchDetails(match_id);
        
        String country1 = objMatch.getCountry_id1();
        String country2 = objMatch.getCountry_id2();
        
        //Set option for match team.
        List<RefxVO> lst_match_team = new ArrayList<RefxVO>();
        RefxVO countryOne = new RefxVO();
        countryOne.setRefx_label(objMatch.getCountry_id1());
        countryOne.setRefx_value(objMatch.getCountry_id1());
        lst_match_team.add(countryOne);
        
        RefxVO countryTwo = new RefxVO();
        countryTwo.setRefx_label(objMatch.getCountry_id2());
        countryTwo.setRefx_value(objMatch.getCountry_id2());
        lst_match_team.add(countryTwo);
        
        session.setAttribute(MATCH_DETAILS,objMatch);
        session.setAttribute(MATCH_TEAMS,lst_match_team);
        
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="fetchFullScoreCard")
    public ActionForward  fetchFullScoreCard(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        String match_id = request.getParameter("match_id");
        String first_batting_team = request.getParameter("first_batting_team");
        String second_batting_team = request.getParameter("second_batting_team");
        TournamentMatchesVO matchVO = (TournamentMatchesVO) session.getAttribute(MATCH_DETAILS);
        matchVO.setFirst_batting_team(first_batting_team);
        
        setScoreCard(request,matchVO);
        
        return mapping.findForward("success");
    }
    
    private void setScoreCard(HttpServletRequest request, TournamentMatchesVO matchVO) throws Exception
    {
        HttpSession session = request.getSession();
        Scorecard logic = Scorecard.getInstance();
        
        //Fetch for Players for 1st Innings.
        String firstInningsCountry = matchVO.getFirst_batting_team();
        session.setAttribute("opt_first_batting_team",logic.fetchPlayersForMatch(firstInningsCountry));
        //Fetch scores
        List<ScorecardVO> firstInnings = logic.fetchScoreCardForTeam(matchVO.getMatch_id(),"1");
        int sizeFirst = 0;
        if(firstInnings != null)
        {
            sizeFirst = firstInnings.size();
        }
        
        List<ScorecardVO> lst_scorecard_1 = new ArrayList<ScorecardVO>();
        
        for (int i = 0; i < 11; i++)
        {
            System.out.println("SIZE 1ST INNINGS: "+sizeFirst+" i: "+i);
            if(sizeFirst > i)
            {
                ScorecardVO scoreVO = firstInnings.get(i);
                lst_scorecard_1.add(scoreVO);
                request.setAttribute("batsman_id_"+i,scoreVO.getBatsman_id());
                request.setAttribute("howout_"+i,scoreVO.getHowout());
                request.setAttribute("helper_id_"+i,scoreVO.getHelper_id());
                request.setAttribute("bowler_id_"+i,scoreVO.getBowler_id());
                request.setAttribute("runs_scored_"+i,scoreVO.getRuns_scored());
                
                System.out.println("\n\n HOW OUT: "+request.getAttribute("howout_"+i));
            }
            else
            {
                lst_scorecard_1.add(new ScorecardVO());
            }
        }
        request.setAttribute("lst_scorecard_1",lst_scorecard_1);
        
        //Fetch for Players for 2nd innings.
        String secondInningsCountry = matchVO.getCountry_id1();
        if(secondInningsCountry.equals(firstInningsCountry))
        {
            secondInningsCountry = matchVO.getCountry_id2();
        }
        
        
        session.setAttribute("opt_second_batting_team",logic.fetchPlayersForMatch(secondInningsCountry));
        //Fetch scores
        List<ScorecardVO> secondInnings = logic.fetchScoreCardForTeam(matchVO.getMatch_id(),"2");
        int sizeSecond = 0;
        if(secondInnings != null)
        {
            sizeSecond = secondInnings.size();
        }
        
        List<ScorecardVO> lst_scorecard_2 = new ArrayList<ScorecardVO>();
        for (int i = 0; i < 11; i++)
        {
            if(sizeSecond > i)
            {
                ScorecardVO scoreVO = secondInnings.get(i);
                lst_scorecard_2.add(scoreVO);
                request.setAttribute("batsman_id_"+(i+11),scoreVO.getBatsman_id());
                request.setAttribute("howout_"+(i+11),scoreVO.getHowout());
                request.setAttribute("helper_id_"+(i+11),scoreVO.getHelper_id());
                request.setAttribute("bowler_id_"+(i+11),scoreVO.getBowler_id());
                request.setAttribute("runs_scored_"+(i+11),scoreVO.getRuns_scored());
                
            }
            else
            {
                lst_scorecard_2.add(new ScorecardVO());
            }
        }
        request.setAttribute("lst_scorecard_2",lst_scorecard_2);
        
    }
    
    @IAppEventHandler(appEvent="saveTournament")
    public ActionForward  saveTournament(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        DynaValidatorForm objForm = (DynaValidatorForm) form;
        TournamentMatchesVO tournMatVO = (TournamentMatchesVO)objForm.get("objTournMatches");
        Map scorecard = setRequestParamToVo(request);
        scorecard.put(MATCH_DETAILS,tournMatVO);
        Scorecard logic = Scorecard.getInstance();
        logic.scoreCardUpdate(scorecard);
        return mapping.findForward("success");
    }
    
    private Map setRequestParamToVo(HttpServletRequest request) throws Exception
    {
        HttpSession session = request.getSession();
        String match_id = request.getParameter("objTournMatches.match_id");
        Map scoreCardMap = new HashMap();
        List lst_scorecard_1 = new ArrayList();
        for (int i = 0; i < 11; i++)
        {
            ScorecardVO firstScoreCardVO = new ScorecardVO();
            firstScoreCardVO.setBatsman_id(request.getParameter("batsman_id_"+i));
            firstScoreCardVO.setHowout(request.getParameter("howout_"+i));
            firstScoreCardVO.setHelper_id(request.getParameter("helper_id_"+i));
            firstScoreCardVO.setBowler_id(request.getParameter("bowler_id_"+i));
            firstScoreCardVO.setRuns_scored(request.getParameter("runs_scored_"+i));
            firstScoreCardVO.setPlaying_position((i+1)+"");
            firstScoreCardVO.setInnings("1");
            firstScoreCardVO.setMatch_id(match_id);
            lst_scorecard_1.add(firstScoreCardVO);
            
            request.setAttribute("batsman_id_"+i,firstScoreCardVO.getBatsman_id());
            request.setAttribute("howout_"+i,firstScoreCardVO.getHowout());
            request.setAttribute("helper_id_"+i,firstScoreCardVO.getHelper_id());
            request.setAttribute("bowler_id_"+i,firstScoreCardVO.getBowler_id());
            request.setAttribute("runs_scored_"+i,firstScoreCardVO.getRuns_scored());
            
            System.out.println("ARY VALUE: "+i+" --> "+request.getParameter("batsman_id_"+i) +" batsman "+ request.getParameter("runs_scored_"+i)+" runs" );
        }
        request.setAttribute("lst_scorecard_1",lst_scorecard_1);
        scoreCardMap.put("lst_scorecard_1",lst_scorecard_1);
        
        List lst_scorecard_2 = new ArrayList();
        for (int i = 11; i < 22; i++)
        {
            ScorecardVO secondScoreCardVO = new ScorecardVO();
            secondScoreCardVO.setBatsman_id(request.getParameter("batsman_id_"+i));
            secondScoreCardVO.setHowout(request.getParameter("howout_"+i));
            secondScoreCardVO.setHelper_id(request.getParameter("helper_id_"+i));
            secondScoreCardVO.setBowler_id(request.getParameter("bowler_id_"+i));
            secondScoreCardVO.setRuns_scored(request.getParameter("runs_scored_"+i));
            secondScoreCardVO.setPlaying_position((i+1-11)+"");
            secondScoreCardVO.setInnings("2");
            secondScoreCardVO.setMatch_id(match_id);
            lst_scorecard_2.add(secondScoreCardVO);
            
            request.setAttribute("batsman_id_"+i,secondScoreCardVO.getBatsman_id());
            request.setAttribute("howout_"+i,secondScoreCardVO.getHowout());
            request.setAttribute("helper_id_"+i,secondScoreCardVO.getHelper_id());
            request.setAttribute("bowler_id_"+i,secondScoreCardVO.getBowler_id());
            request.setAttribute("runs_scored_"+i,secondScoreCardVO.getRuns_scored());
            
            System.out.println("ARY VALUE: "+i+" --> "+request.getParameter("batsman_id_"+i) +" batsman "+ request.getParameter("runs_scored_"+i)+" runs" );
        }
        request.setAttribute("lst_scorecard_2",lst_scorecard_2);
        scoreCardMap.put("lst_scorecard_2",lst_scorecard_2);
        return scoreCardMap;
    }
    
    @IAppEventHandler(appEvent="initPlayerContribution")
    public ActionForward  initPlayerContribution(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        Tournament logicTournament = new Tournament();
        session.setAttribute(TOURNAMENTS,logicTournament.fetchActiveTournament());
        session.setAttribute(TOURNAMENTS_MATCHES,new ArrayList());
        session.setAttribute(PLAYER_CONTRIB,new ArrayList());
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="calculatePlayerContribution")
    public ActionForward  calculatePlayerContribution(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        String tournament_id = request.getParameter("tournament_id");
        String match_id = request.getParameter("match_id");
        Scorecard logic = Scorecard.getInstance();
        List lst_player_contrib = logic.calculatePlayerContribution(match_id);
        setPlayerPoints(tournament_id,lst_player_contrib);
        session.setAttribute(PLAYER_CONTRIB,lst_player_contrib);
        return mapping.findForward("success");
    }
    
    private void setPlayerPoints(String tournament_id, List<PlayerContributionVO> lst_player_vo) throws Exception
    {
        //Fetch Rules.
        Tournament tournLogic = new Tournament();
        RulesVO rules = tournLogic.fetchRules(tournament_id);
        
        int points_for_playing = Integer.parseInt(rules.getPoints_for_playing());
        int points_runs_scored = Integer.parseInt(rules.getPoints_runs_scored());
        int points_quater_century = Integer.parseInt(rules.getPoints_quater_century());
        int points_half_century = Integer.parseInt(rules.getPoints_half_century());
        int points_century = Integer.parseInt(rules.getPoints_century());
        int minimum_runs = Integer.parseInt(rules.getMinimum_runs());
        int points_for_wicket = Integer.parseInt(rules.getPoints_for_wicket());
        int points_for_3wicket = Integer.parseInt(rules.getPoints_for_3wicket());
        int points_for_5wicket = Integer.parseInt(rules.getPoints_for_5wicket());
        int points_for_stumping = Integer.parseInt(rules.getPoints_for_stumping());
        int points_for_runOut = Integer.parseInt(rules.getPoints_for_runOut());
        int points_for_catch = Integer.parseInt(rules.getPoints_for_catch());
        
        for(PlayerContributionVO objPl: lst_player_vo)
        {
            //Calculate points for each players
            int player_points = 0;
            player_points = points_for_playing;
            LCLogger.debug("Player Name: "+objPl.getPlayer_name() + " - "+ player_points);
            // Runs socored logic
            int player_runs = Integer.parseInt(objPl.getRuns_scored());
            System.out.println("Player runs: "+ player_runs);
            player_points += ((player_runs - minimum_runs)*points_runs_scored);
            if(player_runs >= 25)
            {
                player_points += points_quater_century;
            }
            if(player_runs >= 50)
            {
                player_points += points_half_century;
            }
            if(player_runs >= 100)
            {
                player_points += points_century;
            }
            LCLogger.debug("Points after Runs: "+ player_points);
            //Wickets taken logic.
            int player_wickets = Integer.parseInt(objPl.getWickets_taken());
            player_points += (player_wickets * points_for_wicket);
            if(player_wickets >= 3)
            {
                player_points += points_for_3wicket;
            }
            if(player_wickets >= 5)
            {
                player_points += points_for_5wicket;
            }
            LCLogger.debug("Points after Wicket: "+ player_points);
            //Catch
            player_points += (Integer.parseInt(objPl.getCatches()) * points_for_catch);
            LCLogger.debug("Points after Catch: "+ player_points);
            //Runout
            player_points += (Integer.parseInt(objPl.getRunout()) * points_for_runOut);
            LCLogger.debug("Points after RunOut: "+ player_points);
            //Stumped
            player_points += (Integer.parseInt(objPl.getStumps()) * points_for_stumping);
            LCLogger.debug("Points after Stumped: "+ player_points);
            objPl.setPlayer_points(player_points+"");
            
        }
        
    }
    
    @IAppEventHandler(appEvent="savePlayerContribution")
    public ActionForward  savePlayerContribution(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        List lst_player_contrib = (List) session.getAttribute(PLAYER_CONTRIB);
        
        String tournament_id = request.getParameter("tournament_id");
        String match_id = request.getParameter("match_id");
        
        Scorecard logic = Scorecard.getInstance();
        logic.savePlayerContribution(match_id,lst_player_contrib);
        request.setAttribute(LCConstants.STATUS_MESSAGE_CODE,"record.updated");
        return mapping.findForward("success");
    }
}
