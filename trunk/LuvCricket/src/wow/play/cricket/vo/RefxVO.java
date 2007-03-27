/*
 * RefxVO.java
 *
 * Created on January 9, 2007, 5:36 PM
 *
 */

package wow.play.cricket.vo;

/**
 * Value Object class for refx table.
 */
public class RefxVO
{
    
    /**
     * Creates a new instance of RefxVO
     */
    public RefxVO()
    {
    }
    
    private String refx_code;
    private String refx_label;
    private String refx_value;
    private String refx_add_info;
    private String sort_by;
    
    /**
     * Returns the refx_code attribute.
     * @return refx_code attribute
     */
    public String getRefx_code()
    {
        return refx_code;
    }
    
    /**
     * Sets the refx_code attribute.
     * @param refx_code attribute
     */
    public void setRefx_code(String refx_code)
    {
        this.refx_code = refx_code;
    }
    
    /**
     * Returns the refx_label attribute.
     * @return refx_label attribute
     */
    public String getRefx_label()
    {
        return refx_label;
    }
    
    /**
     * Sets the refx_label attribute.
     * @param refx_label attribute
     */
    public void setRefx_label(String refx_label)
    {
        this.refx_label = refx_label;
    }
    
    /**
     * Returns the refx_value attribute.
     * @return refx_value attribute
     */
    public String getRefx_value()
    {
        return refx_value;
    }
    
    /**
     * Sets the refx_value attribute.
     * @param refx_value attribute
     */
    public void setRefx_value(String refx_value)
    {
        this.refx_value = refx_value;
    }
    
    /**
     * Returns the refx_add_info attribute.
     * @return refx_add_info attribute
     */
    public String getRefx_add_info()
    {
        return refx_add_info;
    }
    
    /**
     * Sets the refx_add_info attribute.
     * @param refx_add_info attribute
     */
    public void setRefx_add_info(String refx_add_info)
    {
        this.refx_add_info = refx_add_info;
    }
    
    /**
     * Returns the sort_by attribute.
     * @return sort_by attribute
     */
    public String getSort_by()
    {
        return sort_by;
    }
    
    /**
     * Sets the sort_by attribute.
     * @param sort_by attribute
     */
    public void setSort_by(String sort_by)
    {
        this.sort_by = sort_by;
    }
}
