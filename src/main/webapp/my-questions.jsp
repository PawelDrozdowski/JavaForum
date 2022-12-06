<%-- 
    Document   : my-questions
    Created on : 6 gru 2022, 17:33:51
    Author     : pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="PARTIAL/headDefault.html" />
        <title>My questions</title>
    </head>
    <body>
        <jsp:include page="PARTIAL/banner.jsp" />
        <div class="container body-content min-vh-100">    
            <h2 class="text-center">My questions</h2>
            <form class="d-flex col-md-8 offset-1 pb-3" method="GET">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">🔍</button>
                <input class="form-control me-sm-2 col-md-6 offset-1" type="text" id="search" name="search" placeholder="Search">
            </form>

            <%
                int postStart = 1;
                int postEnd = Integer.parseInt(getServletContext().getInitParameter("QuestionsPerPage"));
                for (int i = postStart; i <= postEnd; i++) {
            %>
            <div class="pb-3">
                <div class="card">
                    <div class="card-header text-end">
                        <p>Added: 21.11.2022 &emsp; Number of answers: X</p>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Question title <%=i%></h5>
                        <p class="card-text">Question content limited to X chars...</p>
                        <a href="question.jsp?id=<%=i%>" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>

            <%}%>

        </div>
        <jsp:include page="PARTIAL/footer.jsp" />
    </body>
</html>
