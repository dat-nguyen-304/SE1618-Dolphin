<%-- 
    Document   : index
    Created on : Jun 11, 2022, 12:07:15 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>index</title>
    </head>
    <body>
        <h1>Index</h1>
        <%
            String id = String.valueOf(request.getAttribute("id"));
            String family_name = String.valueOf(request.getAttribute("family_name"));
            String given_name = String.valueOf(request.getAttribute("given_name"));
            String link = String.valueOf(request.getAttribute("link"));
            String name = String.valueOf(request.getAttribute("name"));
            String picture = String.valueOf(request.getAttribute("picture"));
            String email = String.valueOf(request.getAttribute("email"));
            out.print("Id: " + id);
            out.print("<br/>Family name: " + family_name);
            out.print("<br/>Given name: " + given_name);
            out.print("<br/>Name: " + name);
            out.print("<br/>Link: " + link);
            out.print("<br/>Picture: " + picture);
            out.print("<br/>Email: " + email);
        %>
    </body>
</html>