/*
 * LoginAc.java
 *
 * Created on 21 December 2006, 23:47
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.ac;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.DynaValidatorForm;
import wow.play.cricket.common.LCConstants;
import wow.play.cricket.common.crypt.JCrypt;
import wow.play.cricket.common.exception.LCException;
import wow.play.cricket.logic.RegNewUserLogic;
import wow.play.cricket.logic.Tournament;
import wow.play.cricket.vo.RegNewUserVO;

/**
 *
 * @author NURUL SIDDIK
 */
public class LoginAc extends Action
{
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        ActionForward retValue;
        String appEvent =(String) request.getParameter("appEvent");
        System.out.println("Submit Action: "+appEvent);
        if("welcome".equals(appEvent))
        {
            return welcomeUser(mapping,form,request,response);
        }
        else if("validatelogin".equals(appEvent))
        {
            return validateUser( mapping,  form,  request, response);
        }
        else if("logoutApplication".equals(appEvent))
        {
            return logoutApplication(mapping,form,request,response);
        }
        else if("relogin".equals(appEvent))
        {
            logoutApplication(mapping,form,request,response);
            return mapping.findForward("sessionout");
        }

        
        return mapping.findForward("success");
    }
    
    public ActionForward welcomeUser(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm dForm = (DynaValidatorForm) form;
        dForm.set("userId", "");
        dForm.set("password", "");
        //Fetch tournament matches:
        Tournament logic = new Tournament();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String currDate = sdf.format(new Date());
        request.getSession().setAttribute("tournament_matches",logic.fetchTournamentMatchesFromDate("0",currDate));
        
        return mapping.findForward("welcome");
    }
    
    public ActionForward validateUser(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        ActionForward retMap = mapping.findForward("failurelogin");
        DynaValidatorForm dForm = (DynaValidatorForm) form;
        String userId = (String)dForm.get("userId");
        String password = (String)dForm.get("password");
        String cryptPassword = JCrypt.cry(password);
        RegNewUserLogic regNewL = new RegNewUserLogic();
        RegNewUserVO paramVO = new RegNewUserVO();
        paramVO.setUser_id(userId);
        RegNewUserVO objRegUserVO = (RegNewUserVO) regNewL.fetchUserDataFromName(paramVO);
        
        if(objRegUserVO != null && !"".equals(objRegUserVO.getUser_id())&& (userId.equals(objRegUserVO.getUser_id()) || userId.equals(objRegUserVO.getLogin_name())))
        {
            if(objRegUserVO.getPassword().equals(cryptPassword))
            {
                HttpSession session = request.getSession();
                session.setAttribute(LCConstants.USER_NAME,objRegUserVO.getUser_name());
                session.setAttribute(LCConstants.USER_ID,objRegUserVO.getUser_id()+"");
                String player_type = objRegUserVO.getUser_type();
                if("player".equals(player_type))
                {
                    session.setAttribute("MENU_NAME","menu.xml");
                }
                else
                {
                    session.setAttribute("MENU_NAME","adminmenu.xml");
                }
                retMap = mapping.findForward("successlogin");
            }
            else
            {
                throw new LCException("invalid.login");
            }
        }
        else
        {
            throw new LCException("invalid.login");
        }
        return retMap;
    }
    
    public ActionForward  logoutApplication(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        if(session != null)
        {
            session.removeAttribute(LCConstants.USER_ID);
            session.removeAttribute(LCConstants.USER_NAME);
        }
        return mapping.findForward("logout");
    }
    
}
