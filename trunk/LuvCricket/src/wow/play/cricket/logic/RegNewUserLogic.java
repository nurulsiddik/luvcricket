/*
 * RegNewUserLogic.java
 *
 * Created on 27 December 2006, 23:59
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wow.play.cricket.logic;

import com.ibatis.sqlmap.client.SqlMapClient;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import wow.play.cricket.common.exception.LCException;
import wow.play.cricket.tm.TransactionManager;
import wow.play.cricket.vo.RegNewUserVO;

/**
 *
 * @author NURUL SIDDIK
 */
public class RegNewUserLogic
{
    SqlMapClient sqlTM = null;
    /** Creates a new instance of RegNewUserLogic */
    public RegNewUserLogic()
    {
        sqlTM = TransactionManager.getSQLInstance();
    }
    
    public void insertRecord(RegNewUserVO objVO) throws SQLException,LCException
    {
        try
        {
            List userList = fetchAllUser();
            if(userList != null && userList.size() > 0)
            {
                int userCount = userList.size();
                for(int i=0; i<userCount; i++)
                {
                    RegNewUserVO objUserVo = (RegNewUserVO) userList.get(i);
                    System.out.println("Login name: "+objUserVo.getLogin_name());
                    if(objVO.getLogin_name().equals(objUserVo.getLogin_name()))
                    {
                        System.out.println("THROW");
                        String argList[] = {objVO.getLogin_name(),objUserVo.getUser_id()+""};
                        throw new LCException("user.registered",argList);
                    }
                }
            }
            sqlTM.startTransaction();
            sqlTM.insert("insertNewRegistration",objVO);
            sqlTM.commitTransaction();
        }
        finally
        {
            sqlTM.endTransaction();
        }
    }
    public RegNewUserVO fetchUserDataFromName(RegNewUserVO paramVO) throws SQLException,LCException
    {
        RegNewUserVO objVO;
        try
        {
            sqlTM.startTransaction();
            objVO = (RegNewUserVO) sqlTM.queryForObject("selectRegUserFromId",paramVO);
            sqlTM.commitTransaction();
            
        }
        finally
        {
            sqlTM.endTransaction();
        }
        return objVO;
        
    }
    public List fetchAllUser() throws SQLException,LCException
    {
        List userList = null;
        try 
        {
            userList = sqlTM.queryForList("selectAllRegUser");
            System.out.println("USERLIST "+userList);
            if(userList != null)
            {
                System.out.println(userList.size());
            }
        }
        finally
        {
            sqlTM.endTransaction();
        }
        
        return userList;
    }
    
    public void updateUserData(RegNewUserVO userVO) throws Exception
    {
        try 
        {
            sqlTM.startTransaction();
            sqlTM.update("updateUserData",userVO);
            sqlTM.commitTransaction();
        }
        finally
        {
            sqlTM.endTransaction();
        }
        
    }
    public void updateUserDefaultTeam(String user_id, String user_team_id) throws Exception
    {
        try 
        {
            sqlTM.startTransaction();
            Map param = new HashMap();
            param.put("user_id",user_id);
            param.put("default_user_team",user_team_id);
            sqlTM.update("updateUserDefaultTeam",param);
            sqlTM.commitTransaction();
        }
        finally
        {
            sqlTM.endTransaction();
        }
        
    }
    
}
