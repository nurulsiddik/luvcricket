/*
 * PlayingNationsTeamAc.java
 *
 * Created on January 30, 2007, 10:58 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.ac;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.DynaValidatorForm;
import wow.play.cricket.common.IAppEventHandler;
import wow.play.cricket.common.LCConstants;
import wow.play.cricket.common.LCLogger;
import wow.play.cricket.common.exception.LCException;
import wow.play.cricket.logic.PlayingNationsTeam;
import wow.play.cricket.vo.PlayerContributionVO;
import wow.play.cricket.vo.PlayingNationsTeamVO;
import wow.play.cricket.vo.RefxVO;

/**
 *
 * @author NURUL SIDDIK
 */
public class PlayingNationsTeamAc extends LCCommonAc
{
    
    /**
     * Creates a new instance of PlayingNationsTeamAc
     */
    public PlayingNationsTeamAc()
    {
    }
    
    public ActionForward performAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        ActionForward af = mapping.findForward("success");
        return af;
    }
    @IAppEventHandler(appEvent="initCreate")
    public ActionForward initializeCreate(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        LCLogger.debug("Initialize Create");
        request.setAttribute("opt_nations",fetchNations());
        request.setAttribute("screen_mode","create");
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="initModify")
    public ActionForward initializeModify(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        LCLogger.debug("Initialize modify");
        List lstCountries = fetchNations();
        List lstPlayers = null;
        RefxVO objCountry = null;
        if(lstCountries != null && lstCountries.size() > 0)
        {
            objCountry = (RefxVO)lstCountries.get(0);
            request.setAttribute("opt_nations",fetchNations());
            request.setAttribute("opt_players",fetchNationsPlayers(objCountry.getRefx_value()));
        }
        else
        {
            throw new LCException("no.country");
        }
        
        request.setAttribute("screen_mode","modify");
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="createPlayer")
    public ActionForward createPlayer(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objForm = (DynaValidatorForm) form;
        PlayingNationsTeamVO objFormVO = (PlayingNationsTeamVO) objForm.get("objPlayingNationsTeam");
        int player_id = PlayingNationsTeam.getInstance().insertPlayer(objFormVO);
        objFormVO.setPlayer_id(player_id+"");
        request.setAttribute("opt_nations",fetchNations());
        request.setAttribute("opt_players",fetchNationsPlayers(objFormVO.getCountry_id()));
        objForm.set("objPlayingNationsTeam",objFormVO);
        request.setAttribute(LCConstants.STATUS_MESSAGE_CODE,"record.updated");
        return mapping.findForward("success");
        
    }
    
    @IAppEventHandler(appEvent="deletePlayer")
    public ActionForward deletePlayer(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objForm = (DynaValidatorForm) form;
        PlayingNationsTeamVO objFormVO = (PlayingNationsTeamVO) objForm.get("objPlayingNationsTeam");
        
        String player_id = objFormVO.getPlayer_id();
        PlayingNationsTeam loginPNT = PlayingNationsTeam.getInstance();
        loginPNT.deletePlayer(player_id);
        request.setAttribute("opt_nations",fetchNations());
        request.setAttribute("opt_players",fetchNationsPlayers(objFormVO.getCountry_id()));
        request.setAttribute(LCConstants.STATUS_MESSAGE_CODE,"record.updated");
        objForm.set("objPlayingNationsTeam", new PlayingNationsTeamVO());
        return mapping.findForward("success");
    }
    @IAppEventHandler(appEvent="updatePlayer")
    public ActionForward updatePlayer(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objForm = (DynaValidatorForm) form;
        PlayingNationsTeamVO objFormVO = (PlayingNationsTeamVO) objForm.get("objPlayingNationsTeam");
        
        PlayingNationsTeam loginPNT = PlayingNationsTeam.getInstance();
        loginPNT.updatePlayer(objFormVO);
        
        request.setAttribute("opt_nations",fetchNations());
        request.setAttribute("opt_players",fetchNationsPlayers(objFormVO.getCountry_id()));
        request.setAttribute(LCConstants.STATUS_MESSAGE_CODE,"record.updated");
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="onChangeCountry")
    public ActionForward onChangeCountry(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objForm = (DynaValidatorForm) form;
        PlayingNationsTeamVO objFormVO = (PlayingNationsTeamVO) objForm.get("objPlayingNationsTeam");
        
        //Initialize VO
        PlayingNationsTeamVO objNewFormVO = new PlayingNationsTeamVO();
        objNewFormVO.setCountry_id(objFormVO.getCountry_id());
        
        request.setAttribute("opt_nations",fetchNations());
        request.setAttribute("opt_players",fetchNationsPlayers(objNewFormVO.getCountry_id()));
        objForm.set("objPlayingNationsTeam",objNewFormVO);
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="onChangePlayer")
    public ActionForward onChangePlayer(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objForm = (DynaValidatorForm) form;
        PlayingNationsTeamVO objFormVO = (PlayingNationsTeamVO) objForm.get("objPlayingNationsTeam");
        
        PlayingNationsTeam logicPlayer = PlayingNationsTeam.getInstance();
        PlayingNationsTeamVO objNewFormVO = logicPlayer.fetchPlayer(objFormVO.getPlayer_id());
        request.setAttribute("opt_nations",fetchNations());
        request.setAttribute("opt_players",fetchNationsPlayers(objNewFormVO.getCountry_id()));
        objForm.set("objPlayingNationsTeam",objNewFormVO);
        return mapping.findForward("success");
    }
    
    private List fetchNations() throws Exception
    {
        PlayingNationsTeam objPNT = PlayingNationsTeam.getInstance();
        return objPNT.fetchNations();
    }
    private List fetchNationsPlayers(String country_id) throws Exception
    {
        PlayingNationsTeam objPNT = PlayingNationsTeam.getInstance();
        return objPNT.fetchNationPlayer(country_id);
    }
    
    @IAppEventHandler(appEvent="getPlayerContributionForTournament")
    public ActionForward  getPlayerContributionForTournament(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objForm = (DynaValidatorForm) form;
        boolean flagPlayerList = true;
        List<RefxVO> nationList = fetchNations();
        request.setAttribute("opt_nations",nationList);
        
        PlayingNationsTeam logic = PlayingNationsTeam.getInstance();
        String player_id = request.getParameter("player_id");
        
        if(player_id == null || "".equals(player_id))
        {
            String country_id = request.getParameter("country_id");
            if(country_id == null || "".equals(country_id))
            {
                RefxVO objRefx = nationList.get(0);
                country_id = objRefx.getRefx_value();
            }
            
            List<RefxVO> playerLst = fetchNationsPlayers(country_id);
            request.setAttribute("opt_players",playerLst);
            flagPlayerList = false;
            RefxVO playerVO = playerLst.get(0);
            player_id = playerVO.getRefx_value();
        }
        
        PlayingNationsTeamVO pntVO = logic.fetchPlayer(player_id);
        if(flagPlayerList)
        {
            request.setAttribute("opt_players",fetchNationsPlayers(pntVO.getCountry_id()));
        }
        
        PlayerContributionVO plcVO = logic.fetchPlayerContribInTournament(player_id);
        
        objForm.set("objPlayerDetail",pntVO);
        objForm.set("objPlayerTournContribution",plcVO);
        request.setAttribute("player_details",pntVO);
        request.setAttribute("player_tournament_contribution",plcVO);
        return mapping.findForward("success");
    }
    
}
