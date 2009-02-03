/*
 * LCProcessJobs.java
 *
 * Created on March 12, 2007, 10:14 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import wow.play.cricket.logic.ProcessJobs;
import wow.play.cricket.logic.Tournament;

/**
 *
 * @author NURUL SIDDIK
 */
public class LCProcessJobs
{
    private static LCProcessJobs obj = null;
    private Timer objTourLockTimer;
    /** Creates a new instance of LCProcessJobs */
    private LCProcessJobs()
    {
    }
    
    static
    {
        try
        {
            obj = new LCProcessJobs();
            obj.init();
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }
    public static LCProcessJobs getInstance()
    {
        return obj;
    }
    private void init() throws Exception
    {
        objTourLockTimer = new Timer(true);
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.set(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),cal.get(Calendar.DAY_OF_MONTH),18,30);
        LCLogger.info("LOCK TOURNAMENT TIMER SET TO: "+cal.getTime());
        objTourLockTimer.schedule(new LockTournament(),cal.getTime(),(24*60*60*1000));
    }
    
    private class LockTournament extends TimerTask
    {
        public void run()
        {
            Date currDate = new Date();
            LCLogger.info("\n\n\n\n Executing Schedule task: LOCK TOURNAMENT AT : "+ currDate);
            
            Tournament logic = new Tournament();
            Date next_tourn_date;
            try
            {
                next_tourn_date = logic.fetchNextMatchDate("0");
                LCLogger.info("Next Match date fetched from tournament matches: "+next_tourn_date);
            }
            catch (Exception ex)
            {
                LCLogger.error("Error fetching next match date,hence setting to next day from tomorrow.");
                ex.printStackTrace();
                
                Calendar cal = Calendar.getInstance();
                cal.setTime(currDate);
                //Add a day...
                cal.add(Calendar.DAY_OF_MONTH,1);
                cal.set(Calendar.HOUR_OF_DAY,0);
                cal.set(Calendar.MINUTE,0);
                cal.set(Calendar.SECOND,0);
                ///cal.set(Calendar.MILLISECOND,0);
                next_tourn_date = cal.getTime();
            }
            
            /*Calendar cal = Calendar.getInstance();
            cal.setTime(currDate);
            //Add a day...
            cal.add(Calendar.DAY_OF_MONTH,1);
            cal.set(Calendar.HOUR_OF_DAY,0);
            cal.set(Calendar.MINUTE,0);
            cal.set(Calendar.SECOND,0);
            ///cal.set(Calendar.MILLISECOND,0);
            Date next_tourn_date = cal.getTime();*/
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            LCLogger.info("NEXT TOURN DATE SET TO "+sdf.format(next_tourn_date));
            try
            {
                //Process for tournament id 0 - WORLD CUP...
                ProcessJobs.lockTournamentChanges("0",sdf.format(next_tourn_date));
            }
            catch (Exception ex)
            {
                LCLogger.error("Errors Processing Schedule job..Lock Tournament.");
                ex.printStackTrace();
            }
            LCLogger.info("\n\n\n\n Schedule task: LOCK TOURNAMENT finished ");
        }
    }
}
