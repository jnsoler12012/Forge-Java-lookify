<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Song
        <c:out value="${song.title}" />
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
    <h2><a href="/dashboard">Dashboard</a></h2>
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-6">
                Title
            </div>
            <div class="col-md-6">
                <c:out value="${song.title}" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                Artist
            </div>
            <div class="col-md-6">
                <c:out value="${song.artist}" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                Rating
            </div>
            <div class="col-md-6">
                <c:out value="${song.rating}" />
            </div>
        </div>

        <form:form action="/delete/${song.id}" method="delete">
            <input type="submit" value="Delete" />
        </form:form>
    </div>

</body>

</html>