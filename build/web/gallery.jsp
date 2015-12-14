<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>


<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Photo Gallery</title>
        <!-- Latest compiled and minified CSS -->
        <!-- Optional theme -->
        <script src="include/js/jquery-2.1.3.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="include/css/bootstrap.min.css"/>
        <script src="include/js/bootstrap.min.js"></script>
        <script src="include/js/gallery.js" ></script>
    </head>
    <body>

    <nav class="navbar navbar-inverse navbar-static-top" role="navigation" id="mynav">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" 
                    data-target="#navbar-collapse">
                <span class="sr-only">switch</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#mynav">StandingOut</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="x.html"><span class="glyphicon glyphicon-home"></span>Home</a></li>
                <li><a href="x.html"><span class="glyphicon glyphicon-info-sign"></span>How to make good Resume</a></li>
                <li><a href="photoGallery"><span class="glyphicon glyphicon-picture"></span>Gallery</a></li>
                <li><a href="x.html"><span class="glyphicon glyphicon-question-sign"></span>Help</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="col-lg-10" style="float: none; margin: 0 auto;">
            <h1>Welcome to our resume gallery</h1>
            <div class="table-responsive">
                <table class="table">
                    <tbody>
                        <%
                            ArrayList rows = new ArrayList();

                            rows = (ArrayList) request.getAttribute("rows");
                            HashMap msg = (HashMap) request.getAttribute("msg");


                            int i = 0;
                            while (i < rows.size()) {
                                ArrayList row = (ArrayList) rows.get(i);
                                out.print("<tr id='" + row.get(0) + "-" + i + "'>");
                                out.print("<td class='col-lg-6'>");

                                out.print("<img src='" + row.get(1) + "' style='width:600px;height:auto;'></img>");
                                out.print("</td>");

                                out.print("<td class='col-lg-4' align='left'>");
                                out.print("<h4><p>Description: </p></h4>");
                                out.print("<p style='padding-left:1em'>" + row.get(3) + "</p>");
                                out.print("<h4><p>Score: </p></h4>");
                                out.print("<p style='padding-left:1em'>" + row.get(2) + "</p>");
                                out.print("<div class='btn-group'>");
                                out.print("<button class='btn btn-primary'> +1</button>");
                                out.print("<button class='btn btn-primary' data-toggle='collapse' data-target='#demo'>Read More</button>");
                                out.print("</div>");

                                out.print("<div id='demo' class='collapse'>");
                                
                                ArrayList messages = (ArrayList)msg.get(row.get(0));
                                System.out.println(messages.toString());
                                int j = 0;
                                
                                out.print("<ul class='list-group' style='margin-top:20px;'> ");
                                while(j<messages.size()) {
                                    ArrayList msgRow = (ArrayList) messages.get(j);
                                    out.print("<li class='list-group-item'>" + msgRow.get(1)+": " + msgRow.get(3) + "</li>");                                    
                                    j=j+1; 
                                }
                                out.print("</ul>");
                                out.print("</div>");

                                out.print("</td>");
                                i = i + 1;
                                out.print("</tr>");
                            }
                        %>


                    </tbody>
                </table>
                <h4 align="center">Submit your resume
                    <a href="upload.jsp"> here</a>
                </h4>
            </div>

        </div>
    </div>

</body>
</html>
