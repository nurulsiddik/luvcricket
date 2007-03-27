/*
 * LCWebListener.java
 *
 * Created on December 26, 2006, 5:21 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.common;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import wow.play.cricket.tm.TransactionManager;

/**
 * This class will be loaded when the server starts up.
 * @author Narul Siddik
 * @version $Revision$
 * Last changed by $Author$ on $Date$ as $Revision$
 */
public final class LCWebListener implements ServletContextListener
{
    
    /**
     * This function will be called at the startup of the server.
     * The web application initialisation code can be placed here.
     * @param servletContextEvent Servlet Context event
     */
    public void contextInitialized(ServletContextEvent servletContextEvent)
    {
        try
        {
            LCLogger.info("Starting LC Web application");
            System.out.println("LCM"+LCMessageManager.getInstance());
            System.out.println("TM "+TransactionManager.getSQLInstance());
            System.out.println("LC PROCESS JOBS:"+ LCProcessJobs.getInstance());
            System.out.println("");
            
        } 
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

    /**
     * This function is called when the server is shutting down.
     * @param servletContextEvent Servlet Context Event.
     */
    public void contextDestroyed(ServletContextEvent servletContextEvent)
    {
        LCLogger.info("Stopping LC Web application");
    }
    
}
