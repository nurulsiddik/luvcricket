/*
 * UserTeamVO.java
 *
 * Created on February 12, 2007, 10:09 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class UserTeamVO
{
    
    /** Creates a new instance of UserTeamVO */
    public UserTeamVO()
    {
    }
    private String user_team_id;
    private String user_team_name;
    private String user_id;
    private String tournament_id;
    private String user_team_points;
    private String user_team_descr;
    private String default_team;
    private String number_of_changes;
    
    public String getUser_team_id()
    {
        return user_team_id;
    }
    
    public void setUser_team_id(String user_team_id)
    {
        this.user_team_id = user_team_id;
    }
    
    public String getUser_team_name()
    {
        return user_team_name;
    }
    
    public void setUser_team_name(String user_team_name)
    {
        this.user_team_name = user_team_name;
    }
    
    public String getUser_id()
    {
        return user_id;
    }
    
    public void setUser_id(String user_id)
    {
        this.user_id = user_id;
    }
    
    public String getTournament_id()
    {
        return tournament_id;
    }
    
    public void setTournament_id(String tournament_id)
    {
        this.tournament_id = tournament_id;
    }
    
    public String getUser_team_points()
    {
        return user_team_points;
    }
    
    public void setUser_team_points(String user_team_points)
    {
        this.user_team_points = user_team_points;
    }
    
    public String getUser_team_descr()
    {
        return user_team_descr;
    }
    
    public void setUser_team_descr(String user_team_descr)
    {
        this.user_team_descr = user_team_descr;
    }
    
    public String getDefault_team()
    {
        return default_team;
    }
    
    public void setDefault_team(String default_team)
    {
        this.default_team = default_team;
    }

    public String getNumber_of_changes()
    {
        return number_of_changes;
    }

    public void setNumber_of_changes(String number_of_changes)
    {
        this.number_of_changes = number_of_changes;
    }
}
