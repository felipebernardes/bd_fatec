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