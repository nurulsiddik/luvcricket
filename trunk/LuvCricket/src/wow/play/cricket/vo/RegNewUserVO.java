/*
 * RegNewUserVO.java
 *
 * Created on 25 December 2006, 19:52
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;
 
/**
 *
 * @author NURUL SIDDIK
 */
public class RegNewUserVO extends LCBaseVO
{
    private String user_id;
    private String user_name;
    private String login_name;
    private String password;
    private String user_type;
    private String description;
    private String email;
    public String getUser_id()
    {
        return user_id;
    }

    public void setUser_id(String user_id)
    {
        this.user_id = user_id;
    }

    public String getUser_name()
    {
        return user_name;
    }

    public void setUser_name(String user_name)
    {
        this.user_name = user_name;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getUser_type()
    {
        return user_type;
    }

    public void setUser_type(String user_type)
    {
        this.user_type = user_type;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getLogin_name()
    {
        return login_name;
    }

    public void setLogin_name(String login_name)
    {
        this.login_name = login_name;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    /**
     * Holds value of property default_user_team.
     */
    private String default_user_team;

    /**
     * Getter for property default_user_team.
     * @return Value of property default_user_team.
     */
    public String getDefault_user_team()
    {
        return this.default_user_team;
    }

    /**
     * Setter for property default_user_team.
     * @param default_user_team New value of property default_user_team.
     */
    public void setDefault_user_team(String default_user_team)
    {
        this.default_user_team = default_user_team;
    }

}
