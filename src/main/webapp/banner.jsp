<%-- 
    Document   : banner
    Created on : 22 lis 2022, 21:47:21
    Author     : pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/Animals">🐶 Animal Schelter</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/Animals">Animals</a></li>
                    <li><a href="/AnimalConditions">Conditions</a></li>
                    <li><a href="/Cares">Care</a></li>
                    <li><a href="/Feeds">Feeds</a></li>
                    <li><a href="/Coops">Coops</a></li>
                </ul>
                    <ul class="nav navbar-nav navbar-right">
        <li><a href="/Account/Register" id="registerLink">Register</a></li>
        <li><a href="/Account/Login" id="loginLink">Log in</a></li>
    </ul>

            </div>
        </div>
    </div>
    <br/><br/>
</body>