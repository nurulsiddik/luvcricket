/*
 * TournamentMatchesVO.java
 *
 * Created on March 1, 2007, 10:00 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class TournamentMatchesVO
{
    
    /** Creates a new instance of TournamentMatchesVO */
    public TournamentMatchesVO()
    {
    }
    
    private String  match_id;
    private String  tournament_id;
    private String  match_date;
    private String  match_venue;
    private String  country_id1;
    private String  country_id2;
    private String  match_type;
    private String  match_result;
    private String  match_winner;
    private String  match_tournament_status;
    private String  comments;
    private String  first_batting_team;
    
    public String getMatch_id()
    {
        return match_id;
    }
    
    public void setMatch_id(String match_id)
    {
        this.match_id = match_id;
    }
    
    public String getTournament_id()
    {
        return tournament_id;
    }
    
    public void setTournament_id(String tournament_id)
    {
        this.tournament_id = tournament_id;
    }
    
    public String getMatch_date()
    {
        return match_date;
    }
    
    public void setMatch_date(String match_date)
    {
        this.match_date = match_date;
    }
    
    public String getMatch_venue()
    {
        return match_venue;
    }
    
    public void setMatch_venue(String match_venue)
    {
        this.match_venue = match_venue;
    }
    
    public String getCountry_id1()
    {
        return country_id1;
    }
    
    public void setCountry_id1(String country_id1)
    {
        this.country_id1 = country_id1;
    }
    
    public String getCountry_id2()
    {
        return country_id2;
    }
    
    public void setCountry_id2(String country_id2)
    {
        this.country_id2 = country_id2;
    }
    
    public String getMatch_type()
    {
        return match_type;
    }
    
    public void setMatch_type(String match_type)
    {
        this.match_type = match_type;
    }
    
    public String getMatch_result()
    {
        return match_result;
    }
    
    public void setMatch_result(String match_result)
    {
        this.match_result = match_result;
    }
    
    public String getMatch_winner()
    {
        return match_winner;
    }
    
    public void setMatch_winner(String match_winner)
    {
        this.match_winner = match_winner;
    }
    
    public String getMatch_tournament_status()
    {
        return match_tournament_status;
    }
    
    public void setMatch_tournament_status(String match_tournament_status)
    {
        this.match_tournament_status = match_tournament_status;
    }
    
    public String getComments()
    {
        return comments;
    }
    
    public void setComments(String comments)
    {
        this.comments = comments;
    }
    
    public String getFirst_batting_team()
    {
        return first_batting_team;
    }
    
    public void setFirst_batting_team(String first_batting_team)
    {
        this.first_batting_team = first_batting_team;
    }
}
