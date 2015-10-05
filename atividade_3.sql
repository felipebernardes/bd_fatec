create table movimento (nrmovimento int primary key, data date, situacao char(1));

create sequence seq_movimento
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
nocycle;

select seq_movimento.nextval from dual;
select sysdate from dual;

insert into movimento values (seq_movimento.nextval, '23/09/2015', 'N');
