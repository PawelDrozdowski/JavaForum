<%-- 
    Document   : login
    Created on : 23 lis 2022, 11:03:48
    Author     : pawel
--%>

<%@page import="com.mycompany.javaforum.Helpers"%>
<%@page import="com.mycompany.javaforum.User"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) (request.getSession().getAttribute("user"));
    //redirect if already logged in
    if (user != null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    //try to log in
    String emailPOST = request.getParameter("email");
    String passwordPOST = request.getParameter("password");
    user = getUser(emailPOST, passwordPOST);

    if (user != null) {
        request.getSession().setAttribute("user", user);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="PARTIAL/headDefault.html" />
        <title>Log in</title>
    </head>
    <body>
        <jsp:include page="PARTIAL/banner.jsp" />
        <div class="container body-content">
            <h2>Log in</h2>
            <form method="POST">
                <%=user == null && emailPOST != null ? "<p>bad login data</p>" : ""%>

                <div class="mb-3 col-6">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>

                <div class="mb-3 col-6">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>

                <button type="submit" class="btn btn-primary">Log in</button>
            </form>

            <jsp:include page="PARTIAL/footer.html" />
        </div>
    </body>
</html>

<%!
    private User getUser(String email, String passwordPOST) {
        if ("".equals(email) || "".equals(passwordPOST)) {
            return null;
        }
        try {
            String passwordHash = Helpers.hash(passwordPOST);
            String xPathExp = "/users/user[email='" + email + "'][password='" + passwordHash + "']";
            String xmlUrl = getServletContext().getRealPath("/TEMP_DATA_SOURCE/users.xml");
            NodeList nodeList = Helpers.getNodeList(xmlUrl, xPathExp);

            Node node = nodeList.item(0);
            if (node != null) {
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) node;
                    int id = Integer.parseInt(eElement.getElementsByTagName("id").item(0).getTextContent());
                    String password = eElement.getElementsByTagName("password").item(0).getTextContent();
                    String nick = eElement.getElementsByTagName("nick").item(0).getTextContent();
                    return new User(id, email, password, nick);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
%>
