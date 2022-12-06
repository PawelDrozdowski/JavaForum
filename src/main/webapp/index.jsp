<%-- 
    Document   : index
    Created on : 22 lis 2022, 22:00:03
    Author     : pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <jsp:include page="PARTIAL/headDefault.html" />
    <title>JSP Page</title>
</head>
<body>
    <jsp:include page="PARTIAL/banner.jsp" />
    <div class="container body-content min-vh-100 d-flex">    
        <!--Left block-->
        <div class="col-md-2 pt-lg-5">  
            <div class="sticky-top mt-2" style="top:2vh">
            <%
                int newPostStart = 1;
                int newPostEnd = Integer.parseInt(getServletContext().getInitParameter("NewQuestionsAmount"));
                for (int i = newPostStart; i <= newPostEnd; i++) {
            %>
            <div class="pb-3">
                <div class="card small">
                    <div class="card-header text-end p-4">
                        <p class="m-0">21.11.2022</p>   
                    </div>
                    <div class="card-body">
                        <h6 class="card-title">Question title <%=i%></h6>
                        <p class="card-text">Question content limited to X chars...</p>
                        <div class="d-flex justify-content-center align-items-center">
                            <a href="question.jsp?id=<%=i%>" class="btn btn-primary">More</a>
                        </div>

                    </div>
                </div>
            </div>
            <%}%>
            </div>
        </div>
        <!--Left block-->

        <!--Right block-->
        <div class="col-md-9 offset-1">
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
        <!--Right block-->

    </div>
    <jsp:include page="PARTIAL/footer.jsp" />
</body>
</html>
