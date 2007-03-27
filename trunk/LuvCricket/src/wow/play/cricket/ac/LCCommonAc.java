/*
 * MMTAction.java
 *
 * Created on January 2, 2007, 1:45 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.ac;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import wow.play.cricket.common.IAppEventHandler;
import wow.play.cricket.common.LCConstants;
import wow.play.cricket.common.LCLogger;


/**
 * An abstract Action class which needs to be extended by each and every MMT action
 * classes. Those MMT Action classes will have to implement abstract method performAction.
 * @author Jatan Porecha
 * @version $Revision$
 * Last changed by $Author$ on $Date$ as $Revision$
 */
public abstract class LCCommonAc extends Action
{
    
    private Map<String,Method> appEventHandlers;
    private Object[] args;
    
    
    protected String appEvent;
    
    /**
     * Creates a new instance of LCCommonAc. Since this is an abstract class, this does
     * hold any significance.
     */
    public LCCommonAc()
    {
        appEventHandlers = new HashMap<String,Method>();
        args = new Object[4];
        try
        {
            setAppEventHandlers();
        }
        catch (Exception ex)
        {
            LCLogger.error("Event handling mechanism could not be set for "+this);
            LCLogger.error("Hence every request will be routed to performAction.");
            appEventHandlers.clear();
            ex.printStackTrace();
        }
    }
    
    /**
     * The standard execute method, which will be called by Struts controller upon any
     * do action. This method will do some housekeeping and in turn call the performAction
     * method for functionality specific logic execution. This performAction method is abstract
     * in this class and needs to be implemented by derived classes.
     * @param mapping ActionMapping object passed by Struts.
     * @param form Form bean object passed by Struts.
     * @param request Http request object.
     * @param response Http response object.
     * @return A suitable ActionForward returned by performAction method.
     * @throws java.lang.Exception If anything goes wrong then this will be fired.
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession();
        String user_id = (String)session.getAttribute(LCConstants.USER_ID);
        String appEvent = request.getParameter("appEvent");
        LCLogger.info("App Event: "+appEvent );
        if((user_id == null || "".equals(user_id)) && !("initRegisterUser".equals(appEvent) || "registerNewUser".equals(appEvent) || "forgotPassword".equals(appEvent)))
        {
            LCLogger.info("Session Time out or terminated.. logging out...");
            return mapping.findForward("relogin");
        }
        setActionVars(request);        
        
        if(isEventHandlerExist())
        {
            return invokeEventHandler(mapping,form,request,response);
        }
        return performAction(mapping,form,request,response);
    }
    
    /**
     * If the mapping between Action class method and application event is found then
     * this function will invoke that method using reflection techniques. The child Action
     * class will be analyzed and searched for different application event handles based
     * on {@link IAppEventHandler} annotation.
     * @param mapping Action mapping object passed by Struts and will be passed to event handler method.
     * @param form Action form object passed by Struts and will be passed to event handler method.
     * @param request Http request object which will be passed to event handler method.
     * @param response Http response object which will be passed to event handler method.
     * @return Action forward object.
     * @throws java.lang.Exception Any Application / System (SQL) exception.
     */
    public ActionForward invokeEventHandler(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        Method mtEventHandler = appEventHandlers.get(appEvent);
        System.out.println("METHOD: "+mtEventHandler.getName());
        args[0] = mapping;
        args[1] = form;
        args[2] = request;
        args[3] = response;
        
        return (ActionForward)mtEventHandler.invoke(this,args);
    }
    
    /**
     *
     * @param request
     */
    private void setActionVars(HttpServletRequest request)
    {
        appEvent = request.getParameter("appEvent");
    }
    private void setAppEventHandlers() throws Exception
    {
        IAppEventHandler annotation;
        for(Method m:this.getClass().getMethods())
        {
            annotation = m.getAnnotation(IAppEventHandler.class);
            
            if(annotation == null)
                continue;
            
            String strAnnotatedEvent = annotation.appEvent();
            
            if(strAnnotatedEvent.indexOf(',') < 0)
            {
                attachEventHandler(strAnnotatedEvent,m);
            }
            else
            {
                String[] strEvents = strAnnotatedEvent.split(",");
                
                for(String strEvent:strEvents)
                {
                    attachEventHandler(strEvent,m);
                }
                
            }
        }
    }
    
    private void attachEventHandler(String strEvent,Method m) throws Exception
    {
        if(appEventHandlers.get(strEvent.trim()) != null)
        {
            throw new Exception("Duplicate Event Handlers in Action Class"+ this);
        }
        else
        {
            appEventHandlers.put(strEvent.trim(),m);
        }
    }
    
    private boolean isEventHandlerExist()
    {
        System.out.println("APPLICATION EVENT: "+appEvent);
        if(appEvent == null || "".equals(appEvent))
            return false;
        
        if(appEventHandlers.get(appEvent) == null)
            return false;
        
        return true;
    }
    
    
    /**
     * Abstract method which needs to be implemented by derived class. Upon receiving do
     * action from browser (client), this method will be called after necessary
     * house-keeping logic.
     * All the MMT Action handler classes will have to be derived from {@link LCCommonAc}
     * class and hence have to implement performAction method.
     * @param mapping ActionMapping object passed by Struts.
     * @param form Form bean object passed by Struts.
     * @param request Http request object.
     * @param response Http response object.
     * @return Suitable ActionForward object.
     * @throws java.lang.Exception Any application {@link org.un.mmt.common.MMTException} or system exception.
     */
    public abstract ActionForward performAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception;
    
}
