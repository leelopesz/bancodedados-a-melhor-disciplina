-- Exercício 1

delimiter //
    create procedure sp_ListarAutores()
     select * from autor;
	//
    
    call sp_ListarAutores();
