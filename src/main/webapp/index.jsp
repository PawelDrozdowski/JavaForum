<%-- 
    Document   : index
    Created on : 22 lis 2022, 22:00:03
    Author     : pawel
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="com.mycompany.javaforum.Question"%>
<%@page import="Db.DbQuestions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String limit = getServletContext().getInitParameter("NewQuestionsAmount");
    LinkedList<Question> newQuestionsList = DbQuestions.getDbQuestionList("ORDER BY id DESC", limit);
    int contentLimit = Integer.parseInt(getServletContext().getInitParameter("QuestionContentPreviewLength"));
    request.setAttribute("contentLimit",contentLimit);
    request.setAttribute("newQuestionsList",newQuestionsList);
%>

<!DOCTYPE html>
<head>
    <jsp:include page="PARTIAL/headDefault.html" />
    <title>Ask me things</title>
</head>
<body>
    <jsp:include page="PARTIAL/banner.jsp" />
    <div class="container body-content min-vh-100 d-flex">    
        <!--Left block-->
        <div class="col-md-2 pt-4">  
            <h5 class="text-center">New questions:</h5>
            <div class="sticky-top mt-2" style="top:2vh">
                <c:forEach items="${newQuestionsList}" var="q">
                    <div class="pb-3">
                        <div class="card small">
                            <div class="card-header text-end p-4">
                                <p class="m-0">${q.date}</p>   
                            </div>
                            <div class="card-body">
                                <h6 class="card-title">${q.title}</h6>
                                <p class="card-text">
                                    ${contentLimit > q.content.length() ? q.content : q.content.substring(0,contentLimit)}
                                </p>
                                <div class="d-flex justify-content-center align-items-center">
                                    <a href="question.jsp?id=${q.id}" class="btn btn-primary">More</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>
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
