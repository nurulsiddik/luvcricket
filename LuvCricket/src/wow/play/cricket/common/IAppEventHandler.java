/*
 * IAppEventHandler.java
 *
 * Created on January 9, 2007, 2:09 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.common;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * An annotation tag which will be used to identify the Action class methods to be 
 * called on particular application event (e.g. create / modify) etc...
 * @author Jatan Porecha
 * @version $Revision$
 * Last changed by $Author$ on $Date$ as $Revision$
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface IAppEventHandler
{
    /**
     * Application event attribute of this annotation tag.
     */
    String appEvent();    
}
