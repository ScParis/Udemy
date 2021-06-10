***Settings***
Documentation       Caso de teste criado no modelo procedural

Resource            ../resources/resource.robot
Resource            ../resources/PO/Home.robot
Resource            ../resources/PO/Carrinho.robot
Resource            ../resources/PO/login.robot

Suite Setup          Abrir navegador
Suite Teardown       Fechar navegador


***Test Cases***
Test Case #1: Pesquisar Produtos Existentes
    
    Acessar a página home do site
    Adicionar o produto "t-shirt" no carrinho
    Excluir o produto do carrinho
    Conferir se o carrinho fica vazio

### EXERCÍCIO
Caso de Teste com PO 02: Adicionar Cliente
    Acessar a página home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso