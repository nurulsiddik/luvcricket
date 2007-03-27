/*
 * PlayingNationsVO.java
 *
 * Created on January 30, 2007, 1:18 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class PlayingNationsVO
{
    
    /** Creates a new instance of PlayingNationsVO */
    public PlayingNationsVO()
    {
    }
    private String country_id;
    private String country_name;
    private String country_active;

    public String getCountry_id()
    {
        return country_id;
    }

    public void setCountry_id(String country_id)
    {
        this.country_id = country_id;
    }

    public String getCountry_name()
    {
        return country_name;
    }

    public void setCountry_name(String country_name)
    {
        this.country_name = country_name;
    }

    public String getCountry_active()
    {
        return country_active;
    }

    public void setCountry_active(String country_active)
    {
        this.country_active = country_active;
    }
    
}
