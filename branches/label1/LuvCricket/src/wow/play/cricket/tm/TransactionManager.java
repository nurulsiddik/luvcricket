/*
 * TransactionManager.java
 *
 * Created on 24 December 2006, 12:14
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.tm;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

/**
 *
 * @author NURUL SIDDIK
 */
public class TransactionManager
{
    private static SqlMapClient sqlMapper;
    private static TransactionManager objTM;
    private static Reader reader;
    
    static
    {
        try
        {
            objTM = new TransactionManager();
            reader = Resources.getResourceAsReader(objTM.getClass().getClassLoader(),"../SqlMapConfig.xml");
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
        }
        catch (Exception e)
        {
            // Fail fast.
            e.printStackTrace();
            throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
        }
    }
    
    /** Creates a new instance of TransactionManager */
    
    private TransactionManager(){}
    
    public static SqlMapClient getSQLInstance()
    {
        if(sqlMapper != null)
        {
            return sqlMapper;
        }
        else
        {
            return null;
        }
    }
    
}
