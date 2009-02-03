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
import javax.servlet.http.HttpSession;
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
public class Title extends TagSupport
{
    private String title;
    private String menubar;
    private String username;
    
    /**
     * Returns the title attribute.
     * 
     * @return title attribute
     */
    public String getTitle()
    {
        return title;
    }
    /**
     * Sets the title attribute.
     * 
     * @param title attribute
     */
    public void setTitle(String title)
    {
        this.title = title;
    }
    
    
    /**
     * Sets the title attribute.
     * 
     * @param title attribute
     */
    public void setMenubar(String menubar)
    {
        this.menubar = menubar;
    }
    /**
     * Returns the title attribute.
     * 
     * @return title attribute
     */
    public String getMenubar()
    {
        return menubar;
    }
    
    
      
    /**
     * This method is called when the starting tag (e.g <dropdownlist> is encountered.)
     * @return EVAL_PAGE integer constant.
     */
    public int doStartTag()
    {
        try
        {
            JspWriter out = pageContext.getOut();
            ServletRequest request = pageContext.getRequest();
            HttpSession session = pageContext.getSession();
            String user_name = (String) session.getAttribute("username");
            
            String strCode = "<tr>\n";
            
            if(!LCUtils.isNullOrBlank(getUsername()))
            {
                if(!"false".equals(user_name))
                {
                    strCode = strCode + "<td width=\"30%\"><font class=\"userwelcomelabel\">Welcome "+user_name+"</font></td>\n";
                }
            }
            strCode = strCode + "<td width=\"60%\" align=\"right\">";
            if(!LCUtils.isNullOrBlank(getMenubar()))
            {
                if(!"false".equals(menubar))
                {
                    strCode = strCode 
                            + "<script language=\"JavaScript1.2\" type=\"text/javascript\">\n"
                            +"screenMenu.writeMenuBar();"
                            +"</script>";
                }
                else
                {
                    strCode = strCode + "&nbsp;";
                }
            }
            strCode = strCode + "</td>";
            strCode = strCode + "<td align=\"center\" width=\"10%\"><img alt=\"LogOut\" src=\"/LuvCricket/images/logout.gif\" name=\"imgLogOut\" onclick=\"fnLogOut()\" style=\"cursor: Hand;\"></td>\n";
            strCode = strCode +"</tr>\n";

            if (!LCUtils.isNullOrBlank(getTitle()))
            {
                strCode += "<tr><td colspan=\"3\" class=\"pageheader\"><label>"+getTitle()+"</label></td></tr>";
            }
            else
            {
                strCode += "<tr><td colspan=\"3\" >&nbsp</td></tr>";
            }
            
                    
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
        LCLogger.debug("Ending Title tag...");
        return EVAL_PAGE;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }
    
    
}
