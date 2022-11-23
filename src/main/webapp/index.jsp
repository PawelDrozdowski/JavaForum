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
    <div class="container body-content">    

        <form class="d-flex col-md-8 offset-1" method="GET">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">🔍</button>
            <input class="form-control me-sm-2 col-md-6 offset-1" type="text" id="search" name="search" placeholder="Search">
        </form>

        <br/>

        <div class="card">
            <div class="card-header text-end">
                <p>Added: 21.11.2022 &emsp; Number of answers: X</p>
            </div>
            <div class="card-body">
                <h5 class="card-title">Question title</h5>
                <p class="card-text">Question content limited to X chars...</p>
                <a href="question.jsp?id=1" class="btn btn-primary">More</a>
            </div>
        </div>
        
        <br/>
        
        <div class="card">
            <div class="card-header text-end">
                <p>Added: 22.11.2022 &emsp; Number of answers: X</p>
            </div>
            <div class="card-body">
                <h5 class="card-title">Question title 2</h5>
                <p class="card-text">Question content limited to X chars...</p>
                <a href="question.jsp?id=2" class="btn btn-primary">More</a>
            </div>
        </div>

        <jsp:include page="PARTIAL/footer.html" />
    </div>
</body>
</html>
