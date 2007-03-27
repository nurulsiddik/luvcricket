/*
 * LCMessageResource.java
 *
 * Created on December 22, 2006, 11:24 AM
 *
 */

package wow.play.cricket.common;
import java.util.Locale;
import org.apache.struts.util.MessageResources;
import org.apache.struts.util.MessageResourcesFactory;

/**
 * MMT Message Resource
 * @author Narul Siddik
 * @version $Revision$
 * Last changed by $Author$ on $Date$ as $Revision$
 */
public class LCMessageResource extends MessageResources
{
    
    /**
     * Creates a new instance of LCMessageResource
     * @param factory Message Resource factory
     * @param config Message resource configuration name.
     */
    public LCMessageResource(MessageResourcesFactory factory,String config)
    {
        super(factory,config);
    }

    /**
     * This function returns the message text for the supplied id.
     * @param locale Locale 
     * @param string Message key
     * @return Message text. 
     */
    public String getMessage(Locale locale, String string)
    {
       LCMessageManager objMsg = LCMessageManager.getInstance();
        return objMsg.getMessage(string);
    }
}
