<%-- 
    Document   : register
    Created on : 23 lis 2022, 11:08:07
    Author     : pawel
--%>

<%@page import="Db.DbUsers"%>
<%@page import="com.mycompany.javaforum.Helpers"%>
<%@page import="com.mycompany.javaforum.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) (request.getSession().getAttribute("user"));
    //redirect if already logged in
    if (user != null)
        response.sendRedirect(request.getContextPath() + "/index.jsp");

    //read POST
    String emailPOST = request.getParameter("email");
    String passwordPOST = request.getParameter("password");
    String passwordRetypePOST = request.getParameter("retype");
    String nickPOST = request.getParameter("nickname");
    
    //validate input
    boolean fieldsFilled = passwordPOST != null && nickPOST != null && emailPOST != null && passwordRetypePOST != null;
    boolean passwordRetypeCorrect = fieldsFilled && passwordPOST.equals(passwordRetypePOST);
    boolean validData = fieldsFilled && passwordRetypeCorrect && passwordPOST.length() > 2 && nickPOST.length() > 2 && emailPOST.length() > 2;

    //find users with that email
    boolean userAlreadyInDb = false;
    if (validData) {
        user = DbUsers.findByEmail(emailPOST);
        userAlreadyInDb = user != null;
    }

    //register if new and valid
    if (!userAlreadyInDb && validData) {
        String passwordHash = Helpers.hash(passwordPOST);

        if(DbUsers.insertUser(emailPOST, passwordHash, nickPOST))
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        else
            validData = false;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="PARTIAL/headDefault.html" />
        <title>JSP page</title>
    </head>
    <body>
        <jsp:include page="PARTIAL/banner.jsp" />
        <div class="container body-content min-vh-100">
            <h2>Register</h2>
            <form method="POST">
                <%=registerError(userAlreadyInDb, validData, emailPOST)%>

                <div class="mb-3 col-6">
                    <label for="email1" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email">
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>

                <div class="mb-3 col-6">
                    <label for="nickname" class="form-label">Nickname</label>
                    <input type="text" class="form-control" id="nickname" name="nickname">
                </div>

                <div class="mb-3 col-6">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>

                <div class="mb-3 col-6">
                    <label for="retype" class="form-label">Retype password</label>
                    <input type="password" class="form-control" id="retype" name="retype">
                </div>

                <button type="submit" class="btn btn-primary">Register</button>
            </form>

        </div>

        <jsp:include page="PARTIAL/footer.jsp" />
    </body>
</html>

<%!
    private String registerError(boolean userAlreadyInDb, boolean validData, String emailPOST) {
        if (userAlreadyInDb) {
            return "<p>User already in database</p>";
        } else if (!validData && emailPOST != null) {
            return "<p>Invalid register data</p>";
        }
        return "";
    }
%>
