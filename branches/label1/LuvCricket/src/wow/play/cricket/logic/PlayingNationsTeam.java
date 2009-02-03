/*
 * PlayingNationsTeam.java
 *
 * Created on January 30, 2007, 11:11 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.logic;

import com.ibatis.sqlmap.client.SqlMapClient;
import java.util.List;
import wow.play.cricket.tm.TransactionManager;
import wow.play.cricket.vo.LCCommonVO;
import wow.play.cricket.vo.PlayerContributionVO;
import wow.play.cricket.vo.PlayingNationsTeamVO;


/**
 *
 * @author NURUL SIDDIK
 */
public class PlayingNationsTeam
{
    private static PlayingNationsTeam objPlayingTeam = null;
    /** Creates a new instance of PlayingNationsTeam */
    private PlayingNationsTeam()
    {
    }
    static
    {
        if(objPlayingTeam == null)
        {
            objPlayingTeam = new PlayingNationsTeam();
        }
    }
    public static PlayingNationsTeam getInstance()
    {
        return objPlayingTeam;
    }
    public List fetchNations() throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchAllNations");
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    public List fetchNationPlayer(String countries_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchAllNationsPlayer",countries_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public PlayingNationsTeamVO fetchPlayer(String player_id) throws Exception
    {
        SqlMapClient objSql = null;
        PlayingNationsTeamVO objRetVO = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objRetVO = (PlayingNationsTeamVO) objSql.queryForObject("fetchPlayer",player_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return objRetVO;
    }
    public int insertPlayer(PlayingNationsTeamVO objPlayerVO) throws Exception
    {
        SqlMapClient objSql = null;
        int retInt = -1;
        try
        {
            int player_id = getNextPlayerId();
            objPlayerVO.setPlayer_id(player_id+"");
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            objSql.insert("insertPlayer",objPlayerVO);
            objSql.commitTransaction();
            retInt = player_id;
        }
        finally
        {
            objSql.endTransaction();
        }
        return retInt;
    }
    public void updatePlayer(PlayingNationsTeamVO objPlayerVO) throws Exception
    {
        SqlMapClient objSql = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            objSql.update("updatePlayer",objPlayerVO);
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
    }
    public void deletePlayer(String player_id) throws Exception
    {
        SqlMapClient objSql = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            objSql.delete("deletePlayer",player_id);
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
    }
    
    private int getNextPlayerId() throws Exception
    {
        SqlMapClient objSql = null;
        int retValue = 0;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Integer maxId = (Integer)objSql.queryForObject("maxPlayerId");
            if(maxId != null)
            {
                retValue = maxId.intValue() + 1;
            }
        }
        finally
        {
            objSql.endTransaction();
        }
        return retValue;
    }
    
    public List<LCCommonVO> fetchTopPlayers() throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("topPlayers");
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    public PlayerContributionVO fetchPlayerContribInTournament(String player_id) throws Exception
    {
        SqlMapClient objSql = null;
        PlayerContributionVO objRetVO = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objRetVO = (PlayerContributionVO) objSql.queryForObject("fetchPlayerContribInTournament",player_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return objRetVO;
        
    }
    
    
}
