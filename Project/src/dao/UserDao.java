package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDao {
//ログイン画面
	  public User findByLoginInfo(String loginId, String password) {
	        Connection conn = null;
	        try {

	            conn = DBManager.getConnection();


	            String sql = "SELECT * FROM user WHERE login_id = ? and password = ?";


	            PreparedStatement pStmt = conn.prepareStatement(sql);
	            pStmt.setString(1, loginId);
	            pStmt.setString(2, password);
	            ResultSet rs = pStmt.executeQuery();


	            if (!rs.next()) {
	                return null;
	            }

	            String loginIdData = rs.getString("login_id");
	            String nameData = rs.getString("name");
	            pStmt.close();
	            return new User(loginIdData, nameData);

	        } catch (SQLException e) {
	            e.printStackTrace();
	            return null;
	        } finally {

	            if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    return null;
	                }
	            }
	        }
	    }


//ユーザ一覧表
public List<User> findAll() {
    Connection conn = null;
    List<User> userList = new ArrayList<User>();

    try {

        conn = DBManager.getConnection();


        // TODO: 未実装：管理者以外を取得するようSQLを変更する
        String sql = "SELECT * FROM user";


        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);



        while (rs.next()) {
            int id = rs.getInt("id");
            String loginId = rs.getString("login_id");
            String name = rs.getString("name");
            Date birthDate = rs.getDate("birth_date");
            String password = rs.getString("password");
            String createDate = rs.getString("create_date");
            String updateDate = rs.getString("update_date");
            User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

            userList.add(user);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return null;
    } finally {
        // データベース切断
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
    }
    return userList;
}


//ユーザー詳細
public User findByuserInfo(String id) {
    Connection conn = null;
    try {

        conn = DBManager.getConnection();


        String sql = "SELECT * FROM user WHERE id = ? ";


        PreparedStatement pStmt = conn.prepareStatement(sql);
        pStmt.setString(1, id);

        ResultSet rs = pStmt.executeQuery();


        if (!rs.next()) {
            return null;
        }
        int idData = rs.getInt("id");
        String loginIdData = rs.getString("login_id");
        String nameData = rs.getString("name");
        Date birthdateData = rs.getDate("birth_date");
        String createdateData = rs.getString("create_date");
        String updateData = rs.getString("update_date");
        return new User(idData,loginIdData,nameData,birthdateData,createdateData,updateData);

    } catch (SQLException e) {
        e.printStackTrace();
        return null;
    } finally {

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }



    }

}



//ユーザー新規
public void insertUserNew(String loginId,String password,String name,String birthDate) {
    Connection conn = null;
    try {

        conn = DBManager.getConnection();


        String sql = "INSERT INTO user(login_id,password,name,birth_date,create_date,update_date) VALUES(?,?,?,?,now(),now())";

        PreparedStatement pStmt = conn.prepareStatement(sql);
        pStmt.setString(1, loginId);
        pStmt.setString(2, password);
        pStmt.setString(3, name);
        pStmt.setString(4, birthDate);
       // pStmt.setString(5, createDate);
        //pStmt.setString(6, updateDate);

        int result = pStmt.executeUpdate();

        System.out.println(result);
        pStmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {


    }
}


public String testUserNew(String loginId) {
    Connection conn = null;
    String loginIdData = null;
    try {

        conn = DBManager.getConnection();


        String sql = "SELECT * FROM user WHERE login_id = ?";

        PreparedStatement pStmt = conn.prepareStatement(sql);
        pStmt.setString(1, loginId);



        ResultSet rs = pStmt.executeQuery();
        loginIdData = rs.getString("login_id");


        pStmt.close();

    } catch (SQLException e) {
    	e.printStackTrace();

    }

    return loginIdData;


}



//ユーザー更新


    	public void updateUser(String id,String password,String name,String birthDate) {
    	    Connection conn = null;
    	    try {

    	        conn = DBManager.getConnection();


    	        String sql = "UPDATE user SET password = ?,name = ?,birth_Date = ? WHERE id = ?";


    	        PreparedStatement pStmt = conn.prepareStatement(sql);


    	        pStmt.setString(1, password);
    	        pStmt.setString(2, name);
    	        pStmt.setString(3, birthDate);
    	        pStmt.setString(4, id);

    	        int result = pStmt.executeUpdate();

    	        System.out.println(result);
    	        pStmt.close();
    	    } catch (SQLException e) {
    	        e.printStackTrace();
    	    } finally {



    }
}
//ユーザー削除
    	public void deleteUser(String id) {
    	    Connection conn = null;
    	    try {

    	        conn = DBManager.getConnection();


    	        String sql = "DELETE FROM user WHERE id=?";


    	        PreparedStatement pStmt = conn.prepareStatement(sql);



    	        pStmt.setString(1, id);

    	        int result = pStmt.executeUpdate();

    	        System.out.println(result);
    	        pStmt.close();
    	    } catch (SQLException e) {
    	        e.printStackTrace();
    	    } finally {


    	    }


}
}