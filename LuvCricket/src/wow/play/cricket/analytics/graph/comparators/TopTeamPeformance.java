/*
 * TopTeamPeformance.java
 *
 * Created on March 28, 2007, 12:24 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.analytics.graph.comparators;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.CategoryItemLinkGenerator;
import de.laures.cewolf.tooltips.CategoryToolTipGenerator;
import java.io.Serializable;
import java.util.Date;
import java.util.Map;
import org.jfree.data.category.CategoryDataset;
import wow.play.cricket.analytics.logic.GraphGenerator;

/**
 *
 * @author jatan.porecha
 */
public class TopTeamPeformance implements DatasetProducer, CategoryToolTipGenerator, CategoryItemLinkGenerator,  Serializable
{
    
    /** Creates a new instance of TopTeamPeformance */
    public TopTeamPeformance()
    {
    }
    
    public String getProducerId()
    {
        return "Top Teams Peformance Graph";
    }
    
    public boolean hasExpired(Map map, Date date)
    {
        return true;
    }

    public String generateLink(Object object, int i, Object object0)
    {
        return "";
    }

    public String generateToolTip(CategoryDataset categoryDataset, int i, int i0)
    {
        return "";
    }
    
    public Object produceDataset(Map map) throws DatasetProduceException
    {
        Object obj = null;
        System.out.println("Coming HERE");
        try
        {
            obj = GraphGenerator.getInstance().giveTopTeamDataset(map);
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            throw (DatasetProduceException)(new DatasetProduceException()).initCause(ex);
        }
        catch(Throwable t)
        {
            t.printStackTrace();
        }
        
        return obj;
    }
    
}
