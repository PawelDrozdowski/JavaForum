<%-- 
    Document   : register
    Created on : 23 lis 2022, 11:08:07
    Author     : pawel
--%>

<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page import="javax.xml.transform.dom.DOMSource"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="com.mycompany.javaforum.Helpers"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="com.mycompany.javaforum.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) (request.getSession().getAttribute("user"));
    //redirect if already logged in
    if (user != null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    //read POST
    String emailPOST = request.getParameter("email");
    String passwordPOST = request.getParameter("password");
    String passwordRetypePOST = request.getParameter("retype");
    String nickPOST = request.getParameter("nickname");

    boolean fieldsFilled = passwordPOST != null && nickPOST != null && emailPOST != null && passwordRetypePOST != null;
    boolean passwordRetypeCorrect = fieldsFilled && passwordPOST.equals(passwordRetypePOST);
    boolean validData = fieldsFilled && passwordRetypeCorrect && passwordPOST.length() > 2 && nickPOST.length() > 2 && emailPOST.length() > 2;

    boolean userAlreadyInDb = false;

    //find users with that email
    if (validData) {
        String xPathExp = "/users/user[email='" + emailPOST + "']";
        String xmlUrl = getServletContext().getRealPath("/TEMP_DATA_SOURCE/users.xml");
        NodeList nodeList = Helpers.getNodeList(xmlUrl, xPathExp);

        userAlreadyInDb = nodeList.getLength() > 0;
    }

    //register if new and valid
    if (!userAlreadyInDb && validData) {
        String passwordHash = Helpers.hash(passwordPOST);

        user = new User(User.firstFreeID++, emailPOST, passwordHash, nickPOST);

        pushNewUser(user);
        request.getSession().setAttribute("user", user);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
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

    private void pushNewUser(User user) {
        final String XML_PATH = getServletContext().getRealPath("/TEMP_DATA_SOURCE/users.xml");
        try {

            Document doc = Helpers.getXMLDoc(XML_PATH);
            Element root = doc.getDocumentElement();

            //create new user
            Element newUser = doc.createElement("user");

            //add id element to user
            Element id = doc.createElement("id");
            id.appendChild(doc.createTextNode(String.valueOf(user.id)));
            newUser.appendChild(id);

            //add email element to user
            Element email = doc.createElement("email");
            email.appendChild(doc.createTextNode(user.email));
            newUser.appendChild(email);

            //add password element to user
            Element password = doc.createElement("password");
            password.appendChild(doc.createTextNode(user.password));
            newUser.appendChild(password);

            //add nick element to user
            Element nick = doc.createElement("nick");
            nick.appendChild(doc.createTextNode(user.nick));
            newUser.appendChild(nick);

            //add new user to root
            root.appendChild(newUser);

            //save changes
            DOMSource source = new DOMSource(doc);
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            StreamResult result = new StreamResult(XML_PATH);
            transformer.transform(source, result);
        } catch (Exception e) {
        }
    }
%>
