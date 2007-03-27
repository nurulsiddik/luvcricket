/*
 * UserTeamDetailVO.java
 *
 * Created on February 24, 2007, 3:51 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class UserTeamDetailVO
{
    
    /** Creates a new instance of UserTeamDetailVO */
    public UserTeamDetailVO()
    {
    }
    private String user_team_id;
    private String player1;
    private String player2;
    private String player3;
    private String player4;
    private String player5;
    private String player6;
    private String player7;
    private String player8;
    private String player9;
    private String player10;
    private String player11;
    private String number_of_changes;
    private String effective_date;

    public String getUser_team_id()
    {
        return user_team_id;
    }

    public void setUser_team_id(String user_team_id)
    {
        this.user_team_id = user_team_id;
    }

    public String getPlayer1()
    {
        return player1;
    }

    public void setPlayer1(String player1)
    {
        this.player1 = player1;
    }

    public String getPlayer2()
    {
        return player2;
    }

    public void setPlayer2(String player2)
    {
        this.player2 = player2;
    }

    public String getPlayer3()
    {
        return player3;
    }

    public void setPlayer3(String player3)
    {
        this.player3 = player3;
    }

    public String getPlayer4()
    {
        return player4;
    }

    public void setPlayer4(String player4)
    {
        this.player4 = player4;
    }

    public String getPlayer5()
    {
        return player5;
    }

    public void setPlayer5(String player5)
    {
        this.player5 = player5;
    }

    public String getPlayer6()
    {
        return player6;
    }

    public void setPlayer6(String player6)
    {
        this.player6 = player6;
    }

    public String getPlayer7()
    {
        return player7;
    }

    public void setPlayer7(String player7)
    {
        this.player7 = player7;
    }

    public String getPlayer8()
    {
        return player8;
    }

    public void setPlayer8(String player8)
    {
        this.player8 = player8;
    }

    public String getPlayer9()
    {
        return player9;
    }

    public void setPlayer9(String player9)
    {
        this.player9 = player9;
    }

    public String getPlayer10()
    {
        return player10;
    }

    public void setPlayer10(String player10)
    {
        this.player10 = player10;
    }

    public String getPlayer11()
    {
        return player11;
    }

    public void setPlayer11(String player11)
    {
        this.player11 = player11;
    }

    public String getNumber_of_changes()
    {
        return number_of_changes;
    }

    public void setNumber_of_changes(String number_of_changes)
    {
        this.number_of_changes = number_of_changes;
    }

    public String getEffective_date()
    {
        return effective_date;
    }

    public void setEffective_date(String effective_date)
    {
        this.effective_date = effective_date;
    }

    /**
     * Holds value of property team_points.
     */
    private String team_points;

    /**
     * Getter for property team_points.
     * @return Value of property team_points.
     */
    public String getTeam_points()
    {
        return this.team_points;
    }

    /**
     * Setter for property team_points.
     * @param team_points New value of property team_points.
     */
    public void setTeam_points(String team_points)
    {
        this.team_points = team_points;
    }
}
