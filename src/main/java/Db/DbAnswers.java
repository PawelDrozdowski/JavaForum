/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Db;

import com.mycompany.javaforum.Answer;
import com.mycompany.javaforum.Question;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author pawel
 */
public class DbAnswers {

    public static Answer getDbAnswer(String id)
            throws SQLException, NoSuchAlgorithmException, ClassNotFoundException {
        //establish connection
        Connection con = DbConnection.initializeDatabase();

        //prepare statement
        PreparedStatement st = con.prepareStatement("SELECT id, userId, title, content, date FROM answers WHERE id = ?");

        st.setString(1, id);

        //execute statement
        ResultSet rs = st.executeQuery();

        Answer answer = getFromResultSet(rs);
        // Close all connections
        st.close();
        con.close();
        return answer;
    }

    public static boolean insertAnswer(String questionId, String userId, String content) {
        //establish connection
        try {
            Connection con = DbConnection.initializeDatabase();

            //prepare statement
            PreparedStatement st = con.prepareStatement
        ("INSERT INTO `answers` (`id`, `questionId`, `userId`, `content`, `date`) VALUES (NULL, ?, ?, ?, current_timestamp())");

            st.setString(1, questionId);
            st.setString(2, userId);
            st.setString(3, content);
            st.executeUpdate();

            // Close all connections
            st.close();
            con.close();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    private static Answer getFromResultSet(ResultSet rs) throws SQLException {
        if (rs.isBeforeFirst()) {
            rs.first();
            return new Answer(rs.getString("id"),
                    rs.getString("userId"),
                    rs.getString("questionId"),
                    rs.getString("content"),
                    rs.getString("date"));
        }
        return null;
    }
}
