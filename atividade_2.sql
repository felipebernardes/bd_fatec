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
  fk_id_livro varchar(15) not null,
  fk_cod_socio long not null,
  dt_retirada date not null,
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
  tot_pag number(20) not null check(tot_pag>=0),
  dias_prazo number(3) check(dias_prazo>=0),
  cod_assunto number not null
);

alter table emprestimos
add constraint fk_cod_socio foreign key (codigo) references socios (codigo);

alter table emprestimos
add constraint fk_cod_livro foreign key (id_livro) references livros (id_livro);

alter table emprestimos
add constraint fk_cod_socio foreign key (codigo) references socios (codigo);

alter table emprestimos
add constraint emprestimo_pk primary key (fk_cod_livro, fk_cod_socio, dt_retirada;

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

create sequence seq_cod_socio
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
nocycle;

insert into socios values (seq_cod_socio.nextval, "Amanda", "1512345678", "Rua dos Bobos, nº 0", "", "Jardim das Flores", "Sorocaba", "18070340")

insert into socios values (seq_cod_socio.nextval, "Felipe", "1587654321", "Rua dos Bobos, nº 0", "", "Jardim das Flores", "Sorocaba", "18023346")

insert into socios values (seq_cod_socio.nextval, "Ted", "1556784256", "Rua dos Bobos, nº 0", "", "Jardim das Flores", "Sorocaba", "18050378")

insert into socios values (seq_cod_socio.nextval, "João", "1534569076", "Rua dos Bobos, nº 0", "", "Jardim das Flores", "Sorocaba", "18050243")

insert into socios values (seq_cod_socio.nextval, "Carlos", "1530456743", "Rua dos Bobos, nº 0", "", "Jardim das Flores", "Sorocaba", "18040346")

// devolvidos com multa
insert into emprestimos values ('7374202S2002', 1, '05/07/1992', '25/07/1992', '30/09/1992', 3.00);
insert into emprestimos values ('7374202S2002', 1, '21/07/1992', '30/09/1992', '30/09/1992', 3.00);

//devolvidos sem multa
insert into emprestimos values ('6832343S334', 1, '15/07/1992', '20/09/1992', '20/09/1992', 0.00);
insert into emprestimos values ('6832343S334', 1, '25/07/1992', '17/09/1992','17/09/1992', 0.00);  
insert into emprestimos values ('5889949S3003', 1, '23/07/1992', '18/09/1992', '18/09/1992', 0.00);
insert into emprestimos values ('5889949S3003', 1, '29/07/1992', '23/09/1992', '23/09/1992', 0.00);
insert into emprestimos values ('7374234S2323', 1, '24/11/1992', '06/12/1992', '06/12/1992', 0.00);  
insert into emprestimos values ('7374234S2323', 1, '01/08/1992', '08/08/1992', '08/08/1992', 0.00);
insert into emprestimos values ('6815203S442', 1, '22/01/1992', '04/02/1992', '04/02/1992', 0.00);
insert into emprestimos values ('6815203S442', 1, '13/07/1992', '06/05/1992', '06/05/1992', 0.00);
insert into emprestimos values ('6832343S334', 1, '18/07/1992', '12/04/1992', '12/04/1992', 0.00);
insert into emprestimos values ('6832343S334', 1, '07/07/1992', '28/07/1992', '28/07/1992', 0.00);  

//não devolvidos
insert into emprestimos values ('3335656S1849', 1, '06/08/1992', '01/09/1992', '', 0.00);
insert into emprestimos values ('3335656S1849', 1, '13/08/1992', '02/09/1992', '', 0.00);
insert into emprestimos values ('6832343S334', 1, '08/08/1992', '09/09/1992', '', 0.00);

create sequence seq_cod_editora
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
nocycle;

create table editora (
codigo long primary key,
nome varchar(30),
cidade varchar(30),
uf varchar(2)
)

alter table livros
drop column editora;

alter table livros add cod_editora long;

alter table livros
add constraint cod_editora foreign key (codigo) references editora (codigo);

insert into editoras values(seq_cod_editora.nextval, 'Acadêmica', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Rio de Janeiro', 'São Paulo', 'RJ');
insert into editoras values(seq_cod_editora.nextval, 'Ática', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Atlas', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Atual', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Axcel Books', 'Rio de Janeiro', 'RJ');
insert into editoras values(seq_cod_editora.nextval, 'Berkeley', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Bookman', 'Porto Alegre', 'RS');
insert into editoras values(seq_cod_editora.nextval, 'Brasiliense', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Brasport', 'Rio de Janeiro', 'RJ');
insert into editoras values(seq_cod_editora.nextval, 'Campus', 'Rio de Janeiro', 'RJ');
insert into editoras values(seq_cod_editora.nextval, 'Ciência Moderna', 'Rio de Janeiro', 'RJ');
insert into editoras values(seq_cod_editora.nextval, 'Companhia das Letras', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Cortez Editora', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Cultrix', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Edgard Blucher', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Edições Paulinas', 'Rio de Janeiro','RJ');
insert into editoras values(seq_cod_editora.nextval, 'Editora da FGV', 'São Paulo', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Editora da UNICAMP', 'Campinas', 'SP');
insert into editoras values(seq_cod_editora.nextval, 'Editora do SEBRAE', 'Brasília', 'DF');

delete from livros where id='3335656S1849';

update socios set cidade='Sorocaba' where cep=null;