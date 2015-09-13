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

create table livros(
  id varchar(15) primary key,
  titulo varchar(80) not null,
  editora varchar(20) not null,
  tot_pag number(20) not null,
  dias_prazo number(3),
  cod_assunto number(20) not null
);

create table autores(
  codigo number primary key,
  nome varchar(40) not null,
  origem varchar(20) not null
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

insert into livros
  ('MICROBIOLOGIA', '737.4.202 S2002', 'Os bichos são assim', 'Silva, José da; Silva, Vanderlei da', 'LTC', 1990, 'Única', 'Único', 300),
  ('PROGRAMAÇÃO', '681.5.203 S442', 'Técnicas de programação estruturada', 'Silva, João da', 'Campus', 1992, '2', 'Único', 253),
  ('MATERIAIS', '588.9.949 S3003', 'Ensaios de dureza e de moleza', 'Silva, Pedro da', 'LTC', 1993, 'Única', 'Único', 330),
  ('FISIOLOGIA', '737.4.234 S2323', 'O funcionamento do intestino', 'Silva, Ana da; Silva, Vanderlei da', 'LTC', 1992, '3', 'Único', 300),
  ('USINAGEM', '588.3.342 S4343', 'Torno radial: Como funciona a coisa', 'Silva, Antonio da; Silva, Joaquim da; Silva, Pedro da', 'LTC', 1994, 'Única', 'Único', 505),
  ('MICROBIOLOGIA', '737.4.180 S2023', 'Bactérias, micróbios e coisas parecidas', 'Silva, José da; Silva, Vanderlei da; Silva, Maria da', 'Erika', 1989, 'Única', 'Único', 300),
  ('BANCO DE DADOS', '683.2.343 S334', 'Teoria de bancos de dados', 'Silva, Teobaldo da', 'Campus', 1990, 'Única', 'Único', 450),
  ('CALCULO', '333.5.656 S1849', 'Calculo diferencial e integral', 'Silva, Arlete da', 'LTC', 1990, 'Única', '1', 300);
