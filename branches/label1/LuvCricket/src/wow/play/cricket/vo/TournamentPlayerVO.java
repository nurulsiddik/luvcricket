/*
 * TournamentPlayerVO.java
 *
 * Created on February 5, 2007, 12:01 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class TournamentPlayerVO
{
    
    /** Creates a new instance of TournamentPlayerVO */
    public TournamentPlayerVO()
    {
    }
    private String tournament_id;
    private String player_id;
    private String player_value;
    private String player_name;
    private String country_id;
    public String getTournament_id()
    {
        return tournament_id;
    }

    public void setTournament_id(String tournament_id)
    {
        this.tournament_id = tournament_id;
    }

    public String getPlayer_id()
    {
        return player_id;
    }

    public void setPlayer_id(String player_id)
    {
        this.player_id = player_id;
    }

    public String getPlayer_value()
    {
        return player_value;
    }

    public void setPlayer_value(String player_value)
    {
        this.player_value = player_value;
    }

    public String getCountry_id()
    {
        return country_id;
    }

    public void setCountry_id(String country_id)
    {
        this.country_id = country_id;
    }

    public String getPlayer_name()
    {
        return player_name;
    }

    public void setPlayer_name(String player_name)
    {
        this.player_name = player_name;
    }
}
