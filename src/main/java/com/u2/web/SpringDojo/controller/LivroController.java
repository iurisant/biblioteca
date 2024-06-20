package com.u2.web.SpringDojo.controller;

import com.u2.web.SpringDojo.model.Livro;
import com.u2.web.SpringDojo.service.LivroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/biblioteca")
public class LivroController {

	@Autowired
	private LivroService livroService;

	@GetMapping
	public String Livros(@RequestParam(value = "busca", required = false, defaultValue = "") String busca, Model model) {
		if(busca.isEmpty()){
			model.addAttribute("livros", livroService.listarLivros());
		} else {
			List<Livro> livrosEncontrados = livroService.pesquisarLivros(busca);
			model.addAttribute("livros", livrosEncontrados);
		}
		return "livros";
	}

	@GetMapping("/cadastro")
	public String Cadastro(Model model) {
		model.addAttribute("livros", new Livro());
		return "cadastro";
	}

	@PostMapping("/adicionarLivro")
	public String AdicionarLivro(@ModelAttribute Livro livro, Model model) {
		try{
			livroService.salvarLivro(livro);
			return "redirect:/biblioteca";
		}catch (Exception e) {
			model.addAttribute("errorMessage", "Erro ao atualizar o livro: " + e.getMessage());
			return "cadastro";
		}
	}

	@GetMapping("/editar/{id}")
	public String Editar(@PathVariable("id") Long id, Model model) {
		Optional<Livro> livro = livroService.buscarLivroPorId(id);
		if (livro.isPresent()) {
			model.addAttribute("livro", livro.get());
			return "editar";
		}
		return "redirect:/biblioteca";
	}

	@PostMapping("/atualizar/{id}")
	public String Atualizar(@PathVariable("id") Long id, @ModelAttribute Livro livro, Model model) {
		try{
			livro.setId(id);
			livroService.salvarLivro(livro);
			return "redirect:/biblioteca";
		}catch (Exception e) {
			model.addAttribute("errorMessage", "Erro ao atualizar o livro: " + e.getMessage());
			return "cadastro";
		}
	}

	@GetMapping("/emprestar/{id}")
	public String Emprestar(@PathVariable("id") String id) {
		try{

		}catch (Exception e) {}
		Long livroId = Long.parseLong(id);
		Optional<Livro> optionalLivro = livroService.buscarLivroPorId(livroId);
		if (optionalLivro.isPresent()) {
			Livro livro = optionalLivro.get();
			livro.setEmprestado(!livro.isEmprestado());
			livroService.salvarLivro(livro);
		}
		return "redirect:/biblioteca";
	}

	@GetMapping("/deletar/{id}")
	public String Deletar(@PathVariable("id") Long id) {
		try{

		}catch (Exception e) {}
		livroService.removerLivro(id);
		return "redirect:/biblioteca";
	}
}