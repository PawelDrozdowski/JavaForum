<%-- 
    Document   : register
    Created on : 23 lis 2022, 11:08:07
    Author     : pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="PARTIAL/headDefault.html" />
        <title>JSP page</title>
    </head>
    <body>
        <jsp:include page="PARTIAL/banner.jsp" />
        <div class="container body-content">
            
            <form method="POST">
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
            
            <jsp:include page="PARTIAL/footer.html" />
        </div>
    </body>
</html>
