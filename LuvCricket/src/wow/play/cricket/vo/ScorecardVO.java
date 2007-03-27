/*
 * ScorecardVO.java
 *
 * Created on March 1, 2007, 10:02 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class ScorecardVO
{
    
    /** Creates a new instance of ScorecardVO */
    public ScorecardVO()
    {
    }
    private String match_id;
    private String innings;
    private String index;
    private String batsman_id;
    private String howout;
    private String helper_id;
    private String bowler_id;
    private String runs_scored;

    public String getMatch_id()
    {
        return match_id;
    }

    public void setMatch_id(String match_id)
    {
        this.match_id = match_id;
    }

    public String getInnings()
    {
        return innings;
    }

    public void setInnings(String innings)
    {
        this.innings = innings;
    }


    public String getBatsman_id()
    {
        return batsman_id;
    }

    public void setBatsman_id(String batsman_id)
    {
        this.batsman_id = batsman_id;
    }

    public String getHowout()
    {
        return howout;
    }

    public void setHowout(String howout)
    {
        this.howout = howout;
    }

    public String getHelper_id()
    {
        return helper_id;
    }

    public void setHelper_id(String helper_id)
    {
        this.helper_id = helper_id;
    }

    public String getBowler_id()
    {
        return bowler_id;
    }

    public void setBowler_id(String bowler_id)
    {
        this.bowler_id = bowler_id;
    }

    public String getRuns_scored()
    {
        return runs_scored;
    }

    public void setRuns_scored(String runs_scored)
    {
        this.runs_scored = runs_scored;
    }

    /**
     * Holds value of property playing_position.
     */
    private String playing_position;

    /**
     * Getter for property playing_position.
     * @return Value of property playing_position.
     */
    public String getPlaying_position()
    {
        return this.playing_position;
    }

    /**
     * Setter for property playing_position.
     * @param playing_position New value of property playing_position.
     */
    public void setPlaying_position(String playing_position)
    {
        this.playing_position = playing_position;
    }
}
