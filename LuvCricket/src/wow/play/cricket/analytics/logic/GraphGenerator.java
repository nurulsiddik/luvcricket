/*
 * GraphGenerator.java
 *
 * Created on March 28, 2007, 12:14 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.analytics.logic;

import com.ibatis.sqlmap.client.SqlMapClient;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jfree.data.category.DefaultCategoryDataset;
import wow.play.cricket.analytics.vo.TopTeamDataVO;
import wow.play.cricket.tm.TransactionManager;

/**
 *
 * @author jatan.porecha
 */
public class GraphGenerator
{
    private static GraphGenerator objGG;
    
    /** Creates a new instance of GraphGenerator */
    public GraphGenerator()
    {
    }
    
    static
    {
        if(objGG == null)
        {
            objGG = new GraphGenerator();
        }
    }
    public static GraphGenerator getInstance()
    {
        return objGG;
    }
    
    
    public DefaultCategoryDataset giveTopTeamDataset(Map map) throws Exception
    {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset()
        {
            /**
             * @see java.lang.Object#finalize()
             */
            protected void finalize() throws Throwable
            {
                super.finalize();
            }
        };
        
        SqlMapClient objSql = TransactionManager.getSQLInstance();
        Map<String,Integer> team_point_map = new HashMap<String,Integer>();
         
        List<TopTeamDataVO> retList = (List<TopTeamDataVO>)objSql.queryForList("topTeamGraph",map);
        int total_pt = 0;
        
        for(TopTeamDataVO data:retList )
        {
            Integer team_points = team_point_map.get(data.getUser_team_id());
            if(team_points == null)
            {
                total_pt = 0;
            }
            else
            {
                total_pt = team_points.intValue();
            }
            
            total_pt+=data.getTeam_points();
            
            team_point_map.put(data.getUser_team_id(),new Integer(total_pt));
            dataset.addValue(total_pt,data.getUser_team_id(),data.getDate());
            
        }
        
        return dataset;
    }
    
}
