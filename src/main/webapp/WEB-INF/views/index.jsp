<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Форум job4j</title>
</head>
<body>
    <div class="container pt-3">
        <div class="row">
            <div style="margin-left: auto;">
                <ul class="nav">
                    <c:choose>
                        <c:when test="${not empty user}">
                            <li class="nav-item">
                                <a class="nav-link" href="#">${user.name}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/logout'/>">Выйти</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/login' />" >Войти</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/reg'/>">Регистрация</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="card" style="width: 100%">
                <div class="card-header">
                    <h4>Форум job4j</h4>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Тема</th>
                                <th scope="col">Автор</th>
                                <th scope="col">Дата создания</th>
                                <th scope="col">Количество сообщений</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${posts}" var="post">
                                <tr>
                                    <td>
                                        <a class="nav-link" href="<c:url value='/post?postId=${post.id}'/>">${post.name}</a>
                                    </td>
                                    <td>${post.author.name}</td>
                                    <td>${post.created.time}</td>
                                    <td>${post.messages.size()}</td>
                                    <td>
                                        <c:if test="${post.author.id == user.id}">
                                            <a href='<c:url value="/post/edit?postId=${post.id}"/>'>
                                                <i class="fa fa-edit mr-3"></i>
                                            </a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <c:if test="${not empty user}">
            <div class="container pt-3">
                <div class="row">
                    <form action="<c:url value='/post/edit'/>">
                        <button type="submit" class="btn btn-primary">Создать новую тему</button>
                    </form>
                </div>
            </div>
        </c:if>
    </div>
</body>
</html>