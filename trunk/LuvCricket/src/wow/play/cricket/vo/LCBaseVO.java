/*
 * LCBaseVO.java
 *
 * Created on January 16, 2007, 10:33 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 *
 * @author NURUL SIDDIK
 */
public class LCBaseVO
{
    private String msg_id;
    private String sql_error;

    public String getMsg_id()
    {
        return msg_id;
    }

    public void setMsg_id(String msg_id)
    {
        this.msg_id = msg_id;
    }

    public String getSql_error()
    {
        return sql_error;
    }

    public void setSql_error(String sql_error)
    {
        this.sql_error = sql_error;
    }
}
