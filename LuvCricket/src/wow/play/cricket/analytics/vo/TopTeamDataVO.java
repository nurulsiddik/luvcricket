/*
 * TopTeamDataVO.java
 *
 * Created on March 28, 2007, 11:59 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.analytics.vo;

/**
 *
 * @author jatan.porecha
 */
public class TopTeamDataVO
{
    
    /** Creates a new instance of TopTeamDataVO */
    public TopTeamDataVO()
    {
    }

    /**
     * Holds value of property user_team_id.
     */
    private String user_team_id;

    /**
     * Getter for property user_team_id.
     * @return Value of property user_team_id.
     */
    public String getUser_team_id()
    {
        return this.user_team_id;
    }

    /**
     * Setter for property user_team_id.
     * @param user_team_id New value of property user_team_id.
     */
    public void setUser_team_id(String user_team_id)
    {
        this.user_team_id = user_team_id;
    }

    /**
     * Holds value of property effective_date.
     */
    private String date;

    /**
     * Getter for property effective_date.
     * @return Value of property effective_date.
     */
    public String getDate()
    {
        return this.date;
    }

    /**
     * Setter for property effective_date.
     * @param effective_date New value of property effective_date.
     */
    public void setDate(String effective_date)
    {
        this.date = effective_date;
    }

    /**
     * Holds value of property team_points.
     */
    private int team_points;

    /**
     * Getter for property team_points.
     * @return Value of property team_points.
     */
    public int getTeam_points()
    {
        return this.team_points;
    }

    /**
     * Setter for property team_points.
     * @param team_points New value of property team_points.
     */
    public void setTeam_points(int team_points)
    {
        this.team_points = team_points;
    }
    
}
