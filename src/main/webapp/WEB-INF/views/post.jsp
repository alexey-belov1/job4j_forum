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

    <script>
        function validate() {
            if ($('#text').val() === '') {
                $('#msg').text('Введите текст сообщения');
                return false;
            }
            return true;
        }
    </script>

    <title>Форум job4j</title>
</head>
<body>
<div class="container pt-3">
    <div class="row">
        <div style="margin-left: auto;">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/index'/>">На главную</a>
                </li>
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
                ${post.name}
            </div>
            <div class="card-body">
                <blockquote class="blockquote mb-0">
                    <p>${post.desc}</p>
                    <footer class="blockquote-footer">Автор: ${post.author.name}</footer>
                    <footer class="blockquote-footer">Дата создания: ${post.created.time}</footer>
                </blockquote>
            </div>
        </div>
    </div>
    <c:forEach items="${post.messages}" var="message">
        <div class="row">
            <div class="card" style="width: 100%">
                <div class="card-header">
                        RE: ${post.name}
                </div>
                <div class="card-body">
                    <blockquote class="blockquote mb-0">
                        <p>${message.text}</p>
                        <footer class="blockquote-footer">Автор: ${message.author.name}</footer>
                        <footer class="blockquote-footer">Дата создания: ${message.created.time}</footer>
                    </blockquote>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<c:if test="${not empty user}">
    <div class="container pt-3">
        <div class="row">
            <div class="card" style="width: 100%">
                <div class="card-header">
                    Добавить новое сообщение
                </div>
                <div class="card-body">
                    <form action="<c:url value='/message/create'/>" method='post'>
                        <div class="form-group">
                            <label for="text">Текст сообщения:</label>
                            <textarea class="form-control" name="text" id="text" rows="3"></textarea>
                        </div>
                        <input type="hidden" name="postId" value="${post.id}" />
                        <input type="submit" class="btn btn-primary" value="submit" onclick="return validate();"/>
                        <p id="msg"></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</c:if>
</body>
</html>