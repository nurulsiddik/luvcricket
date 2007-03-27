/*
 * TournamentChangesVO.java
 *
 * Created on January 21, 2007, 12:18 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class TournamentChangesVO
{
    private String tournament_id;
    private String tournament_stage;
    private String changes_permitted;
    private String stage_description;

    public String getTournament_id()
    {
        return tournament_id;
    }

    
    public void setTournament_id(String tournament_id)
    {
        this.tournament_id = tournament_id;
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

    /**
     * Holds value of property stage_effective_date.
     */
    private String stage_effective_date;

    /**
     * Getter for property stage_effective_date.
     * @return Value of property stage_effective_date.
     */
    public String getStage_effective_date()
    {
        return this.stage_effective_date;
    }

    /**
     * Setter for property stage_effective_date.
     * @param stage_effective_date New value of property stage_effective_date.
     */
    public void setStage_effective_date(String stage_effective_date)
    {
        this.stage_effective_date = stage_effective_date;
    }
    
}
