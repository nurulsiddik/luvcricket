/*
 * LCTournamentVO.java
 *
 * Created on February 21, 2007, 12:16 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class LCTournamentVO
{
    
    /** Creates a new instance of LCTournamentVO */
    public LCTournamentVO()
    {
    }
    private String tournament_id;
    private String tournament_name;
    private String tournament_description;
    private String tournament_status;
    private String current_stage;
    private String tournament_value;
    private String next_effective_date;
    private String tournament_stage;
    private String changes_permitted;
    private String stage_description;
    private String stage_effective_date;

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

    public String getTournament_value()
    {
        return tournament_value;
    }

    public void setTournament_value(String tournament_value)
    {
        this.tournament_value = tournament_value;
    }

    public String getNext_effective_date()
    {
        return next_effective_date;
    }

    public void setNext_effective_date(String next_effective_date)
    {
        this.next_effective_date = next_effective_date;
    }

    public String getTournament_stage()
    {
        return tournament_stage;
    }

    public void setTournament_stage(String tournament_stage)
    {
        this.tournament_stage = tournament_stage;
    }

    public String getChanges_permitted()
    {
        return changes_permitted;
    }

    public void setChanges_permitted(String changes_permitted)
    {
        this.changes_permitted = changes_permitted;
    }

    public String getStage_description()
    {
        return stage_description;
    }

    public void setStage_description(String stage_description)
    {
        this.stage_description = stage_description;
    }

    public String getStage_effective_date()
    {
        return stage_effective_date;
    }

    public void setStage_effective_date(String stage_effective_date)
    {
        this.stage_effective_date = stage_effective_date;
    }

    /**
     * Holds value of property last_points_updated_date.
     */
    private String last_points_updated_date;

    /**
     * Getter for property last_points_updated_date.
     * @return Value of property last_points_updated_date.
     */
    public String getLast_points_updated_date()
    {
        return this.last_points_updated_date;
    }

    /**
     * Setter for property last_points_updated_date.
     * @param last_points_updated_date New value of property last_points_updated_date.
     */
    public void setLast_points_updated_date(String last_points_updated_date)
    {
        this.last_points_updated_date = last_points_updated_date;
    }
}
