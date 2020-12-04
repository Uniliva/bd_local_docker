
-- ##############################################################
-- Coloque aqui os scripts do banco do financeiro
-- ##############################################################

if not exists(select 1
from sys.tables
where name = 'exemplo')
begin
    create table dbo.exemplo
    (
        id_exemplo bigint identity not null,
        descricao VARCHAR(10) NOT NULL ,
        CONSTRAINT pk_exemplo primary key (id_exemplo)
    )
end;

IF NOT EXISTS( SELECT * FROM dbo.exemplo)
begin
  -- coloque aqui as querys de insert ou update de DML
  INSERT INTO endosso(descricao) VALUES('Isso é um exemplo');
end;
