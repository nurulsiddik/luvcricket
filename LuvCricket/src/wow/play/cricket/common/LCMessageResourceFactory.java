/*
 * MMTMessages.java
 *
 * Created on December 22, 2006, 10:58 AM
 *
 */
package wow.play.cricket.common;

import org.apache.struts.util.MessageResources;
import org.apache.struts.util.MessageResourcesFactory;

/**
 * Message Resource Factory
 * @author Narul Siddik
 */
public class LCMessageResourceFactory extends MessageResourcesFactory
{
    
    /** Creates a new instance of MMTMessages */
    public LCMessageResourceFactory()
    {
    }

    /**
     * Creates message resources
     * @param config Message resource config
     * @return MMT Message resource
     */
    public MessageResources createResources(String config)
    {
        return new LCMessageResource(this,config);
    }
}
