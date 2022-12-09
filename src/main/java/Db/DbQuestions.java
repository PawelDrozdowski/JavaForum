/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Db;

import com.mycompany.javaforum.Question;
import com.mycompany.javaforum.User;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

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
        PreparedStatement st = con.prepareStatement
        ("SELECT questions.id as qId, userId, title, content, date, users.nick "
                + "FROM questions "
                + "LEFT JOIN USERS on users.id = questions.userId "
                + "WHERE questions.id = ?");

        st.setString(1, id);

        //execute statement
        ResultSet rs = st.executeQuery();

        Question question = getFromResultSet(rs);
        // Close all connections
        st.close();
        con.close();
        return question;
    }

    /**
     * return list of questions
     *
     * @param filterClauses leave empty to not filter
     * @param amount limit list size
     * @return
     * @throws SQLException
     * @throws NoSuchAlgorithmException
     * @throws ClassNotFoundException
     */
    public static LinkedList<Question> getDbQuestionList(String filterClauses, String amount)
            throws SQLException, NoSuchAlgorithmException, ClassNotFoundException {
        LinkedList<Question> output = new LinkedList<>();
        //establish connection
        Connection con = DbConnection.initializeDatabase();

        //prepare statement
        PreparedStatement st = con.prepareStatement("SELECT questions.id as qId, userId, title, content, date, users.nick "
                + "FROM questions "
                + "LEFT JOIN USERS on users.id = questions.userId " 
                + filterClauses 
                + " LIMIT " + amount);
        

        //execute statement
        ResultSet rs = st.executeQuery();
        
        //put results to list
        while (rs.next()) 
            output.add(buildQuestionFromResult(rs));
        
        // Close all connections
        st.close();
        con.close();
        return output;
    }

    public static boolean insertQuestion(String userId, String title, String content) {
        //establish connection
        try {
            Connection con = DbConnection.initializeDatabase();

            //prepare statement
            PreparedStatement st = con.prepareStatement("INSERT INTO `questions` (`id`, `userId`, `title`, `content`, `date`) VALUES (NULL, ?, ?, ?, current_timestamp())");

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
            return buildQuestionFromResult(rs);
        }
        return null;
    }

    private static Question buildQuestionFromResult(ResultSet rs) throws NumberFormatException, SQLException {
        User author = new User(rs.getString("userId"),"","",rs.getString("nick"));
        return new Question(rs.getString("qid"),
                rs.getString("userId"),
                rs.getString("title"),
                rs.getString("content"),
                rs.getString("date"),
                author,
                null);
    }
}
