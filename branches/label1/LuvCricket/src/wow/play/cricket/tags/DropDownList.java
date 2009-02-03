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
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import org.apache.struts.taglib.TagUtils;
import wow.play.cricket.common.LCLogger;
import wow.play.cricket.common.LCUtils;
import wow.play.cricket.tm.TransactionManager;
import wow.play.cricket.vo.RefxVO;

/**
 *
 * @author Hemant.Bhatye
 * Last changed by $Author$ on $Date$ as $Revision$
 */
public class DropDownList extends TagSupport
{
    private String name;
    private String refx;
    private String sortby;
    private String emptyoption;
    private String onchange;
    private String size;
    private String baseelement;
    private String refxlist;
    private String multiselect;
    private String style;
    private String forcedvalue;
    
    /**
     * Returns the multiselect attribute.
     * @return multiselect attribute
     */
    public String getMultiselect()
    {
        return multiselect;
    }
    
    /**
     * Sets the multiselect attribute.
     * @param multiselect attribute
     */
    public void setMultiselect(String multiselect)
    {
        this.multiselect = multiselect;
    }
    
    
    
    /**
     * Returns the refxlist attribute.
     * @return refxlist attribute
     */
    public String getRefxlist()
    {
        return refxlist;
    }
    
    /**
     * Sets the refxlist attribute.
     * @param refxlist attribute
     */
    public void setRefxlist(String refxlist)
    {
        this.refxlist = refxlist;
    }
    
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
     * Returns the refx attribute.
     * @return refx attribute
     */
    public String getRefx()
    {
        return refx;
    }
    
    /**
     * Sets the refx attribute.
     * @param refx attribute
     */
    public void setRefx(String refx)
    {
        this.refx = refx;
    }
    
    /**
     * Returns the sortby attribute.
     * @return sortby attribute
     */
    public String getSortby()
    {
        return sortby;
    }
    
    /**
     * Sets the sortby attribute.
     * @param sortby attribute
     */
    public void setSortby(String sortby)
    {
        this.sortby = sortby;
    }
    
    /**
     * Returns the emptyoption attribute.
     * @return emptyoption attribute
     */
    public String getEmptyoption()
    {
        return emptyoption;
    }
    
    /**
     * Sets the emptyoption attribute.
     * @param emptyoption attribute
     */
    public void setEmptyoption(String emptyoption)
    {
        this.emptyoption = emptyoption;
    }
    
    /**
     * Returns the onchange attribute.
     * @return onchange attribute
     */
    public String getOnchange()
    {
        return onchange;
    }
    
    /**
     * Sets the onchange attribute.
     * @param onchange attribute
     */
    public void setOnchange(String onchange)
    {
        this.onchange = onchange;
    }
    
    
    /**
     * This method is called when the starting tag (e.g <dropdownlist> is encountered.)
     * @return EVAL_PAGE integer constant.
     * @throws javax.servlet.jsp.JspException if tag attributes are incorrect.
     */
    public int doStartTag() throws JspException
    {
        SqlMapClient sqlMap = null;
        try
        {
            sqlMap = TransactionManager.getSQLInstance();
            
            
            String strOldValue = "";
            try
            {
                
                if(!LCUtils.isNullOrBlank(getForcedvalue()))
                {
                    if(forcedvalue.equals("request"))
                    {
                        strOldValue = (String)pageContext.getRequest().getAttribute(getName());
                    }
                    else if("session".equals(forcedvalue))
                    {
                        strOldValue = (String)pageContext.getSession().getAttribute(getName());
                    }
                    else
                    {
                        strOldValue = getForcedvalue();
                    }    
                }
                else
                {
                    try
                    {
                        strOldValue = (String) TagUtils.getInstance().lookup(pageContext, "org.apache.struts.taglib.html.BEAN", getName(), null);
                    } 
                    catch (JspException ex)
                    {
                        //ex.printStackTrace();
                        strOldValue = null;
                    }
                    if(strOldValue == null)
                    {
                        strOldValue = (String) pageContext.getRequest().getAttribute(getName());
                    }
                    else if(strOldValue == null)
                    {
                        strOldValue = (String) pageContext.getSession().getAttribute(getName());
                    }

                }
                System.out.println("\n value for tag: "+getName()+" --> "+strOldValue);
            }
            catch (Exception ex)
            {
                LCLogger.debug("No old value for "+getName());
            }
            
            RefxVO refxVO = new RefxVO();
            JspWriter out = pageContext.getOut();
            String strCode = "";
            
            //All the attributes of selece tag go here
            strCode += "<select class='dropdownbox' name=\"" + getName() + "\"";
            
            if (!LCUtils.isNullOrBlank(getOnchange()))
            {
                strCode += " onchange=\""+getOnchange()+"\"";
            }
            
            if (!LCUtils.isNullOrBlank(getSize()))
            {
                strCode += " size=\""+getSize()+"\"";
            }
            
            if(!LCUtils.isNullOrBlank(baseelement))
            {
                strCode = strCode + " baseelement = '"+baseelement+"' ";
            }

            if(!LCUtils.isNullOrBlank(style))
            {
                strCode = strCode + " style = \""+style+"\" ";
            }
            
            if ("true".equals(getMultiselect()))
            {
                if (LCUtils.isNullOrBlank(getSize()) || Integer.parseInt(getSize()) <= 1)
                {
                    throw new JspException("Size attribute must be set to a value > 1 in order to use multiselect");
                }
                
                strCode += " multiple ";
            }
            
            strCode += ">";
            //select attributes end
            
            if ("true".equalsIgnoreCase(getEmptyoption()))
            {
                strCode += "<option value=\"\">-- Select Options --</option>";
            }
            
            if (!LCUtils.isNullOrBlank(getRefx()) && !LCUtils.isNullOrBlank(getRefxlist()))
            {
                throw new JspException("Use either refx or refxlist attribute in the dropdownlist tag");
            }
            
            if (!LCUtils.isNullOrBlank(getRefx()))
            {
                
                refxVO.setRefx_code(getRefx());
                String strSortby = getSortby();
                
                if ("value".equals(strSortby))
                {
                    refxVO.setSort_by("refx_value");
                }
                else //Sort by label if not specified
                {
                    refxVO.setSort_by("refx_label");
                }
                
                List lstRefx = sqlMap.queryForList("selectRefxVal", refxVO);
                
                //Build options
                int iSize = lstRefx.size();
                for (int i=0; i<iSize; i++)
                {
                    RefxVO refxResVO = (RefxVO)lstRefx.get(i);
                    strCode += "<option ";
                    if (refxResVO.getRefx_value().equals(strOldValue))
                    {
                        strCode += " selected ";
                    }
                    strCode += "value=\"" + refxResVO.getRefx_value()+ "\">" + refxResVO.getRefx_label()+ "</option>";
                }
            }
            else if (!LCUtils.isNullOrBlank(getRefxlist()))
            {
                //Get the value map from request object
                List<RefxVO> lstValues = (List)this.pageContext.getRequest().getAttribute(getRefxlist());
                if (lstValues == null)
                {
                    lstValues = (List)this.pageContext.getSession().getAttribute(getRefxlist());
                    if(lstValues == null)
                    {
                        throw new JspException("No refx list found in request or session object.:------ "+getRefxlist());
                    }
                    
                }
                int size = lstValues.size();
                String strSortby = getSortby();
                
               /* if ("value".equals(strSortby) || "label".equals(strSortby))
                {
                    Collections.sort(lstValues, new RefxComparator(strSortby));
                }*/
                
                for (int i=0; i<size; i++)
                {
                    RefxVO objRefx = lstValues.get(i);
                    String strValue = objRefx.getRefx_value();
                    String strLabel = objRefx.getRefx_label();
                    String strDesc = objRefx.getRefx_add_info();
                    strCode += " <option";
                    if (strValue.trim().equals(strOldValue))
                    {
                        strCode += " selected ";
                    }
                    strCode += " value=\""+strValue.trim()+"\" desc=\""+ strDesc + "\">" + strLabel+ "</option>";
                }
                
            }
            out.println(strCode);
        }
        catch (Exception ex)
        {
            if (ex instanceof JspException)
            {
                JspException jsEx = (JspException)ex;
                throw jsEx;
            }
            ex.printStackTrace();
            return SKIP_PAGE;
        }
        finally
        {
            try
            {
                sqlMap.endTransaction();
            } catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }
        
        return EVAL_PAGE;
    }
    
    /**
     * This method is called when the ending tag (e.g </dropdownlist> is encountered.)
     * @return EVAL_PAGE integer constant.
     */
    public int doEndTag()
    {
        try
        {
            JspWriter out = pageContext.getOut();
            out.println("</select>");
        }
        catch (IOException ex)
        {
            ex.printStackTrace();
        }
        return EVAL_PAGE;
    }
    
    /**
     * Returns the baseelement attribute.
     * @return baseelement attribute
     */
    public String getBaseelement()
    {
        return baseelement;
    }
    
    /**
     * Sets the baseelement attribute.
     * @param baseelement attribute
     */
    
    public void setBaseelement(String baseelement)
    {
        this.baseelement = baseelement;
    }

    /**
     * Returns the style attribute.
     * @return style attribute
     */
    public String getStyle()
    {
        return style;
    }

    /**
     * Sets the style attribute.
     * @param style attribute
     */
    public void setStyle(String style)
    {
        this.style = style;
    }

    public String getForcedvalue()
    {
        return forcedvalue;
    }

    public void setForcedvalue(String forcedvalue)
    {
        this.forcedvalue = forcedvalue;
    }
    
    
}
