create database senai;
use senai;
create table funcionario(
id int auto_increment primary key,
nome varchar (30) not null,
salario float not null
);
create table departamento(
id int auto_increment primary key,
nome varchar (30) not null
);
create table funcionario_departamento(
id int auto_increment primary key,
id_funcionario int ,
foreign key(id_funcionario)references funcionario(id),
id_departamento int,
foreign key(id_departamento)references departamento(id)
);

drop database senai;
select * from funcionario_departamento;

insert into funcionario (nome, salario) 
		values ("João"	,3000),
				("Maria",	4000),
                ("Pedro",	2500),
				("Ana",	3500);
                
insert into departamento (nome) 
		values ("Vendas"),
			("Marketing"),
			("TI");
            
            
          insert into funcionario_departamento (id_funcionario, id_departamento) 
		values (1,1),
			(2,1),
			(3,2),
            (4,3);
            
            select d.nome as departamento, avg (f.salario) as media_Salarial
            from funcionario_departamento as fd
            inner join funcionario as f
            inner join departamento as d on d.id = fd.id_departamento and fd.id_funcionario = f.id
            group by d.nome
            having avg(f.salario) > 3000;
