/*o que são metadados?
são dados sobre dados, especificação dos dados.*/

/*ddl - definição de dados*/

create table cargo(
  cdcargo char(3) not null,
  nmcargo varchar(20) not null,
  vrsalario number(7,2) not null
);

create table depto(
cddepto varchar2(3) not null,
nmdepto varchar2(20) not null,
ramal varchar2(4)
);

create table funcionario(
nrmatric integer not null,
nmfunc varchar2(80) not null,
dtadm date not null,
sexo char(1) not null check (sexo in('F','M')),
cdcargo char(3) not null,
cddepto varchar2(3) not null
);

alter table funcionario modify nmfunc VARCHAR2(100);

alter table funcionario add dtdemisao date;

drop table funcionario;
drop table cargo;
drop table depto;

alter table cargo 
add constraint pk_cargo primary key (cdcargo);

alter table depto
add primary key (cddepto);

alter table funcionario
add constraint pk_funcionario primary key (nrmatric);

alter table funcionario
add constraint fk_cargo_func foreign key (cdcargo) references cargo (cdcargo);

alter table funcionario
add constraint fk_depto_func foreign key (cddepto) references depto (cddepto);

select * from user_constraints
where table_name IN ('CARGO', 'DEPTO', 'FUNCIONARIO')
and constraint_type IN ('P', 'R'); 

/*dml - manipulação de dados*/

insert into depto values('D1', 'T1', '121');
insert into depto values('D2', 'Adm', '120');

insert into cargo (cdcargo, nmcargo, vrsalario) values ('C1', 'Analista', 4500);
insert into cargo (cdcargo, nmcargo, vrsalario) values ('C2', 'Programador', 3000);

insert into funcionario values('10902', 'Rosana', '11-jan-1997', 'F', 'C1', 'D1');

select * from cargo;
select * from depto;
select * from funcionario;

update cargo set vrsalario=vrsalario*1.1;

update cargo set vrsalario=vrsalario*1.1 where cdcargo='C1';

update funcionario set nmfunc='Rosana Garcia Prado', cddepto='D2' where nrmatricula = 1090;