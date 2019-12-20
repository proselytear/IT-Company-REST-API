<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<!-- Fragment #1 : Headerfiles contains css and js references -->
<head th:fragment="headerfiles">
    <title>Introduction to SpringBoot Security</title>
    <meta charset="UTF-8"/>
    <link th:href="@{~/bootstrap.min.css}" rel="stylesheet">
    <link th:href="@{~/fontawesome/css/all.css}" rel="stylesheet">
</head>
<body>
<!-- Fragment #2 : Navbar contains nav links -->
<div th:fragment="nav">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Boot Security</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" th:href="@{~/index}"><i class="fa fa-home"></i>Home</a>
                </li>
                <li sec:authorize="isAuthenticated()" class="nav-item">
                    <a class="nav-link" href="#" th:href="@{~/users/index}">User</a>
                </li>
                <li sec:authorize="hasRole('MODERATOR', 'ADMIN')" class="nav-item">
                    <a class="nav-link" href="#" th:href="@{~/moderator/index}">Moderator</a>
                </li>
                <li sec:authorize="hasRole('ADMIN')" class="nav-item">
                    <a class="nav-link" href="#" th:href="@{~/admin/index}">Admin</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" form-method="post" th:action="@{/logout}">
                <button sec:authorize="isAuthenticated()" class="btn btn-outline-danger my-2 my-sm-0 btn-sm" type="submit">Logout</button>
                <button sec:authorize="isAnonymous()" th:href="@{~/login}" class="btn btn-outline-info my-2 my-sm-0 btn-sm" type="submit">Login</button>
            </form>
        </div>
    </nav>
</div>
</body>
</html>