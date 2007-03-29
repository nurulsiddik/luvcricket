/*
 * GraphsAC.java
 *
 * Created on March 28, 2007, 12:07 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.analytics.ac;

import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import wow.play.cricket.ac.LCCommonAc;
import wow.play.cricket.common.IAppEventHandler;
import wow.play.cricket.logic.Tournament;
import wow.play.cricket.logic.UserTeam;
import wow.play.cricket.vo.RefxVO;

public class GraphsAC extends LCCommonAc
{
    
    /** Creates a new instance of GraphsAC */
    public GraphsAC()
    {
    }
    

    public ActionForward performAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return mapping.findForward("success");
    }
    
    
    @IAppEventHandler(appEvent="topTeams")
    public ActionForward topTeamGraph(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        Tournament logicTour = new Tournament();
        List<RefxVO> tournaments = logicTour.fetchActiveTournament();
        
        request.setAttribute("act_tournas",tournaments);
        request.setAttribute("tourna_stages",logicTour.fetchTournamentStages(tournaments.get(0).getRefx_value()));
        request.setAttribute("tourna_teams",UserTeam.getInstance().fetchAllUserTeamsForTournament(tournaments.get(0).getRefx_value()));

        return mapping.findForward("success");
    }    

    @IAppEventHandler(appEvent="showTopTeamsChart")
    public ActionForward showTopTeamsChart(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        Tournament logicTour = new Tournament();
        List<RefxVO> tournaments = logicTour.fetchActiveTournament();
        
        request.setAttribute("act_tournas",tournaments);
        request.setAttribute("tourna_stages",logicTour.fetchTournamentStages(request.getParameter("tournaments")));
        request.setAttribute("tourna_teams",UserTeam.getInstance().fetchAllUserTeamsForTournament(request.getParameter("tournaments")));
            
        Enumeration e = request.getParameterNames();
        
        String param = null;
        StringBuffer teams_to_show = new StringBuffer();
        
        boolean first_element = true;
        
        while(e.hasMoreElements())
        {
            param = (String)e.nextElement();
            if(param.indexOf("team_") >= 0)
            {
                if(!first_element)
                {
                    teams_to_show.append(",'");
                }
                else
                {
                    teams_to_show.append("'");
                    first_element = false;
                }
                
                teams_to_show.append(param.substring(5).replaceAll("'","''"));
                teams_to_show.append('\'');
            }
        }
        
        request.setAttribute("teams_to_show",teams_to_show.toString());
        request.setAttribute("showChart","1");

        return mapping.findForward("success");
    }    
    
}
