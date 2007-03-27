/*
 * TournamentNationVO.java
 *
 * Created on February 3, 2007, 12:54 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class TournamentNationVO
{
    private String tournament_id;
    private String country_id;
    private String country_status_in_tournament;
    /** Creates a new instance of TournamentNationVO */
    public TournamentNationVO()
    {
    }

    public String getTournament_id()
    {
        return tournament_id;
    }

    public void setTournament_id(String tournament_id)
    {
        this.tournament_id = tournament_id;
    }

    public String getCountry_id()
    {
        return country_id;
    }

    public void setCountry_id(String country_id)
    {
        this.country_id = country_id;
    }

    public String getCountry_status_in_tournament()
    {
        return country_status_in_tournament;
    }

    public void setCountry_status_in_tournament(String country_status_in_tournament)
    {
        this.country_status_in_tournament = country_status_in_tournament;
    }
    
}
