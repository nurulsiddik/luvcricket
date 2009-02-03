/*
 * TournamentVO.java
 *
 * Created on January 20, 2007, 8:55 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

import java.util.List;

/**
 *
 * @author NURUL SIDDIK
 */
public class TournamentVO
{
    private String tournament_id;
    private String tournament_name;
    private String tournament_description;
    private String tournament_status;
    private String current_stage; 
    private List tournament_changes;
    
    public String getTournament_id()
    {
        return tournament_id;
    }

    public void setTournament_id(String tournament_id)
    {
        this.tournament_id = tournament_id;
    }

    public String getTournament_name()
    {
        return tournament_name;
    }

    public void setTournament_name(String tournament_name)
    {
        this.tournament_name = tournament_name;
    }

    public String getTournament_description()
    {
        return tournament_description;
    }

    public void setTournament_description(String tournament_description)
    {
        this.tournament_description = tournament_description;
    }

    public String getTournament_status()
    {
        return tournament_status;
    }

    public void setTournament_status(String tournament_status)
    {
        this.tournament_status = tournament_status;
    }

    public String getCurrent_stage()
    {
        return current_stage;
    }

    public void setCurrent_stage(String current_stage)
    {
        this.current_stage = current_stage;
    }

    public List getTournament_changes()
    {
        return tournament_changes;
    }

    public void setTournament_changes(List tournament_changes)
    {
        this.tournament_changes = tournament_changes;
    }
}
