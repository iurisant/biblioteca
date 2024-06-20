# Sistema de Gerenciamento de Biblioteca - SpringDojo 

Este é um projeto de exemplo para um sistema de gerenciamento de biblioteca, desenvolvido em Spring Boot. 

## Visão Geral O sistema permite operações básicas de gerenciamento de uma biblioteca, incluindo: 
- Listar todos os livros 
- Adicionar um novo livro 
- Editar os detalhes de um livro existente 
- Excluir um livro 
- Pesquisar livros por título, autor ou ISBN - Emprestar ou devolver um livro 

## Estrutura do Projeto O projeto está organizado nas seguintes partes: 
### Controller `LivroController`:
O controlador LivroController é responsável por gerenciar as operações relacionadas aos livros em uma biblioteca. Ele fornece endpoints para listar, adicionar, editar, atualizar, emprestar e deletar livros.

### Endpoints
1. **Listar Livros**  
   URL: `/biblioteca`  
   Método HTTP: `GET`  
   Descrição: Exibe a lista de livros. Se um termo de busca for fornecido, exibe os livros que correspondem ao termo.
   busca (opcional): Termo de busca para filtrar os livros.
2. **Formulário de Cadastro de Livro**  
   URL: `/biblioteca/cadastro`  
   Método HTTP: `GET`  
   Descrição: Exibe o formulário para cadastrar um novo livro.  
3. **Adicionar Livro**
   URL: `/biblioteca/adicionarLivro`  
   Método HTTP: `POST`  
   Descrição: Adiciona um novo livro à biblioteca.
   livro: Objeto Livro que contém os detalhes do livro a ser adicionado.  
4. **Formulário de Edição de Livro**  
   URL: `/biblioteca/editar/{id}`  
   Método HTTP: `GET`  
   Descrição: Exibe o formulário para editar um livro existente.
   id: ID do livro a ser editado.
5. **Atualizar Livro**
   URL: `/biblioteca/atualizar/{id}`  
   Método HTTP: `POST`  
   Descrição: Atualiza os detalhes de um livro existente.
   id: ID do livro a ser atualizado.  
   livro: Objeto Livro com os novos detalhes do livro.  
6. **Emprestar ou Devolver Livro**  
   URL: `/biblioteca/emprestar/{id}`  
   Método HTTP: `GET`  
   Descrição: Alterna o estado de empréstimo de um livro (emprestar ou devolver).
   id: ID do livro a ser emprestado ou devolvido.  
7. **Deletar Livro**  
   URL: `/biblioteca/deletar/{id}`  
   Método HTTP: `GET`  
   Descrição: Remove um livro da biblioteca.  
   Parâmetros:  
   id: ID do livro a ser deletado.  
- - -
### Model `Livro`:
O modelo Livro representa a entidade de um livro na aplicação. Ele é mapeado para uma tabela no banco de dados usando JPA (Java Persistence API).

### Atributos  
`id` (`Long`): Identificador único do livro. É gerado automaticamente pelo banco de dados.  
`isbn` (`String`): Código ISBN do livro.  
`titulo` (`String`): Título do livro.  
`autor` (`String`): Autor do livro.  
`emprestado` (`boolean`): Indica se o livro está emprestado (true) ou disponível (false).  
### Mapeamento JPA
A classe Livro está anotada com @Entity, o que indica que é uma entidade JPA. A anotação @Id é usada para especificar o campo id como a chave primária, e a anotação @GeneratedValue é usada para definir a estratégia de geração do valor do campo id como auto-incremento. 
- - -

### Serviço `LivroService`:
O serviço LivroService é responsável por gerenciar as operações relacionadas aos livros na aplicação. Ele fornece métodos para listar, buscar, salvar, pesquisar e remover livros.

### Métodos
1. **Listar Livros**  
   Método: `listarLivros`  
   Descrição: Retorna uma lista de todos os livros, ordenados pelo ID.  
   Retorno: `List<Livro>` - Lista de livros.  
2. **Buscar Livro por ID**  
   Método: `buscarLivroPorId`  
   Descrição: Busca um livro pelo seu ID.   
   `id` (`Long`): ID do livro a ser buscado.  
   Retorno: `Optional<Livro>` - Um Optional contendo o livro, se encontrado.  
3. **Salvar Livro**  
   Método: `salvarLivro`  
   Descrição: Salva um livro. Se o livro não tiver ID, ele é adicionado à lista com um novo ID gerado automaticamente. Se o livro já tiver um ID, ele é atualizado.  
   `livro` (`Livro`): Objeto Livro a ser salvo.  
   Retorno: Livro - O livro salvo.  
4. **Pesquisar Livros**  
   Método: `pesquisarLivros`  
   Descrição: Pesquisa livros com base em um termo de busca. A pesquisa é realizada nos campos título, autor e ISBN.  
   `busca` (`String`): Termo de busca.  
   Retorno: `List<Livro>` - Lista de livros que correspondem ao termo de busca.  
5. **Remover Livro**  
   Método: `removerLivro`  
   Descrição: Remove um livro pelo seu ID.  
   `id` (`Long`): ID do livro a ser removido.  

## Tecnologias Utilizadas 
- Java 
- Spring Boot 
- Spring MVC 
- Spring Data JPA

## Integrantes da Equipe
- Aoued Mekki
- Gabriel Barauna Ferreira
- Iuri Santana Goes da Silva
- Jefferson Santos Luiz Fernandes
- Paulo Moabe de Oliveira Alves

## Como Executar Para executar o projeto localmente, siga estas etapas: 
1. Certifique-se de ter o Java JDK e o Maven instalados em seu sistema. 
2. Clone este repositório em sua máquina local. 
3. Navegue até o diretório do projeto e execute o comando `mvn spring-boot:run`. 
4. Acesse o aplicativo em seu navegador, geralmente em `http://localhost:8080/biblioteca`.