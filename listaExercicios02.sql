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

-- Exercício 3

delimiter //
create procedure sp_ContarLivrosPorCategoria(in categoria_nome varchar(200), out total_livros int)
begin
    select count(*) into total_livros
    from Livro
    inner join Categoria on Livro.Categoria_ID = Categoria.Categoria_ID
    where Categoria.Nome = categoria_nome;
end //
delimiter ;

-- Exercício 4

delimiter //
create procedure sp_VerificarLivrosCategoria(in categoria_nome varchar(200), out categoria_tem_livros )
begin
    declare total_livros int;
    
    select count(*) into total_livros
    from Livro
    inner join Categoria on Livro.Categoria_ID = Categoria.Categoria_ID
    where Categoria.Nome = categoria_nome;
    
end //
delimiter ;

-- Exercício 5

delimiter //
create procedure sp_LivrosAteAno(in ano_limite int)
begin
    select Livro.Titulo, Livro.Ano_Publicacao from Livro
    where Livro.Ano_Publicacao <= ano_limite;
end //
delimiter ;

-- Exercício 6

delimiter //
create procedure sp_TitulosPorCategoria(in categoria_nome varchar(200))
begin
    select Livro.Titulo from Livro
    inner join Categoria on Livro.Categoria_ID = Categoria.Categoria_ID
    where Categoria.Nome = categoria_nome;
end //
delimiter ;

-- Exercício 7

delimiter //
create procedure sp_AdicionarLivro(
    in titulo_livro varchar(500),
    in editora_id int,
    in ano_publicacao int,
    in numero_paginas int,
    in categoria_id int,
    out resultado varchar(255)
)
begin
    declare livro_existente int;

    select count(*) into livro_existente
    from Livro
    where Titulo = titulo_livro;

    if livro_existente > 0 then
        set resultado = 'Título já existe na tabela.';
    else
        insert into Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        values (titulo_livro, editora_id, ano_publicacao, numero_paginas, categoria_id);
        
        set resultado = 'Livro adicionado.';
    end if;
end //
delimiter ;

-- Exercício 8
