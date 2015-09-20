create table socios(
  codigo long primary key,
  nome varchar(40) not null,
  telefone varchar(20) not null,
  lograd varchar(30) not null,
  complem varchar(15),
  bairro varchar(20),
  uf varchar(2),
  cep varchar(8)
);

create table emprestimos(
  id_livro varchar(15) primary key,
  cod_socio long primary key,
  dt_retirada date not null primary key,
  dt_dev_prev date not null,
  dt_dev_real date,
  vr_multa number(7,2)
);

create table assuntos(
  codigo number primary key,
  nome varchar(40) not null unique
);

create table autorias(
  id_livro varchar(15) primary key,
  cod_autor number primary key
);

create table autores(
  codigo number primary key,
  nome varchar(40) not null,
  origem varchar(20) not null
);

create table livros(
  id varchar(15) primary key,
  titulo varchar(80) not null,
  editora varchar(20) not null,
  tot_pag number(20) not null,
  dias_prazo number(3),
  cod_assunto number(20) not null
);

alter table emprestimos
add constraint fk_cod_socio foreign key (codigo) references socios (codigo);

alter table emprestimos
add constraint fk_cod_livro foreign key (id) references livros (id);

alter table autorias
add constraint fk_cod_livro foreign key (id) references livros (id);

alter table autorias
add constraint fk_cod_autor foreign key (id) references autores (id);

alter table livros
add constraint fk_cod_assunto foreign key (cod_assunto) references assuntos (cod_assunto);

insert into assuntos values(1, 'MICROBIOLOGIA');
insert into assuntos values(2, 'PROGRAMAÇÃO');
insert into assuntos values(3, 'FISIOLOGIA');
insert into assuntos values(4, 'USINAGEM');
insert into assuntos values(5, 'MICROBIOLOGIA');
insert into assuntos values(6, 'BANCO DE DADOS');
insert into assuntos values(7, 'CALCULO');
insert into assuntos values(8, 'MATERIAIS');
 
insert into livros values ('7374202S2002', 'Os bichos são assim', 'LTC', 300, null, 1);
insert into livros values ('6815203S442', 'Técnicas de programação estruturada', 'Campus', 253, null, 2);
insert into livros values ('5889949S3003', 'Ensaios de dureza e de moleza', 'LTC', 330, null, 8);
insert into livros values ('7374234S2323', 'O funcionamento do intestino', 'LTC', 300, null, 3);
insert into livros values ('5883342S4343', 'Torno radial: Como funciona a coisa', 'LTC', 505, null, 4);
insert into livros values ('7374180S2023', 'Bactérias, micróbios e coisas parecidas', 'Erika', 300, null, 1);
insert into livros values ('6832343S334', 'Teoria de bancos de dados', 'Campus', 450, null, 6);
insert into livros values ('3335656S1849', 'Calculo diferencial e integral', 'LTC', 300, null, 7);