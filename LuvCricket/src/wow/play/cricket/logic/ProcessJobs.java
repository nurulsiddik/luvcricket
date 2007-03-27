/*
 * ProcessJobs.java
 *
 * Created on February 26, 2007, 12:49 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.logic;

import com.ibatis.sqlmap.client.SqlMapClient;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import wow.play.cricket.common.LCLogger;
import wow.play.cricket.tm.TransactionManager;
import wow.play.cricket.vo.LCTournamentVO;
import wow.play.cricket.vo.PlayerContributionVO;
import wow.play.cricket.vo.UserTeamDetailVO;
import wow.play.cricket.vo.UserTeamVO;

/**
 *
 * @author NURUL SIDDIK
 */
public class ProcessJobs
{
    private static ProcessJobs objPJ = null;
    /** Creates a new instance of ProcessJobs */
    private ProcessJobs()
    {
    }
    
    static
    {
        if(objPJ == null)
        {
            objPJ = new ProcessJobs();
        }
    }
    public static boolean lockTournamentChanges(String tournament_id, String next_lock_date) throws Exception
    {
        SqlMapClient objSql = null;
        boolean retFlag = false;
        try
        {
            //Fetch tournament details
            Tournament logicTour = new Tournament();
            LCTournamentVO objTourn = logicTour.fetchFullDetailsofTournament(tournament_id);
            
            String current_tournament_eff_date = objTourn.getNext_effective_date();
            
            objSql = TransactionManager.getSQLInstance();
            objSql.startTransaction();
            
            // Fetch user team for this tournament
            List<UserTeamVO> lstUserTeam = objSql.queryForList("selectUserTeamForTournament",tournament_id);
            
            if(lstUserTeam != null && lstUserTeam.size() > 0)
            {
                for(UserTeamVO objUserVO: lstUserTeam)
                {
                    String user_team_id = objUserVO.getUser_team_id();
                    UserTeamDetailVO objUserTeamDetail = (UserTeamDetailVO) objSql.queryForObject("fetchLatestUserTeam",user_team_id);
                    if(objUserTeamDetail != null)
                    {
                        String user_team_eff_date = objUserTeamDetail.getEffective_date();
                        LCLogger.debug("Checking USER TEAM ID: "+user_team_id +" EFFECTIVE DATE : "+user_team_eff_date);
                        if(current_tournament_eff_date.equals(user_team_eff_date))
                        {
                            LCLogger.debug("DO NOTHING.... for "+user_team_id+" SINCE THE USER HAVE ALREADY UPDATED.");
                        }
                        else
                        {
                            LCLogger.debug("INSERT A RECORD FOR USER_TEAM: "+user_team_id+" WITH DATE :"+current_tournament_eff_date);
                            objUserTeamDetail.setEffective_date(current_tournament_eff_date);
                            objUserTeamDetail.setNumber_of_changes("0");
                            objSql.insert("insertUserTeamPlayers",objUserTeamDetail);
                        }
                    }
                }
            }
            //Update tournament effective date
            LCLogger.debug("UPDATE TOURNAMENT WITH EFFECTIVE DATE: "+next_lock_date);
            Map paramMap = new HashMap();
            paramMap.put("tournament_id",tournament_id);
            paramMap.put("next_effective_date",next_lock_date);
            objSql.update("setNextEffDate",paramMap);
            objSql.commitTransaction();
            retFlag = true;
        }
        finally
        {
            objSql.endTransaction();
        }
        return retFlag;
    }
    
    
    public static void updatePoints(String[] aryUserTeamid,String tournament_id,String match_date) throws Exception
    {
        if(aryUserTeamid != null && aryUserTeamid.length > 0)
        {
            UserTeam userTeamLogic = UserTeam.getInstance();
            List<PlayerContributionVO> lst_player_points = userTeamLogic.fetchPlayerPointsForMatchDate(match_date,tournament_id);
            if(lst_player_points == null || lst_player_points.size() == 0)
            {
                LCLogger.info("NO MATCH FOUND OR SCORES ENTERED FOR THE DAY");
            }
            else
            {
                //Convert to map for fast searching.
                Map<String,String> mapPlayerPoints = new HashMap<String,String>();
                for(PlayerContributionVO objVO: lst_player_points)
                {
                    mapPlayerPoints.put(objVO.getPlayer_id(),objVO.getPlayer_points());
                }
                //update for each team in single
                for (int i = 0; i < aryUserTeamid.length; i++)
                {
                    String strUserTeam = aryUserTeamid[i].trim();
                    UserTeamDetailVO userTeamVO = userTeamLogic.fetchUserTeamForDate(strUserTeam,match_date);
                    
                    if(userTeamVO != null)
                    {
                        
                        //Now match each player in the map and if found count the point
                        int total_points = 0;
                        
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer1()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer1()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer2()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer2()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer3()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer3()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer4()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer4()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer5()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer5()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer6()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer6()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer7()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer7()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer8()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer8()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer9()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer9()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer10()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer10()));
                        }
                        if(mapPlayerPoints.containsKey(userTeamVO.getPlayer11()))
                        {
                            total_points += Integer.parseInt(mapPlayerPoints.get(userTeamVO.getPlayer11()));
                        }
                        userTeamVO.setTeam_points(total_points+"");
                        userTeamLogic.updateUserTeamPoints(userTeamVO);
                    }
                }
                Tournament logicTourn = new Tournament();
                logicTourn.updateLastPointsUpdated(tournament_id,match_date);
            }
            
            
        }
    }
    
}
