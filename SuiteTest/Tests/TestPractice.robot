***Settings***
Documentation       Caso de teste criado no modelo procedural
#Resource            ../Resources/Resource.robot
Resource            ../Resources/Resource copy.robot

#Test Setup          Abrir navegador
Suite Setup         Abrir navegador
Suite Teardown       Fechar navegador

***Test Cases***
Test Case #1: Pesquisar Produtos Existentes
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o procuto "Blouse" foi listado no site

Test Case #2: Pesquisar Produtos não Existentes
    Acessar a página home do site
    Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""

Test Case #3: Listar Produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"

Test Case #4: Adicionar Produtos no Carrinho
    Acessar a página home do site
    Digitar o nome do produto "t-shirt" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to cart" do produto
    Clicar no botão "Proceed to checkout"

Test Case #5: Remover Produtos
    Acessar a página home do site
    Clicar no ícone carrinho de compras no menu superior direito
    O sistema deve exibir a mensagem "Your shopping cart is empty."

Test Case #6: Adicionar cliente
    Acessar a página home do site
    Clicar no botão superior direito “Sign in”
    Inserir um e-mail válido
    Clicar no botão "Create an account"
    Preencher os campos obrigatórios
    Clicar em "Register" para finalizar o cadastro