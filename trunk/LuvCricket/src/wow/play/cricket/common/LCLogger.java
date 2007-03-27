/*
 * LCLogger.java
 *
 */

package wow.play.cricket.common;

import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;

/**
 * A message logger class, which internally uses log4j to log the messages to Console
 * and/or File.
 * @author Narul Siddik
 */


public class LCLogger
{
    
    private static Logger objLogger;
    
    static
    {
        DOMConfigurator.configure(Thread.currentThread().getContextClassLoader().getResource("log4j.xml"));
        objLogger = Logger.getLogger("wow.play.cricket");        
        //objLogger.getAppender();
    }
    
    /** Creates a new instance of LCLogger */
    private LCLogger()
    {
    }
    
    /**
     * It logs the error on debug level.
     * @param strMsg Error message to be logged.
     */
    public static void debug(String strMsg)
    {
        objLogger.debug(strMsg);
    }
    
    /**
     * It logs the error on debug level.
     * @param strMsg The error message to log.
     * @param intThrow An exception which stack trace will be logged along with error message.
     */
    public static void debug(String strMsg,Throwable intThrow)
    {
        objLogger.debug(strMsg,intThrow);
    }
    
    /**
     * Logs error on info level.
     * @param strMsg Error message to log.
     */
    public static void info(String strMsg)
    {
        objLogger.info(strMsg);
    }
    
    /**
     * Logs error on info level.
     * @param strMsg Error message to log.
     * @param intThrow An exception which stack trace will be logged along with error message.
     */
    public static void info(String strMsg,Throwable intThrow)
    {
        objLogger.info(strMsg,intThrow);
    }
    
    /**
     * Logs error on fatal level.
     * @param strMsg Error message to log.
     */
    public static void fatal(String strMsg)
    {
        objLogger.fatal(strMsg);
    }
    
    /**
     * Logs error on fatal level.
     * @param strMsg Error message to log.
     * @param intThrow An exception which stack trace will be logged along with error message.
     */
    public static void fatal(String strMsg,Throwable intThrow)
    {
        objLogger.fatal(strMsg,intThrow);
    }
    
    /**
     * It logs the message on error level.
     * @param strMsg Error message to be logged.
     */
    public static void error(String strMsg)
    {
        objLogger.error(strMsg);
    }
    
    /**
     * It logs the error on error level.
     * @param strMsg The error message to log.
     * @param intThrow An exception which stack trace will be logged along with error message.
     */
    public static void error(String strMsg,Throwable intThrow)
    {
        objLogger.error(strMsg,intThrow);
    }
    
}
