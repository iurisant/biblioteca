<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Biblioteca Virtual</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <main class="container py-5">
    <h1>Biblioteca Virtual</h1>

    <br>

    <!-- Barra de Pesquisa -->
    <form class="row gap-4 mx-1" action="/biblioteca" method="get">
        <input class="form-control col" type="search" placeholder="Buscar Livro" name="busca" aria-label="Search" value="${param.busca}">
        <button class="btn btn-dark col-2" type="submit"><i class="bi bi-search"></i></button>
    </form>

    <br>
    <strong>Livros Disponível</strong>
    <!-- Tabela de Livros -->
    <table border="1" class="table">
        <thead>
            <tr>
                <th class="bg-dark text-light" scope="col">#</th>
                <th class="bg-dark text-light" scope="col">ISBN</th>
                <th class="bg-dark text-light" scope="col">Título</th>
                <th class="bg-dark text-light" scope="col">Autor</th>
                <th class="bg-dark text-light" scope="col">Emprestado</th>
                <th class="bg-dark text-light" scope="col">Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="livro" items="${livros}">
                <c:if test="${livro.emprestado == false}">
                    <tr>
                        <th>${livro.id}</th>
                        <td>${livro.isbn}</td>
                        <td>${livro.titulo}</td>
                        <td>${livro.autor}</td>
                        <td>${livro.emprestado ? 'Sim' : 'Não'}</td>
                        <td>
                            <nav class="row">
                                <form action="/biblioteca/emprestar/${livro.id}" method="get" class="col">
                                    <button type="submit" class="btn btn-primary w-100" title="Emprestar"><i class="bi bi-tag-fill"></i></button>
                                </form>
                                <form action="/biblioteca/editar/${livro.id}" method="get" class="col">
                                    <button type="submit" class="btn btn-warning w-100" title="Editar"><i class="bi bi-pencil-fill text-white"></i></button>
                                </form>
                                <form action="/biblioteca/deletar/${livro.id}" method="get" class="col">
                                    <button type="submit" class="btn btn-danger w-100" title="Remover"><i class="bi bi-trash-fill"></i></button>
                                </form>
                            </nav>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
    <strong>Livros Alugados</strong>
        <!-- Tabela de Livros -->
        <table border="1" class="table">
            <thead>
                <tr>
                    <th class="bg-dark text-light" scope="col">#</th>
                    <th class="bg-dark text-light" scope="col">ISBN</th>
                    <th class="bg-dark text-light" scope="col">Título</th>
                    <th class="bg-dark text-light" scope="col">Autor</th>
                    <th class="bg-dark text-light" scope="col">Emprestado</th>
                    <th class="bg-dark text-light" scope="col">Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="livro" items="${livros}">
                    <c:if test="${livro.emprestado == true}">
                        <tr>
                            <th>${livro.id}</th>
                            <td>${livro.isbn}</td>
                            <td>${livro.titulo}</td>
                            <td>${livro.autor}</td>
                            <td>${livro.emprestado ? 'Sim' : 'Não'}</td>
                            <td>
                                <nav class="row">
                                    <form action="/biblioteca/emprestar/${livro.id}" method="get" class="col">
                                        <button type="submit" class="btn btn-primary w-100" title="Emprestar"><b>Devolver</b></button>
                                    </form>
                                </nav>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    <form class="row mx-1" action="/biblioteca/cadastro" method="get">
        <button class="btn btn-success col" type="submit"><b>+ Adicionar Livro</b></button>
    </form>
    </main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>
