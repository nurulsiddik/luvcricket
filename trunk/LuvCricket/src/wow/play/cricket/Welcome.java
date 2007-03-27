/*
 * Welcome.java
 *
 * Created on 20 December 2006, 22:04
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

/**
 *
 * @author NURUL SIDDIK
 */
public class Welcome
{
    private static SqlMapClient sqlMapper;
//    static
//    {
//        try
//        {
//            Reader reader = Resources.getResourceAsReader("/WEB-INF/SqlMapConfig.xml");
//            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
//            reader.close();
//        }
//        catch (IOException e)
//        {
//            // Fail fast.
//            throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
//        }
//    }
    
    /** Creates a new instance of Welcome */
    public Welcome()
    {
    }
    public void mytest()
    {
        System.out.println("Hello my test");
    }
    public void test()
    {
        try
        {
            System.out.println("Hello dear connecting");
            sqlMapper.queryForList("selectAllAccounts");
            System.out.println("After query");
        } 
        catch (Exception ex)
        {
            System.out.println("Exception occurred");
            ex.printStackTrace();
        }
        
    }
    
}
