<%-- 
    Document   : new-question
    Created on : 23 lis 2022, 10:21:48
    Author     : pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <jsp:include page="PARTIAL/headDefault.html" />
    <title>New Question</title>
</head>
<body>
    <jsp:include page="PARTIAL/banner.jsp" />
    <div class="container body-content">
        <form method="POST">
            <div class="mb-3 col-6">
                <label for="email" class="form-label">Title</label>
                <input type="text"class="form-control" id="title" name="title"/>
            </div>

            <div class="mb-3 col-6">
                <label for="content" class="form-label">Content</label>
                <textarea class="form-control input-group col-md-10" id="content" name="answer" cols="40" rows="5"></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Ask</button>
        </form>
        

        <jsp:include page="PARTIAL/footer.html" />
    </div>
</body>
</html>
