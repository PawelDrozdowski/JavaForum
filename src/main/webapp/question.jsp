<%-- 
    Document   : question
    Created on : 23 lis 2022, 12:52:54
    Author     : pawel
--%>

<%@page import="com.mycompany.javaforum.Answer"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.mycompany.javaforum.Question"%>
<%@page import="Db.DbAnswers"%>
<%@page import="com.mycompany.javaforum.User"%>
<%@page import="Db.DbQuestions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    //load question
    Question question = DbQuestions.getDbQuestion(request.getParameter("id"));
    request.setAttribute("question", question);
%>  
<%
    //insert answer from POST
    String errorMessage = "";
    if (request.getMethod().equals("POST")) {
        //read POST
        String questionId = request.getParameter("questionId");
        String userId = request.getParameter("userId");
        String contentPOST = request.getParameter("content");

        //validate input
        boolean validData = contentPOST != null && contentPOST.length() > 4;

        //insert if valid
        if (validData) {
            if (DbAnswers.insertAnswer(questionId, userId, contentPOST)) {
                response.sendRedirect(request.getContextPath() + "/question.jsp?id=" + questionId);
                return;
            } else {
                errorMessage = "Internal server error";
            }
        } else {
            errorMessage = "Invalid data";
        }
    }
%>
<!DOCTYPE html>
<head>
    <jsp:include page="PARTIAL/headDefault.html" />
    <title>${question.title}</title>
</head>
<body>
    <jsp:include page="PARTIAL/banner.jsp" />
    <div class="container body-content min-vh-100">
        <h1>${question.title}</h1>
        <hr/>

        <div class="card mb-3">
            <div class="card-header text-end">
                <p>${question.questionAuthor.nick} (${question.date})</p>
            </div>
            <div class="card-body">
                <p class="col-md-9 text-justify" style="white-space:pre-line;">
                    ${question.content}
                </p>
            </div>
        </div>

        <h2>Answers</h2>
        <hr/>
        
        <c:if test = "${question.answers == null || question.answers.size() == 0}">
            <h5 class="pb-3">There are no answers yet. Help ${question.questionAuthor.nick}!</h5>
        </c:if>
            
        <c:forEach items="${question.answers}" var="a">
            <div class="card mb-4">
                <div class="card-header text-end">
                    <p>${a.answerAuthor.nick} (${a.date})</p>
                </div>
                <div class="card-body">
                    <p class="card-text" style="white-space:pre-line;">
                        ${a.content}
                    </p>
                </div>
            </div>
        </c:forEach>

        <h2>Answer</h2>
        <hr/>

        <div class="container">
            <form method="POST">
                <%=errorMessage%>
                <div class="form-horizontal">
                    <input style="display:none" name="questionId" value=<%=request.getParameter("id")%>>
                    <input type="hidden" name="userId" value="<%=((User) request.getSession().getAttribute("user")).id%>"/>
                    <div class="form-group">
                        <div class="col-md-11">
                            <textarea class="form-control input-group col-md-10" id="content" 
                                      name="content" cols="40" rows="5" placeholder="Write your answer"></textarea>
                        </div>
                    </div>
                    <br/>
                    <div class="form-group">
                        <div class="col-md-10">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="PARTIAL/footer.jsp" />
</body>
</html>
