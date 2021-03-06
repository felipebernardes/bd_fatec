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

alter table funcionario 
add ecivil varchar(2);

alter table funcionario 
add cdsuperv int;

INSERT ALL
  INTO cargo (cdcargo, nmcargo, vrsalario) VALUES ('C3', 'AUX. ESCRITORIO', 450.00)
  INTO cargo (cdcargo, nmcargo, vrsalario) VALUES ('C4', 'ESCRITURARIO', 600.00)
  INTO cargo (cdcargo, nmcargo, vrsalario) VALUES ('C5', 'GERENTE', 2300.00)
  INTO cargo (cdcargo, nmcargo, vrsalario) VALUES ('C7', 'VENDEDOR', 800.00)
SELECT * FROM dual;

INSERT ALL
  INTO depto (cddepto, nmdepto, ramal) VALUES ('D3', 'SERVIÇOS GERAIS', 330)
  INTO depto (cddepto, nmdepto, ramal) VALUES ('D4', 'VENDAS', 300)
SELECT * FROM dual;

INSERT ALL
  INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1001, 'JOAO SAMPAIO', '14/06/94', 'M', 'C2', 'D2', 'C', 0)
  INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1004, 'LUCIO TORRES', '10/04/95', 'M', 'C2', 'D2', 'C', 1001)
  /*INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1048, 'ANA SILVEIRA', '25/04/94', 'F', 'C5', '', 'C', 0)*/
  INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1034, 'ROBERTO PEREIRA', '30/01/93', 'M', 'C3', 'D1', 'C', 1048)
  INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1021, 'JOSE NOGUEIRA', '19/02/95', 'M', 'C3', 'D1', 'C', 1001)
  INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1029, 'RUTE DE SOUZA', '02/10/92', 'F', 'C3', 'D1', 'C', 1001)
  INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1095, 'MARIA DA SILVA', '30/05/93', 'F', 'C4', 'D1', 'C', 1001)
  INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1023, 'LUIZ DE ALMEIDA', '06/11/93', 'M', 'C2', 'D2', 'S', 1048)
  INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1042, 'PEDRO PINHEIRO', '30/05/95', 'M', 'C4', 'D1', 'C', 1048)
  INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1015, 'PAULO RODRIGUES', '22/10/92', 'M', 'C2', 'D2', 'C', 1001)
SELECT * FROM dual;

ALTER TABLE FUNCIONARIO
modify (cddepto varchar(3) null);

INSERT INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1048, 'ANA SILVEIRA', '25/04/94', 'F', 'C5', '', 'C', 0);

update cargo set vrsalario=vrsalario*1.1;

delete from funcionario where nrmatric='1001';
delete from funcionario where nrmatric='1004';
delete from funcionario where nrmatric='1023';
delete from funcionario where nrmatric='1015';

delete from cargo where cdcargo='C2';

update depto set ramal=340 where cddepto='D3';

update funcionario set cdsuperv=1034 where cdsuperv=1001;
INSERT INTO funcionario (nrmatric, nmfunc, dtadm, sexo, cdcargo, cddepto, ecivil, cdsuperv) VALUES (1050, 'SEVERINO GOMES', '10/10/96', 'M', 'C3', 'D1', 'C', 1034);
update funcionario set cdcargo='C1' where nrmatric='1029';