/*
 * PlayingNationsAc.java
 *
 * Created on January 30, 2007, 1:07 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.ac;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author NURUL SIDDIK
 */
public class PlayingNationsAc extends LCCommonAc
{
    
    /** Creates a new instance of PlayingNationsAc */
    public PlayingNationsAc()
    {
    }

    public ActionForward performAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        ActionForward ac = mapping.findForward("success");
        return ac;
    }
    
}
