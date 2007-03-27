/*
 * UpdatePlayerPointsForUserTeamAc.java
 *
 * Created on March 13, 2007, 10:06 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.ac;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import wow.play.cricket.common.IAppEventHandler;
import wow.play.cricket.common.LCConstants;
import wow.play.cricket.common.LCLogger;
import wow.play.cricket.logic.ProcessJobs;
import wow.play.cricket.logic.Tournament;
import wow.play.cricket.logic.UserTeam;

/**
 *
 * @author NURUL SIDDIK
 */
public class UpdatePlayerPointsForUserTeamAc extends LCCommonAc
{
    
    /**
     * Creates a new instance of UpdatePlayerPointsForUserTeamAc
     */
    public UpdatePlayerPointsForUserTeamAc()
    {
    }
    
    public ActionForward performAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return mapping.findForward("sucess");
    }
    
    @IAppEventHandler(appEvent="initUpdatePlayerPoints")
    public ActionForward  initUpdatePlayerPoints(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        Tournament logicTour = new Tournament();
        session.setAttribute("opt_tournament_id",logicTour.fetchActiveTournament());
        session.setAttribute("opt_match_dates",new ArrayList());
        session.setAttribute("lst_tournament_matches",new ArrayList());
        session.setAttribute("opt_user_teams",new ArrayList());
        
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="onSelectTournament")
    public ActionForward  onSelectTournament(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        String tournament_id = request.getParameter("tournament_id");
        Tournament logicTour = new Tournament();
        session.setAttribute("opt_match_dates",logicTour.fetchMatchDates(tournament_id));
        session.setAttribute("lst_tournament_matches",logicTour.fetchMatchByDates(tournament_id));
        UserTeam userLogic = UserTeam.getInstance();
        session.setAttribute("opt_user_teams",userLogic.fetchAllUserTeamsForTournament(tournament_id));
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="updateUserTeamPoints")
    public ActionForward  updateUserTeamPoints(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        LCLogger.info("Updating all the user points");
        String tournament_id = request.getParameter("tournament_id");
        String match_date = request.getParameter("match_date");
        String[] aryUserTeamid = request.getParameterValues("opt_user_team");
        ProcessJobs.updatePoints(aryUserTeamid,tournament_id,match_date);
        request.setAttribute(LCConstants.STATUS_MESSAGE_CODE,"points_updated");
        return mapping.findForward("success");
    }
    
}
