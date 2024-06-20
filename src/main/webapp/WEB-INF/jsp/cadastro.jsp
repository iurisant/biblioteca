<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <main class="container-sm p-5 my-5 shadow border rounded-lg bg-white">
        <form name="form" method="post" action="/biblioteca/adicionarLivro">
            <h3>Cadastrar Livro</h3>
            <div class="form-group">
                <label for="exampleInputISBN">ISBN</label>
                <input type="text" class="form-control" id="exampleInputISBN" name="isbn" placeholder="ISBN">
            </div>
            <div class="form-group">
                <label for="exampleInputTitulo">Titulo</label>
                <input type="text" class="form-control" id="exampleInputTitulo" name="titulo" placeholder="Titulo">
            </div>
            <div class="form-group">
                <label for="exampleInputAutor">Autor</label>
                <input type="text" class="form-control" id="exampleInputAutor" name="autor" placeholder="Autor">
            </div>
            <br>
            <div>
                <button type="submit" class="btn btn-primary">Cadastrar</button>
                <button type="reset" class="btn btn-secondary">Limpar</button>
                <span class="ms-3 text-danger">
                    <c:if test="${not empty errorMessage}">
                        ${errorMessage}
                    </c:if>
                </span>
            </div>
        </form>
    </main>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>