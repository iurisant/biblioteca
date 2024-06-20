package com.u2.web.SpringDojo.service;

import com.u2.web.SpringDojo.model.Livro;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Collectors;

@Service
public class LivroService {
    private List<Livro> livros = new ArrayList<>();
    private AtomicLong idGenerator = new AtomicLong();

    public List<Livro> listarLivros() {
        return new ArrayList<>(livros).stream()
                .sorted(Comparator.comparing(Livro::getId))
                .collect(Collectors.toList());
    }

    public Optional<Livro> buscarLivroPorId(Long id) {
        return livros.stream().filter(livro -> livro.getId().equals(id)).findFirst();
    }

    public Livro salvarLivro(Livro livro) {
        if (livro.getId() == null) {
            livro.setId(idGenerator.incrementAndGet());
            livros.add(livro);
        } else {
            removerLivro(livro.getId());
            livros.add(livro);
        }
        return livro;
    }

    public List<Livro> pesquisarLivros(String busca) {
        return livros.stream()
        .filter(livro -> livro.getTitulo().toLowerCase().contains(busca.toLowerCase()) ||
                livro.getAutor().toLowerCase().contains(busca.toLowerCase()) ||
                livro.getIsbn().toLowerCase().contains(busca.toLowerCase()))
        .collect(Collectors.toList());
    }

    public void removerLivro(Long id) {
        livros.removeIf(livro -> livro.getId().equals(id));
    }
}