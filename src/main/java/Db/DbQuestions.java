/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Db;

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
public class DbQuestions {
    public static Question getDbQuestion(String id)
            throws SQLException, NoSuchAlgorithmException, ClassNotFoundException {
        //establish connection
        Connection con = DbConnection.initializeDatabase();

        //prepare statement
        PreparedStatement st = con.prepareStatement("SELECT id, userId, title, content, date FROM questions WHERE id = ?");

        st.setString(1, id);

        //execute statement
        ResultSet rs = st.executeQuery();

        Question question = getFromResultSet(rs);
        // Close all connections
        st.close();
        con.close();
        return question;
    }

    public static boolean insertQuestion(String userId, String title, String content) {
        //establish connection
        try {
            Connection con = DbConnection.initializeDatabase();

            //prepare statement
            PreparedStatement st = con.prepareStatement
        ("INSERT INTO `questions` (`id`, `userId`, `title`, `content`, `date`) VALUES (NULL, ?, ?, ?, current_timestamp())");

            st.setString(1, userId);
            st.setString(2, title);
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
    
        private static Question getFromResultSet(ResultSet rs) throws SQLException {
        if (rs.isBeforeFirst()) {
            rs.first();
            int id = Integer.parseInt(rs.getString("id"));
            int userId = Integer.parseInt(rs.getString("userId"));
            return new Question(id,
                    userId,
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getString("date"));
        }
        return null;
    }
}
