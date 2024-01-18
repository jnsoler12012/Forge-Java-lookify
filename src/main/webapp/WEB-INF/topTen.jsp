<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Ten</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
    <h1>Top Ten</h1>
    <span class="border border-secondary">
        <ul>
            <c:forEach items="${songs}" var="song">
                <li>
                    <p>
                        <c:out value="${song.rating}" /> - <a href="/songs/${song.id}">
                            <c:out value="${song.title}" />
                        </a> -
                        <c:out value="${song.artist}" />
                    </p>
                </li>
            </c:forEach>
        </ul>
    </span>

    <h2><a href="/dashboard">Dashboard</a></h2>
</body>

</html>