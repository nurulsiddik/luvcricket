/*
 * MMTMessageCacher.java
 *
 * Created on December 22, 2006, 11:46 AM
 *
 */

package wow.play.cricket.common;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.ResourceBundle;
import wow.play.cricket.vo.LCMessageVO;

/**
 * This is a singleton class it manages the messeges that are going to be used 
 * in the application.
 * The messages are going to be cached in the beginning and then will be fetched
 * from the cache when requested.
 * @author Narul Siddik
 */
public class LCMessageManager
{
    private static final String KEY_DELIMITER = "\\!";
    private static final String MSG_DELIMITER = "\\^";
    /**
     * Map containing the number of message files that are to be cached.
     * Key:- Message file identifier
     * Value:- Message file name prefix except the locale information.
     *         eg. for Mmt_Msg_en_US.properties only Mmt_Msg is the value
     */
    private static Map messageFileMap = new HashMap(); 
    
    /**
     * This map contains all the cached messages.
     */
    private static Map mmtMessagesMap = new HashMap();
    /**
     * This is an object of this class itself. The same instance will be 
     * returned for all the request.
     */
    private static final LCMessageManager objMsgManager;

    static 
    {
        //List all the message files in the map
        messageFileMap.put("main","LC_Msg");
        
        //Instantiating singleton object
        objMsgManager = new LCMessageManager();
        objMsgManager.loadAllMessageFiles();
    }
    
    /**
     * This function will return the instance of this class.
     * Since this is a singleton class this function ensures that only one 
     * instance is shared.
     * @return LCMessageManager 
     */
    public static final LCMessageManager getInstance()
    {
        return objMsgManager;
    }
    
    /**
     * This function initiates the procedure of caching all the message files.
     */
    private void loadAllMessageFiles()
    {
        Iterator msgFileIter = messageFileMap.keySet().iterator();
        while(msgFileIter.hasNext())
        {
            String msgKey = (String) msgFileIter.next();
            String msgFile = (String) messageFileMap.get(msgKey);
            loadMessageFile(msgKey,msgFile);
        }
    }
    
    /**
     * This function loads/refresh specific message file in the cache.
     * @param fileKey String message file key
     * @param fileName String message file
     */
    private void loadMessageFile(String fileKey,String fileName)
    {
        ResourceBundle msgResource = ResourceBundle.getBundle(fileName);
        Enumeration keys = msgResource.getKeys();
        
        Map messageMap = new HashMap();
        while(keys.hasMoreElements())
        {
            String msgKey = (String)keys.nextElement();
            String msgStr = (String)msgResource.getString(msgKey);
            //Splitting message string to find out the type of message;
            String msgText = "";
            String msgType = "I";
            String[] msgAry = msgStr.split(MSG_DELIMITER);

            if(msgAry.length > 0)
            {
                msgText = msgAry[0];
            }
            if(msgAry.length > 1)
            {
                msgType = msgAry[1];
            }
            messageMap.put(msgKey,new LCMessageVO(msgKey,msgText,msgType));
        }
        mmtMessagesMap.put(fileKey,messageMap);
    }
    
    /**
     * This function returns the Message text for the supplied message id.
     * @param msgKey The message key can contain the indicative message 
     * namespace or it cancontain only the message id.e.g main!msg_key or 
     * msg_key
     * 
     * @return String Message Text
     */
    public static String getMessage(String msgKey)
    {
        String returnMessageTxt="";
        //Parse message key to know the message file
        LCMessageVO msgVO = getMessageVo(msgKey);
        returnMessageTxt = msgVO.getMessageString();
        return returnMessageTxt;
    }
    
    /**
     * This function returns the type of the message.
     * e.g debug,info,warning,error,fatalerror
     * @param msgKey The message key can contain the indicative message 
     * namespace or it can contain only the message id.e.g main!msg_key or 
     * msg_key
     * @return String, type of message e.g debug,info,warning,error,fatalerror
     */
    public static String getMessageType(String msgKey)
    {
        String returnMessageType="";
        LCMessageVO msgVO = getMessageVo(msgKey);
        returnMessageType = msgVO.getMessageType();
        return returnMessageType;
    }
    
    /**
     * This function returns VO which have the whole information of the 
     * particular message
     * 
     * @param msgKey The message key can contain the indicative message 
     * namespace or it can contain only the message id.e.g main!msg_key or 
     * msg_key
     * @return LCMessageVO object
     */
    public static LCMessageVO getMessageVo(String msgKey)
    {
        //Parse message key to know the message file
        String[] msgAry = msgKey.split(KEY_DELIMITER);
        String msgFile = "main";
        String msgId;
        if(msgAry.length > 1)
        {
            msgFile = msgAry[0];
            msgId = msgAry[1];
        }
        else
        {
            msgId = msgAry[0];
        }
        Map msgMap = (Map)mmtMessagesMap.get(msgFile);
        return (LCMessageVO)msgMap.get(msgId);
    }
    
    /**
     * This function returns the Message string by replacing the parameters with
     * the supplied values.
     * @param msgKey String Message Id.
     * @param arguments String Array containing argument values.
     * @return String Message text.
     */
    public static String getMessage(String msgKey, String[] arguments)
    {
        int lentArg = arguments.length;
        String msgTxt = getMessageVo(msgKey).getMessageString();
        
        for(int i =0; i < lentArg; i++)
        {
            msgTxt = msgTxt.replaceAll("\\%s"+i,arguments[i]);
        }
        return msgTxt;
    }
    
    /*
        String msgTxt = "%s1 Mera Naam is %s2 this %s1 great."; 
        String arguments[] = {"one","two"};
        int lentArg = arguments.length;
      
        for(int i =0; i < lentArg; i++)
        {
            msgTxt = msgTxt.replaceAll("\\%s"+(i+1),arguments[i]);
        }
        
        System.out.println(msgTxt);

     */
    /*
     *        String msgTxt = getLCMessageVo(msgKey).getMessageString();
        boolean lastIsDelim = false;
        int countArgPlace = 0;
        if(msgTxt.substring(msgTxt.length() - 2).equals("%s"))
        {
            lastIsDelim = true;
            countArgPlace++;
        }
        // Split the message with %s delimiter 
        String conString = "";
        String [] strAry = msgTxt.split("\\%s");

        countArgPlace += strAry.length - 1;
        if(arguments.length < countArgPlace)
        {
            System.out.println("INSUFFICIENT ARGUMENTS SUPPLIED... REQUIRED :"+countArgPlace+" SUPPLIED :"+arguments.length);
            //throw new Exception("Insufficient Arguments");
        }
        
        for(int i=0,argCount = 0 ; i<strAry.length -1; i++, argCount++)
        {
            conString += strAry[i] + arguments[argCount];
        }
        conString += strAry[strAry.length  -1];
        if(lastIsDelim)
        {
            conString += arguments[arguments.length-1];
        }
        
        return conString;
*/
}
