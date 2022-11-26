<%-- 
    Document   : question
    Created on : 23 lis 2022, 12:52:54
    Author     : pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <jsp:include page="PARTIAL/headDefault.html" />
    <title>Question</title>
</head>
<body>
    <jsp:include page="PARTIAL/banner.jsp" />
    <div class="container body-content">
        <h1>Question title</h1>
        <hr/>

        <div class="card mb-3">
            <div class="card-header text-end">
                <p>User123 (21.11.2022)</p>
            </div>
            <div class="card-body">
                <p class="col-md-9 text-justify" style="white-space:pre-line;">
                    Hello! We provides artistic and thematic video editions and we mix it with our selection of music, some of this músic is edited by us, and other we transform it by fair use, we use mash up with audio programs for made it, adding it some crazy video edit with vídeo editor programs, and thougth all this we express:  audiovisual art, Aesthetic, Trippy and Vaporwave vibes.
                    We want you to have an experience close to the "nirvana" with each of our videos.

                    ¨"You use a glass mirror to see your face; you use works of art to see your soul.” -George Bernard Shaw
                </p>
            </div>
        </div>

        <h2>Answers</h2>
        <hr/>

        <div class="card mb-4">
            <div class="card-header text-end">
                <p>555User555 (22.11.2022)</p>
            </div>
            <div class="card-body">
                <p class="card-text">Have the same.</p>
            </div>
        </div>

        <div class="card mb-4">
            <div class="card-header text-end">
                <p>111User111 (22.11.2022)</p>
            </div>
            <div class="card-body">
                <p class="card-text">Try XYZ.</p>
            </div>
        </div>

        <h2>Answer</h2>
        <hr/>

        <div class="container">
            <form method="POST">
                <div class="form-horizontal">
                    <input style="display:none" name="questionID" value=<%=request.getParameter("id")%>>
                    <div class="form-group">
                        <div class="col-md-11">
                            <textarea class="form-control input-group col-md-10" id="answer" 
                                      name="answer" cols="40" rows="5" placeholder="Write your answer"></textarea>
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
        <jsp:include page="PARTIAL/footer.html" />
    </div>
</body>
</html>
