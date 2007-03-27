/*
 * LCException.java
 *
 * Created on 10 January 2007, 02:01
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.common.exception;

import wow.play.cricket.common.*;

/**
 *
 * @author NURUL SIDDIK
 */
public class LCException extends Exception
{
    private String[] argumentList;
    private String msgId;
    /** Creates a new instance of LCException */
    public LCException()
    {
        super();
    }
    
    public LCException(String msgid)
    {
        super(msgid);
        msgId = msgid;
    }
    
    public LCException(String msgid, String[] arglist)
    {
        super(msgid);
        msgId = msgid;
        argumentList = arglist;
    }
   
    public String[] getArgumentList()
    {
        return argumentList;
    }
    public String getErrorMessage()
    {
        if(argumentList == null || argumentList.length == 0)
        {
            return LCMessageManager.getInstance().getMessage(msgId);
        }
        else
        {
            return LCMessageManager.getInstance().getMessage(msgId,argumentList);
        }
    }
    public String getErrorMessageType()
    {
        return LCMessageManager.getInstance().getMessageType(msgId);
    }
    public String getErrorMessageCode()
    {
        return msgId;
    }
}
