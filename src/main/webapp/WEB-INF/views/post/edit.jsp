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
            let args = [$('#name'), $('#desc')];
            for (let i = 0; i < args.length; i++) {
                if (args[i].val() === '') {
                    let msg = $('#msg');
                    msg.text('Заполните поле: ' + args[i].attr('title'));
                    return false;
                }
            }
            return true;
        }
    </script>

    <title>Форум job4j</title>
</head>
<body>
<div class="container pt-3">
    <div class="container pt-3">
        <div class="row">
            <div class="card" style="width: 100%">
                <div class="card-header">
                    Редактировать пост
                </div>
                <div class="card-body">
                    <form action="<c:url value='/post/create'/>" method='post'>
                        <c:if test="${not empty post}">
                            <input type="hidden" name="id" value="${post.id}">
                        </c:if>
                        <div class="form-group">
                            <label for="name">Название:</label>
                            <input type="text" class="form-control" name="name" id="name" value="${post.name}" title="название">
                        </div>
                        <div class="form-group">
                            <label for="desc">Описание:</label>
                            <textarea class="form-control" name="desc" id="desc" rows="3" title="описание">${post.desc}</textarea>
                        </div>
                        <input type="submit" class="btn btn-primary" value="submit" onclick="return validate();"/>
                        <p id="msg"></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>