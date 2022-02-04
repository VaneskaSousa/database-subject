* Consulta 01: 
> Encontre todos os nomes dos clientes que iniciam com 'Antonio'.

select nome from cliente, usuario where cliente.usuario_id = usuario.id and nome like 'Antonio%'
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta1.png)

* Consulta 02:
> Quais os nomes e telefones (DDD e número) dos clientes com nomes que terminam com 'Cooper'?

select nome, ddd, numero from cliente as client, usuario as usuario, usuario_telefone as usuario_telefone
where client.usuario_id = usuario.id and client.usuario_id = usuario_telefone.usuario_id and nome like '%Cooper'
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta2.png)

* Consulta 03:
> Quais os nomes dos usuários registrados na tabela de usuario e que não são clientes?
– Observação:
Podem ser retornados um ou mais nomes de usuários.

SELECT nome FROM usuario WHERE usuario.id NOT IN (SELECT cliente.usuario_id FROM cliente)
OU
(SELECT nome FROM usuario) EXCEPT (SELECT nome FROM cliente, usuario WHERE cliente.usuario_id = usuario.id)  
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta3.png)
ps: gostei mais usando o NOT IN e apartir daqui eu vi como os parenteses e letras maiusculas para os comandos ajudam a deixar mais legivel.

* Consulta 04:
>Quais as descrições e preços dos produtos que não estão disponíveis na filial cujo identificador é 1?

SELECT descricao, preco FROM produto AS prod WHERE NOT EXISTS 
(SELECT * FROM estoque AS estoque, filial AS filial WHERE prod.id = estoque.produto_id 
 AND filial.id = estoque.filial_id AND filial.id = 1 AND quantidade > 0)
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta4.png)


* Consulta 05
>Quais os nomes dos funcionários que começam com 'Julie' e que possuem telefones com DDD 81? A consulta deverá retornar, também, o DDD e número do telefone do funcionário.

SELECT nome, ddd, numero FROM usuario AS usuario, funcionario AS funcionario, usuario_telefone AS usuario_telefone
WHERE usuario.id = funcionario.usuario_id AND usuario.id = usuario_telefone.usuario_id
AND nome LIKE 'Julie%' AND ddd = '81'
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta5.png)

* Consulta 06
>Quais os identificadores e descrições dos produtos que estão faltando em estoque na filial de razão social 'THOUSAND OAKS'?

SELECT produto.id, descricao
FROM produto AS produto, estoque AS estoque, filial AS filial
WHERE produto.id = estoque.produto_id AND filial.id = estoque.filial_id
AND filial.razao_social = 'THOUSAND OAKS' AND quantidade = 0
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta6.png)

* Consulta 07
>Qual o preço do produto mais caro que faz parte da categoria de descrição 'RAM'?

SELECT MAX(preco) AS preco FROM produto AS produto, produto_categoria AS produto_categoria, categoria AS categoria
WHERE produto.id = produto_categoria.produto_id AND categoria.id = produto_categoria.categoria_id AND categoria.descricao = 'RAM'
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta7.png)

* Consulta 08
>Elabore uma consulta que mostre as descrições e preços dos produtos que possuem mais de uma categoria associada.

SELECT produto.descricao, preco FROM produto 
AS produto, produto_categoria AS produto_categoria, categoria AS categoria
WHERE produto.id = produto_categoria.produto_id AND categoria.id = produto_categoria.categoria_id
GROUP BY produto.descricao, preco HAVING COUNT(produto_categoria.categoria_id) > 1
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta8.png)

* Consulta 09
>Insira um novo cliente com nome ‘Antonio José da Silva’, endereço ‘Rua X, 123’, e-mail ‘ajsilva@provedor.com’, login ‘ajsilva’ e senha ‘ajs123’.
> – Observe que para inserir um cliente, um usuário correspondente a esse cliente deve ser criado primeiro;
> – Após a inserção do novo usuário, verifique o id que foi atribuído e vincule esse id ao cliente ‘Antonio José da Silva’;
> – Suponha que não existam dois usuários com o mesmo nome.

INSERT INTO usuario (nome, endereco, email, login, senha) VALUES ( 'Antonio José da Silva', 'Rua X, 123', 'ajsilva@provedor.com', 'ajsilva', 'ajs123');
INSERT INTO cliente SELECT id FROM usuario WHERE nome = 'Antonio José da Silva';
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta9.png)

* Consulta 10
>Insira três telefones para o cliente ‘Antonio José da Silva’.
> – Telefones:
>  • DDD: 85 Número: 98765432
>  • DDD: 85 Número: 99754208
>  • DDD: 85 Número: 98639121
> – Suponha que não existam dois usuários com o mesmo nome.

INSERT INTO usuario_telefone (usuario_id, ddd, numero) VALUES ((SELECT id FROM usuario WHERE nome = 'Antonio José da Silva'), 85, 98765432);
INSERT INTO usuario_telefone (usuario_id, ddd, numero) VALUES ((SELECT id FROM usuario WHERE nome = 'Antonio José da Silva'),85, 99754208);
INSERT INTO usuario_telefone (usuario_id, ddd, numero) VALUES ((SELECT id FROM usuario WHERE nome = 'Antonio José da Silva'),85, 98639121);
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta10.png)

* Consulta 11
>Atualize, aumentando em 10 unidades na tabela estoque, a quantidade dos produtos que foram vendidos para o cliente de id igual a 226.

UPDATE estoque SET quantidade = (quantidade + 10) WHERE estoque.produto_id IN (
    SELECT venda_item.produto_id FROM venda_item, venda WHERE venda_item.venda_id = venda.id AND cliente_id = 226
);
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta11.png)

* Consulta 12
>Atualize, aumentando em 10%, o salário de cada funcionário que realizou pelo menos uma venda.

UPDATE funcionario SET salario = salario * 1.1 WHERE usuario_id IN (
    SELECT funcionario_id
    FROM venda
    GROUP BY funcionario_id
);
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta12.png)

* Consulta 13
> Remova todos os itens de vendas do cliente de nome ‘Antonio José da Silva’. Após isso, remova todas as vendas que foram feitas para o cliente de 
nome ‘Antonio José da Silva’.
– Suponha que não existem dois usuários com o mesmo nome.

DELETE FROM venda_item WHERE venda_id IN (
    SELECT venda.id FROM venda WHERE cliente_id = (
   	 SELECT usuario.id FROM usuario WHERE nome = 'Antonio José da Silva'
));

DELETE FROM venda WHERE cliente_id = (
    SELECT usuario.id FROM usuario WHERE nome = 'Antonio José da Silva'
);
![](https://github.com/VaneskaSousa/database_subject_ufc/blob/main/TF07/output/consulta13.png)
