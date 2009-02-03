/*
 * DropDownList.java
 *
 * Created on January 9, 2007, 2:41 PM
 *
 * (c) Trigyn Technologies
 */

package wow.play.cricket.tags;

import com.ibatis.sqlmap.client.SqlMapClient;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import wow.play.cricket.common.LCLogger;
import wow.play.cricket.common.LCUtils;
import wow.play.cricket.tm.TransactionManager;
import wow.play.cricket.vo.RefxVO;

/**
 *
 * @author Hemant.Bhatye
 * Last changed by $Author$ on $Date$ as $Revision$
 */
public class Hidden extends TagSupport
{
    private String name;
    private String value;
    private String size;
    
    
    /**
     * Returns the size attribute.
     * @return size attribute
     */
    public String getSize()
    {
        return size;
    }
    
    /**
     * Sets the size attribute.
     * @param size attribute
     */
    public void setSize(String size)
    {
        this.size = size;
    }
    
    
    
    /**
     * Returns the name attribute.
     * @return name attribute
     */
    public String getName()
    {
        return name;
    }
    
    /**
     * Sets the name attribute.
     * @param name attribute
     */
    public void setName(String name)
    {
        this.name = name;
    }
    
    
      
    /**
     * This method is called when the starting tag (e.g <dropdownlist> is encountered.)
     * @return EVAL_PAGE integer constant.
     */
    public int doStartTag()
    {
        try
        {
            SqlMapClient sqlMap = TransactionManager.getSQLInstance();
            
            JspWriter out = pageContext.getOut();
            String strCode = "";
            ServletRequest request = pageContext.getRequest();
            String strValue = request.getParameter(getName());
            if(strValue == null)
            {
                strValue = (String)request.getAttribute(getName());
            }
            //All the attributes of selece tag go here
            strCode += "<input type='hidden' name=\"" + getName() + "\"";
            
            if (!LCUtils.isNullOrBlank(getSize()))
            {
                strCode += " size=\""+getSize()+"\"";
            }
            
            
            strCode += " value='"+strValue +"'>";
            //Attributes end
            request.setAttribute(getName(),strValue);
            out.println(strCode);
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        
        return EVAL_PAGE;
    }
    
    /**
     * This method is called when the ending tag (e.g </dropdownlist> is encountered.)
     * @return EVAL_PAGE integer constant.
     */
    public int doEndTag()
    {
        LCLogger.debug("Ending dropdownlist tag...");
        try
        {
            JspWriter out = pageContext.getOut();
            out.println("</input>");
        }
        catch (IOException ex)
        {
            ex.printStackTrace();
        }
        return EVAL_PAGE;
    }
    
    
}
