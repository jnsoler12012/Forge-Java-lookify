<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <title>Dashboard</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row mt-3 mb-3">
            <div class="col-md-4">
                <a href="/songs/new">Add New</a>
            </div>
            <div class="col-md-4">
                <a href="/search/topTen">Top Songs</a>
            </div>
            <div class="col-md-4">
                <form action="/search" method="post" commandName="dashboard" class="form-inline">

                        <input name="artist" type="text" class="form-control" id="artist" path="artist" />
                        <input type="submit" value="Search Artists">
             
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered table-hover table-sm">
                    <thead>
                        <tr>
                            <th>
                                Name
                            </th>
                            <th>
                                Rating
                            </th>
                            <th>
                                Actions
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${songs}" var="song">
                            <tr>
                                <td>
                                    <a href="/songs/${song.id}"><c:out value="${song.title}" /></a>
                                </td>
                                <td>
                                    <c:out value="${song.rating}" />
                                </td>
                                <td>
                                    <form:form action="/delete/${song.id}" method="delete">
                                        <input type="submit" value="Delete" />
                                    </form:form>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
</body>
</html>