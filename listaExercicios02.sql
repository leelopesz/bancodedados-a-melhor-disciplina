-- Exercício 1

delimiter //
    create procedure sp_ListarAutores()
     select * from autor;
	//

-- Exercício 2
		
delimiter //
  create procedure sp_LivrosPorCategoria(in nome_categoria varchar(200))
    begin
	select Livro.Titulo, Autor.Nome, Autor.Sobrenome from Livro
	inner join Categoria on Livro.Categoria_ID = Categoria.Categoria_ID
	inner join Autor_Livro on Livro_Livro_ID = Autor_Livro.Livro_ID
	inner join Autor on Autor_Livro.Autor_Id = Autor.Autor_ID;
	end//
    delimiter;
