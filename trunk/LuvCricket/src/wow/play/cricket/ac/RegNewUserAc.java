/*
 * RegNewUserAc.java
 *
 * Created on 25 December 2006, 19:39
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.ac;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.DynaValidatorForm;
import wow.play.cricket.common.IAppEventHandler;
import wow.play.cricket.common.LCConstants;
import wow.play.cricket.common.crypt.JCrypt;
import wow.play.cricket.logic.RegNewUserLogic;
import wow.play.cricket.logic.UserTeam;
import wow.play.cricket.vo.RegNewUserVO;

/**
 *
 * @author NURUL SIDDIK
 */
public class RegNewUserAc extends LCCommonAc
{
    Logger log = Logger.getLogger("wow.play.cricket");
    
    public ActionForward performAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        ActionForward objAfd = mapping.findForward("success");
        String appEvent = (String) request.getParameter(LCConstants.APP_EVENT);
        log.debug("Submit Action "+appEvent);
        if("init".equals(appEvent))
        {
            objAfd = initRegistration(mapping, form, request, response);
        }
        else if("insertvalues".equals(appEvent))
        {
            objAfd = insertRegistration(mapping, form, request, response);
        }
        
        return objAfd;
    }
    
    @IAppEventHandler(appEvent="initRegisterUser")
    public ActionForward initRegistration(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objDynaForm = (DynaValidatorForm)form;
        log.debug("Initializing the Registration");
        RegNewUserVO objEmptyVo = new RegNewUserVO();
        objDynaForm.set("objUserData",objEmptyVo);
        
        return mapping.findForward("welcome");
    }
    
    @IAppEventHandler(appEvent="registerNewUser")
    public ActionForward insertRegistration(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objDF = (DynaValidatorForm) form;
        RegNewUserVO objFormVO = (RegNewUserVO)objDF.get("objUserData");
        objFormVO.setUser_type("player");
        try
        {
            
            RegNewUserLogic regTM = new RegNewUserLogic();
            List allUser = regTM.fetchAllUser();
            if(allUser != null && !allUser.isEmpty())
            {
                int userCount = allUser.size();
                for(int i=0; i<userCount; i++)
                {
                    RegNewUserVO objDBVO = (RegNewUserVO)allUser.get(i);
                    if(objDBVO.getUser_id().equals(objFormVO.getUser_id()))
                    {
                        //throw new LCException("user.registered");
                        request.setAttribute(LCConstants.STATUS_MESSAGE_CODE,"user.registered");
                        return mapping.findForward(LCConstants.ERROR);
                    }
                    else if(objDBVO.getLogin_name().equals(objFormVO.getLogin_name()))
                    {
                        //throw new LCException("user.registered");
                        request.setAttribute(LCConstants.STATUS_MESSAGE_CODE,"user.registered");
                        return mapping.findForward(LCConstants.ERROR);
                    }
                }
                
            }
            //objFormVO.setPassword(JCrypt.cry(objFormVO.getPassword()));
            objFormVO.setPassword(JCrypt.cry(objFormVO.getPassword()));
            regTM.insertRecord(objFormVO);
            request.setAttribute(LCConstants.STATUS_MESSAGE_CODE,"record.updated");
        }
        catch (SQLException ex)
        {
            String sqlmsg = ex.getCause().getMessage();
            String strAry[] = sqlmsg.split("]");
            sqlmsg = strAry[strAry.length-1];
            sqlmsg = sqlmsg.replaceAll("'","");
            System.out.println("SQL MSG"+sqlmsg);
            request.setAttribute("sqlerror",sqlmsg);
            return mapping.findForward(LCConstants.ERROR);
        }
        return mapping.findForward(LCConstants.SUCCESS);
    }
    
    @IAppEventHandler(appEvent="initEditUser")
    public ActionForward  initEditUser(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objDF = (DynaValidatorForm) form;
        
        String user_id = (String) request.getSession().getAttribute(LCConstants.USER_ID);
        RegNewUserVO userVO = new RegNewUserVO();
        userVO.setUser_id(user_id);
        
        RegNewUserLogic logic = new RegNewUserLogic();
        userVO = logic.fetchUserDataFromName(userVO);
        
        UserTeam logicUT = UserTeam.getInstance();
        List lstUserTeams = logicUT.fetchUserTeam(user_id);
        request.getSession().setAttribute("opt_user_team",lstUserTeams);
        request.setAttribute("original_password",userVO.getPassword());
        objDF.set("objUserData",userVO);
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="editUserDetails")
    public ActionForward  editUserDetails(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        DynaValidatorForm objDF = (DynaValidatorForm) form;
        RegNewUserVO userVO = (RegNewUserVO) objDF.get("objUserData");
        String user_id = (String) request.getSession().getAttribute(LCConstants.USER_ID);
        userVO.setUser_id(user_id);
        String original_password = request.getParameter("original_password");
        String form_password = userVO.getPassword();
        if(!original_password.equals(form_password))
        {
            userVO.setPassword(JCrypt.cry(userVO.getPassword()));
        }
        RegNewUserLogic logic = new RegNewUserLogic();
        logic.updateUserData(userVO);
        
        request.setAttribute(LCConstants.STATUS_MESSAGE_CODE,"record.updated");
        return mapping.findForward("success");
    }
    
    @IAppEventHandler(appEvent="forgotPassword")
    public ActionForward  forgotPassword(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        String user_id = request.getParameter("user_id");
        String login_name = request.getParameter("login_name");
        String email = request.getParameter("email");
        
        RegNewUserVO userVO = new RegNewUserVO();
        userVO.setUser_id(user_id);
        
        RegNewUserLogic logic = new RegNewUserLogic();
        userVO = logic.fetchUserDataFromName(userVO);
        if(userVO == null)
        {
            request.setAttribute("pass_message","Invalid User Credentials supplied:  User Id");
        }
        else if(!login_name.equals(userVO.getLogin_name()))
        {
            request.setAttribute("pass_message","Invalid User Credentials supplied:  Login Name");
        }
        else if(!email.equals(userVO.getEmail()))
        {
            request.setAttribute("pass_message","Invalid User Credentials supplied:  Email");
        }
        else
        {
            //Generate new Password.
            String newpassword = new Date().getTime() + "";
            newpassword = newpassword.substring(7);
            userVO.setPassword(JCrypt.cry(newpassword));
            try
            {
                logic.updateUserData(userVO);
                request.setAttribute("pass_message","New Password set to: "+newpassword);
            }
            catch (Exception ex)
            {
                ex.printStackTrace();
                request.setAttribute("pass_message","Error resetting password, mail to: narul.siddik@trigyn.com");
            }
            
        }
        
        return mapping.findForward("forgotpassword");
    }
    
}
