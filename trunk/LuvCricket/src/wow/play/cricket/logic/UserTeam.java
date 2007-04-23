/*
 * UserTeam.java
 *
 * Created on February 13, 2007, 10:47 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.logic;

import com.ibatis.sqlmap.client.SqlMapClient;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import wow.play.cricket.tm.TransactionManager;
import wow.play.cricket.vo.LCCommonVO;
import wow.play.cricket.vo.LCTournamentVO;
import wow.play.cricket.vo.PlayerContributionVO;
import wow.play.cricket.vo.PlayingNationsTeamVO;
import wow.play.cricket.vo.RefxVO;
import wow.play.cricket.vo.UserTeamDetailVO;
import wow.play.cricket.vo.UserTeamDetail_1VO;
import wow.play.cricket.vo.UserTeamVO;


/**
 *
 * @author NURUL SIDDIK
 */
public class UserTeam
{
    private static UserTeam objUserTeam = null;
    /** Creates a new instance of UserTeam */
    private UserTeam()
    {
    }
    static
    {
        if(objUserTeam == null)
        {
            objUserTeam = new UserTeam();
        }
    }
    public static UserTeam getInstance()
    {
        return objUserTeam;
    }
    
    public static void createUserTeam(UserTeamVO objUserVO) throws Exception
    {
        
        SqlMapClient objSql = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            objSql.insert("createUserTeam",objUserVO);
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
    }
    
    public static List<RefxVO> fetchUserTeam(String user_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchUserTeam",user_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public static UserTeamVO selectUserTeam(String user_team_id) throws Exception
    {
        SqlMapClient objSql = null;
        UserTeamVO retVO = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retVO = (UserTeamVO) objSql.queryForObject("selectUserTeam",user_team_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retVO;
    }
    public static void updateUserTeam(UserTeamVO objUserVO) throws Exception
    {
        SqlMapClient objSql = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            objSql.update("updateUserTeam",objUserVO);
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
        
    }
    
    public static List fetchAllTheUserTeams(String user_team_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchAllTheUserTeams",user_team_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public static List<PlayingNationsTeamVO> fetchPlayerDetailForTeam(Map userTeamMap) throws Exception
    {
        String player1 = (Integer) userTeamMap.get("player1") + "";
        String player2 = (Integer) userTeamMap.get("player2") + "";
        String player3 = (Integer) userTeamMap.get("player3")+ "";
        String player4 = (Integer) userTeamMap.get("player4")+ "";
        String player5 = (Integer) userTeamMap.get("player5")+ "";
        String player6 = (Integer) userTeamMap.get("player6")+ "";
        String player7 = (Integer) userTeamMap.get("player7")+ "";
        String player8 = (Integer) userTeamMap.get("player8")+ "";
        String player9 = (Integer) userTeamMap.get("player9")+ "";
        String player10 = (Integer) userTeamMap.get("player10")+ "";
        String player11 = (Integer) userTeamMap.get("player11")+ "";
        String inClause =   player1 +"," + player2 +"," + player3 +"," + player4
                +"," + player5 +"," + player6 +"," + player7 +"," + player8
                +"," + player9 +"," + player10 +"," + player11;
        Map newParameterMap = new HashMap();
        newParameterMap.put("user_team_id",userTeamMap.get("user_team_id"));
        newParameterMap.put("inclause",inClause);
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList =  objSql.queryForList("userTeamPlayerDetails",newParameterMap);
            System.out.println("Retlist: "+retList.size());
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public static List<PlayingNationsTeamVO> fetchAllPlayerForTournament(String tournament_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("allPlayerDetails",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public static List<PlayingNationsTeamVO> fetchAllActiveCountriesPlayerDetails(String tournament_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("allActiveCountriesPlayerDetails",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public static void createUserTeamPlayers(UserTeamDetailVO objUserTeamDetailVO) throws Exception
    {
        
        String effective_date = objUserTeamDetailVO.getEffective_date();
        String user_team_id = objUserTeamDetailVO.getUser_team_id();
        SqlMapClient objSql = null;
        
        try
        {
            int totalPlayersChanged =  0;
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            
            
            UserTeamVO userTeam = (UserTeamVO) objSql.queryForObject("selectUserTeam",user_team_id);
            
            LCTournamentVO objTournamentVO = (LCTournamentVO) objSql.queryForObject("fetchTournamentAllDetails",userTeam.getTournament_id());
            
            //Delete the current effective date
            int rowsDeleted = objSql.delete("deleteUserTeamDetails",objUserTeamDetailVO);
            
            //Fetch the all the team and get the most current team to set the difference.
            List allDaysTeam = objSql.queryForList("fetchAllTheUserTeamsInVO",user_team_id);
            if(allDaysTeam == null || allDaysTeam.size() == 0 || !"1".equals(objTournamentVO.getTournament_status()))
            {
                //No teams for this user id.This is the first team so difference is 0
                totalPlayersChanged =  0;
            }
            else
            {
                //Find the number of players changed.
                //Fetch latest team in the database.
                UserTeamDetailVO latestTeam = (UserTeamDetailVO)allDaysTeam.get(0);
                
                totalPlayersChanged = computeChanges(objUserTeamDetailVO,latestTeam);
            }
            objUserTeamDetailVO.setNumber_of_changes(totalPlayersChanged+"");
            
            //Insert new team players
            objSql.insert("insertUserTeamPlayers",objUserTeamDetailVO);
            
            //Update player changes.
            userTeam.setNumber_of_changes(totalPlayersChanged+"");
            objSql.update("updateUserTeam",userTeam);
            
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
        
    }
    
    private static int computeChanges(UserTeamDetailVO newTeam, UserTeamDetailVO latestTeam)
    {
        int number_of_changes = 0;
        //Cache latestTeam for fast computing.
        Map latestTeamMap = new HashMap();
        latestTeamMap.put(latestTeam.getPlayer1(),"");
        latestTeamMap.put(latestTeam.getPlayer2(),"");
        latestTeamMap.put(latestTeam.getPlayer3(),"");
        latestTeamMap.put(latestTeam.getPlayer4(),"");
        latestTeamMap.put(latestTeam.getPlayer5(),"");
        latestTeamMap.put(latestTeam.getPlayer6(),"");
        latestTeamMap.put(latestTeam.getPlayer7(),"");
        latestTeamMap.put(latestTeam.getPlayer8(),"");
        latestTeamMap.put(latestTeam.getPlayer9(),"");
        latestTeamMap.put(latestTeam.getPlayer10(),"");
        latestTeamMap.put(latestTeam.getPlayer11(),"");
        
        if(!latestTeamMap.containsKey(newTeam.getPlayer1()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer2()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer3()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer4()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer5()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer6()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer7()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer8()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer9()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer10()))
        {
            number_of_changes++;
        }
        if(!latestTeamMap.containsKey(newTeam.getPlayer11()))
        {
            number_of_changes++;
        }
        
        
        return number_of_changes;
    }
    
    public static int totalChangesForTeam(String user_team_id) throws Exception
    {
        SqlMapClient objSql = null;
        int retValue = 0;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            
            UserTeamVO userTeam = (UserTeamVO) objSql.queryForObject("selectUserTeam",user_team_id);
            String tournament_id = userTeam.getTournament_id();
            
            Tournament logicTourn = new Tournament();
            LCTournamentVO tournamentVO = (LCTournamentVO)logicTourn.fetchFullDetailsofTournament(tournament_id);
            String stage_effective_date = tournamentVO.getStage_effective_date();
            
            Map paramMap = new HashMap();
            paramMap.put("user_team_id",user_team_id);
            paramMap.put("effective_date",stage_effective_date);
            
            
            Integer total_number_of_changes =(Integer) objSql.queryForObject("totalNumberOfChanges",paramMap);
            if(total_number_of_changes != null)
            {
                retValue = total_number_of_changes.intValue();
            }
            
        }
        finally
        {
            if(objSql != null)
            {
                objSql.endTransaction();
            }
            
        }
        return retValue;
    }
    
    public List<RefxVO> fetchAllUserTeamsForTournament(String tournament_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchUserTeamsForTournament",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
        
    }
    
    public List<PlayerContributionVO> fetchPlayerPointsForMatchDate(String match_date,String tournament_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Map param = new HashMap();
            param.put("tournament_id",tournament_id);
            param.put("match_date",match_date);
            retList = objSql.queryForList("fetchPlayerPointsForMatchDate",param);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
        
    }
    
    public UserTeamDetailVO fetchUserTeamForDate(String user_team_id,String effective_date) throws Exception
    {
        SqlMapClient objSql = null;
        UserTeamDetailVO retVO = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Map param = new HashMap();
            param.put("user_team_id",user_team_id);
            param.put("effective_date",effective_date);
            retVO =(UserTeamDetailVO) objSql.queryForObject("fetchUserTeamForDate",param);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retVO;
        
    }
    
    public void updateUserTeamPoints(UserTeamDetailVO userTeamDetVO) throws Exception
    {
        SqlMapClient objSql = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            objSql.update("updateTeamPoints",userTeamDetVO);
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
        
    }
    
    public UserTeamDetailVO fetchLatestUserTeam(String user_team_id) throws Exception
    {
        SqlMapClient objSql = null;
        UserTeamDetailVO retVO = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retVO = (UserTeamDetailVO) objSql.queryForObject("fetchLatestUserTeam",user_team_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retVO;
        
    }
    
    public Integer fetchTeamPoints(String user_team_id,String stage_effective_date) throws Exception
    {
        SqlMapClient objSql = null;
        Integer retInt = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Map param = new HashMap();
            param.put("user_team_id",user_team_id);
            param.put("effective_date",stage_effective_date);
            retInt = (Integer) objSql.queryForObject("sumTotalPoints",param);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retInt;
        
    }
    
    public List<LCCommonVO> fetchTopUserTeams() throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("topUserTeams");
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public List<LCCommonVO> fetchTopUserTeamsForTournamentStage(String tournament_id, String stage_effective_date, boolean addPredPoints) throws Exception
    {
        SqlMapClient objSql = null;
        List<LCCommonVO> retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            Map param = new HashMap();
            param.put("tournament_id",tournament_id);
            param.put("effective_date",stage_effective_date);
            retList = objSql.queryForList("fetchTopUserTeamsForTournamentStage",param);
            
            if(addPredPoints)
            {
                for (LCCommonVO elem : retList)
                {
                    String user_team_id = elem.getField1();
                    Integer team_points = (Integer) objSql.queryForObject("fetchTeamPointsForWinPrediction",user_team_id);
                    if(team_points == null)
                    {
                        team_points = new Integer(0);
                    }
                    System.out.println("TEAM : "+user_team_id + " POINTS "+ team_points.intValue());
                    elem.setField3( ( Integer.parseInt(elem.getField3()) + team_points.intValue())   + "");
                }
                
            }
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public List<UserTeamDetail_1VO> selectPredictedUserTeam(String user_team_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("selectPredictWinner",user_team_id);
            
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public void insertPredictTeamForUser(String user_team_id, List<UserTeamDetail_1VO> predictedTeamList) throws Exception
    {
        SqlMapClient objSql = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            objSql.delete("deletePredictWinner",user_team_id);
            
            for(UserTeamDetail_1VO objUTD: predictedTeamList)
            {
                objSql.insert("insertPredictWinner",objUTD);
            }
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
    }
    
    public List<UserTeamVO> fetchAllUserTeam() throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchAllUserTeam");
            
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public List<RefxVO> fetchAllEffectiveDates(String tournament_id) throws Exception
    {
        SqlMapClient objSql = null;
        List retList = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            retList = objSql.queryForList("fetchEffectiveDates",tournament_id);
        }
        finally
        {
            objSql.endTransaction();
        }
        return retList;
    }
    
    public String fetchPredictUserTeamWinner(String user_team_id) throws Exception
    {
        SqlMapClient objSql = null;
        Map resultMap = null;
        String retStr = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            resultMap = (HashMap) objSql.queryForObject("selectPredictWinnerTeam",user_team_id);
            if(resultMap != null)
            {
                retStr = (String)resultMap.get("predicted_team_id");
            }
            
        }
        finally
        {
            objSql.endTransaction();
        }
        return retStr;
    }
    
    public void insertPredictUserTeamWinner(String user_team_id, String predicted_team_id) throws Exception
    {
        SqlMapClient objSql = null;
        try
        {
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            objSql.delete("deletePredictWinnerTeam",user_team_id);
            
            Map paramMap = new HashMap();
            paramMap.put("user_team_id",user_team_id);
            paramMap.put("predicted_team_id",predicted_team_id);
            objSql.insert("insertPredictWinnerTeam",paramMap);
            objSql.commitTransaction();
        }
        finally
        {
            objSql.endTransaction();
        }
    }
}
