/*
 * Tournament.java
 *
 * Created on January 28, 2007, 11:36 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.logic;

import com.ibatis.sqlmap.client.SqlMapClient;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import wow.play.cricket.tm.TransactionManager;
import wow.play.cricket.vo.LCTournamentVO;
import wow.play.cricket.vo.RefxVO;
import wow.play.cricket.vo.RulesVO;
import wow.play.cricket.vo.TournamentChangesVO;
import wow.play.cricket.vo.TournamentMatchesVO;
import wow.play.cricket.vo.TournamentPlayerVO;
import wow.play.cricket.vo.TournamentVO;

/**
 *
 * @author NURUL SIDDIK
 */
public class Tournament
{
    SqlMapClient objSql = null;
    /** Creates a new instance of Tournament */
    public Tournament()
    {
    }
    
    public void insertRecord(TournamentVO objVO) throws Exception
    {
        
        try
        {
            String tournament_id = getNextTournamentId() + "";
            objVO.setTournament_id(tournament_id);
            
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            
            objSql.insert("insertTournament",objVO);
            //Set Tournament id.
            List lstTourChanges = objVO.getTournament_changes();
            int lstCount = lstTourChanges.size();
            for (int i = 0; i < lstCount ; i++)
            {
                TournamentChangesVO objTCVO = (TournamentChangesVO)lstTourChanges.get(i);
                objTCVO.setTournament_id(tournament_id);
                objSql.insert("insertTournamentChanges",objTCVO);
            }
            objSql.commitTransaction();
            
        }
        finally
        {
            objSql.endTransaction();
        }
    }
    
    private int getNextTournamentId() throws Exception
    {
        int retValue = 0;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Integer maxId = (Integer)objSql.queryForObject("maxTournamentId");
            System.out.println("MAX ID "+maxId);
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
    
    public List fetchActiveTournament() throws Exception
    {
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchAllTournaments");
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public List fetchCountriesForTournament(String tournament_id) throws Exception
    {
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchTournamentCountries",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
        
    }
    
    public List fetchActiveCountriesForTournament(String tournament_id) throws Exception
    {
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchActiveCountriesForTournament",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
        
    }
    
    public List fetchAssociatedPlayers(String tournament_id) throws Exception
    {
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchAssociatedPlayers",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
        
    }
    public void associatePlayersToTournament(String tournament_id,List playerList) throws Exception
    {
        try
        {
            objSql = TransactionManager.getSQLInstance();
            
            objSql.startTransaction();
            // delete existing association
            objSql.delete("deletePlayerAssociation",tournament_id);
            int countPlayer = playerList.size();
            for (int i = 0; i < countPlayer; i++)
            {
                TournamentPlayerVO objVO = (TournamentPlayerVO)playerList.get(i);
                objVO.setTournament_id(tournament_id);
                objSql.insert("insertTournamentPlayers",objVO);
            }
            
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
    }
    
    public LCTournamentVO fetchFullDetailsofTournament(String tournament_id) throws Exception
    {
        LCTournamentVO objVO = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objVO = (LCTournamentVO)objSql.queryForObject("fetchTournamentAllDetails",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return objVO;
        
    }
    
    public RulesVO fetchRules(String tournament_id) throws Exception
    {
        RulesVO objVO =  null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objVO = (RulesVO)objSql.queryForObject("fetchRules",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return objVO;
    }
    
    public List<RefxVO> fetchMatchDates(String tournament_id) throws Exception
    {
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchTournMatchDates",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
        
    }
    
    public List<RefxVO> fetchMatchByDates(String tournament_id) throws Exception
    {
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Map paramMap = new HashMap();
            retList = objSql.queryForList("fetchTournMatchByDates",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
        
    }
    
    public void updateLastPointsUpdated(String tournament_id,String updated_date) throws Exception
    {
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Map paramMap = new HashMap();
            paramMap.put("tournament_id",tournament_id);
            paramMap.put("last_points_updated_date",updated_date);
            objSql.update("updateLastPointsUpdated",paramMap);
        }
        finally
        {
            objSql.endTransaction();
        }
        
    }
    
    public LCTournamentVO fetchPrevStageDetails(String tournament_id, String curr_stage_eff_date) throws Exception
    {
        LCTournamentVO objVO = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Map paramMap = new HashMap();
            paramMap.put("tournament_id",tournament_id);
            paramMap.put("stage_effective_date",curr_stage_eff_date);
            objVO = (LCTournamentVO)objSql.queryForObject("tournamentPrevStageDetails",paramMap);
        }
        finally
        {
            objSql.endTransaction();
        }
        return objVO;
    }
    
    public List fetchTournamentStages(String tournament_id) throws Exception
    {
        objSql = TransactionManager.getSQLInstance();
        return objSql.queryForList("fetchTournamentStages",Integer.valueOf(tournament_id));
    }
    
    public List<TournamentMatchesVO> fetchTournamentMatchesFromDate(String tournament_id, String fromdate) throws Exception
    {
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Map paramMap = new HashMap();
            paramMap.put("tournament_id",tournament_id);
            paramMap.put("match_date",fromdate);
            retList = objSql.queryForList("fetchTournamentMatchesFromDate",paramMap);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public Date fetchNextMatchDate(String tournament_id) throws Exception
    {
        Date retDate = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retDate = (Date) objSql.queryForObject("fetchNextMatchDate",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retDate;
    }

}
