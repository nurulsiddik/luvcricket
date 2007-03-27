/*
 * UserWelcomeAc.java
 *
 * Created on January 16, 2007, 11:16 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.ac;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import wow.play.cricket.common.IAppEventHandler;
import wow.play.cricket.common.LCConstants;
import wow.play.cricket.common.LCLogger;
import wow.play.cricket.logic.PlayingNationsTeam;
import wow.play.cricket.logic.RegNewUserLogic;
import wow.play.cricket.logic.Tournament;
import wow.play.cricket.logic.UserTeam;
import wow.play.cricket.vo.LCCommonVO;
import wow.play.cricket.vo.LCTournamentVO;
import wow.play.cricket.vo.PlayingNationsTeamVO;
import wow.play.cricket.vo.RegNewUserVO;
import wow.play.cricket.vo.UserTeamDetailVO;
import wow.play.cricket.vo.UserTeamVO;

/**
 *
 * @author NURUL SIDDIK
 */

public class UserWelcomeAc extends LCCommonAc
{
    
    public ActionForward performAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        System.out.println("In user welcome ac");
        setHomePageForUser(request);
        ActionForward af=mapping.findForward("welcome");
        return af;
    }
    
    @IAppEventHandler(appEvent="displayHomePage")
    public ActionForward  displayHomePage(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        LCLogger.debug("DISPLAYING HOME PAGE");
        setHomePageForUser(request);
        return mapping.findForward("homepage");
    }
    
    private void setHomePageForUser(HttpServletRequest request) throws Exception
    {
        HttpSession session = request.getSession();
        String loggedInuserId = (String)session.getAttribute(LCConstants.USER_ID);
        RegNewUserLogic regNewL = new RegNewUserLogic();
        RegNewUserVO paramVO = new RegNewUserVO();
        paramVO.setUser_id(loggedInuserId);
        RegNewUserVO objRegUserVO = (RegNewUserVO) regNewL.fetchUserDataFromName(paramVO);
        String default_team_id = objRegUserVO.getDefault_user_team();
        session.setAttribute("team_id","");
        session.setAttribute("team_points","0");
        session.setAttribute("userteam_players_list","");
        setUserTeamDetails(request,default_team_id);
    }
    
    private void setUserTeamDetails(HttpServletRequest request, String default_team_id) throws Exception
    {
        HttpSession session = request.getSession();
        UserTeam logicUserTeam = UserTeam.getInstance();
        UserTeamVO objUserTeam = logicUserTeam.selectUserTeam(default_team_id);
        UserTeamDetailVO objUserTeamDetail = logicUserTeam.fetchLatestUserTeam(default_team_id);
        String tournament_id = null;
        if(objUserTeam == null || objUserTeam.getTournament_id() == null || "".equals(objUserTeam.getTournament_id()))
        {
            tournament_id = "0";
        }
        else
        {
            tournament_id = objUserTeam.getTournament_id();
        }
        
        Tournament logicTourn = new Tournament();
        LCTournamentVO objTournFullVO = logicTourn.fetchFullDetailsofTournament(tournament_id);
        
        session.setAttribute("team_id",default_team_id);
        if(objUserTeamDetail != null)
        {
            Map paramMap = new HashMap();
            paramMap.put("player1",Integer.parseInt(objUserTeamDetail.getPlayer1()));
            paramMap.put("player2",Integer.parseInt(objUserTeamDetail.getPlayer2()));
            paramMap.put("player3",Integer.parseInt(objUserTeamDetail.getPlayer3()));
            paramMap.put("player4",Integer.parseInt(objUserTeamDetail.getPlayer4()));
            paramMap.put("player5",Integer.parseInt(objUserTeamDetail.getPlayer5()));
            paramMap.put("player6",Integer.parseInt(objUserTeamDetail.getPlayer6()));
            paramMap.put("player7",Integer.parseInt(objUserTeamDetail.getPlayer7()));
            paramMap.put("player8",Integer.parseInt(objUserTeamDetail.getPlayer8()));
            paramMap.put("player9",Integer.parseInt(objUserTeamDetail.getPlayer9()));
            paramMap.put("player10",Integer.parseInt(objUserTeamDetail.getPlayer10()));
            paramMap.put("player11",Integer.parseInt(objUserTeamDetail.getPlayer11()));
            paramMap.put("user_team_id",default_team_id);
            List<PlayingNationsTeamVO> lst_user_team = logicUserTeam.fetchPlayerDetailForTeam(paramMap);
            if(lst_user_team != null)
            {
                session.setAttribute("userteam_players_list",lst_user_team);
                Integer team_points = logicUserTeam.fetchTeamPoints(default_team_id,objTournFullVO.getStage_effective_date());
                if(team_points != null)
                {
                    session.setAttribute("team_points",team_points.toString());
                }
            }
        }
        List topUserTeams = logicUserTeam.fetchTopUserTeamsForTournamentStage(tournament_id,objTournFullVO.getStage_effective_date());
        Collections.sort(topUserTeams, new TopTeamsSort());
        session.setAttribute("top_user_teams",topUserTeams);
        
        //Previous tournament
        LCTournamentVO prevStageDesc = logicTourn.fetchPrevStageDetails(tournament_id,objTournFullVO.getStage_effective_date());
        if(prevStageDesc != null)
        {
            List prevTopUserTeams = logicUserTeam.fetchTopUserTeamsForTournamentStage(tournament_id,prevStageDesc.getStage_effective_date());
            Collections.sort(prevTopUserTeams, new TopTeamsSort());
            session.setAttribute("top_user_teams_prev",prevTopUserTeams);
        }
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String strLastPointUpdatedDate = objTournFullVO.getLast_points_updated_date();
        if(strLastPointUpdatedDate == null || "".equals(strLastPointUpdatedDate))
        {
            session.setAttribute("last_updated_date","- NO DATE -");
        }
        else
        {
            Date last_updated = sdf.parse(strLastPointUpdatedDate);
            sdf.applyPattern("dd-MM-yyyy");
            session.setAttribute("last_updated_date",sdf.format(last_updated));
            
        }
        
        session.setAttribute("tournament_name",objTournFullVO.getTournament_name());
        session.setAttribute("tournament_stage",objTournFullVO.getStage_description());
        PlayingNationsTeam logicPnt = PlayingNationsTeam.getInstance();
        List topPlayers = logicPnt.fetchTopPlayers();
        session.setAttribute("top_players",topPlayers);
        
    }
    
    private class TopTeamsSort implements Comparator
    {
        public int compare(Object obj1 , Object obj2 )
        {
            LCCommonVO lcObj1 = (LCCommonVO) obj1;
            LCCommonVO lcObj2 = (LCCommonVO) obj2;
            int team_points_1 = Integer.parseInt(lcObj1.getField3());
            int team_points_2 = Integer.parseInt(lcObj2.getField3());
            return (team_points_2 - team_points_1 );
        }
        
        
    }
}
