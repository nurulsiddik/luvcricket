/*
 * LCMessageVO.java
 *
 * Created on December 22, 2006, 2:32 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.vo;

/**
 * This class holds the Value Objects related to Messages.
 * @author Narul.Siddik
 * @version $Revision$
 * Last changed by $Author$ on $Date$ as $Revision$
 */
public class LCMessageVO extends LCBaseVO
{
    private String messageId;
    private String messageString;
    private String messageType;
    
    /**
     * Creates a new instance of LCMessageVO
     */
    public LCMessageVO()
    {
    }

    /**
     * Class Constructor
     * @param msgId Message Key
     * @param msgString Message Text
     * @param msgType Message type
     */
    public LCMessageVO(String msgId,String msgString,String msgType)
    {
        this.messageId = msgId;
        this.messageString = msgString;
        this.messageType = msgType;
    }
    
    /**
     * Getter method for MessageId
     * @return MessageId
     */
    public String getMessageId()
    {
        return messageId;
    }

    /**
     * Setter method for MessageId
     * @param aMessageId Message Id
     */
    public void setMessageId(String aMessageId)
    {
        messageId = aMessageId;
    }

    /**
     * Getter method of Message String
     * @return Message text
     */
    public String getMessageString()
    {
        return messageString;
    }

    /**
     * Setter method of Message String
     * @param aMessageString Message String
     */
    public void setMessageString(String aMessageString)
    {
        messageString = aMessageString;
    }

    /**
     * Getter method of Message type
     * @return Message type
     */
    public String getMessageType()
    {
        return messageType;
    }

    /**
     * Setter method of message type
     * @param aMessageType Message type.
     */
    public void setMessageType(String aMessageType)
    {
        messageType = aMessageType;
    }
    
}
