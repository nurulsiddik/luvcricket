/*
 * UserTeamPerformanceAc.java
 *
 * Created on April 2, 2007, 8:33 PM
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
import wow.play.cricket.common.IAppEventHandler;
import wow.play.cricket.common.LCConstants;
import wow.play.cricket.logic.PlayingNationsTeam;
import wow.play.cricket.logic.Scorecard;
import wow.play.cricket.logic.Tournament;
import wow.play.cricket.logic.UserTeam;
import wow.play.cricket.vo.PlayerContributionVO;
import wow.play.cricket.vo.PlayingNationsTeamVO;
import wow.play.cricket.vo.RefxVO;
import wow.play.cricket.vo.UserTeamDetailVO;
import wow.play.cricket.vo.UserTeamVO;

/**
 *
 * @author NURUL SIDDIK
 */
public class UserTeamPerformanceAc extends LCCommonAc
{
    
    /** Creates a new instance of UserTeamPerformanceAc */
    public UserTeamPerformanceAc()
    {
    }
    
    public ActionForward performAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="initViewTeamPerformance")
    public ActionForward  initViewTeamPerformance(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        
        String user_id = (String)session.getAttribute(LCConstants.USER_ID);
        
        UserTeam logic = UserTeam.getInstance();
        List<UserTeamVO> lstUserTeam = logic.fetchAllUserTeam();
        List<RefxVO> optUserTeam = new ArrayList<RefxVO>();
        String strCurrUserTeam = null;
        
        for(UserTeamVO objUserTeam :lstUserTeam)
        {
            RefxVO newVO = new RefxVO();
            String user_team_id = objUserTeam.getUser_team_id();
            newVO.setRefx_value(user_team_id);
            newVO.setRefx_label(user_team_id);
            if(user_id.equals(objUserTeam.getUser_id()))
            {
                strCurrUserTeam = objUserTeam.getUser_team_id();
            }
            optUserTeam.add(newVO);
        }
        if(strCurrUserTeam == null)
        {
            strCurrUserTeam = lstUserTeam.get(0).getUser_team_id();
        }
        
        List<RefxVO> lst_eff_dates = logic.fetchAllEffectiveDates("0");
        session.setAttribute("lst_effective_dates",lst_eff_dates);
        session.setAttribute("lst_user_team",optUserTeam);
        request.setAttribute("opt_user_team",strCurrUserTeam);
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="showTeamPerformance")
    public ActionForward  showTeamPerformance(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        String user_team_id = request.getParameter("user_team_id");
        String eff_date = request.getParameter("eff_date");
        
        UserTeam logicUT = UserTeam.getInstance();
        
        UserTeamVO userTeam = logicUT.selectUserTeam(user_team_id);
        String tournament_id = userTeam.getTournament_id();
        UserTeamDetailVO userTeamDetail = logicUT.fetchUserTeamForDate(user_team_id,eff_date);
        if(userTeamDetail != null)
        {
            String[] player_array = {userTeamDetail.getPlayer1(),
            userTeamDetail.getPlayer2(),
            userTeamDetail.getPlayer3(),
            userTeamDetail.getPlayer4(),
            userTeamDetail.getPlayer5(),
            userTeamDetail.getPlayer6(),
            userTeamDetail.getPlayer7(),
            userTeamDetail.getPlayer8(),
            userTeamDetail.getPlayer9(),
            userTeamDetail.getPlayer10(),
            userTeamDetail.getPlayer11()
            };
            Map returnMap = populatePlayerPerfList(tournament_id,user_team_id,eff_date,player_array);
            List<PlayerContributionVO> lstYourPlayerThisDay = (List)returnMap.get("player_list");
            String total_points = (String)returnMap.get("total_points");
            request.setAttribute("lst_player_perf",lstYourPlayerThisDay);
            request.setAttribute("total_points",total_points);
        }
        else
        {
            request.setAttribute("no_players","true");
        }
        Tournament logicTourn = new Tournament();
        List<RefxVO> match_list = logicTourn.fetchAllTournamentMatchesForDate(tournament_id,eff_date);
        request.setAttribute("match_list",match_list);
        request.setAttribute("opt_eff_date",eff_date);
        request.setAttribute("opt_user_team",user_team_id);
        return mapping.findForward("success");
    }
    
    private Map populatePlayerPerfList(String tournament_id,String user_team_id,String eff_date, String[]player_list) throws Exception
    {
        Map retMap = new HashMap();
        
        List<PlayerContributionVO> lstYourPlayerThisDay = new ArrayList<PlayerContributionVO>();
        Scorecard logicScore = Scorecard.getInstance();
        PlayingNationsTeam logicPnt = PlayingNationsTeam.getInstance();
        int total_points = 0;
        for (int i = 0; i < player_list.length; i++)
        {
            PlayerContributionVO playerVO = logicScore.selectPlayerPerformanceForDay(tournament_id,player_list[i],eff_date);
            if(playerVO == null)
            {
                playerVO = new PlayerContributionVO();
                playerVO.setPlayer_id(player_list[i]);
                playerVO.setRuns_scored("0");
                playerVO.setWickets_taken("0");
                playerVO.setCatches("0");
                playerVO.setStumps("0");
                playerVO.setRunout("0");
                playerVO.setPlayer_points("0");
            }
            PlayingNationsTeamVO objPnt = logicPnt.fetchPlayer(player_list[i]);
            playerVO.setPlayer_name(objPnt.getPlayer_name());
            playerVO.setCountry_id(objPnt.getCountry_id());
            total_points = total_points + Integer.parseInt(playerVO.getPlayer_points());
            lstYourPlayerThisDay.add(playerVO);
        }
        retMap.put("player_list",lstYourPlayerThisDay);
        retMap.put("total_points",total_points+"");
        return retMap;
    }
}
