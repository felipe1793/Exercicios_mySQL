/* 1° Liste a tabela TB_PRODUTO, mostrando as colunas COD_PRODUTO, DESCRICAO,
PRECO_CUSTO, PRECO_VENDA e calculando o lucro unitário (subtrair o PRECO_CUSTO
do PRECO_VENDA );*/ 

select COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA, PRECO_VENDA - PRECO_CUSTO lucro_unitario from TB_PRODUTO

/* 2° Liste a tabela TB_PRODUTO, mostrando os campos COD_PRODUTO, DESCRICAO e
calculando o valor total investido no estoque daquele produto ( multiplique a QTD_REAL
pelo PRECO_CUSTO); */

select COD_PRODUTO, DESCRICAO, QTD_REAL * PRECO_CUSTO Valor_Total_Investido from TB_PRODUTO

/* 3° Liste a tabela TB_ITENSPEDIDO, mostrando as colunas NUM_PEDIDO, NUM_ITEM,
COD_PRODUTO, PR_UNITARIO, QUANTIDADE, DESCONTO e calculando o valor de cada
item ( multiplicar o PR_UNITARIO pela QUANTIDADE e abater o DESCONTO/100 );*/

select NUM_PEDIDO, NUM_ITEM, QUANTIDADE, (PR_UNITARIO * QUANTIDADE) - (desconto/100) Valor_Item from TB_ITENSPEDIDO

/* 4° Liste a tabela TB_PRODUTO, mostrando as colunas COD_PRODUTO, DESCRICAO,
PRECO_CUSTO, PRECO_VENDA e calculando lucro estimado em reais (QTD_REAL
multiplicada pelo lucro unitário (subtrair o PRECO_CUSTO do PRECO_VENDA ));*/

select COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA, QTD_REAL * (PRECO_VENDA - PRECO_CUSTO) Lucro_Estimado from TB_PRODUTO 

/* 5° Liste a tabela TB_PRODUTO, mostrando os campos COD_PRODUTO, DESCRICAO,
PRECO_CUSTO, PRECO_VENDA, calculando o lucro unitário em reais (PRECO_VENDA –
PRECO_CUSTO) e o lucro unitário percentual ((100 *(PRECO_VENDA - PRECO_CUSTO) /
PRECO_CUSTO)). Filtre apenas PRODUTOS com PRECO_CUSTO maior que 0.*/

select COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA, (PRECO_VENDA - PRECO_CUSTO) Lucro_Unitario, 
100 * (PRECO_VENDA - PRECO_CUSTO) / (PRECO_CUSTO) Lucro_Unitario_Porcentual  from TB_PRODUTO
where PRECO_CUSTO > 0

/* 6° Liste tabela TB_PRODUTO, criando campo calculado (QTD_REAL - QTD_MINIMA), e filtre
os registros resultantes, mostrando somente aqueles que tiverem a quantidade real
abaixo da quantidade mínima.*/

select QTD_REAL - QTD_MINIMA Canpo_Calculado from TB_PRODUTO
where QTD_REAL < QTD_MINIMA

/* 7° Liste a tabela TB_PRODUTO, mostrando os registros que tenham quantidade real acima
de 5000;*/

select * from TB_PRODUTO
where QTD_REAL > 5000

/* 8° Liste produtos com preço de venda inferior a R$0,50;*/

select * from TB_PRODUTO
where PRECO_VENDA < 0.50

/* 9° Liste a tabela TB_PEDIDO com valor total (VLR_TOTAL) acima de R$15.000,00;*/

select * from TB_PEDIDO
where VLR_TOTAL > 15000.00

/* 10° Liste produtos com QTD_REAL entre 500 e 1000 unidades;*/

select * from TB_PRODUTO
where QTD_REAL between 500 and 1000
 
/* 11° Liste pedidos com valor total entre R$15.000,00 e R$25.000,00;*/

SELECT * FROM TB_PEDIDO WHERE VLR_TOTAL BETWEEN 15000 AND 25000;

/* 12° Liste produtos com quantidade real acima de 5000 e código do tipo igual a 6;*/

SELECT * FROM TB_PRODUTO WHERE QTD_REAL > 5000 AND COD_TIPO = 6;

/* 13° Liste produtos com quantidade real acima de 5000 ou código do tipo igual a 6;*/

SELECT * FROM TB_PRODUTO WHERE QTD_REAL > 5000 OR COD_TIPO = 6;

/* 14° Liste pedidos com valor total inferior a R$100,00 ou acima de R$100.000,00;*/

SELECT * FROM TB_PEDIDO WHERE VLR_TOTAL < 100 OR VLR_TOTAL > 100000;

/* 15° Liste produtos com QTD_REAL menor que 500 ou maior que 1000.*/

SELECT * FROM TB_PRODUTO WHERE QTD_REAL < 500 OR QTD_REAL > 1000;

/* 16° Liste clientes do estado de São Paulo (SP);*/

SELECT * FROM TB_CLIENTE WHERE ESTADO = 'SP';

/* 17° Liste clientes dos estados de Minas Gerais e Rio de Janeiro (MG, RJ);*/

SELECT * FROM TB_CLIENTE WHERE ESTADO IN('MG','RJ');

/* 18° Liste clientes dos estados de São Paulo, Minas Gerais e Rio de Janeiro (SP, MG, RJ);*/

SELECT * FROM TB_CLIENTE WHERE ESTADO IN('SP','MG','RJ');

/* 19° Liste os vendedores com o nome LEIA;*/

SELECT * FROM TB_VENDEDOR WHERE NOME = 'LEIA';

/* 20° Liste todos os clientes que tenham NOME começando com BRINDES;*/

SELECT * FROM TB_CLIENTE WHERE NOME LIKE 'BRINDES%';

/* 21° Liste todos os clientes que tenham NOME terminando com BRINDES;*/

SELECT * FROM TB_CLIENTE WHERE NOME LIKE '%BRINDES';

/* 22° Liste todos os clientes que tenham NOME contendo BRINDES;*/

SELECT * FROM TB_CLIENTE WHERE NOME LIKE '%BRINDES%';

/* 23° Liste todos os produtos com DESCRICAO começando por CANETA;*/

SELECT * FROM TB_PRODUTO WHERE DESCRICAO LIKE 'CANETA%';

/* 24° Liste todos os produtos com DESCRICAO contendo SPECIAL;*/

SELECT * FROM TB_PRODUTO WHERE DESCRICAO LIKE '%SPECIAL%';

/* 25° Liste todos os produtos com DESCRICAO terminando por GOLD;*/

SELECT * FROM TB_PRODUTO WHERE DESCRICAO LIKE '%GOLD';

/* 26° Liste todos os clientes que tenham a letra A como segundo caractere do nome;*/

SELECT * FROM TB_CLIENTE WHERE SUBSTRING(NOME,2,1) = 'A';
			/* ou */
SELECT * FROM TB_CLIENTE WHERE NOME LIKE '_A%';

/* 27° Liste todos os produtos que tenham 0 (ZERO) como segundo caractere do campo*
COD_PRODUTO;*/

SELECT * FROM TB_PRODUTO WHERE SUBSTRING(COD_PRODUTO,2,1) = '0'
SELECT * FROM TB_PRODUTO WHERE COD_PRODUTO LIKE '_0%'

/* 28° Liste todos os produtos que tenham a letra A como terceiro caractere do campo
COD_PRODUTO.*/

SELECT * FROM TB_PRODUTO WHERE SUBSTRING(COD_PRODUTO,3,1) = 'A';
SELECT * FROM TB_PRODUTO WHERE COD_PRODUTO LIKE '__A%'

/* 29° Liste todos os pedidos com data de emissão anterior a Jan/2016;*/

SELECT * FROM TB_PEDIDO WHERE DATA_EMISSAO < '20160101';

/* 30° Liste todos os pedidos com data de emissão no primeiro semestre de 2016;*/

SELECT * FROM TB_PEDIDO WHERE MONTH(DATA_EMISSAO) <= 6 AND YEAR(DATA_EMISSAO) = 2016;

/* 31° Liste todos os pedidos com data de emissão em janeiro e junho de 2016;*/

SELECT * FROM TB_PEDIDO WHERE DATEPART(MONTH,DATA_EMISSAO) IN (1,6) AND DATEPART(YEAR,DATA_EMISSAO)= 2016;

/* 32° Liste todos os pedidos do Vendedor Código 1 em Jan/2016;*/

SELECT * FROM TB_PEDIDO WHERE CODVEN = 1 AND DATEPART(MONTH,DATA_EMISSAO) = 1  AND DATEPART(YEAR,DATA_EMISSAO)= 2016;

/* 33° Liste os códigos de clientes que efetuaram alguma compra (pedido) em Jan/2016, caso o
cliente tenha comprado mais de uma vez aparecer cada código de cliente uma única vez.*/

SELECT DISTINCT
	CODCLI 
FROM TB_PEDIDO 
WHERE DATEPART(MONTH,DATA_EMISSAO) = 1  AND DATEPART(YEAR,DATA_EMISSAO)= 2016 GROUP BY CODCLI;