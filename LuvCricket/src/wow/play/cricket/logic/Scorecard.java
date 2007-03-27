/*
 * Scorecard.java
 *
 * Created on March 1, 2007, 10:09 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.logic;

import com.ibatis.sqlmap.client.SqlMapClient;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import wow.play.cricket.common.LCUtils;
import wow.play.cricket.tm.TransactionManager;
import wow.play.cricket.vo.PlayerContributionVO;
import wow.play.cricket.vo.RefxVO;
import wow.play.cricket.vo.ScorecardVO;
import wow.play.cricket.vo.TournamentMatchesVO;

/**
 *
 * @author NURUL SIDDIK
 */
public class Scorecard
{
    private static Scorecard objScore = null;
    /** Creates a new instance of Scorecard */
    private Scorecard()
    {
    }
    static
    {
        objScore = new Scorecard();
    }
    public static Scorecard getInstance()
    {
        return objScore;
    }
    
    public List <RefxVO> fetchAllTournamentsMatches(String tournament_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchAllTournamentMatches",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public TournamentMatchesVO selectMatchDetails(String match_id) throws Exception
    {
        SqlMapClient objSql = null;
        TournamentMatchesVO retVO = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retVO = (TournamentMatchesVO)objSql.queryForObject("selectMatchData",match_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retVO;
        
    }
    
    public List fetchScoreCardForTeam(String match_id,String innings) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Map paramMap = new HashMap();
            paramMap.put("match_id",match_id);
            paramMap.put("innings",innings);
            retList = objSql.queryForList("fetchScoreCard",paramMap);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
        
    }
    
    public List<RefxVO> fetchPlayersForMatch(String country_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchPlayersForMatch",country_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public void scoreCardUpdate(Map param) throws Exception
    {
        SqlMapClient objSql = null;
        try
        {
            TournamentMatchesVO tournMatVO = (TournamentMatchesVO) param.get("match_vo");
            List lst_scorecard_1 = (List) param.get("lst_scorecard_1");
            List lst_scorecard_2 = (List) param.get("lst_scorecard_2");
            
            objSql = TransactionManager.getSQLInstance();
            
            objSql.startTransaction();
            //Update match first;
            objSql.update("updateTournamentScorecard",tournMatVO);
            String match_id = tournMatVO.getMatch_id();
            
            //Delete existing score if any
            objSql.delete("deleteScorecard",match_id);
            
            //Insert all the scores
            //First Innings
            int size = lst_scorecard_1.size();
            for (int i = 0; i < size; i++)
            {
                ScorecardVO scoreVO = (ScorecardVO) lst_scorecard_1.get(i);
                scoreVO = (ScorecardVO) LCUtils.convertBlankToNull(scoreVO);
                objSql.insert("insertScorecard",scoreVO);
            }
            
            // Second innings
            size = lst_scorecard_2.size();
            for (int i = 0; i < size; i++)
            {
                ScorecardVO scoreVO = (ScorecardVO) lst_scorecard_2.get(i);
                scoreVO = (ScorecardVO) LCUtils.convertBlankToNull(scoreVO);
                objSql.insert("insertScorecard",scoreVO);
            }            
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
    }
    
    public static List<PlayerContributionVO> calculatePlayerContribution(String match_id) throws Exception
    {
        SqlMapClient objSql = null;
        List<PlayerContributionVO> retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("calculatePlayerContribution",match_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public static void savePlayerContribution(String match_id,List<PlayerContributionVO> lstPlayerContrib)throws Exception
    {
        SqlMapClient objSql = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            
            //delete currently contribution for this match
            objSql.delete("deletePlayerContribution",match_id);
            
            //insert 
            int size = lstPlayerContrib.size();
            for (int i = 0; i < size; i++)
            {
                objSql.insert("insertPlayerContribution",(PlayerContributionVO)lstPlayerContrib.get(i));
            }
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
    }
}
