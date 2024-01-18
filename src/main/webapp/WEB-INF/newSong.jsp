<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New song
        
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>

<body>
    <h2><a href="/dashboard">Dashboard</a></h2>

    <form:form action="/songs/new" method="post" modelAttribute="song">
        <div class="form-group">
            <form:label path="title" for="title">Title</form:label>
            <form:errors path="title" class="badge text-bg-primary" />
            <form:input type="text" class="form-control" id="title" path="title" />
        </div>
        <div class="form-group">
            <form:label path="artist" for="artist">Artist</form:label>
            <form:errors path="artist" class="badge text-bg-primary" />
            <form:input type="text" class="form-control" id="artist" path="artist" />
        </div>
        <div class="form-group">
            <form:label path="rating" for="rating">Current version</form:label>
            <form:errors path="rating" class="badge text-bg-primary" />
            <form:select class="form-control" id="rating" path="rating">
                <c:forEach var="i" begin="1" end="10">
                    <option value="${i}">
                        <c:out value="${i}" />
                    </option>
                </c:forEach>
            </form:select>
        </div>
        <button type="submit" class="btn btn-primary">
            Add Song
        </button>
    </form:form>
</body>

</html>